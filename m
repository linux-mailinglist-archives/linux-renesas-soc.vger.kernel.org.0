Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32AD9368F4D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Apr 2021 11:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbhDWJ0r convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Apr 2021 05:26:47 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:35719 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229939AbhDWJ0q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Apr 2021 05:26:46 -0400
Received: by mail-ua1-f50.google.com with SMTP id j8so12586729uak.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Apr 2021 02:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=94DxQAuQlYTR71bRQTmyFm1or/Y+mVgGzMSnhtKOc/s=;
        b=fKDovZoGDStWwV8QvPHWFY4Mf1/SjpeEi2CARsSw2+oc4/fi9iqaExUZR33lWrNjH5
         eZ7N2yUg99adGFc/6UDQ5vaMCZ6+JVd3wBlV2xYWqTL3urX+dAusU00raszP30WNyNyz
         RAWqFNKlEiPNfTO9Vrs1bjWz+4OuZ3LCbmJRs7XdMbvSWJsjq7Biu/8kffjHNiDjYe/s
         fq5e1JADe5nMNEJjuJungmNikSKaliPq0c+4PvnW6Xb9IC7dIwsbDIHUNxas7z/RM3MC
         rib8EIh/BMZuOxiHXCju9XcL8jXAgh3rdNnbY4sYAKT2NoKuLx3G/aDrhbRwOXFUvMPI
         5PtQ==
X-Gm-Message-State: AOAM53010HIGTnKKLoTF7g0bp3jtkfGv7xSymryyfASxHL7xr0TmkM0U
        GQEKSge5l3apS5kZHEYoY9Api0dEEO68wLVJOCawRUgNxJg=
X-Google-Smtp-Source: ABdhPJyvAhkKlX7XydBlp1UZCMy2/MWmxFQgvdDxk0pCk9zIzuRFnhUp6GsNNdiDnXhi/6AehFCH4AkDBtBlX0bqF0A=
X-Received: by 2002:ab0:3157:: with SMTP id e23mr2106884uam.106.1619169970171;
 Fri, 23 Apr 2021 02:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210413184844.2606086-1-niklas.soderlund+renesas@ragnatech.se> <20210413184844.2606086-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20210413184844.2606086-2-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 23 Apr 2021 11:25:59 +0200
Message-ID: <CAMuHMdUC2VVnu-pQnpEkfR-EtCo=coghhfYNkjS2bfVERvar8Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a779a0: Add and connect all
 CSI-2, ISP and VIN nodes
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Tue, Apr 13, 2021 at 8:49 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The V3U have 32 VIN, 4 CSI-2 and 4 ISP nodes that interact with each
> other for video capture. Add all nodes and record how they are
> interconnected.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Thanks for your patch!

The "standard" properties (reg/interrupts/clocks/resets/...) look good
to me.

> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -1017,6 +1017,870 @@ msiof5: spi@e6c28000 {
>                         status = "disabled";
>                 };
>
> +               vin00: video@e6ef0000 {
> +                       compatible = "renesas,vin-r8a779a0";
> +                       reg = <0 0xe6ef0000 0 0x1000>;
> +                       interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 730>;
> +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 730>;
> +                       renesas,id = <0>;
> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@2 {
> +                                       reg = <2>;
> +
> +                                       vin00isp0: endpoint {

Shouldn't this be endpoint@0 (+ appropriate {address,size}-cells above),
as per the DT bindings?
Same for vin 01-07.

> +                                               remote-endpoint = <&isp0vin00>;
> +                                       };
> +                               };
> +                       };
> +               };

> +               isp0: isp@fed00000 {
> +                       compatible = "renesas,isp-r8a779a0";

renesas,r8a779a0-isp (for all ISP nodes).

> +                       reg = <0 0xfed00000 0 0x10000>;
> +                       interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 612>;
> +                       power-domains = <&sysc R8A779A0_PD_A3ISP01>;
> +                       resets = <&cpg 612>;
> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       reg = <0>;
> +                                       isp0csi40: endpoint {

Shouldn't this be endpoint@something  (+ appropriate {address,size}-cells
above), as the bindings say there can be multiple endpoints?
Same for isp2csi42.

> +                                               remote-endpoint = <&csi40isp0>;
> +                                       };
> +                               };

> +               isp1: isp@fed20000 {
> +                       compatible = "renesas,isp-r8a779a0";
> +                       reg = <0 0xfed20000 0 0x10000>;
> +                       interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 613>;
> +                       power-domains = <&sysc R8A779A0_PD_A3ISP01>;
> +                       resets = <&cpg 613>;
> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@0 {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       reg = <0>;
> +                                       isp1csi41: endpoint@1 {
> +                                               reg = <1>;

BTW, where does the "1" come from?
Same for isp3csi43.

> +                                               remote-endpoint = <&csi41isp1>;
> +                                       };
> +                               };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
