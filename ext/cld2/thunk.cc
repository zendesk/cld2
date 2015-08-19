#include <stdio.h>
#include <string.h>
#include "internal/lang_script.h"
#include "public/compact_lang_det.h"
#include "public/encodings.h"

using namespace CLD2;

typedef struct {
  const char *name;
  const char *code;
  bool reliable;
} RESULT;

extern "C" {
  RESULT detectLanguageThunkInt(const char * src, bool is_plain_text) {
    bool is_reliable;
    Language plus_one = UNKNOWN_LANGUAGE;
    const char* tld_hint = NULL;
    int encoding_hint = UNKNOWN_ENCODING;
    Language language_hint = UNKNOWN_LANGUAGE;

    double normalized_score3[3];
    Language language3[3];
    int percent3[3];
    int text_bytes;

    Language lang;
    lang = ExtDetectLanguageSummary(src,
                          strlen(src),
                          is_plain_text,
                          tld_hint,
                          encoding_hint,
                          language_hint,
                          language3,
                          percent3,
                          normalized_score3,
                          &text_bytes,
                          &is_reliable);

    RESULT res;
    res.name = LanguageName(lang);
    res.code = LanguageCode(lang);
    res.reliable = is_reliable;
    return res;
  }
}

int main(int argc, char **argv) {
}