Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A92161226D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2019 09:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbfLQIkr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Dec 2019 03:40:47 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36766 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbfLQIkr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 03:40:47 -0500
Received: by mail-ot1-f66.google.com with SMTP id i4so12843110otr.3;
        Tue, 17 Dec 2019 00:40:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VJ24kvdQ8QR7L8rhFTwqdt4Vhk25r3lcR+7D319i8LM=;
        b=B2oXKiHPlLLS6mL5WtVeMasfospMtfJnjKEuH60fycpJ0xr5uWkBVtWjqCc31/ME4X
         +QvdpTZPNYO6yGUKygvwbkrR9s0fwj9i54RUWiFLTt6G5iSytj+a1+3wVAyCqOJLsYpi
         i8dkCdlqpOyuK/+W9/htMvq02mBnd0tlBpPiKphp3DKohKtGOEQ1wcQ7lU1mmjQkXE5c
         cNxi9LLogWAh3Tk5ETlYv2oLkt9djhDZO8XINPndE034UjIojsdQdPirg/IqQVixyLfl
         Y4NH3VopaqMyS8BfRya4CxVxgmR3YtJLlJn1ARZSBVosVmdwPKp+NmADAzRbE5WGg0pe
         fKdw==
X-Gm-Message-State: APjAAAVrNVQYeYJd3caIcN8wQ49hhg44eUSiVKwatjlK5JniYkwRh7rz
        dpXFE+DraQ7OFqvmC94dNG/iuiLx+/wUXlUpLNw=
X-Google-Smtp-Source: APXvYqwL6C11NKuYjZE4AGku87n5jFvX3FVoQqnSuTbQMUGBxic0mPsKwVmcmigLo9j0icg61vmFkqVcnQyUVeRWW1Q=
X-Received: by 2002:a9d:7984:: with SMTP id h4mr37280198otm.297.1576572046230;
 Tue, 17 Dec 2019 00:40:46 -0800 (PST)
MIME-Version: 1.0
References: <87h81zh4ap.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdUHGXkmKrcZVNQo8nOcGo0h6xYgjZ+XmfGy6bJCPK9ZwQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUHGXkmKrcZVNQo8nOcGo0h6xYgjZ+XmfGy6bJCPK9ZwQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Dec 2019 09:40:35 +0100
Message-ID: <CAMuHMdUc4yyXsp4Y4Xx==3mUMrUn5DO8G-rLA_Mnv-790n6Ehg@mail.gmail.com>
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
>
> Does this make sense?
> Can it be improved, by putting something useful in the delay slot?

BTW, there seems to be a serious security issue with this strncpy()
implementation: while it never writes more than n bytes in the
destination buffer, it doesn't pad the destination buffer with zeroes if
the source string is shorter than the buffer size.  This will leak
data.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
