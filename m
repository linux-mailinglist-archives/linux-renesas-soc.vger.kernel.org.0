Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82B4678AEAD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 13:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjH1LU7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 07:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbjH1LUc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 07:20:32 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CD6DB6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 04:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693221631; x=1724757631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y0o7cPz28oj6gIzjXxgvzLqUnO42LwUmzn0fZtRGTH4=;
  b=MURFaAAjw2FJli+Jj3fqCxHFYjSB+jacs5mn+Xh+DvKaPyqiY9/eJcZp
   pzPqfmDZG0EM1WbzzrUGwjVGoAt8x2+riB4H7ZQMZMCoS59WMpaiZZK53
   gVoR/H9bTkqrWugQHDWXTaLXacmn2g4RLVUVe4lhERm8K0Lh8x18mFgE4
   TY2nAlIa6qvs/Q/0jUFU2H6cZwzKpWb2ZgPmPWA6XLj04rjq80wGmQtVs
   TKKCk5iAouxTo8g59ca7yNsR69CuoG6K3DZCig+sdp1I1BbUu3us8nHx2
   xP8OLiWniVnImoT62yXLXC9r8qDRtaFI/MdcLN+VHrqvB4lfLDLvOqFcO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="355403993"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="355403993"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 04:20:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="803661394"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="803661394"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 28 Aug 2023 04:20:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qaaIF-00Futr-18;
        Mon, 28 Aug 2023 14:20:27 +0300
Date:   Mon, 28 Aug 2023 14:20:27 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Lee Jones <lee@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mfd: max77541: Simplify probe()
Message-ID: <ZOyC++vjeg4TGCpx@smile.fi.intel.com>
References: <20230826091020.45621-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230826091020.45621-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Aug 26, 2023 at 10:10:20AM +0100, Biju Das wrote:
> Simplify probe() by replacing device_get_match_data() and ID lookup for
> retrieving match data by i2c_get_match_data().
> 
> While at it, drop leading commas from OF table.

...

> -		return -EINVAL;
> +		return -ENODEV;

Why?

-- 
With Best Regards,
Andy Shevchenko


