Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D77D736DF9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 10:00:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725782AbfFFIAN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 04:00:13 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35362 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725769AbfFFIAN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 04:00:13 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2CF6133B;
        Thu,  6 Jun 2019 10:00:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559808011;
        bh=F7s+czjjssKdq0j9S305nnXbFC6eahvLe2kWI7qn58M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l2vzXnDOWOs+F7GYY4umRs/UwsEYsatVI3Qb8nBY29EsOfSL6HSpPd/jKWi2TQMk6
         2f0+sOxD826OizAmTtQq2bqiZauiZEMTlA+MvhfSE/QNTs4wN4CuXR1emXVxj+vFiF
         19Ui5liSBK0SfvM5i3REhpZyQdmInw02j3hRKazw=
Date:   Thu, 6 Jun 2019 10:59:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Simon Horman <horms@verge.net.au>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v3 08/10] arm64: dts: renesas: r8a7799[05]: Point LVDS0
 to its companion LVDS1
Message-ID: <20190606075957.GF4931@pendragon.ideasonboard.com>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-9-laurent.pinchart+renesas@ideasonboard.com>
 <20190603114045.jusjfo3tswro4xbm@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190603114045.jusjfo3tswro4xbm@verge.net.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Mon, Jun 03, 2019 at 01:40:45PM +0200, Simon Horman wrote:
> On Tue, May 28, 2019 at 05:12:32PM +0300, Laurent Pinchart wrote:
> > Add the new renesas,companion property to the LVDS0 node to point to the
> > companion LVDS encoder LVDS1.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> Hi Laurent,
> 
> is this patch ready to be merged?

I was hoping for an ack from the DT bindings maintainers for the
corresponding bindings changes, but I want to get this merged for the
next kernel release, so I may not get it. I'll ping you when I send the
pull request for the DT bindings and drivers changes, at that point this
patch should be picked up.

-- 
Regards,

Laurent Pinchart
