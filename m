Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE89336F20
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 10:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbfFFIvO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 04:51:14 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:56690 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727250AbfFFIvO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 04:51:14 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id F417225B746;
        Thu,  6 Jun 2019 18:51:11 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id E8118E21A74; Thu,  6 Jun 2019 10:51:09 +0200 (CEST)
Date:   Thu, 6 Jun 2019 10:51:09 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v3 08/10] arm64: dts: renesas: r8a7799[05]: Point LVDS0
 to its companion LVDS1
Message-ID: <20190606085109.o2ihuj5yudsakmzv@verge.net.au>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-9-laurent.pinchart+renesas@ideasonboard.com>
 <20190603114045.jusjfo3tswro4xbm@verge.net.au>
 <20190606075957.GF4931@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190606075957.GF4931@pendragon.ideasonboard.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 06, 2019 at 10:59:57AM +0300, Laurent Pinchart wrote:
> Hi Simon,
> 
> On Mon, Jun 03, 2019 at 01:40:45PM +0200, Simon Horman wrote:
> > On Tue, May 28, 2019 at 05:12:32PM +0300, Laurent Pinchart wrote:
> > > Add the new renesas,companion property to the LVDS0 node to point to the
> > > companion LVDS encoder LVDS1.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > 
> > Hi Laurent,
> > 
> > is this patch ready to be merged?
> 
> I was hoping for an ack from the DT bindings maintainers for the
> corresponding bindings changes, but I want to get this merged for the
> next kernel release, so I may not get it. I'll ping you when I send the
> pull request for the DT bindings and drivers changes, at that point this
> patch should be picked up.

Thanks Laurent, got it.
