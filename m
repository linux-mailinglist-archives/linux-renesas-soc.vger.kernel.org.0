Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F42D8EDF8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Aug 2019 16:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732835AbfHOOQI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Aug 2019 10:16:08 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:51980 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731822AbfHOOQI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Aug 2019 10:16:08 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 8CFE920049;
        Thu, 15 Aug 2019 16:16:00 +0200 (CEST)
Date:   Thu, 15 Aug 2019 16:15:59 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Eric Anholt <eric@anholt.net>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        xu_shunji@hoperun.com, ebiharaml@si-linux.co.jp
Subject: Re: [PATCH v2 0/9] Add dual-LVDS panel support to EK874
Message-ID: <20190815141559.GB2437@ravnborg.org>
References: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565867073-24746-1-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8
        a=xQ1MIdX7YOo3YP1MDUoA:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio

> it appears that Rob has been busy converting the dt-bindings relevant to this
> series, and his changes are now found in linux-next. Most notably
> Documentation/devicetree/bindings/display/panel/panel-lvds.txt has now become
> Documentation/devicetree/bindings/display/panel/lvds.yaml
> 
> You have already taken patch:
> https://patchwork.kernel.org/patch/11072749/
> 
> as such the patch I am sending you is still related to:
> Documentation/devicetree/bindings/display/panel/panel-lvds.txt
> 
> Patch "dt-bindings: display: Add bindings for Advantech IDK-2121WR" is still
> assuming the format is .txt, as I am not too sure about what the protocol is in
> this case? Shall we take this patch and convert it later to .yaml or shall I
> convert it to .yaml straight away?
> 
> Please, let me know what's the best course of action.

It is preferred that all new display and panel bindings uses the new
meta-schema format.
And that the writers uses the available tools to verify the bindings
submission.
This is one way to avoid simple mistakes in examples.

	Sam
