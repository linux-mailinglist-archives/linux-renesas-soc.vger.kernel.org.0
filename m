Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BF4437A18
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 18:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbfFFQxN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 12:53:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:44928 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728305AbfFFQxN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 12:53:13 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBA6333B;
        Thu,  6 Jun 2019 18:53:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559839991;
        bh=tOU1DPqgtzYWV6dcVYsaOM6vAbyR5dvopinvYtXfsAU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X2LFSAvI++z6oE1SYWy0VykF2ETXjBbx1dAqkMSKuMzcFxSS1fr2cg1jemYUF9xw0
         cHALCR3cGZqU3NRl6COU0JK31Avb/TX4XawbfsKvd+svD0jPqSrtIUEi2KidJvW/Qg
         61MtX4jP/7UQ33TcMCBKjKb894MPF/KiWbQexCAE=
Date:   Thu, 6 Jun 2019 19:52:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/20] dt-bindings: display, renesas,du: Document cmms
 property
Message-ID: <20190606165257.GJ12825@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-3-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Jun 06, 2019 at 04:22:02PM +0200, Jacopo Mondi wrote:
> Document the newly added 'cmms' property which accepts a list of phandle
> and channel index pairs that point to the CMM units available for each
> Display Unit output video channel.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
> index aedb22b4d161..100114ef11d5 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> @@ -44,6 +44,10 @@ Required Properties:
>      instance that serves the DU channel, and the channel index identifies the
>      LIF instance in that VSP.
>  
> +  - cmms: A list of phandles to the CMM instances present in the SoC, one
> +    for each available DU channel. The property shall not be specified for
> +    SoCs that does not provide any CMM (such as V3M and V3H).

s/does/do/

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  Required nodes:
>  
>  The connections to the DU output video ports are modeled using the OF graph
> @@ -89,6 +93,7 @@ Example: R8A7795 (R-Car H3) ES2.0 DU
>  			 <&cpg CPG_MOD 721>;
>  		clock-names = "du.0", "du.1", "du.2", "du.3";
>  		vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
> +		cmms = <&cmm0 &cmm1 &cmm2 &cmm3>;
>  
>  		ports {
>  			#address-cells = <1>;

-- 
Regards,

Laurent Pinchart
