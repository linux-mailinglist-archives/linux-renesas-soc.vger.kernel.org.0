Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65C844BAC7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 16:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726332AbfFSOIU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 10:08:20 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:36610 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727076AbfFSOIU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 10:08:20 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0724825B75F;
        Thu, 20 Jun 2019 00:08:19 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 0AEDA9409FF; Wed, 19 Jun 2019 16:08:16 +0200 (CEST)
Date:   Wed, 19 Jun 2019 16:08:16 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ARM: shmobile: defconfig: Refresh for v5.2-rc1
Message-ID: <20190619140816.2uzlewbgun5kelea@verge.net.au>
References: <20190618124714.15120-1-geert+renesas@glider.be>
 <20190619115141.wwze45px5qinll2j@verge.net.au>
 <CAMuHMdVbGKxfVgkQ=CwqcBWj5u3CSR3j1E0Eso1eZTrdJUfPSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVbGKxfVgkQ=CwqcBWj5u3CSR3j1E0Eso1eZTrdJUfPSQ@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 19, 2019 at 02:02:35PM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Wed, Jun 19, 2019 at 1:51 PM Simon Horman <horms@verge.net.au> wrote:
> > On Tue, Jun 18, 2019 at 02:47:14PM +0200, Geert Uytterhoeven wrote:
> > > Update the defconfig for Renesas ARM boards:
> > >   - Drop CONFIG_GENERIC_PHY=y (selected by PHY_RCAR_GEN3_USB2).
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > I believe this duplicates the following patch which is present
> > in renesas-next.
> >
> > b995421faef5 ("ARM: shmobile: Remove GENERIC_PHY from shmobile_defconfig")
> 
> That commit doesn't seem to be part of your public repo.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git/commit/?id=b995421faef5

Thanks, I will fix that oversight.
