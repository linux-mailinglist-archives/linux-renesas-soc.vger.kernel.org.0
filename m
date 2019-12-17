Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8BA122709
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 09:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbfLQIuf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 03:50:35 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:39018 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbfLQIuf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 03:50:35 -0500
Received: by mail-ot1-f68.google.com with SMTP id 77so12858597oty.6;
        Tue, 17 Dec 2019 00:50:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TZPkva4M8BuXpNHl5A2yV8mKCKltCPUvIM0dhkVfPnM=;
        b=DsQtW+K9yhQf+CtjiB9ExVyT20c/0B1fPATApooSKDB2hszWGDSBXXGFfzguhncYtN
         /JDLKnN8pwVo45w/Ss7mDaG++cK8gdZAHGNEgYQvoTdB7CEMaFAdQ5Wdf/N3NxkHBduC
         dBY1CbhyCLwU5vi17JxZJGNJKO/HtYR3E9xSmU5clq4hvuQB/O5PlPvLUeTOA8zeuD5r
         AAS704KsoTIJ6kHB9wyLgT5iMIEfdwnFkPr+gNrY4+oCCydgYnkUSypDh0FGY6N+5Cix
         6nbdanJ8Q3l56bfd/Wz9AcATMbEmmxb77bWfyexOgAh0GoyrN2XUTH9QaahPP2fLjDes
         AEOg==
X-Gm-Message-State: APjAAAWNlVMYJdLwDyfqFtumGG+Ku5na+BBQzoaWqt56JXtQrxZzIyvI
        QvPY6V583CuqNsECBdZerkLzwMp0WOSgNTSJk8o=
X-Google-Smtp-Source: APXvYqzzz5jp5JYS0UuCFklHs9lYX+TjfU1MpwLabzHZ4rqXU8cpe5f+J/TRWc9dSyKV1aYT3AoX0VDZNRH2pLMzXDM=
X-Received: by 2002:a9d:6c81:: with SMTP id c1mr37419814otr.39.1576572634636;
 Tue, 17 Dec 2019 00:50:34 -0800 (PST)
MIME-Version: 1.0
References: <87h81zh4ap.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdUHGXkmKrcZVNQo8nOcGo0h6xYgjZ+XmfGy6bJCPK9ZwQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUHGXkmKrcZVNQo8nOcGo0h6xYgjZ+XmfGy6bJCPK9ZwQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Dec 2019 09:50:22 +0100
Message-ID: <CAMuHMdUtwFvab08A-Pqzs-33P-V3Ujcfbdx-RypbUwS8wsy5xQ@mail.gmail.com>
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

On Tue, Dec 17, 2019 at 9:29 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Dec 17, 2019 at 7:09 AM Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com> wrote:
> > We get too many below strncpy() warning on SH.
> > Can someone solve it ?
> > I don't remember SH assembler code / can't test it...
>
> I never touched SH assembler code at all.
> But it looks a bit like RISCified m68k, so let's give it a try ;-)
>
> > In file included from /home/morimoto/WORK/linux/arch/sh/include/asm/string.h:3,
> >                  from /home/morimoto/WORK/linux/include/linux/string.h:20,
> >                  from /home/morimoto/WORK/linux/include/linux/bitmap.h:9,
> >                  from /home/morimoto/WORK/linux/include/linux/nodemask.h:95,
> >                  from /home/morimoto/WORK/linux/include/linux/mmzone.h:17,
> >                  from /home/morimoto/WORK/linux/include/linux/gfp.h:6,
> >                  from /home/morimoto/WORK/linux/include/linux/slab.h:15,
> >                  from /home/morimoto/WORK/linux/drivers/mmc/host/vub300.c:38:
> > /home/morimoto/WORK/linux/drivers/mmc/host/vub300.c: In function 'new_system_port_status':
> > /home/morimoto/WORK/linux/arch/sh/include/asm/string_32.h:51:42: warning: array subscript 80 is above array bounds of 'char[26]' [-Warray-bounds]
> >    : "0" (__dest), "1" (__src), "r" (__src+__n)
> >                                      ~~~~~^~~~
>
> Yeah, these array warnings are (sometimes) a PITA.
>
> >         static inline char *strncpy(char *__dest, const char *__src, size_t __n)
> >         {
> >                 register char *__xdest = __dest;
> >                 unsigned long __dummy;
> >
> >                 if (__n == 0)
> >                         return __xdest;
> >
> >                 __asm__ __volatile__(
> >                         "1:\n"
> >                         "mov.b  @%1+, %2\n\t"
> >                         "mov.b  %2, @%0\n\t"
> >                         "cmp/eq #0, %2\n\t"
> >                         "bt/s   2f\n\t"
> >                         " cmp/eq        %5,%1\n\t"
> >                         "bf/s   1b\n\t"
> >                         " add   #1, %0\n"
> >                         "2:"
> >                         : "=r" (__dest), "=r" (__src), "=&z" (__dummy)
> > =>                      : "0" (__dest), "1" (__src), "r" (__src+__n)
> >                         : "memory", "t");
> >
> >                 return __xdest;
> >         }
>
>
> My first thought was to just replace "__src+__n" by "__dest+__n", and
> change the "cmp/eq" from "%1" (current src) to "%0" (current dst).
> However, "%0" isn't incremented until the branch delay slot of the loop.
> So I had to move the increment up, and fill the branch delay slot with a nop.
>
> Untested (it-compiles-so-it-must-be-perfect ;-) whitespace-damaged patch:
>
> --- a/arch/sh/include/asm/string_32.h
> +++ b/arch/sh/include/asm/string_32.h
> @@ -40,15 +40,15 @@ static inline char *strncpy(char *__dest, const
> char *__src, size_t __n)
>         __asm__ __volatile__(
>                 "1:\n"
>                 "mov.b  @%1+, %2\n\t"
> -               "mov.b  %2, @%0\n\t"
> +               "mov.b  %2, @%0+\n\t"

While this compiles for SH2, it doesn't for SH4 :-(

>                 "cmp/eq #0, %2\n\t"
>                 "bt/s   2f\n\t"
> -               " cmp/eq        %5,%1\n\t"
> +               " cmp/eq        %5,%0\n\t"
>                 "bf/s   1b\n\t"
> -               " add   #1, %0\n"
> +               " nop\n"
>                 "2:"
>                 : "=r" (__dest), "=r" (__src), "=&z" (__dummy)
> -               : "0" (__dest), "1" (__src), "r" (__src+__n)
> +               : "0" (__dest), "1" (__src), "r" (__dest+__n)
>                 : "memory", "t");
>
>         return __xdest;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
