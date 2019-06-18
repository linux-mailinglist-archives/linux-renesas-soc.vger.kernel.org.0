Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B86EA4A742
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 18:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729785AbfFRQn6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 12:43:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55646 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729319AbfFRQn6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 12:43:58 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 682CFD5;
        Tue, 18 Jun 2019 18:43:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560876235;
        bh=1xUkCuv94g7S9J2o8wEGgwE4uKHhIma2x2Q1OFT9Qyg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=J5LcKgHqPwLOD0UM3Av3Op3KWpF67JJo7Leut0KuPYT6BKqek14fzSlOn+YS3Lz1I
         luR9eq/GHmEC3A8vHiHnS7FwZTvTxnYQ9DqIa45Z1Ni49gSedGVNsaOSbKcahh5LAb
         JC8PnOUhGQ38hgYF6gC+QokLScepNYpTJP01W4t4=
Date:   Tue, 18 Jun 2019 19:43:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: renesas: Add r8a774a1 support
Message-ID: <20190618164338.GG21105@pendragon.ideasonboard.com>
References: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1560871119-16570-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1560871119-16570-2-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Tue, Jun 18, 2019 at 04:18:37PM +0100, Fabrizio Castro wrote:
> Document RZ/G2M (R8A774A1) SoC bindings.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I don't have pending changes for this file for this kernel release. As
your series contains DT changes, I'm fine if this patch gets merged
through the ARM SoC tree along with the rest. Otherwise please let me
know if I should handle it myself.

> ---
>  Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> index a41d280..db68041 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> @@ -12,10 +12,12 @@ following device-specific properties.
>  Required properties:
>  
>  - compatible : Shall contain one or more of
> +  - "renesas,r8a774a1-hdmi" for R8A774A1 (RZ/G2M) compatible HDMI TX
>    - "renesas,r8a7795-hdmi" for R8A7795 (R-Car H3) compatible HDMI TX
>    - "renesas,r8a7796-hdmi" for R8A7796 (R-Car M3-W) compatible HDMI TX
>    - "renesas,r8a77965-hdmi" for R8A77965 (R-Car M3-N) compatible HDMI TX
> -  - "renesas,rcar-gen3-hdmi" for the generic R-Car Gen3 compatible HDMI TX
> +  - "renesas,rcar-gen3-hdmi" for the generic R-Car Gen3 and RZ/G2 compatible
> +			     HDMI TX
>  
>      When compatible with generic versions, nodes must list the SoC-specific
>      version corresponding to the platform first, followed by the

-- 
Regards,

Laurent Pinchart
