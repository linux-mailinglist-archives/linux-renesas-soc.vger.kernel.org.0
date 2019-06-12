Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 403B4424C8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 13:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728150AbfFLLwy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 07:52:54 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:38508 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727431AbfFLLwy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 07:52:54 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A27F025AD60;
        Wed, 12 Jun 2019 21:52:52 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 98EDAE21FE5; Wed, 12 Jun 2019 13:52:50 +0200 (CEST)
Date:   Wed, 12 Jun 2019 13:52:50 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v3 08/10] arm64: dts: renesas: r8a7799[05]: Point LVDS0
 to its companion LVDS1
Message-ID: <20190612115249.t4s5eebae6ospudm@verge.net.au>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-9-laurent.pinchart+renesas@ideasonboard.com>
 <20190603114045.jusjfo3tswro4xbm@verge.net.au>
 <20190606075957.GF4931@pendragon.ideasonboard.com>
 <20190606085109.o2ihuj5yudsakmzv@verge.net.au>
 <20190612102124.GJ5035@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190612102124.GJ5035@pendragon.ideasonboard.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 12, 2019 at 01:21:24PM +0300, Laurent Pinchart wrote:
> Hi Simon,
> 
> On Thu, Jun 06, 2019 at 10:51:09AM +0200, Simon Horman wrote:
> > On Thu, Jun 06, 2019 at 10:59:57AM +0300, Laurent Pinchart wrote:
> > > On Mon, Jun 03, 2019 at 01:40:45PM +0200, Simon Horman wrote:
> > >> On Tue, May 28, 2019 at 05:12:32PM +0300, Laurent Pinchart wrote:
> > >>> Add the new renesas,companion property to the LVDS0 node to point to the
> > >>> companion LVDS encoder LVDS1.
> > >>> 
> > >>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > >>> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > >>> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > >> 
> > >> Hi Laurent,
> > >> 
> > >> is this patch ready to be merged?
> > > 
> > > I was hoping for an ack from the DT bindings maintainers for the
> > > corresponding bindings changes, but I want to get this merged for the
> > > next kernel release, so I may not get it. I'll ping you when I send the
> > > pull request for the DT bindings and drivers changes, at that point this
> > > patch should be picked up.
> > 
> > Thanks Laurent, got it.
> 
> The DT bindings and driver changes have been merged, so please go ahead
> and pick this patch for v5.3.

Thanks Laurent,

done.
