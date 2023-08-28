Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91EC378AE37
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 12:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232355AbjH1K6H (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 06:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbjH1K5e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 06:57:34 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5FC9B9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 03:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693220240; x=1724756240;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xvFEscjR4f9rt4nAnENeMbkYhJrU88vGsU6khu2tj9o=;
  b=UWI2L1+6A8DKtzfigjexm2lMgOGD05OEhxid+T0nA5ijPBshsd5ktgEl
   nsYbEwf3Ioyu1vTD3aOZ9gD6EMW3PemNQW/K+dUkEC2FLh3pirJ2lkW5/
   1JY6PQG/ZmzEAseQjGSPhUiL/phevfId/ue1q+1IhsQvVYCYSZMFDy+DV
   TiWAVQsKfQdrpuAi4Jt4X941elRgV1VyutpzkM9cDVm6sciNuWBupOL8Z
   hN4vrNWvmPQyhXxEewsNLapmWVzWTBV+DcG0CLYZ/S1lOrUy2va8y6ZSZ
   Hdg483cpVCTxNkziWG9gq5NnbsUdR9IdWUvL+JCPFWXCk9muWciTnGHHP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="372479063"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="372479063"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 03:57:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="1068994837"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="1068994837"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 28 Aug 2023 03:57:14 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qaZvk-00FAK6-1a;
        Mon, 28 Aug 2023 13:57:12 +0300
Date:   Mon, 28 Aug 2023 13:57:12 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] regulator: sy8824x: Make similar OF and ID table
Message-ID: <ZOx9iNd4tfiqPrx5@smile.fi.intel.com>
References: <20230826171158.82219-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230826171158.82219-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Aug 26, 2023 at 06:11:58PM +0100, Biju Das wrote:
> Make similar OF and ID table to extend support for ID match using
> i2c_match_data(). Currently it works only for OF match tables as the
> driver_data is wrong for ID match.

...

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, sy8824_dt_ids);

...

>  static const struct i2c_device_id sy8824_id[] = {
> -	{ "sy8824", },
> +	{ "sy8824", (kernel_ulong_t)&sy8824c_cfg },

>  	{ },

Here is even inconsistency with usage of trailing comma in the terminator
entry.

>  };

-- 
With Best Regards,
Andy Shevchenko


