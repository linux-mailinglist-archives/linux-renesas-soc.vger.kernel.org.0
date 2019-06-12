Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4735B4252F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 14:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbfFLMMD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 08:12:03 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:39404 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbfFLMMC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 08:12:02 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id CC08525AD60;
        Wed, 12 Jun 2019 22:12:00 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id B9DCEE21FE5; Wed, 12 Jun 2019 14:11:58 +0200 (CEST)
Date:   Wed, 12 Jun 2019 14:11:58 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77990: Fix register range of
 display node
Message-ID: <20190612121157.y6iiftulcsv3ty5w@verge.net.au>
References: <1560084198-2930-1-git-send-email-ykaneko0929@gmail.com>
 <20190611123022.oo4arh76w72vlkg5@verge.net.au>
 <20190611140252.GL5016@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190611140252.GL5016@pendragon.ideasonboard.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 11, 2019 at 05:02:52PM +0300, Laurent Pinchart wrote:
> Hello,
> 
> On Tue, Jun 11, 2019 at 02:30:27PM +0200, Simon Horman wrote:
> > + Laurent
> > 
> > On Sun, Jun 09, 2019 at 09:43:18PM +0900, Yoshihiro Kaneko wrote:
> > > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > 
> > > Since the R8A77990 SoC uses DU{0,1}, the range from the base address to
> > > the 0x4000 address is used.
> > > This patch fixed it.
> > > 
> > > Fixes: 13ee2bfc5444 ("arm64: dts: renesas: r8a77990: Add display output support")
> > > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> > 
> > Thanks,
> > 
> > This looks fine to me but I will wait to see if there are other reviews
> > before applying.
> > 
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, I have applied this for inclusion in v5.3.

> > Is a similar fix also appropriate for D3 (r8a77995)
> 
> Yes it is.

Nice.

Kaneko-san, could you prepare a patch?

> > And a variant that reduces the register size to 0x5000
> > for M3-W (r8a77965).
> 
> M3-W has registers at 0xfeb60000. You could reduce the size from
> 0x80000 to 0x70000 but I don't think it's worth it.

Got it, lets leave M3-W as is.

...
