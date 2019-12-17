Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7190F1226B0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 09:30:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbfLQIaG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 03:30:06 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36271 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfLQIaG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 03:30:06 -0500
Received: by mail-ot1-f68.google.com with SMTP id i4so12801085otr.3;
        Tue, 17 Dec 2019 00:30:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j3trBTOGSnb8QmQqnr6rJcV4X2XCyQhQgwAPIbYfnA4=;
        b=IxsmNrACcDgRrxRDtC2ksgj5Db+jmEA4Eos7wHnnwyFu3IH7vu0YFj7Szay8SrYoCy
         1b1yggJcmg/IQFE+HUxqIOIOSdPwz29arpLlDD1gwYVXuL11UxUZOrSHnuV+xH+c3jXr
         JBFVQzQaDUlB4ai/69BZLz8Nq8zll/UVnVG1jwXvjGytJohTzJJYcGpqU7o0yAZH6Ee6
         7OibBbbUWYQYuWg5J4IBWplwWAM7Mb5ILXqYjp/ZTL3gNkdz+TN48OEcoFmf+R5zjyDj
         QBqigHmn5Ig9+16f4urg1cXEyPgRYTe3a0/Ydn480jltJLNrC8WYnXX5X1vFVb7FSfpm
         MWUg==
X-Gm-Message-State: APjAAAVaVbJj/xPW/XzI9MrjHftE/PmB0UxhihMcQBioJwbHp0V8Q1Va
        AQnYeRL0JwPhSiBi/OPXXNrZrPzYOEBiGnzsr10=
X-Google-Smtp-Source: APXvYqwxkMKPROqDuA1ODX4o7k7da5JyXUnHeV4NO5ENuFxk/9sCtYeas01IKqTUJeGP1Jp57NZY5yLO6scmXxW3QFA=
X-Received: by 2002:a05:6830:18e2:: with SMTP id d2mr6983611otf.107.1576571405430;
 Tue, 17 Dec 2019 00:30:05 -0800 (PST)
MIME-Version: 1.0
References: <87h81zh4ap.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87h81zh4ap.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Dec 2019 09:29:53 +0100
Message-ID: <CAMuHMdUHGXkmKrcZVNQo8nOcGo0h6xYgjZ+XmfGy6bJCPK9ZwQ@mail.gmail.com>
Subject: Re: can someone solve string_32.h issue for SH ?
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Linux-SH <linux-sh@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Tue, Dec 17, 2019 at 7:09 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> We get too many below strncpy() warning on SH.
> Can someone solve it ?
> I don't remember SH assembler code / can't test it...

I never touched SH assembler code at all.
But it looks a bit like RISCified m68k, so let's give it a try ;-)

> In file included from /home/morimoto/WORK/linux/arch/sh/include/asm/string.h:3,
>                  from /home/morimoto/WORK/linux/include/linux/string.h:20,
>                  from /home/morimoto/WORK/linux/include/linux/bitmap.h:9,
>                  from /home/morimoto/WORK/linux/include/linux/nodemask.h:95,
>                  from /home/morimoto/WORK/linux/include/linux/mmzone.h:17,
>                  from /home/morimoto/WORK/linux/include/linux/gfp.h:6,
>                  from /home/morimoto/WORK/linux/include/linux/slab.h:15,
>                  from /home/morimoto/WORK/linux/drivers/mmc/host/vub300.c:38:
> /home/morimoto/WORK/linux/drivers/mmc/host/vub300.c: In function 'new_system_port_status':
> /home/morimoto/WORK/linux/arch/sh/include/asm/string_32.h:51:42: warning: array subscript 80 is above array bounds of 'char[26]' [-Warray-bounds]
>    : "0" (__dest), "1" (__src), "r" (__src+__n)
>                                      ~~~~~^~~~

Yeah, these array warnings are (sometimes) a PITA.

>         static inline char *strncpy(char *__dest, const char *__src, size_t __n)
>         {
>                 register char *__xdest = __dest;
>                 unsigned long __dummy;
>
>                 if (__n == 0)
>                         return __xdest;
>
>                 __asm__ __volatile__(
>                         "1:\n"
>                         "mov.b  @%1+, %2\n\t"
>                         "mov.b  %2, @%0\n\t"
>                         "cmp/eq #0, %2\n\t"
>                         "bt/s   2f\n\t"
>                         " cmp/eq        %5,%1\n\t"
>                         "bf/s   1b\n\t"
>                         " add   #1, %0\n"
>                         "2:"
>                         : "=r" (__dest), "=r" (__src), "=&z" (__dummy)
> =>                      : "0" (__dest), "1" (__src), "r" (__src+__n)
>                         : "memory", "t");
>
>                 return __xdest;
>         }


My first thought was to just replace "__src+__n" by "__dest+__n", and
change the "cmp/eq" from "%1" (current src) to "%0" (current dst).
However, "%0" isn't incremented until the branch delay slot of the loop.
So I had to move the increment up, and fill the branch delay slot with a nop.

Untested (it-compiles-so-it-must-be-perfect ;-) whitespace-damaged patch:

--- a/arch/sh/include/asm/string_32.h
+++ b/arch/sh/include/asm/string_32.h
@@ -40,15 +40,15 @@ static inline char *strncpy(char *__dest, const
char *__src, size_t __n)
        __asm__ __volatile__(
                "1:\n"
                "mov.b  @%1+, %2\n\t"
-               "mov.b  %2, @%0\n\t"
+               "mov.b  %2, @%0+\n\t"
                "cmp/eq #0, %2\n\t"
                "bt/s   2f\n\t"
-               " cmp/eq        %5,%1\n\t"
+               " cmp/eq        %5,%0\n\t"
                "bf/s   1b\n\t"
-               " add   #1, %0\n"
+               " nop\n"
                "2:"
                : "=r" (__dest), "=r" (__src), "=&z" (__dummy)
-               : "0" (__dest), "1" (__src), "r" (__src+__n)
+               : "0" (__dest), "1" (__src), "r" (__dest+__n)
                : "memory", "t");

        return __xdest;

Does this make sense?
Can it be improved, by putting something useful in the delay slot?

Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
