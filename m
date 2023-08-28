Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35F5C78AE85
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 13:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232454AbjH1LMz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 07:12:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjH1LM1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 07:12:27 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6531BE
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 04:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693221145; x=1724757145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VwTnlYWKzRUsbpO7VF3ElRn4ag5+R4zmWxVaLMqTchI=;
  b=aHFYQ5lHM/89LXp4jh9ww//q4KgfrlKaU6DAWn2QxQRDCKy+E/8pY9Y0
   /ba5/YuNuAOIRmt+FwHSb/n5mORg+grWnlYc8TQbUKFcVtyRqIKALtgMy
   JlGl8culow2dQ62wZCUMLuCy6HZ2y4sAbtwLe9INQhXIpgVD9ANBoz1wp
   kd5mMrc2+Jnd8fPDmqWv2z41Pz7ykD0TiUE40l9cG6ON9SingHlHuuVsi
   qV3WSbB8Rh9UEAbDZNgIbs1ouqLIEF5pXQ7+A2OYP3nXbYop9+3+UXRn/
   dYL03hGvAh4GHfKHPt9fxvax5swoH/vYS9h8/pCETN8I0JtWKrX5rWO+Q
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="360071756"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="360071756"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 04:12:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="1068999723"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="1068999723"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 28 Aug 2023 04:12:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qaaAN-00FedS-2D;
        Mon, 28 Aug 2023 14:12:19 +0300
Date:   Mon, 28 Aug 2023 14:12:19 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, patches@opensource.cirrus.com,
        alsa-devel@alsa-project.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ASoC: wm8580: Simplify probe()
Message-ID: <ZOyBE7znVJNjLB3z@smile.fi.intel.com>
References: <20230827102114.55863-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230827102114.55863-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Aug 27, 2023 at 11:21:14AM +0100, Biju Das wrote:
> Simplify probe() by replacing of_match_device->i2c_get_match_data() and
> extend matching support for ID table.

...

> -		return -EINVAL;

> +		return dev_err_probe(-ENODEV);

Commit message doesn't explain this change.

...

> +static const struct of_device_id wm8580_of_match[] = {
> +	{ .compatible = "wlf,wm8580", .data = &wm8580_data },
> +	{ .compatible = "wlf,wm8581", .data = &wm8581_data },

> +	{ },

Do not put comma in the terminator entry. It's illogical.

> +};

-- 
With Best Regards,
Andy Shevchenko


