Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F098B7BA180
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Oct 2023 16:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239441AbjJEOn1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Oct 2023 10:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237184AbjJEOio (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2023 10:38:44 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 404C95278;
        Thu,  5 Oct 2023 07:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696514620; x=1728050620;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7kjCMS9xjATRZqnRQH9aAmYqWQ2qY58Qj/F3YYDj1UI=;
  b=ewN4PWTZx6BDoufa2TikkvBJVz7IhkFRjwzWsW35wIhyq7wvrCnaCl/D
   G1POItkUBirWu0HcS6sOijljMMD5fMdjAEFy+O9OV8em1R/O0PikVKktk
   Gym6JatF0MU0bpk64yh1iMKaN7/K/yFRnyM4uYydNbRr0S24l1FvJEy8m
   rPIxRXspUZKIYh1ceSe2ImuXy5tWXpi74su4EVpGl9f4/845nAomFYgaI
   lKF1xgMPIRgbXKxcAc0eQG7oxTMhtEg1S4R/Wp2IIja9SKmT4RCiTukZQ
   ziFkxSS/82ecKBOvp0WDDEbaYwSeG51u8komMHl8R5AyNlwi2aTzuH9Lr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="380728703"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="380728703"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 02:07:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="895374737"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="895374737"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 02:05:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qoKK0-00000002yzq-2Mbg;
        Thu, 05 Oct 2023 12:07:04 +0300
Date:   Thu, 5 Oct 2023 12:07:04 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        David Laight <David.Laight@aculab.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.au@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: vc3: Use clamp() instead of min_t()
Message-ID: <ZR58uDLC99WUwkr2@smile.fi.intel.com>
References: <20231004064220.31452-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdXageyQyqaGXJbmmpcKyjoO-VHWGzGk_WJ1YsAne+iiSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXageyQyqaGXJbmmpcKyjoO-VHWGzGk_WJ1YsAne+iiSw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

+David

On Wed, Oct 04, 2023 at 09:50:09AM +0200, Geert Uytterhoeven wrote:
> On Wed, Oct 4, 2023 at 8:42 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > The min_t() is often used as a shortcut for clamp(). Secondly, the
> > BIT(16) - 1 is specifically used as the value related to the bits in the
> > hardware and u16 is a software type that coincidentally has the same
> > maximum as the above mentioned bitfield.
> 
> Technically it is two byte-sized registers forming a 16-bit field ;-)
> 
> > Replace min_t()->clamp() in vc3_pll_round_rate().
> >
> > Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  drivers/clk/clk-versaclock3.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
> > index 3d7de355f8f6..50772f61096f 100644
> > --- a/drivers/clk/clk-versaclock3.c
> > +++ b/drivers/clk/clk-versaclock3.c
> > @@ -402,7 +402,7 @@ static long vc3_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> >                 div_frc = rate % *parent_rate;
> >                 div_frc *= BIT(16) - 1;
> >
> > -               vc3->div_frc = min_t(u64, div64_ul(div_frc, *parent_rate), U16_MAX);
> > +               vc3->div_frc = clamp(div64_ul(div_frc, *parent_rate), 0, BIT(16) - 1);
> 
> I'm not sure this is actually an improvement...

That's what Linus actually suggested to do.

> While I agree "BIT(16) - 1" matches the expression two lines above,
> I find it harder to read.
> Perhaps introducing a VC3_PLL2_FB_FRC_DIV_MAX definition may help.

Either way, but U16_MAX is really semantically wrong here.

> BTW, if the hardware wouldn't use two byte-sized registers, but a real
> bitifield, one could use FIELD_GET(mask, mask) instead.

> Second, clamping an unsigned value to zero is futile, and opens us to
> warnings like:
> 
>     warning: comparison of unsigned expression in ‘>= 0’ is always
> true [-Wtype-limits]

David, is your series fix this as well?

> >                 rate = (*parent_rate *
> >                         (vc3->div_int * VC3_2_POW_16 + vc3->div_frc) / VC3_2_POW_16);
> >         } else {

-- 
With Best Regards,
Andy Shevchenko


