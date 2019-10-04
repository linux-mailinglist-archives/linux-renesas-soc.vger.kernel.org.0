Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8ECBCB4BB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2019 09:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387822AbfJDHCb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Oct 2019 03:02:31 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42420 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387420AbfJDHCa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Oct 2019 03:02:30 -0400
Received: from pendragon.ideasonboard.com (modemcable151.96-160-184.mc.videotron.ca [184.160.96.151])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E0B432E5;
        Fri,  4 Oct 2019 09:02:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570172547;
        bh=ff0YXiLcRAU78UlQx9FiW7X44GoxjWj2rqTFc4BimAU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oHcKjcMOngDwgA2/r8Nl+8advWQ0ml+4p/Kt6OryBCB4jJfrzUg2LORSqz0D8+Dh5
         0N21m7Cr3eJ1saJPF8ZIvamIBlnPvl9B2LmGw06wX/m2/WRCoj6q5MJhsXwwEd5eDO
         F52ytoDf9iofw7ZLfR54LPj8TfLNU53aN5o8XvMk=
Date:   Fri, 4 Oct 2019 10:02:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: display: renesas: Add r8a774b1 support
Message-ID: <20191004070211.GA9380@pendragon.ideasonboard.com>
References: <1569835731-8096-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1569835731-8096-1-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Mon, Sep 30, 2019 at 10:28:51AM +0100, Biju Das wrote:
> Document RZ/G2N (R8A774B1) SoC bindings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

I really like how your RZ patches are simple, they're painless to
review, it's all very pleasurable :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

And applied to my tree.

> ---
>  Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> index db68041..819f3e3 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> @@ -13,6 +13,7 @@ Required properties:
>  
>  - compatible : Shall contain one or more of
>    - "renesas,r8a774a1-hdmi" for R8A774A1 (RZ/G2M) compatible HDMI TX
> +  - "renesas,r8a774b1-hdmi" for R8A774B1 (RZ/G2N) compatible HDMI TX
>    - "renesas,r8a7795-hdmi" for R8A7795 (R-Car H3) compatible HDMI TX
>    - "renesas,r8a7796-hdmi" for R8A7796 (R-Car M3-W) compatible HDMI TX
>    - "renesas,r8a77965-hdmi" for R8A77965 (R-Car M3-N) compatible HDMI TX

-- 
Regards,

Laurent Pinchart
