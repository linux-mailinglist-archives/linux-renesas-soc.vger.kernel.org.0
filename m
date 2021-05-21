Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 511B338CA50
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 May 2021 17:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233691AbhEUPm3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 May 2021 11:42:29 -0400
Received: from mail-vk1-f180.google.com ([209.85.221.180]:36705 "EHLO
        mail-vk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbhEUPm3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 May 2021 11:42:29 -0400
Received: by mail-vk1-f180.google.com with SMTP id c17so4381709vke.3;
        Fri, 21 May 2021 08:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lDtc6qeFwbS7zXFhpeNyi188kDnriWojsEyOipwGPSM=;
        b=n+CB5RfaCH6dH2KfzgI28VVHvTVkWgWfK/u1QCgSOLlhTdBSlSPc4QGUFh+8dvD2Tz
         8WMZD3NEe1e8XEM4qiSS3xc9qOC15RyBfmoAYhr256yfBbak82ZjKXyVz57hRbBn6ODt
         UN1D9qDmN0kqnbMO8euVvfqScB/1zU4PuD8XTpuNWIHt1ZgyH3wmmEnsV7x6izGrZ4SG
         HEDJ2MeL9maMEOSxaBeMx91QKWgdB8lhO/A9T4OF9r58M5ibqHkcenNEfhReTUhQH98H
         ZV8P8J5Xsa1W+SaeshdoFfpGRqV6UwRcQ5AM/oTP68MBHX2QaVjS0nuXR2XH/vWf5C5l
         OLEw==
X-Gm-Message-State: AOAM533RG8iAhk3bDgs1LWErxylHT7noVJpH4n/A5IMkXaZhNXRmyC1q
        nTnXdVkiJ9X7vrNeIS5DHb+t9O2y7uCTGxH32t4=
X-Google-Smtp-Source: ABdhPJytp+wV/CfnV55SrBJJ9y27HWMciCX/TJpafXYAdXZuSDwf7oGMOTjZdb9OGH/opiijoeYKgyewu3AEiqirAHw=
X-Received: by 2002:a1f:a388:: with SMTP id m130mr11033889vke.1.1621611665410;
 Fri, 21 May 2021 08:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210514192218.13022-17-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210514192218.13022-17-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 May 2021 17:40:53 +0200
Message-ID: <CAMuHMdXZEB6JretasVj7xpN2Gbp2y9dHh_Eiq03BEevRK8Zy9Q@mail.gmail.com>
Subject: Re: [PATCH 16/16] arm64: dts: renesas: Add initial device tree for
 RZ/G2L SMARC EVK
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Fri, May 14, 2021 at 9:24 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add basic support for RZ/G2L SMARC EVK (based on R9A07G044L2):
> - memory
> - External input clock
> - SCIF
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -62,3 +62,5 @@ dtb-$(CONFIG_ARCH_R8A77990) += r8a77990-ebisu.dtb
>  dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
>
>  dtb-$(CONFIG_ARCH_R8A779A0) += r8a779a0-falcon.dtb
> +
> +dtb-$(CONFIG_ARCH_R9A07G044L) += r9a07g044l2-smarc.dtb
> diff --git a/arch/arm64/boot/dts/renesas/g2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/g2l-smarc.dtsi
> new file mode 100644
> index 000000000000..9b95d73fb798
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/g2l-smarc.dtsi

rzg2l-smarc?

The rest looks good to me (taking into account compatible value
discussions).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
