Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD5E12DAE2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2019 12:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbfE2KfZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 May 2019 06:35:25 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:49864 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbfE2KfZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 May 2019 06:35:25 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7883525AEEC;
        Wed, 29 May 2019 20:35:23 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 6F5C6940361; Wed, 29 May 2019 12:35:21 +0200 (CEST)
Date:   Wed, 29 May 2019 12:35:21 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: mstp: Remove error messages on
 out-of-memory conditions
Message-ID: <20190529103521.owcbusdsl6coq52d@verge.net.au>
References: <20190527123514.7198-1-geert+renesas@glider.be>
 <20190529102939.ssdpktlqldexwgkv@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190529102939.ssdpktlqldexwgkv@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 29, 2019 at 12:29:39PM +0200, Simon Horman wrote:
> On Mon, May 27, 2019 at 02:35:14PM +0200, Geert Uytterhoeven wrote:
> > pm_clk_create() and pm_clk_add_clk() can fail only when running out of
> > memory.  Hence there is no need to print error messages on failure, as
> > the memory allocation core already takes care of that.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

On a closer look, I see that pm_clk_add_clk() can return
errors for other reasons. Can they never occur in this use-case?
