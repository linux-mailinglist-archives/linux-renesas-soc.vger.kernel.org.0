Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0E2D164968
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2020 17:04:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgBSQEb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Feb 2020 11:04:31 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37506 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726645AbgBSQEb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Feb 2020 11:04:31 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1829D52B;
        Wed, 19 Feb 2020 17:04:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582128269;
        bh=5kmhVcXfV5wEqcZomv5Pfg2wJzFwKTlbi/WI5GSb/hI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U+O32+tpCrui59NrxqWublVEY8ZciUyQjQA1giZNI6hYodj/BP1DsX71KURyLSSUl
         wJoxxylRx+YLNOcL3cQhsyzokGyaX1LXzjbMA6VXpGvGWRS+H8ibq7Q8QfsSEWXDNu
         dKRF0NuauZLUy8KFIA8AxQYZRUUIXm90U4J1JC48=
Date:   Wed, 19 Feb 2020 18:04:10 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5] dt-bindings: display: renesas: du: Document optional
 reset properties
Message-ID: <20200219160410.GX5070@pendragon.ideasonboard.com>
References: <20200214082623.4893-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200214082623.4893-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Fri, Feb 14, 2020 at 09:26:23AM +0100, Geert Uytterhoeven wrote:
> Document the optional properties for describing module resets, to
> support resetting display channels on R-Car Gen2 and Gen3.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> Who's taking this kind of patches?
> V1 was submmitted in March 2017.

My bad.

> 
> v5:
>   - Rebase on top of renesas,cmms and renesas,vsps patches,
> 
> v4:
>   - Use "All but R8A7779" instead of "R8A779[0123456]", to reduce future
>     churn,
> 
> v3:
>   - Add Acked-by,
>   - Drop LVDS resets, as LVDS is now covered by a separate binding,
>   - Update the example.
> 
> v2:
>   - s/phandles/phandle/.
> ---
>  .../devicetree/bindings/display/renesas,du.txt         | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> index eb4ae41fe41f83c7..51cd4d1627703a15 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -50,6 +50,14 @@ Required Properties:
>      VSP instance that serves the DU channel, and the channel index identifies
>      the LIF instance in that VSP.
>  
> +Optional properties:
> +  - resets: A list of phandle + reset-specifier pairs, one for each entry in
> +    the reset-names property.
> +  - reset-names: Names of the resets. This property is model-dependent.
> +    - All but R8A7779 use one reset for a group of one or more successive
> +      channels. The resets must be named "du.x" with "x" being the numerical
> +      index of the lowest channel in the group.

I've now reviewed the patches that add those properties to our .dtsi
files, and I wonder how we should handle the two SoCs that have DU0, DU1
and DU3, but not DU2. The reset resource is tied to a group of two
channels, so we would use du.0 and du.2 respectively, but that conflicts
with the above text.

I'm trying to think about the implementation on the driver side, where
group resources are associated with a group object, whose index is
computed by dividing the channel number by 2. We could have a special
case in group initialization that uses du.3 instead of du.2 for the
second group.

What do you think ? Probably overkill, and we should go for du.3 ?

> +
>  Required nodes:
>  
>  The connections to the DU output video ports are modeled using the OF graph
> @@ -96,6 +104,8 @@ Example: R8A7795 (R-Car H3) ES2.0 DU
>  			 <&cpg CPG_MOD 722>,
>  			 <&cpg CPG_MOD 721>;
>  		clock-names = "du.0", "du.1", "du.2", "du.3";
> +		resets = <&cpg 724>, <&cpg 722>;
> +		reset-names = "du.0", "du.2";
>  		renesas,cmms = <&cmm0>, <&cmm1>, <&cmm2>, <&cmm3>;
>  		renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
>  

-- 
Regards,

Laurent Pinchart
