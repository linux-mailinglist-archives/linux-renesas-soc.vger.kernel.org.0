Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3420025FDB3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 17:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730200AbgIGP4V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 11:56:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730104AbgIGPzs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 11:55:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DE08C061574;
        Mon,  7 Sep 2020 08:55:44 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 800833E;
        Mon,  7 Sep 2020 17:55:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599494107;
        bh=ePFs/RPBL9rw0BM8t2BDNCfTz5P+uLJypOhdDkXDWVc=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=mw2nVh2/FK9JmNKXQcVQdZqMjJ7x9Bb5KdwTmil+ECNMUzBOgM6FbdMGVetb+I3wF
         LqcFcRRMEmhPPlEVxp+uz57vsR2yWrUOgZR0tDEIJo+oLiRVNHvd+P5XV2fhb1Sr7q
         1Vxai3AExKaP0uqfmmoq7EMbzSsw17haOF/fHIPw=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 5/9] arm64: dts: renesas: r8a77961: Add VSP device nodes
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Laurent <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        "(Renesas) shimoda" <yoshihiro.shimoda.uh@renesas.com>,
        dri-devel@lists.freedesktop.org
References: <87sgbu70tq.wl-kuninori.morimoto.gx@renesas.com>
 <87lfhm70s6.wl-kuninori.morimoto.gx@renesas.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <31ec6196-7613-8eb3-e092-07d0c874632a@ideasonboard.com>
Date:   Mon, 7 Sep 2020 16:55:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87lfhm70s6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On 07/09/2020 03:59, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch adds VSP device nodes for R-Car M3-W+ (r8a77961) SoC.
> This patch is test on R-Car M3-W+ Salvator-XS board.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 55 +++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> index fe0db11b9cb9..c2a6918ed5e6 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -2056,6 +2056,61 @@ fcpvd2: fcp@fea37000 {
>  			iommus = <&ipmmu_vi0 10>;
>  		};

The FCP's added are:

                fcpf0: fcp@fe950000 {
                fcpf1: fcp@fe951000 {
                fcpvb0: fcp@fe96f000 {
                fcpvb1: fcp@fe92f000 {
                fcpvi0: fcp@fe9af000 {
                fcpvi1: fcp@fe9bf000 {
                fcpvd0: fcp@fea27000 {
                fcpvd1: fcp@fea2f000 {
                fcpvd2: fcp@fea37000 {

So indeed, the first fcpf0 comes before fe960000.

Do we keep the items grouped by the first occurrence? or sort the nodes
based on address?

for some reason I thought we were ordering based on address, but I see
other situations where we group too - so I'm confused (and wishing there
was an automatic tool to get the sorting correct without fuss).

Is there a set policy?

--
Kieran


> +		vspb: vsp@fe960000 {
> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfe960000 0 0x8000>;
> +			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 626>;
> +			power-domains = <&sysc R8A77961_PD_A3VC>;
> +			resets = <&cpg 626>;
> +
> +			renesas,fcp = <&fcpvb0>;
> +		};
> +
> +		vspd0: vsp@fea20000 {
> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfea20000 0 0x5000>;
> +			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 623>;
> +			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
> +			resets = <&cpg 623>;
> +
> +			renesas,fcp = <&fcpvd0>;
> +		};
> +
> +		vspd1: vsp@fea28000 {
> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfea28000 0 0x5000>;
> +			interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 622>;
> +			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
> +			resets = <&cpg 622>;
> +
> +			renesas,fcp = <&fcpvd1>;
> +		};
> +
> +		vspd2: vsp@fea30000 {
> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfea30000 0 0x5000>;
> +			interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 621>;
> +			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
> +			resets = <&cpg 621>;
> +
> +			renesas,fcp = <&fcpvd2>;
> +		};
> +
> +		vspi0: vsp@fe9a0000 {
> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfe9a0000 0 0x8000>;
> +			interrupts = <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 631>;
> +			power-domains = <&sysc R8A77961_PD_A3VC>;
> +			resets = <&cpg 631>;
> +
> +			renesas,fcp = <&fcpvi0>;
> +		};
> +
>  		csi20: csi2@fea80000 {
>  			reg = <0 0xfea80000 0 0x10000>;
>  			/* placeholder */
> 

