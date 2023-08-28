Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3EFE78AE15
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 12:57:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbjH1K4c (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 06:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232389AbjH1K4U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 06:56:20 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19F5DD
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 03:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693220123; x=1724756123;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=93Q1+09FZxhS4XNoxqvDb1t4zqKJ0lCyw9SI6NZjvGQ=;
  b=UPnxuJD3r9HNmK+pDa7d2SMHCJYC2rcQNfAVTb99WeFIwBPSEjHNlSHW
   0+zHvRABzutUMGuFGs96otHPZ9QP2fuiJ0PHf4yFRa+SYUtm5L3luaEtw
   iUJX6y6XmTJyEPNFxv+F6kUTZdCypgBDG1q3EXOCAwIw/v3z2gXymWaq5
   4Bf1TYQetjHf5VdVPNtzdAVdLng0gFhCIPWmq4LKMxV4ZzvmE94tZHKeF
   PGbanIqK4k42YJ+061/ezfHAFTGLLMKvi/+dXqnsdDMUOotS5ndOR4Qu9
   LXmTdjfbL7NmiYo2f/ppDRkb2uBSBw8KUGD2WT6zUnmTZWJ8rvNtAh8uj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="373962706"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="373962706"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 03:55:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="738201863"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="738201863"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 28 Aug 2023 03:55:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qaZtr-00F6Ig-0Y;
        Mon, 28 Aug 2023 13:55:15 +0300
Date:   Mon, 28 Aug 2023 13:55:14 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Lee Jones <lee@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mfd: madera-i2c: Simplify probe()
Message-ID: <ZOx9Ei3PIioXdQLu@smile.fi.intel.com>
References: <20230826091751.51634-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230826091751.51634-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Aug 26, 2023 at 10:17:51AM +0100, Biju Das wrote:
> Simplify probe() by replacing of_device_get_match_data() and ID lookup for
> retrieving match data by i2c_get_match_data().

...

> -	of_data = of_device_get_match_data(&i2c->dev);
> -	if (of_data)
> -		type = (unsigned long)of_data;
> -	else
> -		type = id->driver_data;
> +	type = (unsigned long)i2c_get_match_data(i2c);

>  

This blank line is not needed after this change.

>  	switch (type) {

-- 
With Best Regards,
Andy Shevchenko


