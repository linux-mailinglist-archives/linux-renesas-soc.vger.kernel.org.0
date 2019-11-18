Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35A95100F8B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2019 00:55:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbfKRXzo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Nov 2019 18:55:44 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60446 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbfKRXzo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Nov 2019 18:55:44 -0500
Received: from pendragon.ideasonboard.com (unknown [38.98.37.142])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7D18311;
        Tue, 19 Nov 2019 00:55:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1574121342;
        bh=OPbuFy8vWR5cxnnCz+S/rfqhG8X+9lN/T165urB055g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GJKZzVhEwnGm6Mn6nqF342wi1sgX5aZjbXvbdQDWbDLq5EJqW3PylT9Q+avOANtqS
         KohobwdZCbtuVYpPlzq1m7/HNYYO6N3Y4coZFsvjIomQhe+523/1cV9z9bDZILEl4/
         RSl/vWbFT7Eh7/J4hZgV3R+r+7PwGlidpVeVMuqA=
Date:   Tue, 19 Nov 2019 01:55:30 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Peter Rosin <peda@axentia.se>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v4 02/13] dt-bindings: display: bridge: lvds-transmitter:
 Document powerdown-gpios
Message-ID: <20191118235530.GB5171@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1573660292-10629-3-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Wed, Nov 13, 2019 at 03:51:21PM +0000, Fabrizio Castro wrote:
> Add documentation for property powerdown-gpios. The property is
> optional.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v3->v4:
> * New patch
> ---
>  .../devicetree/bindings/display/bridge/lvds-transmitter.yaml         | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
> index b5dd0da..2484737 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
> @@ -57,6 +57,11 @@ properties:
>        - port@0
>        - port@1
>  
> +  powerdown-gpios:
> +    description:
> +      The GPIO used to control the power down line of this device.
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - ports

-- 
Regards,

Laurent Pinchart
