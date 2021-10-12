Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBF2B429F1D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 09:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234071AbhJLIAO convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Oct 2021 04:00:14 -0400
Received: from mail-vk1-f170.google.com ([209.85.221.170]:43656 "EHLO
        mail-vk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232541AbhJLIAN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 04:00:13 -0400
Received: by mail-vk1-f170.google.com with SMTP id j38so6816417vkd.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Oct 2021 00:58:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EapaJeEkd+vSTU8C7fw9jinBp8H40YembPdnoTBcpL8=;
        b=dVRlf3pZYXRPkK5/OGAQaZzNzvJQHJr0if2VZpfyjuUXvzBSx62931bepUfWNRNs+F
         7IhkZXnON6Ch91qbdjGxaz5GcuAf4Dvzaxreh6qk3PN/7bKhHhgShjmoecm+qzadjejE
         I5vuylgaq+hiWHpKwcVGqBRSXWPLIApg1miweSN6WkkQBK3gtjLc3xHvhvLJPibFlFT6
         4lvslJv2q2N0FY0Kv7ITE3eVeLh2PgINyyOxEarPCJaiiVYMKy7IfCYMdMhnUS6uftHV
         DSByy2uUQvONfJqdaFYZQ+WvFx1qtwMlykJtDDNQT9+PRFanMSY/Zd9kDGfgIsZSvZZ5
         Tsxg==
X-Gm-Message-State: AOAM5330L9jTM9cdNOVqwd0/pUnSZZ3LsxbWav0ca+63YhIqAKD8JG32
        8TYflxuk5WoBiuRKTqtlmUkXCdqz8puLbEFrg/c9VKXJqW0=
X-Google-Smtp-Source: ABdhPJwwi89+jCfIDv+14N2aOvJVD7WAb8VB9UVFukYfgk/ktOouSchagSxIFT8ZTrqxFtkYwK/BcDPulrDRg9UMK+U=
X-Received: by 2002:a05:6122:a20:: with SMTP id 32mr8813820vkn.15.1634025491739;
 Tue, 12 Oct 2021 00:58:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211010175227.3247895-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20211010175227.3247895-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Oct 2021 09:58:00 +0200
Message-ID: <CAMuHMdVY+f22BAT7XBvNX3Nironhu8+vat=_ZOEJZHbSUeQpCQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779a0: Add and connect all
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

On Sun, Oct 10, 2021 at 7:52 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The V3U have 32 VIN, 4 CSI-2 and 4 ISP nodes that interact with each
> other for video capture. Add all nodes and record how they are
> interconnected.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Fix endpoint for vin00 to vin07 that where missing @0 and
>   {address,size}-cells and reg properties.
> - Fix endpoint for all isp nodes that where missing @0 and
>   {address,size}-cells and reg properties.
> - Update compatible for ISP from renesas,isp-r8a779a0 to
>   renesas,r8a779a0-isp.

Thanks for the update!

> The last binding document for the CSI-2 nodes are now merged in the
> media-tree and this completes the coverage for the nodes in this patch.
>
> If you are happy with the corrections I made from v1 I think this is
> ready to be picked up.

The new version looks good to me, but I still get one complaint from
"make dtbs_check", cfr. below.

> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi

> @@ -1268,6 +2164,426 @@ vspd1: vsp@fea28000 {
>                         renesas,fcp = <&fcpvd1>;
>                 };
>
> +               csi40: csi2@feaa0000 {
> +                       compatible = "renesas,r8a779a0-csi2";
> +                       reg = <0 0xfeaa0000 0 0x10000>;
> +                       interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 331>;
> +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 331>;
> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                                       csi40isp0: endpoint {
> +                                               remote-endpoint = <&isp0csi40>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               csi41: csi2@feab0000 {
> +                       compatible = "renesas,r8a779a0-csi2";
> +                       reg = <0 0xfeab0000 0 0x10000>;
> +                       interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 400>;
> +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 400>;
> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                                       csi41isp1: endpoint {
> +                                               remote-endpoint = <&isp1csi41>;
> +                                       };
> +                               };

arch/arm64/boot/dts/renesas/r8a779a0-falcon.dt.yaml: csi2@feab0000:
ports: 'port@0' is a required property
From schema: Documentation/devicetree/bindings/media/renesas,csi2.yaml

(only for this CSI instance).

> +                       };
> +               };
> +
> +               csi42: csi2@fed60000 {
> +                       compatible = "renesas,r8a779a0-csi2";
> +                       reg = <0 0xfed60000 0 0x10000>;
> +                       interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 401>;
> +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 401>;
> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                                       csi42isp2: endpoint {
> +                                               remote-endpoint = <&isp2csi42>;
> +                                       };
> +                               };
> +                       };
> +               };
> +
> +               csi43: csi2@fed70000 {
> +                       compatible = "renesas,r8a779a0-csi2";
> +                       reg = <0 0xfed70000 0 0x10000>;
> +                       interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 402>;
> +                       power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +                       resets = <&cpg 402>;
> +                       status = "disabled";
> +
> +                       ports {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               port@1 {
> +                                       reg = <1>;
> +                                       csi43isp3: endpoint {
> +                                               remote-endpoint = <&isp3csi43>;
> +                                       };
> +                               };
> +                       };
> +               };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
