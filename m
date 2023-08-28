Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB8A678AE8E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 13:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231754AbjH1LOb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 07:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231903AbjH1LOZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 07:14:25 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F2FFCA
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 04:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693221263; x=1724757263;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ielm4fiHyy4Yk788Tz/YZQ8rqp2NrphwYV2ioBRdgyA=;
  b=XUUfPHsYlvPOV8pcjog8BAxZN7y3YmdFKloOHSa0N9JrUMGrLr0A7Pdf
   HzxkwfcHSAVLgFEDEol+F3jLjdnsigyKNyK/iE9/U8zn/aqgnvmbQC3+R
   6lISIq34nQa0A/gOZm5YuvrtL3m2f8URyu5TwOi8SZwg2r8vC1EG0LX9J
   MrXQrncsHytY/XNmEd9/36oVT/xVGFXXncTQdnbcNVx7PEhuMe9X75M99
   8PFX2Sg9uD9JYITly+Qk4briR+IZWT+YtuII0142+0Jwr+qqxu9K1eYPp
   zG9XcrvaORT5myH3Tb1C5ss82DiiZnoVoiirK3UNiRKIpUq13E84770fJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="461446975"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="461446975"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 04:14:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="773233007"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="773233007"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 28 Aug 2023 04:14:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qaaCA-00FiOP-0C;
        Mon, 28 Aug 2023 14:14:10 +0300
Date:   Mon, 28 Aug 2023 14:14:09 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     James Schulman <james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        patches@opensource.cirrus.com,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ASoC: cs42xx8-i2c: Simplify probe()
Message-ID: <ZOyBgXfn6bzeFh5e@smile.fi.intel.com>
References: <20230827080931.34524-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230827080931.34524-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Aug 27, 2023 at 09:09:31AM +0100, Biju Das wrote:
> Simplify probe() by replacing of_match_device->i2c_get_match_data() and
> extend matching support for ID table.

Again, -EINVAL -> ENODEV is not explained in the above.

-- 
With Best Regards,
Andy Shevchenko


