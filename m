Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3091B90420
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Aug 2019 16:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbfHPOp0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Aug 2019 10:45:26 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.20]:36694 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727291AbfHPOp0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Aug 2019 10:45:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1565966724;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=qBj75Q5pWLtoR5hEl/1HckMzOgleVu9NT+gf6Fkd0eQ=;
        b=eaWQNbu961NzRbKPclcZy7cZSn+gh6W/i+dQSrFgmNYxDP5/xrumT1GtWvfmRtot+s
        RqWxXJqCyEykLEdWbA4YOodXzNZxTlnY0vvXr/eCCROrr4b3xdhPItnADylfOKGrX3dJ
        blsdHzAhE1t+PhZl77MXL7BJzMLlQRWOOjtQQBd+BY/HUpk2suYSkKooV7ef2s8a06EP
        2dIx5XmyY3gU53GFdhjeVSyoDU/fD9p2eALSDoN9yTodpUz7be4b4BbdLJMPhetNryP1
        YwWu1e+cPDZPItJKkTD9/N+FhsoYRxhy1lWqUE/4RmE+AOsrrpxiLSr5Qdf5+ijMMonn
        KWtg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp02-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.26.1 AUTH)
        with ESMTPSA id K077a3v7GEjNBdN
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 16 Aug 2019 16:45:23 +0200 (CEST)
Date:   Fri, 16 Aug 2019 16:45:23 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org
Message-ID: <915285055.72272.1565966723596@webmail.strato.com>
In-Reply-To: <20190816122229.13157-1-geert+renesas@glider.be>
References: <20190816122229.13157-1-geert+renesas@glider.be>
Subject: Re: [PATCH] ARM: dts: r8a7779: Use SYSC "always-on" PM Domain for
 HSCIF
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.10.1-Rev18
X-Originating-IP: 85.212.141.201
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On August 16, 2019 at 2:22 PM Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> 
> 
> Hook up HSCIF serial devices that are part of the CPG/MSTP Clock Domain
> to the SYSC "always-on" PM Domain, for a more consistent
> device-power-area description in DT.
> 
> Cfr. commit 751e29bbb64ad091 ("ARM: dts: r8a7779: Use SYSC "always-on" PM Domain").
> 
> Fixes: 055d15a88f66b096 ("ARM: dts: r8a7779: Add HSCIF0/1 device nodes")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-devel for v5.4.
> 
>  arch/arm/boot/dts/r8a7779.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
> index 3ff2592075275555..ebf5b7cfe21599c6 100644
> --- a/arch/arm/boot/dts/r8a7779.dtsi
> +++ b/arch/arm/boot/dts/r8a7779.dtsi
> @@ -296,7 +296,7 @@
>  			 <&cpg_clocks R8A7779_CLK_S>,
>  			 <&scif_clk>;
>  		clock-names = "fck", "brg_int", "scif_clk";
> -		power-domains = <&cpg_clocks>;
> +		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
>  		status = "disabled";
>  	};
>  
> @@ -309,7 +309,7 @@
>  			 <&cpg_clocks R8A7779_CLK_S>,
>  			 <&scif_clk>;
>  		clock-names = "fck", "brg_int", "scif_clk";
> -		power-domains = <&cpg_clocks>;
> +		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
>  		status = "disabled";
>  	};
>  
> -- 

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli

> 2.17.1
>
