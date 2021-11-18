Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D16B45631C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 20:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232255AbhKRTIJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 14:08:09 -0500
Received: from mail-ua1-f42.google.com ([209.85.222.42]:41943 "EHLO
        mail-ua1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbhKRTII (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 14:08:08 -0500
Received: by mail-ua1-f42.google.com with SMTP id p37so15947411uae.8;
        Thu, 18 Nov 2021 11:05:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0O/66kj2GyVX0uYRJGcZP8ektuuvmy/BGdPE6TmNOtE=;
        b=ayHFxqLEBPwyACiBLwItYQRe1f0cs8EmgdB1UGHBQtjQHvSoP7o881XMh9iyo0upFz
         koKQZC9UGRpxvj+X6wxX/2kQ35RtADq1araO2UxFZeF/7/fHvDbmMjD4CQqSgZzKsoyl
         HasnAZZTnIjYRchwTQWmXDLKW6rNYbUIXWAJPgVkUzIhhT1wCOUTmbA3kYlJ+K7ZTTIG
         CPGaiPQpylf/KvUJeUOXOUkwZRLAypgefe6fR0BUtVrk2VkhDeKXFDD9WsBuXQhmvPK1
         aLfOuEe+U85s4Uk0VSmB0+OkyhobRLe2jKwdyHeIbO0R/5ErzoUgZ/T6UsXeuZv+ZcIW
         BHEw==
X-Gm-Message-State: AOAM531rqieWxca4jQsKaZmpUxMEcleT/GQNTDlpL85YlVvxaOQdNS02
        aRKGFwExiLSZqFkq01TDG7BHJb7Q1SI4YA==
X-Google-Smtp-Source: ABdhPJxmOinKQI0sAN0bGOEYz3khLJrTCSVjgz1RobFbcZDk2YSVTGWMecI+4PWrYtAnYA8zRXI/jw==
X-Received: by 2002:ab0:5b5d:: with SMTP id v29mr39892894uae.110.1637262307282;
        Thu, 18 Nov 2021 11:05:07 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id n10sm377889uaj.20.2021.11.18.11.05.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 11:05:06 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id k83so4416719vke.7;
        Thu, 18 Nov 2021 11:05:06 -0800 (PST)
X-Received: by 2002:a05:6122:50e:: with SMTP id x14mr107427214vko.7.1637262306436;
 Thu, 18 Nov 2021 11:05:06 -0800 (PST)
MIME-Version: 1.0
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com> <20211116074130.107554-10-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211116074130.107554-10-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 20:04:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVLRwzhhLg2dne8KgNsDW4uJWMhjD1Y9sBfSKVgdZBR8Q@mail.gmail.com>
Message-ID: <CAMuHMdVLRwzhhLg2dne8KgNsDW4uJWMhjD1Y9sBfSKVgdZBR8Q@mail.gmail.com>
Subject: Re: [PATCH 09/16] soc: renesas: Identify R-Car S4-8
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimoda-san,

On Tue, Nov 16, 2021 at 8:42 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add support for identifying the R-Car S4-8 (R8A779F0) SoC.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -256,6 +256,13 @@ config ARCH_R8A779A0
>         help
>           This enables support for the Renesas R-Car V3U SoC.
>
> +config ARCH_R8A779F0
> +       bool "ARM64 Platform support for R-Car S4-8"
> +       select ARCH_RCAR_GEN3
> +       select SYSC_R8A779F0

"SYSC_R8A779F0" is only defined in [PATCH 10/16], so you may want to
reorder your series. Or I will while applying later ;-)

> +       help
> +         This enables support for the Renesas R-Car S4-8 SoC.
> +
>  config ARCH_R8A774C0
>         bool "ARM64 Platform support for RZ/G2E"
>         select ARCH_RCAR_GEN3
> diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
> index 7961b0be1850..857a42a82747 100644
> --- a/drivers/soc/renesas/renesas-soc.c
> +++ b/drivers/soc/renesas/renesas-soc.c
> @@ -33,6 +33,11 @@ static const struct renesas_family fam_rcar_gen3 __initconst __maybe_unused = {
>         .reg    = 0xfff00044,           /* PRR (Product Register) */
>  };
>
> +static const struct renesas_family fam_rcar_gen4 __initconst __maybe_unused = {
> +       .name   = "R-Car Gen4",
> +       .reg    = 0xfff00044,           /* PRR (Product Register) */
> +};
> +
>  static const struct renesas_family fam_rmobile __initconst __maybe_unused = {
>         .name   = "R-Mobile",
>         .reg    = 0xe600101c,           /* CCCR (Common Chip Code Register) */
> @@ -214,6 +219,11 @@ static const struct renesas_soc soc_rcar_v3u __initconst __maybe_unused = {
>         .id     = 0x59,
>  };
>
> +static const struct renesas_soc soc_rcar_s4 __initconst __maybe_unused = {
> +       .family = &fam_rcar_gen4,
> +       .id     = 0x5a,
> +};
> +
>  static const struct renesas_soc soc_shmobile_ag5 __initconst __maybe_unused = {
>         .family = &fam_shmobile,
>         .id     = 0x37,
> @@ -319,6 +329,9 @@ static const struct of_device_id renesas_socs[] __initconst = {
>  #ifdef CONFIG_ARCH_R8A779A0
>         { .compatible = "renesas,r8a779a0",     .data = &soc_rcar_v3u },
>  #endif
> +#ifdef CONFIG_ARCH_R8A779F0
> +       { .compatible = "renesas,r8a779f0",     .data = &soc_rcar_s4 },
> +#endif
>  #if defined(CONFIG_ARCH_R9A07G044)
>         { .compatible = "renesas,r9a07g044",    .data = &soc_rz_g2l },
>  #endif
> --
> 2.25.1
>


-- 
Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
