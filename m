Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C93FF2DAD5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2019 12:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725894AbfE2KcZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 May 2019 06:32:25 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:49758 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbfE2KcY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 May 2019 06:32:24 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E1F5D25AEEC;
        Wed, 29 May 2019 20:32:22 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id E086A940361; Wed, 29 May 2019 12:32:20 +0200 (CEST)
Date:   Wed, 29 May 2019 12:32:20 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH/RFT] arm: dts: renesas: r7s9210-rza2mevb: sort nodes of
 rza2mevb board
Message-ID: <20190529103220.5l27ll5x4jbdqrw6@verge.net.au>
References: <1558104187-2842-1-git-send-email-ykaneko0929@gmail.com>
 <CAMuHMdUmmwmm2bx+g=G-py5FiQ5Ynrmxr262j61P5=y5GTA6OQ@mail.gmail.com>
 <20190529102219.pkhwalbm6feaq4tz@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190529102219.pkhwalbm6feaq4tz@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 29, 2019 at 12:22:24PM +0200, Simon Horman wrote:
> On Tue, May 28, 2019 at 10:08:29AM +0200, Geert Uytterhoeven wrote:
> > Hi Kaneko-san,
> > 
> > On Fri, May 17, 2019 at 4:43 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> > > This patch sorts the nodes of arch/arm/boot/dts/r7s9210-rza2mevb.dts.
> > >
> > > * Sort subnodes of root ("/") node alphabetically
> > > * Sort following top-level nodes alphabetically
> > > * Sort subnodes of pinctrl alphabetically
> > >
> > > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> > 
> > Thanks for your patch!
> > 
> > > This patch is based on the devel branch of Simon Horman's renesas tree.
> > 
> > This looks good to me, but in the mean time renesas-devel has progressed.
> > Can you please respin?
> 
> I guess the same thing could happen again so I have gone ahead
> and both updated and applied the patch. The result is as follows:
> 
> >From da06407455334bd8ec24e9c434691d3dd68571f8 Mon Sep 17 00:00:00 2001
> From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> Date: Fri, 17 May 2019 23:43:07 +0900
> Subject: [PATCH] arm: dts: rza2mevb: sort nodes of rza2mevb board

I also updated the patch prefix to "ARM"

...
