Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E46B9456316
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 20:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232274AbhKRTGo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 14:06:44 -0500
Received: from mail-ua1-f52.google.com ([209.85.222.52]:40940 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbhKRTGo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 14:06:44 -0500
Received: by mail-ua1-f52.google.com with SMTP id y5so15939682ual.7;
        Thu, 18 Nov 2021 11:03:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fti3uEpcoz+oVQwCBL2YlzOXlOGhg8Y8VpbkJ31LRB0=;
        b=3IFz1reLo3xBlMmp7H1HeQWSAAh5HCiyIISvZl2v6iespJCH1n9DB4CjWtib2h8yLk
         WDxulMnYYCD797w98MzkiHaME7+eM0IA8rby8obPR/HuusX0ai8GDKqZbsqPyudNnOpS
         kgnXLRsNpPnQVFUPsVSyyakYg6WHuQqHN4hiijPSV6UUtD892bhhu1oqdMvJFjeyWMvc
         m3gOI1F2k8gTB41Q6GDoFwUYpnhZsRhJH6Q7EV8YBB9IKdl3cUff+WTMZ4T/oIDGOoEU
         Rf1XKlOuqtvvyP/AalGy0aSG0sO2rLDMe1xC/sXRb7xR5PBjzILGuonfgrOmSNYFZ3kV
         ZZZg==
X-Gm-Message-State: AOAM530K4fVXn4CpAgix64sV38TRWI12HZsRUJ5XfNOoLGiXVmsmU5C0
        srlduYRJO5Nc00WTc7+1jNT05a1UT7fk6A==
X-Google-Smtp-Source: ABdhPJy/PkndwIBoWHmtRkapmc9RXRh1ncq2R8Lo8NRrroEfuWQHzLCWl+5twXau3gRLaRC0GkweCw==
X-Received: by 2002:a67:ca92:: with SMTP id a18mr84903099vsl.11.1637262222906;
        Thu, 18 Nov 2021 11:03:42 -0800 (PST)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id p69sm375758uap.1.2021.11.18.11.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 11:03:42 -0800 (PST)
Received: by mail-ua1-f49.google.com with SMTP id p37so15938037uae.8;
        Thu, 18 Nov 2021 11:03:42 -0800 (PST)
X-Received: by 2002:a05:6102:1354:: with SMTP id j20mr84778395vsl.41.1637262222298;
 Thu, 18 Nov 2021 11:03:42 -0800 (PST)
MIME-Version: 1.0
References: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com> <20211116074130.107554-10-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20211116074130.107554-10-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 20:03:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWvgK7w82Y1D27y98RdZZWLjXv-Q-jjh=g3YQw5zfbNfQ@mail.gmail.com>
Message-ID: <CAMuHMdWvgK7w82Y1D27y98RdZZWLjXv-Q-jjh=g3YQw5zfbNfQ@mail.gmail.com>
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
> +       help
> +         This enables support for the Renesas R-Car S4-8 SoC.
> +

Please keep sort order (alphabetical, not by part number).

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

Please drop ".reg", which is only meant for existing SoCs.
For new SoCs, we rely on the presence of a "renesas,prr" node in DT.

> +};

The rest looks good to me.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
