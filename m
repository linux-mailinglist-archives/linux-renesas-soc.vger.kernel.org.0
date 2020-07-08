Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFFE9218F4B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2020 19:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgGHRxi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jul 2020 13:53:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:57882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726100AbgGHRxi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jul 2020 13:53:38 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 62219206E9;
        Wed,  8 Jul 2020 17:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594230817;
        bh=ZXTVrAxt2BMAWE6jdwxSDmOlWWlY67skJb6anAFgFQs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=SK/e44KLdRfJM29yIStfOo7N8ICd0pwunnsQJIXgfumzLPch2QwpB2QHz9mBmw2xn
         6xaAol7QCiZYkv8cMVtkv3AsX4AHhZXZhy14C5eY2zM1ED/InYBzdqvDoUcJCJKwie
         ffhJ3RezTrRyIf6y1p8ootCJOKI+f62QSz63DCGQ=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1jtEGF-00AAKr-Te; Wed, 08 Jul 2020 18:53:36 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 08 Jul 2020 18:53:35 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 6/8] arm64: dts: renesas: Initial r8a774e1 SoC device tree
In-Reply-To: <1594230511-24790-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594230511-24790-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <daf83dafc069b12b6a10205e5f93793a@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: prabhakar.mahadev-lad.rj@bp.renesas.com, geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org, tglx@linutronix.de, jason@lakedaemon.net, ulf.hansson@linaro.org, gregkh@linuxfoundation.org, catalin.marinas@arm.com, will@kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, prabhakar.csengg@gmail.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2020-07-08 18:48, Lad Prabhakar wrote:
> From: Marian-Cristian Rotariu 
> <marian-cristian.rotariu.rb@bp.renesas.com>
> 
> Basic support for the RZ/G2H SoC.
> 
> Signed-off-by: Marian-Cristian Rotariu
> <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 652 ++++++++++++++++++++++
>  1 file changed, 652 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> new file mode 100644
> index 000000000000..6637e157ffcd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi

[...]
> +		gic: interrupt-controller@f1010000 {
> +			compatible = "arm,gic-400";
> +			#interrupt-cells = <3>;
> +			#address-cells = <0>;
> +			interrupt-controller;
> +			reg = <0x0 0xf1010000 0 0x1000>,
> +			      <0x0 0xf1020000 0 0x20000>,
> +			      <0x0 0xf1040000 0 0x20000>,
> +			      <0x0 0xf1060000 0 0x20000>;
> +			interrupts = <GIC_PPI 9
> +					(GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;

You seem to have a bit more than only 2 CPUs in this system.

> +			clocks = <&cpg CPG_MOD 408>;
> +			clock-names = "clk";
> +			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
> +			resets = <&cpg 408>;
> +		};

         M.
-- 
Jazz is not dead. It just smells funny...
