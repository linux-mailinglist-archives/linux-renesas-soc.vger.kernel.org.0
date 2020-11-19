Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5E12B9789
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Nov 2020 17:14:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728130AbgKSQNf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Nov 2020 11:13:35 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:44722 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728124AbgKSQNe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Nov 2020 11:13:34 -0500
Received: by mail-oi1-f194.google.com with SMTP id t16so6847544oie.11
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2020 08:13:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TT/SVBPg0FOd/6gd2zs5bV2PmI2jOatYGsnFBx6lsLQ=;
        b=ksvteWQABZuUjkk9sZ+qSOsfYQlsfbJ3v5GCFE8KVeDigoPVZ8WqGyY7hM2WRUNiYT
         XJ+UxUjSY+y2z3o6lXD6kW7mb8Yd/dUrySs4QVUlIiEfiUe+jCg4Z7KFkkqyrjuHUazf
         VwU/LlCRLgRxMA1VWkgFCZ4cZv8XZ3th1g3GkSRG6Xxf/PVP/glywaqkHLCI4vJQ8bSi
         iIcgF+LBCPuKssi+3S+kB43Yr+7a4NaGfxz1rJIdg082k0FzSsq2pF7zqiOvDgCaSxjX
         P1Y7SWXN3tobQsAM88HMOLhyyDFqOlVbjr1THAx9LyI+g2GLKmlA6oJx5C7mkuoE2Skj
         TgWg==
X-Gm-Message-State: AOAM533u/GALZKjvHMRNn62hOh1OMk5QVreOcT2nLH3gNMkuO2cyO/9M
        ysC5EM1AAVhQpQGKXvtTQshx9TVNQ4OxXJh61A8=
X-Google-Smtp-Source: ABdhPJwkNWbiKsK4J0PnL0TkNFnaTQ5Utiz9WzRauBrRa7OTfF4+29oCzEUctYji8hZsN5Yc8M1idhRPaCN2r8Mwwe8=
X-Received: by 2002:aca:4bc3:: with SMTP id y186mr3119656oia.153.1605802413609;
 Thu, 19 Nov 2020 08:13:33 -0800 (PST)
MIME-Version: 1.0
References: <20201119125318.4066097-1-geert+renesas@glider.be> <CAK8P3a0mHYgOYLBO1MHw1CUVgdnOQk4aRf5XTBj+jR-yEtzcoA@mail.gmail.com>
In-Reply-To: <CAK8P3a0mHYgOYLBO1MHw1CUVgdnOQk4aRf5XTBj+jR-yEtzcoA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 19 Nov 2020 17:13:22 +0100
Message-ID: <CAMuHMdXmHOo+6TgYOsAuSC7-iHEyBnLvqX=MCN3qYybUi5M-hw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsi: Stop using __raw_*() I/O accessors
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Arnd,

On Thu, Nov 19, 2020 at 4:54 PM Arnd Bergmann <arnd@kernel.org> wrote:
> On Thu, Nov 19, 2020 at 1:53 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > There is no reason to keep on using the __raw_{read,write}l() I/O
> > accessors in Renesas ARM or SuperH driver code.  Switch to using the
> > plain {read,write}l() I/O accessors, to have a chance that this works on
> > big-endian.
> >
> > Suggested-by: Arnd Bergmann <arnd@kernel.org>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> I don't think this one is correct, as based on
>
> static void fsi_pio_push16(struct fsi_priv *fsi, u8 *_buf, int samples)
> {
>         int i;
>
>         if (fsi_is_enable_stream(fsi)) {
>                 /*
>                  * stream mode
>                  * see
>                  *      fsi_pio_push_init()
>                  */
>                 u32 *buf = (u32 *)_buf;
>
>                 for (i = 0; i < samples / 2; i++)
>                         fsi_reg_write(fsi, DODT, buf[i]);
>         } else {
>                 /* normal mode */
>                 u16 *buf = (u16 *)_buf;
>
>                 for (i = 0; i < samples; i++)
>                         fsi_reg_write(fsi, DODT, ((u32)*(buf + i) << 8));
>         }
> }
>
> the same helper is used for both accessing endianness-sensitive
> register values (which need the converrsion in writel()) and
> possibly in-memory byte streams that need the __raw_writel()
> behavior of copying the input bytes in sequence rather than sets of
> native-endian 16-bit or 32-bit samples.

Thanks, good catch!

> > ---
> > Assembler output difference on SuperH checked.
>
> I'm also not sure whether changing this breaks big-endian SuperH,
> which defines the accessors differently from Arm and most other
> architectures.

On SH, this driver is only used on SH7724 systems.
Compiling an ecovec24_defconfig kernel with CONFIG_CPU_BIG_ENDIAN=y
shows that the same code (native 32-bit access) is generated for
big-endian as for little-endian, which means that it indeed must be
broken for one of them. But this is not changed by my patch.

> Maybe better just mark the driver as 'depends on SH || !CPU_BIG_ENDIAN'
> as it is clearly broken on big-endian Arm.

"depends on !CPU_BIG_ENDIAN"?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
