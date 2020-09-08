Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9A7260A71
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 07:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728790AbgIHFzo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 01:55:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728775AbgIHFzo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 01:55:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DDE0C061573;
        Mon,  7 Sep 2020 22:55:44 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4A831234;
        Tue,  8 Sep 2020 07:55:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599544543;
        bh=uNYo79lo0Mxg6BqWsRgllEZtD1hWKh5q+aBhN5tVPHI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VMW4up5B8R00x8WOyduNCrQIzzg4hT6s93DuyIqkn6Yno5yEQPj7AU7wbei74RLqd
         HaM+PWRT1NBEsNvZW8vKVNNu8/H42sLto922B6kN8C4D6CzHoLeludPTcoymNQQQj4
         Ji/Db0CsjQblEBFZkUbxDaGSwbwIewTPOpx+seaQ=
Date:   Tue, 8 Sep 2020 08:55:18 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        shimoda <yoshihiro.shimoda.uh@renesas.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 03/10] dt-bindings: display: renesas: dw-hdmi: Add
 R8A77961 support
Message-ID: <20200908055518.GN6047@pendragon.ideasonboard.com>
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87k0x5rtwi.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87k0x5rtwi.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

Thank you for the patch.

On Tue, Sep 08, 2020 at 09:34:17AM +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch adds R-Car M3-W+ (R8A77961) SoC bindings.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../devicetree/bindings/display/bridge/renesas,dw-hdmi.txt       | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> index e6526ab485d0..2086f4514911 100644
> --- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
> @@ -16,6 +16,7 @@ Required properties:
>    - "renesas,r8a774b1-hdmi" for R8A774B1 (RZ/G2N) compatible HDMI TX
>    - "renesas,r8a7795-hdmi" for R8A7795 (R-Car H3) compatible HDMI TX
>    - "renesas,r8a7796-hdmi" for R8A7796 (R-Car M3-W) compatible HDMI TX
> +  - "renesas,r8a77961-hdmi" for R8A77961 (R-Car M3-W+) compatible HDMI TX
>    - "renesas,r8a77965-hdmi" for R8A77965 (R-Car M3-N) compatible HDMI TX
>    - "renesas,rcar-gen3-hdmi" for the generic R-Car Gen3 and RZ/G2 compatible
>  			     HDMI TX

-- 
Regards,

Laurent Pinchart
