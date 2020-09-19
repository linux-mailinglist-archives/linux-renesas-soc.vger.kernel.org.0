Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D213A270C35
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 19 Sep 2020 11:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgISJes (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 19 Sep 2020 05:34:48 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:36378 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgISJer (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Sep 2020 05:34:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600508086;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=+sBe03hcZGYmQS2Pg7zJ4yFeBY1dZlw+ScuJk1avCTI=;
        b=lRUCm7hnC7U5/N2EonRBoW3fK0560Tt2XTLUtczRdg9puLpV9Fc0PlkS+gXQ24Q4TU
        f/k/seU7mfbN8u94nFPUG5bFzWtccSIqlQoMLFvawQZz8n2ox2FzgluEKzPCxRrMF9eY
        9KAPg9D5TAAdFnKlhsKF89NT10GJNkDLspbRQ/O0CqsnXc+Pk7204AAdjQ2lIx1953Ev
        RJOGcNSfbYgtqZeAyRBK5P5nEdX16Eavd+f+fEPFpiXc1qJ8llxbnnueTSGtqysP24zr
        sgP6Y3ivMaTkj04spW8A7XICNXmYJR2WUozx5gtEMLUeYc1OkDIWT0K40hbwfHeIXEpo
        CkEQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzvv3qxio1R8fCs/87J3I0="
X-RZG-CLASS-ID: mo00
Received: from oxapp05-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 46.10.7 AUTH)
        with ESMTPSA id e0624aw8J9Yj65p
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 19 Sep 2020 11:34:45 +0200 (CEST)
Date:   Sat, 19 Sep 2020 11:34:45 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org
Message-ID: <391035688.1109009.1600508085865@webmail.strato.com>
In-Reply-To: <20200917132117.8515-2-geert+renesas@glider.be>
References: <20200917132117.8515-1-geert+renesas@glider.be>
 <20200917132117.8515-2-geert+renesas@glider.be>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77990: Fix MSIOF1 DMA
 channels
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.3-Rev21
X-Originating-Client: open-xchange-appsuite
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On 09/17/2020 3:21 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
>  
> According to Technical Update TN-RCT-S0352A/E, MSIOF1 DMA can only be
> used with SYS-DMAC0 on R-Car E3.
> 
> Fixes: 8517042060b55a37 ("arm64: dts: renesas: r8a77990: Add DMA properties to MSIOF nodes")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> index 2cdf766fe3651809..87d41bc076a99d95 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -1193,9 +1193,8 @@
>  			reg = <0 0xe6ea0000 0 0x0064>;
>  			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 210>;
> -			dmas = <&dmac1 0x43>, <&dmac1 0x42>,
> -			       <&dmac2 0x43>, <&dmac2 0x42>;
> -			dma-names = "tx", "rx", "tx", "rx";
> +			dmas = <&dmac0 0x43>, <&dmac0 0x42>;
> +			dma-names = "tx", "rx";
>  			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
>  			resets = <&cpg 210>;
>  			#address-cells = <1>;
> -- 
> 2.17.1

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli
