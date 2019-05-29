Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 240062DEB4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2019 15:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbfE2NmU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 May 2019 09:42:20 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:56928 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727172AbfE2NmT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 May 2019 09:42:19 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 566A425AEEC;
        Wed, 29 May 2019 23:42:17 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 53298940361; Wed, 29 May 2019 15:42:15 +0200 (CEST)
Date:   Wed, 29 May 2019 15:42:15 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH] clk: renesas: mstp: Remove error messages on
 out-of-memory conditions
Message-ID: <20190529134215.grlbmzzt6ksbsn7n@verge.net.au>
References: <20190527123514.7198-1-geert+renesas@glider.be>
 <20190529102939.ssdpktlqldexwgkv@verge.net.au>
 <20190529103521.owcbusdsl6coq52d@verge.net.au>
 <CAMuHMdVREhppSf2j_qzbf3tZ9kr+EibHA_t9QYS0mKwLCc+zLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVREhppSf2j_qzbf3tZ9kr+EibHA_t9QYS0mKwLCc+zLQ@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 29, 2019 at 02:21:46PM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Wed, May 29, 2019 at 12:35 PM Simon Horman <horms@verge.net.au> wrote:
> > On Wed, May 29, 2019 at 12:29:39PM +0200, Simon Horman wrote:
> > > On Mon, May 27, 2019 at 02:35:14PM +0200, Geert Uytterhoeven wrote:
> > > > pm_clk_create() and pm_clk_add_clk() can fail only when running out of
> > > > memory.  Hence there is no need to print error messages on failure, as
> > > > the memory allocation core already takes care of that.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> >
> > On a closer look, I see that pm_clk_add_clk() can return
> > errors for other reasons. Can they never occur in this use-case?
> 
> These are the cases where con_id is non-NULL, right?
> pm_clk_add_clk() calls __pm_clk_add() with con_id == NULL.
> 
> Or do you mean the case where clk is an error pointer? That cannot
> happen neither.

I was referring to the latter. But if it can't happen then I'm happy
with this patch.
