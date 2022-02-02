Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5C314A6DB1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 10:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245436AbiBBJVP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 04:21:15 -0500
Received: from mail-ua1-f46.google.com ([209.85.222.46]:42738 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234114AbiBBJVP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 04:21:15 -0500
Received: by mail-ua1-f46.google.com with SMTP id e17so17906855uad.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Feb 2022 01:21:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3ypmuRln625jLHrzO/O3yk1cvtGTb3GXVs4PNMlW3kE=;
        b=UgJeBDiibvKHkD+Xw/W8HSIV80+t9piKY+loyH8NuIKvAux9nXmwmL3kVyFPt9FZZJ
         OKkHjrytpL2CrbWAyoszCnmGL1SVoIWqPEzCOpMg1w3+cSalVIKrJw+T4hUSWash/mQG
         B0DKxzqKF6zTlEDtxTnsNx86cG0mkFUrYvD2Uo9Onhpp8NgfnJDTzoH/we5lx8YrEPyY
         PCa23YMdGPIAZ5oe6KzcctmPS6QEfCIfe/jFojGV/tlNLWzC/a1Ldqa/91zv7oZ8vT73
         Ilp705CRmOD+jwGayYJiCtk/AGuKOz83Eo1h28JNUdYJfjdq3Gpj1KWdyNlGp90vjdSk
         SWbw==
X-Gm-Message-State: AOAM533f7zc8AfwO7PdZ8TjRI6MVvHu6Ufhm9JJEIH1lNSK1i78K6KyI
        c8fsFbxeUmsjeZzD3/DWIkwoSDEYzb3+Wg==
X-Google-Smtp-Source: ABdhPJxRyfLqTIBXTuIyHDJj8+J3vIpe91hoMM6zBWb78QmFdBo4pyhzkufMZPAIcU7PZsFENixprA==
X-Received: by 2002:a05:6102:1c2:: with SMTP id s2mr11322213vsq.73.1643793674340;
        Wed, 02 Feb 2022 01:21:14 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id x7sm5461495vkg.31.2022.02.02.01.21.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 01:21:13 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id u76so17953093uau.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Feb 2022 01:21:13 -0800 (PST)
X-Received: by 2002:a67:fd63:: with SMTP id h3mr10476114vsa.77.1643793673568;
 Wed, 02 Feb 2022 01:21:13 -0800 (PST)
MIME-Version: 1.0
References: <20220125130021.4144902-1-yoshihiro.shimoda.uh@renesas.com> <20220125130021.4144902-2-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20220125130021.4144902-2-yoshihiro.shimoda.uh@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 2 Feb 2022 10:21:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWrqMNMhTSCX_1k8RiEx2Mm8oXbEYpvNPqJiyGVVrEunA@mail.gmail.com>
Message-ID: <CAMuHMdWrqMNMhTSCX_1k8RiEx2Mm8oXbEYpvNPqJiyGVVrEunA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779f0: Add IPMMU nodes
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Shimodan-san,

On Tue, Jan 25, 2022 at 2:00 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Add IPMMU nodes for r8a779f0.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
> @@ -164,6 +164,52 @@ dmac1: dma-controller@e7351000 {
>                         dma-channels = <16>;
>                 };
>
> +               ipmmu_rt0: iommu@ee480000 {
> +                       compatible = "renesas,ipmmu-r8a779f0",
> +                                    "renesas,rcar-gen4-ipmmu";
> +                       reg = <0 0xee480000 0 0x20000>;
> +                       renesas,ipmmu-main = <&ipmmu_mm 10>;
> +                       power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
> +                       #iommu-cells = <1>;
> +               };
> +
> +               ipmmu_rt1: iommu@ee4c0000 {
> +                       compatible = "renesas,ipmmu-r8a779f0",
> +                                    "renesas,rcar-gen4-ipmmu";
> +                       reg = <0 0xee4c0000 0 0x20000>;
> +                       renesas,ipmmu-main = <&ipmmu_mm 19>;
> +                       power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
> +                       #iommu-cells = <1>;
> +               };
> +
> +               ipmmu_ds0: iommu@eed00000 {
> +                       compatible = "renesas,ipmmu-r8a779f0",
> +                                    "renesas,rcar-gen4-ipmmu";
> +                       reg = <0 0xeed00000 0 0x20000>;
> +                       renesas,ipmmu-main = <&ipmmu_mm 0>;
> +                       power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
> +                       #iommu-cells = <1>;
> +               };
> +
> +               ipmmu_hsc: iommu@eed40000 {
> +                       compatible = "renesas,ipmmu-r8a779f0",
> +                                    "renesas,rcar-gen4-ipmmu";
> +                       reg = <0 0xeed40000 0 0x20000>;
> +                       renesas,ipmmu-main = <&ipmmu_mm 2>;

Bit 2 nor HSC are documented in the MMU Interrupt Status Register
(IMSSTR) register in Rev. 0.51 of the R-Car S4 Hardware User's Manual.

> +                       power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
> +                       #iommu-cells = <1>;
> +               };
> +
> +               ipmmu_mm: iommu@eefc0000 {
> +                       compatible = "renesas,ipmmu-r8a779f0",
> +                                    "renesas,rcar-gen4-ipmmu";
> +                       reg = <0 0xeefc0000 0 0x20000>;
> +                       interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
> +                       power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
> +                       #iommu-cells = <1>;
> +               };
> +

The rest looks good to me.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
