Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62FD428DED0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Oct 2020 12:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728973AbgJNKTy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Oct 2020 06:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgJNKTx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Oct 2020 06:19:53 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F896C061755
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2020 03:19:53 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id i2so2605298ljg.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Oct 2020 03:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=czi2cwWiSLa6vtRB5N1HyM6r6G62r/vG+1s/YjB62Eo=;
        b=vC0qOjfQyKsGeVMIaOUmgXKCkNQvHKrH18ccascEmw+1bqhCTzaKFv2nJLwTT/I51i
         LkFJSEq+tKGmzrnpKuNHYNvd55Y+/ObAjf8zUZk+Ykj8CsVEuRJoINjfnfXyZvOT5q2M
         Gc4AkMThURGxPhTpF/9tbWk/vR8AugSD+IvTdp2G1Ce1PzkxkPAUdB7y2vaBFyuGh3VX
         EGFSXOl1tZjLc/yIklMF2eRis6wA5YwVoJZ4J+XdebiHXBmqQRQDLw5UbMfJCSz2RjWL
         YBKBERNP3XWcC+MY2bTnqY4yABmAR27XtVVmNJsX8QIIxAJ6fZjJJnb0egvGMaNQzbqN
         CqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=czi2cwWiSLa6vtRB5N1HyM6r6G62r/vG+1s/YjB62Eo=;
        b=HkuUZ4t13FErGGuAa4nFRVm12UUq6HSmdo/hoiTj/RuEVitTPiKvMbHZq8HmjORSj9
         h48txHodPD+nIYLPOZeFNLT7oMkLJZAyqlTG5Yv+D9h8yhv3338DGRqlp4/9i97gPDDZ
         FqtgiGAY0xOqrH1ANa6QCPizBUWuk9OBTAmiP4T+F9gxN6fmnh5EDPx6BSTbDPxQRDMf
         JNYWd77GC5zsGT4+LOJk9QWjVqZoPhlmU3T93EyydAO1PX0PeBbvKRj4Z/2i1VoG+1el
         qonRGOogphn4bh2rlmDuEsj5CYw0YwvRgbHXSd0im9kVlTtorgAywXKLSLaZA2JzfGcM
         kc+A==
X-Gm-Message-State: AOAM530+uXkTh7unvh1lwti4QstfgfvID+uF82Eg7HfgZFaD9WfMJtLu
        XoZmYyzI7PAZo8jra8x+felWmA==
X-Google-Smtp-Source: ABdhPJzoHaCGUWSUNozh/lJ3cNwQCLW5odUJLJIkc8I7o4TNJOqXrALXWj0HHO/d1tsqrhYMLRKJCA==
X-Received: by 2002:a2e:9ccc:: with SMTP id g12mr1520164ljj.135.1602670791601;
        Wed, 14 Oct 2020 03:19:51 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id s16sm1026201ljj.35.2020.10.14.03.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 03:19:50 -0700 (PDT)
Date:   Wed, 14 Oct 2020 12:19:50 +0200
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: r8a779a0: Add VIN nodes
Message-ID: <20201014101950.6imj3hql3cjb6fsv@oden.dyn.berto.se>
References: <20201014094443.11070-1-jacopo+renesas@jmondi.org>
 <20201014094443.11070-7-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201014094443.11070-7-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thanks for your work.

On 2020-10-14 11:44:43 +0200, Jacopo Mondi wrote:
> Add VIN nodes to R8A779A0 R-Car V3U SoC.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 320 ++++++++++++++++++++++
>  1 file changed, 320 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> index 83962ad30a1d..bc81e6a761d3 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -105,6 +105,326 @@ scif0: serial@e6e60000 {
>  			status = "disabled";
>  		};
>  
> +		vin0: video@e6ef0000 {
> +			compatible = "renesas,vin-r8a779a0";

How is this tested? There is no driver support and the schema you added 
the compat string to mandates the 'renesas,id' property for the vin 
nodes. As far as I can tell the reason for this id is gone with the new 
pipeline of the V3U. So I guess as long as we don't break dtschema 
validation all is good, just wanted to make sure ;-)

