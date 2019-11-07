Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31537F256B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 03:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732382AbfKGC3k (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Nov 2019 21:29:40 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:47364 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbfKGC3k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Nov 2019 21:29:40 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 39F532D1;
        Thu,  7 Nov 2019 03:29:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1573093778;
        bh=10cPkHoiL4VtxxYfO8BfkPKU8pAwjaQbgE/SdPHPfQA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vd58pCKjdA2EL4jUIFi6vRgerVlSxLI8b8ge/+SngBcPDCbAyprNVTwSyaWBJQx32
         DBAhLPmZXi2i9p1819pI5XLJeaWlhTrHSm/Bopy43pmwOaFYA2mFu8iAhdZBGnS+gc
         /Db91FIIItFZU+nnIi2FPkrmr7Ve0yhrj8DmzkOo=
Date:   Thu, 7 Nov 2019 04:29:29 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: renesas: du: Add vendor prefix
 to vsps property
Message-ID: <20191107022929.GK4878@pendragon.ideasonboard.com>
References: <20191105183504.21447-1-geert+renesas@glider.be>
 <20191105183504.21447-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191105183504.21447-2-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Tue, Nov 05, 2019 at 07:35:02PM +0100, Geert Uytterhoeven wrote:
> The Renesas-specific "vsps" property lacks a vendor prefix.
> Add a "renesas," prefix to comply with DT best practises.
> 
> Move "renesas,vsps" below "renesas,cmms" to preserve alphabetical sort
> order.
> 
> Fixes: 06711e6385a4ab4c ("drm: rcar-du: Document the vsps property in the DT bindings")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and taken in my tree.

> ---
>  .../devicetree/bindings/display/renesas,du.txt       | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> index f6fdaa67c257a046..eb4ae41fe41f83c7 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -41,15 +41,15 @@ Required Properties:
>        supplied they must be named "dclkin.x" with "x" being the input clock
>        numerical index.
>  
> -  - vsps: A list of phandle and channel index tuples to the VSPs that handle
> -    the memory interfaces for the DU channels. The phandle identifies the VSP
> -    instance that serves the DU channel, and the channel index identifies the
> -    LIF instance in that VSP.
> -
>    - renesas,cmms: A list of phandles to the CMM instances present in the SoC,
>      one for each available DU channel. The property shall not be specified for
>      SoCs that do not provide any CMM (such as V3M and V3H).
>  
> +  - renesas,vsps: A list of phandle and channel index tuples to the VSPs that
> +    handle the memory interfaces for the DU channels. The phandle identifies the
> +    VSP instance that serves the DU channel, and the channel index identifies
> +    the LIF instance in that VSP.
> +
>  Required nodes:
>  
>  The connections to the DU output video ports are modeled using the OF graph
> @@ -96,8 +96,8 @@ Example: R8A7795 (R-Car H3) ES2.0 DU
>  			 <&cpg CPG_MOD 722>,
>  			 <&cpg CPG_MOD 721>;
>  		clock-names = "du.0", "du.1", "du.2", "du.3";
> -		vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
>  		renesas,cmms = <&cmm0>, <&cmm1>, <&cmm2>, <&cmm3>;
> +		renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
>  
>  		ports {
>  			#address-cells = <1>;

-- 
Regards,

Laurent Pinchart
