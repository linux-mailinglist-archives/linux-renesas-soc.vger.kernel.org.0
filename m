Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8419178B118
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 14:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbjH1Mx2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 08:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231598AbjH1MxL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 08:53:11 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E72B107
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 05:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693227189; x=1724763189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZUnjt35nE8dBtenzhFEryEjn7xAx4rIKeA8WqVTq1Tg=;
  b=VTkXY1+Gsou3A6VNuYtXFoSId1frqy7ApQsUJBFOPr6s9hedSGFiCOPp
   1xaCP0w3/j9yVFfHknBb92OFIz1mElJVATZVw08dzkdcFsyups06kGhr2
   C1uXxkfFZp7WxK8SG2iQ4ZFYXYhL5EVpg/AtXXHn7ZRQoEWq40d1ZL4ZC
   MaDC1O7UcpRTH0YoNU5Osc/syYNP6WT04pAtfHrOtSDY/yP7l6OVTmhTE
   zAZyNG30kAsMZ+OEzTw1fr9lPNWYarZLRYOdgbDNWafZ76bPX1TJiaWN+
   KX4ySQVEe5LaFvbSwPu63OKjavA81GrZqkziHFqetRTmpaTFY4lef9iUW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="377821034"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="377821034"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 05:53:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="808271571"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="808271571"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 28 Aug 2023 05:53:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qabjp-001JwD-2e;
        Mon, 28 Aug 2023 15:53:01 +0300
Date:   Mon, 28 Aug 2023 15:53:01 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <x1077012@ti.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ASoC: tlv320aic32x4-i2c: Simplify probe()
Message-ID: <ZOyYrVRkzmd3+W9a@smile.fi.intel.com>
References: <20230827094536.49511-1-biju.das.jz@bp.renesas.com>
 <ZOyBY9mpZ5wFVMfw@smile.fi.intel.com>
 <OS0PR01MB5922E9E9F406EF8F60C2A8C486E0A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922E9E9F406EF8F60C2A8C486E0A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 28, 2023 at 11:48:28AM +0000, Biju Das wrote:
> > On Sun, Aug 27, 2023 at 10:45:36AM +0100, Biju Das wrote:

...

> > > +	dev_set_drvdata(&i2c->dev, (void *)i2c_get_match_data(i2c));
> > 
> > You (potentially) drop const qualifier here. It's not good and it's not
> > explained in the commit message why.
> 
> dev_set_drvdata() needs non-const void*, otherwise I get warning.
> The original code also use this cast. That is the reason it is not
> explained in commit message.

Maybe it shouldn't use this pointer directly then?


aic32x4_probe() has these lines

        aic32x4->type = (uintptr_t)dev_get_drvdata(dev);
        dev_set_drvdata(dev, aic32x4);

Dragging data like this makes a little sense to me. What you should do is to
have a precursor patch that adds a third parameter to ->probe().

Also it makes sense to all your improvements for -i2c.c do similar to all
-spi.c cases where it applies.

-- 
With Best Regards,
Andy Shevchenko