> +			reg = <0 0xe6ef0000 0 0x1000>;
> +			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 730>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 730>;
> +			status = "disabled";
> +		};
> +
> +		vin1: video@e6ef1000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6ef1000 0 0x1000>;
> +			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 731>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 731>;
> +			status = "disabled";
> +		};
> +
> +		vin2: video@e6ef2000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6ef2000 0 0x1000>;
> +			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 800>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 800>;
> +			status = "disabled";
> +		};
> +
> +		vin3: video@e6ef3000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6ef3000 0 0x1000>;
> +			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 801>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 801>;
> +			status = "disabled";
> +		};
> +
> +		vin4: video@e6ef4000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6ef4000 0 0x1000>;
> +			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 802>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 802>;
> +			status = "disabled";
> +		};
> +
> +		vin5: video@e6ef5000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6ef5000 0 0x1000>;
> +			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 803>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 803>;
> +			status = "disabled";
> +		};
> +
> +		vin6: video@e6ef6000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6ef6000 0 0x1000>;
> +			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 804>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 804>;
> +			status = "disabled";
> +		};
> +
> +		vin7: video@e6ef7000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6ef7000 0 0x1000>;
> +			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 805>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 805>;
> +			status = "disabled";
> +		};
> +
> +		vin8: video@e6ef8000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6ef8000 0 0x1000>;
> +			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 806>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 806>;
> +			status = "disabled";
> +		};
> +
> +		vin9: video@e6ef9000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6ef9000 0 0x1000>;
> +			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 807>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 807>;
> +			status = "disabled";
> +		};
> +
> +		vin10: video@e6efa000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6efa000 0 0x1000>;
> +			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 808>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 808>;
> +			status = "disabled";
> +		};
> +
> +		vin11: video@e6efb000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6efb000 0 0x1000>;
> +			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 809>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 809>;
> +			status = "disabled";
> +		};
> +
> +		vin12: video@e6efc000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6efc000 0 0x1000>;
> +			interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 810>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 810>;
> +			status = "disabled";
> +		};
> +
> +		vin13: video@e6efd000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6efd000 0 0x1000>;
> +			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 811>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 811>;
> +			status = "disabled";
> +		};
> +
> +		vin14: video@e6efe000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6efe000 0 0x1000>;
> +			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 812>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 812>;
> +			status = "disabled";
> +		};
> +
> +		vin15: video@e6eff000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6eff000 0 0x1000>;
> +			interrupts = <GIC_SPI 175 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 813>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 813>;
> +			status = "disabled";
> +		};
> +
> +		vin16: video@e6ed0000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6ed0000 0 0x1000>;
> +			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 814>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 814>;
> +			status = "disabled";
> +		};
> +
> +		vin17: video@e6ed1000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6ed1000 0 0x1000>;
> +			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 815>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 815>;
> +			status = "disabled";
> +		};
> +
> +		vin18: video@e6ed2000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6ed2000 0 0x1000>;
> +			interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 816>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 816>;
> +			status = "disabled";
> +		};
> +
> +		vin19: video@e6ed3000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6ed3000 0 0x1000>;
> +			interrupts = <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 817>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 817>;
> +			status = "disabled";
> +		};
> +
> +		vin20: video@e6ed4000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6ed4000 0 0x1000>;
> +			interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 818>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 818>;
> +			status = "disabled";
> +		};
> +
> +		vin21: video@e6ed5000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6ed5000 0 0x1000>;
> +			interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 819>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 819>;
> +			status = "disabled";
> +		};
> +
> +		vin22: video@e6ed6000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6ed6000 0 0x1000>;
> +			interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 820>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 820>;
> +			status = "disabled";
> +		};
> +
> +		vin23: video@e6ed7000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6ed7000 0 0x1000>;
> +			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 821>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 821>;
> +			status = "disabled";
> +		};
> +
> +		vin24: video@e6ed8000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6ed8000 0 0x1000>;
> +			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 822>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 822>;
> +			status = "disabled";
> +		};
> +
> +		vin25: video@e6ed9000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6ed9000 0 0x1000>;
> +			interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 823>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 823>;
> +			status = "disabled";
> +		};
> +
> +		vin26: video@e6eda000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6eda000 0 0x1000>;
> +			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 824>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 824>;
> +			status = "disabled";
> +		};
> +
> +		vin27: video@e6edb000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6edb000 0 0x1000>;
> +			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 825>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 825>;
> +			status = "disabled";
> +		};
> +
> +		vin28: video@e6edc000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6edc000 0 0x1000>;
> +			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 826>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 826>;
> +			status = "disabled";
> +		};
> +
> +		vin29: video@e6edd000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6edd000 0 0x1000>;
> +			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 827>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 827>;
> +			status = "disabled";
> +		};
> +
> +		vin30: video@e6ede000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6ede000 0 0x1000>;
> +			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 828>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 828>;
> +			status = "disabled";
> +		};
> +
> +		vin31: video@e6edf000 {
> +			compatible = "renesas,vin-r8a779a0";
> +			reg = <0 0xe6edf000 0 0x1000>;
> +			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 829>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 829>;
> +			status = "disabled";
> +		};
> +
>  		csi40: csi2@feaa0000 {
>  			compatible = "renesas,r8a779a0-csi2";
>  			reg = <0 0xfeaa0000 0 0x10000>;
> -- 
> 2.28.0
> 

-- 
Regards,
Niklas S�derlund
