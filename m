Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4FB260B0B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 08:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728759AbgIHGiA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 02:38:00 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46320 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728501AbgIHGiA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 02:38:00 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F91B35;
        Tue,  8 Sep 2020 08:37:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599547078;
        bh=rj4ghHw2vLG6tlfukWvCwtPnS9dO+wTYXqe2xS+CNks=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KpD31y6RKqAbp/uLiQbzo9d9GhXiJ3ydRdIBi/HphMktIN+IEziVsB/sAlx0vGypn
         9VTm7Er52roUslph4b5QlUOf53bHMP07C/FLP81VXwN2BkmENt/B2YdiRpVbMuCyAM
         PLDF+Y5hQ0SuG8cGDMI7wNTmaSbK4Jt6mQ5HyHiY=
Date:   Tue, 8 Sep 2020 09:37:32 +0300
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
Subject: Re: [PATCH v2 10/10] arm64: dts: renesas: r8a77961-salvator-xs: add
 HDMI Sound support
Message-ID: <20200908063732.GW6047@pendragon.ideasonboard.com>
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87a6y1rtun.wl-kuninori.morimoto.gx@renesas.com>
 <20200908060657.GU6047@pendragon.ideasonboard.com>
 <87wo14rd9v.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87wo14rd9v.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Tue, Sep 08, 2020 at 03:33:29PM +0900, Kuninori Morimoto wrote:
> 
> Hi Laurent
> 
> Thank you for your review
> 
> > > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > > 
> > > This patch enables HDMI Sound on R-Car M3-W+ Salvator-XS board.
> > > 
> > > This reverts commit b997613fad58a03588f0f64a3d86db6c5bd76dd2.
> > 
> > Which tree can this commit be found in ?
> 
> Grr, I forgot to remove it from git-log.
> will fix in v3

No worries :-)

I've applied patch 01 to 04 to my tree and plan to send a pull request
later today. Could you just let me know if you're fine with the small
modification to the commit message proposed in 04/10 ?

-- 
Regards,

Laurent Pinchart
