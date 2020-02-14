Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00D5E15D4D3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2020 10:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728924AbgBNJf1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Feb 2020 04:35:27 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:34618 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728865AbgBNJf1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Feb 2020 04:35:27 -0500
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73600504;
        Fri, 14 Feb 2020 10:35:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1581672926;
        bh=L1QMvkTmDy5Uvz2VqDZr+3R1vRelki8DxUq1A1PCZ6g=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Bt4h8YURtgThJGeR4azMdlK/U1ru7BtnUjr7XIDQyyeH+PYPQj1GP5MoDK11S/RoH
         0QEMaxq9+N0hwKLLickz45txI97uCWj1c3/z1+IryBNGJq2YfzGEaX3wL3H8D26Nk1
         Kxm+poZZYaBEvlR41B6O1VeShWMPQSiqg4ZLqn5w=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH v5] dt-bindings: display: renesas: du: Document optional
 reset properties
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20200214082623.4893-1-geert+renesas@glider.be>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <78fd5397-8294-7bc5-de5d-1b71d78a96a4@ideasonboard.com>
Date:   Fri, 14 Feb 2020 09:35:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200214082623.4893-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 14/02/2020 08:26, Geert Uytterhoeven wrote:
> Document the optional properties for describing module resets, to
> support resetting display channels on R-Car Gen2 and Gen3.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
> Who's taking this kind of patches?
> V1 was submmitted in March 2017.

Hrm ... presumably through the DRM subsystem trees?

Or just for Laurent to pick up ...
--
KB


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
> 

