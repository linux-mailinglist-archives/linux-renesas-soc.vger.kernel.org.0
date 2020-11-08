Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 032E42AABAA
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Nov 2020 15:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgKHOqp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 8 Nov 2020 09:46:45 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:34662 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbgKHOqp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 Nov 2020 09:46:45 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 7CB27804D5;
        Sun,  8 Nov 2020 15:46:42 +0100 (CET)
Date:   Sun, 8 Nov 2020 15:46:41 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jonas Karlman <jonas@kwiboo.se>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        dri-devel@lists.freedesktop.org,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/bridge: lvds-codec: Use dev_err_probe for error
 handling
Message-ID: <20201108144641.GB1212257@ravnborg.org>
References: <20201020093655.3584-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020093655.3584-1-biju.das.jz@bp.renesas.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=yC-0_ovQAAAA:8 a=8SwYCKEtaBmnh9c4yGEA:9
        a=CjuIK1q_8ugA:10 a=QsnFDINu91a9xkgZirup:22
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju
On Tue, Oct 20, 2020 at 10:36:55AM +0100, Biju Das wrote:
> dev_err_probe function simplifies error handling. So use the same in probe
> function wherever possible.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Thanks, applied to drm-misc-next

	Sam
