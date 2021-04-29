Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1645C36ED99
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Apr 2021 17:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233366AbhD2PsG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Apr 2021 11:48:06 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54270 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233770AbhD2PsA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Apr 2021 11:48:00 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46E92E70;
        Thu, 29 Apr 2021 17:47:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619711232;
        bh=s6ufmk42g8UzLZ9+H7+AzTnCyuwx3c6oXqtFSexIB1o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E7B4rB8/R14Q811m6GDWfRZQ+KN7a6cK53G7zPGiAupi+tb6MztStyelbyXyXCMJ4
         Nwjn5WeDQQpr361w5WONa/ryQzNk0NHgdMz1GuH4LxW+5HkF+ZrJURFdfmOWmB6593
         YYScsCOtBml2k3FtLKLUslbO3JgeRE4tn7c0YjaY=
Date:   Thu, 29 Apr 2021 18:47:06 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: renesas,du: Make resets optional
 on R-Car H1
Message-ID: <YIrU+tdcfQ/6ODRz@pendragon.ideasonboard.com>
References: <2da75fd2e971dfab8dd05a2a28bb1d6d9cbe5adb.1619700420.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2da75fd2e971dfab8dd05a2a28bb1d6d9cbe5adb.1619700420.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thu, Apr 29, 2021 at 02:47:31PM +0200, Geert Uytterhoeven wrote:
> The "resets" property is not present on R-Car Gen1 SoCs.
> Supporting it would require migrating from renesas,cpg-clocks to
> renesas,cpg-mssr.
> 
> Reflect this in the DT bindings by removing the global "required:
> resets".  All SoCs that do have "resets" properties already have
> SoC-specific rules making it required.

Should we drop the

        resets:
	  maxItems: 1

from renesas,du-r8a7779 then ? And maybe the

  resets: true

in the general case ?

> Fixes: 99d66127fad25ebb ("dt-bindings: display: renesas,du: Convert binding to YAML")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/devicetree/bindings/display/renesas,du.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
> index 552a99ce4f1280d7..e955034da53b86e2 100644
> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -89,7 +89,6 @@ required:
>    - reg
>    - clocks
>    - interrupts
> -  - resets
>    - ports
>  
>  allOf:

-- 
Regards,

Laurent Pinchart
