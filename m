Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80872E2BA2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Oct 2019 10:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404701AbfJXH76 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Oct 2019 03:59:58 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:44719 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408784AbfJXH76 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Oct 2019 03:59:58 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1iNY2D-0006hy-CI; Thu, 24 Oct 2019 09:59:53 +0200
Message-ID: <b5653d484cb84160992355733153da711aef0849.camel@pengutronix.de>
Subject: Re: [PATCH v2 3/5] dt-bindings: reset: rcar-rst: Document r8a77961
 support
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Date:   Thu, 24 Oct 2019 09:59:50 +0200
In-Reply-To: <20191023122911.12166-4-geert+renesas@glider.be>
References: <20191023122911.12166-1-geert+renesas@glider.be>
         <20191023122911.12166-4-geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Wed, 2019-10-23 at 14:29 +0200, Geert Uytterhoeven wrote:
> Add DT binding documentation for the Reset block in the Renesas R-Car
> M3-W+ (R8A77961) SoC.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> v2:
>   - Add Reviewed-by.
> ---
>  Documentation/devicetree/bindings/reset/renesas,rst.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.txt b/Documentation/devicetree/bindings/reset/renesas,rst.txt
> index d6d6769a0c42735f..de7f06ccd003da9f 100644
> --- a/Documentation/devicetree/bindings/reset/renesas,rst.txt
> +++ b/Documentation/devicetree/bindings/reset/renesas,rst.txt
> @@ -31,6 +31,7 @@ Required properties:
>  		  - "renesas,r8a7794-rst" (R-Car E2)
>  		  - "renesas,r8a7795-rst" (R-Car H3)
>  		  - "renesas,r8a7796-rst" (R-Car M3-W)
> +		  - "renesas,r8a77961-rst" (R-Car M3-W+)
>  		  - "renesas,r8a77965-rst" (R-Car M3-N)
>  		  - "renesas,r8a77970-rst" (R-Car V3M)
>  		  - "renesas,r8a77980-rst" (R-Car V3H)

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

