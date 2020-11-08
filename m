Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0A162AABA8
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Nov 2020 15:45:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727844AbgKHOpU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 8 Nov 2020 09:45:20 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:34592 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbgKHOpT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 8 Nov 2020 09:45:19 -0500
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 6F2C2804D5;
        Sun,  8 Nov 2020 15:45:15 +0100 (CET)
Date:   Sun, 8 Nov 2020 15:45:13 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        dri-devel@lists.freedesktop.org,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/panel: panel-simple: Add connector_type for EDT
 ETM0700G0DH6 panel
Message-ID: <20201108144513.GA1212257@ravnborg.org>
References: <20201020094910.4756-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201020094910.4756-1-biju.das.jz@bp.renesas.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VafZwmh9 c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=yC-0_ovQAAAA:8 a=LhomchRxGllHYqC2xSsA:9
        a=CjuIK1q_8ugA:10 a=QsnFDINu91a9xkgZirup:22
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju

On Tue, Oct 20, 2020 at 10:49:10AM +0100, Biju Das wrote:
> Fix the warning message "missing connector type" by adding connector_type
> for EDT ETM0700G0DH6 panel.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks, applied to drm-misc-next.

	Sam
