Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62E7AA43A9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 31 Aug 2019 11:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbfHaJ3F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 31 Aug 2019 05:29:05 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:52170 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbfHaJ3F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 31 Aug 2019 05:29:05 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id CE8E525AE77;
        Sat, 31 Aug 2019 19:29:02 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id A5108E218F0; Sat, 31 Aug 2019 11:29:00 +0200 (CEST)
Date:   Sat, 31 Aug 2019 11:29:00 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, xu_shunji@hoperun.com
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Fix eMMC status
Message-ID: <20190831092837.lgtxrnqoy55dn2oo@verge.net.au>
References: <1567170935-19186-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdVtkBtVpXo2eCMbZ6MEJskeLHYgC4O=p1SjwOdkHLakyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVtkBtVpXo2eCMbZ6MEJskeLHYgC4O=p1SjwOdkHLakyg@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 30, 2019 at 03:25:39PM +0200, Geert Uytterhoeven wrote:
> On Fri, Aug 30, 2019 at 3:15 PM Fabrizio Castro
> <fabrizio.castro@bp.renesas.com> wrote:
> > SDHI3 got accidentally disabled while adding USB 2.0 support,
> > this patch fixes it.
> >
> > Fixes: 734d277f412a ("arm64: dts: renesas: hihope-common: Add USB 2.0 support")
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> This is a fix for v5.3.

Thanks, applied as a fix for v5.3.
