Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B18A43CBE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 17:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbfFMPhM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 11:37:12 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:41726 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbfFMKMY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 06:12:24 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 686A225BE33;
        Thu, 13 Jun 2019 20:12:22 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 69149940483; Thu, 13 Jun 2019 12:12:20 +0200 (CEST)
Date:   Thu, 13 Jun 2019 12:12:20 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, Cao Van Dong <cv-dong@jinso.co.jp>
Subject: Re: [PATCH repost] dt-bindings: timer: renesas, cmt: Document
 r8a779{5|65|90} CMT support
Message-ID: <20190613101219.vx4ht6dixxu7fioi@verge.net.au>
References: <20190509122949.23256-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190509122949.23256-1-horms+renesas@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, May 09, 2019 at 02:29:49PM +0200, Simon Horman wrote:
> From: Cao Van Dong <cv-dong@jinso.co.jp>
> 
> Document SoC specific bindings for R-Car H3/M3-N/E3 SoCs.

Hi Daniel and Thomas,

would you object to me taking this patch through the renesas tree.
It has been outstanding for some time now.

> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> index c0594450e9ef..c5220bcd852b 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> @@ -42,12 +42,18 @@ Required Properties:
>      - "renesas,r8a7793-cmt1" for the 48-bit CMT1 device included in r8a7793.
>      - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
>      - "renesas,r8a7794-cmt1" for the 48-bit CMT1 device included in r8a7794.
> +    - "renesas,r8a7795-cmt0" for the 32-bit CMT0 device included in r8a7795.
> +    - "renesas,r8a7795-cmt1" for the 48-bit CMT1 device included in r8a7795.
>      - "renesas,r8a7796-cmt0" for the 32-bit CMT0 device included in r8a7796.
>      - "renesas,r8a7796-cmt1" for the 48-bit CMT1 device included in r8a7796.
> +    - "renesas,r8a77965-cmt0" for the 32-bit CMT0 device included in r8a77965.
> +    - "renesas,r8a77965-cmt1" for the 48-bit CMT1 device included in r8a77965.
>      - "renesas,r8a77970-cmt0" for the 32-bit CMT0 device included in r8a77970.
>      - "renesas,r8a77970-cmt1" for the 48-bit CMT1 device included in r8a77970.
>      - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a77980.
>      - "renesas,r8a77980-cmt1" for the 48-bit CMT1 device included in r8a77980.
> +    - "renesas,r8a77990-cmt0" for the 32-bit CMT0 device included in r8a77990.
> +    - "renesas,r8a77990-cmt1" for the 48-bit CMT1 device included in r8a77990.
>  
>      - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2
>  		and RZ/G1.
> -- 
> 2.11.0
> 
