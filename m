Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 110F41405F8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2020 10:22:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgAQJWu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jan 2020 04:22:50 -0500
Received: from asavdk4.altibox.net ([109.247.116.15]:35348 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbgAQJWt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jan 2020 04:22:49 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id A1F90803D1;
        Fri, 17 Jan 2020 10:22:40 +0100 (CET)
Date:   Fri, 17 Jan 2020 10:22:39 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        ebiharaml@si-linux.co.jp
Subject: Re: [PATCH v6 0/6] Add dual-LVDS panel support to EK874
Message-ID: <20200117092239.GA2769@ravnborg.org>
References: <1576590361-28244-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <20191217231326.GG4874@pendragon.ideasonboard.com>
 <CAMuHMdWaZBfsHi9E57B8Mr6QSCATVxpdRtg=9_H-urBaK_iRJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWaZBfsHi9E57B8Mr6QSCATVxpdRtg=9_H-urBaK_iRJw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8
        a=NcFk6D9gAAAA:8 a=VwQbUJbxAAAA:8 a=AnT9JTkVX5hdcftoDygA:9
        a=CjuIK1q_8ugA:10 a=gDps05xe3HUA:10 a=-FEs8UIgK8oA:10 a=CojVow1nldcA:10
        a=NWVoK91CQyQA:10 a=D0XLA9XvdZm18NrgonBM:22 a=dT0RXAwTRpxWjiziVLXF:22
        a=AjGcO6oz07-iQ99wixmX:22
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio/Laurent/Geert.

(Thanks Geert, I recall I never replied to this mail).

On Fri, Jan 17, 2020 at 09:47:22AM +0100, Geert Uytterhoeven wrote:
> Hi Laurent,
> 
> (woops, forgot to press sent)
> 
> On Wed, Dec 18, 2019 at 12:13 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Tue, Dec 17, 2019 at 01:45:55PM +0000, Fabrizio Castro wrote:
> > > this series adds support for dual-LVDS panel IDK-2121WR
> > > from Advantech:
> > > https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm
> > >
> > > V6 reworks patch "drm: rcar-du: lvds: Allow for even and odd pixels swap",
> > > and rebases the series on top of patch:
> > > https://patchwork.kernel.org/patch/11295991/
> >
> > I've taken patch 1/6 to 4/6 in my tree. I expect Geert to take 6/6. For
> > 5/6, I'll give Rob a chance to review the patch. Sam, could you handle
> > it afterwards ?
Rob had comments to the 5/6 patch - and I have missed if a new version was
sent.

	Sam
