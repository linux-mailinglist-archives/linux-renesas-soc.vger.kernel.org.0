Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 784D5167F7E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2020 15:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728431AbgBUOCd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Feb 2020 09:02:33 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:51176 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728086AbgBUOCd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Feb 2020 09:02:33 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 43FE8563;
        Fri, 21 Feb 2020 15:02:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582293751;
        bh=LHOEgWcV5LXy9IWvVA95XvSPs95X1mQqo+NnQYHmIjM=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=lrWZ4ZYc3iuR7wI/Y5T2XoJfiEGBOQZpxExjyD/N4fVYttHW4JtbrwEHAMk3Xhfan
         H9Z9fXyr4pGGT5q0lC2xn/p0YT+MG6esEEEJwp9eoYX/bcMuD91ueh0iF1pomOxP+S
         ftqpSERsMdrLPIir6BZ2EKi0mN+EQRSTEwhVRwuI=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH] ARM: dts: r8a7745: Convert to new DU DT bindings
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org
References: <20200218132217.21454-1-geert+renesas@glider.be>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <69127007-c4ae-185b-21b5-e32da0af32d9@ideasonboard.com>
Date:   Fri, 21 Feb 2020 14:02:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200218132217.21454-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 18/02/2020 13:22, Geert Uytterhoeven wrote:
> The DU DT bindings have been updated to drop the reg-names property.
> Update the r8a7745 device tree accordingly.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Looks fine.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  arch/arm/boot/dts/r8a7745.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7745.dtsi b/arch/arm/boot/dts/r8a7745.dtsi
> index 3f88a7e34af2c28b..3b413658eb8d8fac 100644
> --- a/arch/arm/boot/dts/r8a7745.dtsi
> +++ b/arch/arm/boot/dts/r8a7745.dtsi
> @@ -1506,7 +1506,6 @@
>  		du: display@feb00000 {
>  			compatible = "renesas,du-r8a7745";
>  			reg = <0 0xfeb00000 0 0x40000>;
> -			reg-names = "du";
>  			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>;
> 

