Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D2AF79DA93
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Sep 2023 23:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbjILVLj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Sep 2023 17:11:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbjILVLi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Sep 2023 17:11:38 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4584E10CE;
        Tue, 12 Sep 2023 14:11:34 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="382301443"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="382301443"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 14:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="743858277"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="743858277"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 12 Sep 2023 14:11:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 037C81E5; Wed, 13 Sep 2023 00:11:00 +0300 (EEST)
Date:   Wed, 13 Sep 2023 00:11:00 +0300
From:   Andy Shevchenko <andy@black.fi.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v5 2/4] clk: vc3: Fix 64 by 64 division
Message-ID: <ZQDT5Indg/md+KXt@black.fi.intel.com>
References: <20230824104812.147775-1-biju.das.jz@bp.renesas.com>
 <20230824104812.147775-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824104812.147775-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 24, 2023 at 11:48:10AM +0100, Biju Das wrote:
> Fix the below cocci warnings by replacing do_div()->div64_ul() and
> bound the result with a max value of U16_MAX.
> 
> cocci warnings:
> 	drivers/clk/clk-versaclock3.c:404:2-8: WARNING: do_div() does a
> 	64-by-32 division, please consider using div64_ul instead.

It's nice, but there is a room for a couple of improvements. See below.

...

>  		/* Determine best fractional part, which is 16 bit wide */
>  		div_frc = rate % *parent_rate;
>  		div_frc *= BIT(16) - 1;
> -		do_div(div_frc, *parent_rate);
>  
> -		vc3->div_frc = (u32)div_frc;
> +		vc3->div_frc = min_t(u64, div64_ul(div_frc, *parent_rate), U16_MAX);

First of all, as Linus Torvalds pointed out [1] min_t() is often used as
a shortcut for clamp(). Second one, the BIT(16) - 1 is specifically used
as the value related to the bits in the hardware and u16 is a software
type that coincidentially has the same maximum as the above mentioned
bitfield.

That said, here this should be clamped to the [0 .. BIT(16) - 1] range.

Since the patch is applied perhaps you can cook a followup.

To everyone the message is simple: try to not use typed version of min()
and clamp() at all.

>  		rate = (*parent_rate *
> -			(vc3->div_int * VC3_2_POW_16 + div_frc) / VC3_2_POW_16);
> +			(vc3->div_int * VC3_2_POW_16 + vc3->div_frc) / VC3_2_POW_16);

[1]: https://lore.kernel.org/lkml/CAHk-=whwEAc22wm8h9FESPB5X+P4bLDgv0erBQMa1buTNQW7tA@mail.gmail.com/

-- 
With Best Regards,
Andy Shevchenko


