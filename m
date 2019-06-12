Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D84342245
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 12:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727404AbfFLKVm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 06:21:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47814 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732038AbfFLKVl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 06:21:41 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7756C9B1;
        Wed, 12 Jun 2019 12:21:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560334899;
        bh=oFhhjs4lGxLzFy7EyZiiCgO6TPA+BFzJoz7joFCL//s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UtVBrKZsKFTOYSoUDJIGt9ZOZL1lCYbQED2slpETXYrhYBqfkCsHk/n+5pc+M784k
         4nL5ekGo9pDzdQZnyM2e2r9J8bugAuwYQKV3DRnIlSgnNM4vO5SsDUPjgVl/FwZWMN
         A2GTFy8Uimb+0Im0GQSJBb4afsOKbW4+Xfg1tGyc=
Date:   Wed, 12 Jun 2019 13:21:24 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Simon Horman <horms@verge.net.au>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v3 08/10] arm64: dts: renesas: r8a7799[05]: Point LVDS0
 to its companion LVDS1
Message-ID: <20190612102124.GJ5035@pendragon.ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-9-laurent.pinchart+renesas@ideasonboard.com>
 <20190603114045.jusjfo3tswro4xbm@verge.net.au>
 <20190606075957.GF4931@pendragon.ideasonboard.com>
 <20190606085109.o2ihuj5yudsakmzv@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190606085109.o2ihuj5yudsakmzv@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Thu, Jun 06, 2019 at 10:51:09AM +0200, Simon Horman wrote:
> On Thu, Jun 06, 2019 at 10:59:57AM +0300, Laurent Pinchart wrote:
> > On Mon, Jun 03, 2019 at 01:40:45PM +0200, Simon Horman wrote:
> >> On Tue, May 28, 2019 at 05:12:32PM +0300, Laurent Pinchart wrote:
> >>> Add the new renesas,companion property to the LVDS0 node to point to the
> >>> companion LVDS encoder LVDS1.
> >>> 
> >>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >>> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >>> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> >> 
> >> Hi Laurent,
> >> 
> >> is this patch ready to be merged?
> > 
> > I was hoping for an ack from the DT bindings maintainers for the
> > corresponding bindings changes, but I want to get this merged for the
> > next kernel release, so I may not get it. I'll ping you when I send the
> > pull request for the DT bindings and drivers changes, at that point this
> > patch should be picked up.
> 
> Thanks Laurent, got it.

The DT bindings and driver changes have been merged, so please go ahead
and pick this patch for v5.3.

-- 
Regards,

Laurent Pinchart
