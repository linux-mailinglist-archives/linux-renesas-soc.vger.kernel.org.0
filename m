Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5368E41A47E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Sep 2021 03:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238383AbhI1BNa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Sep 2021 21:13:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbhI1BNa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Sep 2021 21:13:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F58C061575;
        Mon, 27 Sep 2021 18:11:51 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 38CBF3F1;
        Tue, 28 Sep 2021 03:11:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632791508;
        bh=UwUX/PlPzYMUbHTHRTLSsvN1z9n+AldtWKTAxW1LiJc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=elmybGLG8cVXzHZEEPUWoArcm1GPZfOKoF/P4+Xb5B88UjX3L9i5f4ytQ/8bSGTTq
         Ai/UAXv3PPd4kVSZ/JA+y0sJLtw4mlNUCfqsjWbBJI3KMNjb8sxL7spa/zHsyor9vn
         vnyP71ST+8oPlW0d5W8ZCSCLHIslIolMHYmtv3Q4=
Date:   Tue, 28 Sep 2021 04:11:41 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@glider.be>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3.1] dt-bindings: display: renesas,du: Provide bindings
 for r8a779a0
Message-ID: <YVJrzaQS+XBQO4Xg@pendragon.ideasonboard.com>
References: <20210922234726.3337265-2-kieran.bingham@ideasonboard.com>
 <20210923130138.67552-1-kieran.bingham@ideasonboard.com>
 <YVIwPnRxxO0Txm2G@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YVIwPnRxxO0Txm2G@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Sep 27, 2021 at 03:57:34PM -0500, Rob Herring wrote:
> On Thu, 23 Sep 2021 14:01:38 +0100, Kieran Bingham wrote:
> > From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 
> > Extend the Renesas DU display bindings to support the r8a779a0 V3U.
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > 
> > ---
> > v2:
> >  - Collected Laurent's tag
> >  - Remove clock-names requirement
> >  - Specify only a single clock
> > 
> > v3:
> >  - Use clocknames: 'du.0' instead of 'du' to remain consistent
> > 
> > v3.1:
> >  - Require clock-names
> >  - Collect Geert's tag
> > 
> >  .../bindings/display/renesas,du.yaml          | 51 +++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Thank you Rob, that was the missing piece for a pull request :-)

-- 
Regards,

Laurent Pinchart
