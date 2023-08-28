Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EAFD78AEB2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 13:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbjH1LWC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 07:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbjH1LVe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 07:21:34 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52A18B6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 04:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693221692; x=1724757692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OW0R99GwUEkA82/3Aj5gR/CgcGg4fZRBv1sjgN2iO6U=;
  b=CjKnkOgsC1UtDTu43uaRco1yMSBgqgc+ecbgcbF5/HT5jR4ck5uXIYED
   2V7pGp4yV/mevxVgPFLjqiJbLvVR2CuXul4rpsGajpRz0V0Ski7QX6Oy+
   KiRKGD9RttMF8Vj+WefIMil5q5bdbxXY0J13rqoEqJcEPepZT9coXkZfW
   FNz21nJ6XnlbI/nkfktTb01gQ4JbMwh+B1vgTb29cY1WbsgbSwHjVYRHy
   LfLATFTdSY7xiwrO/M2x/b3Ka9SSDVoR24XGW/pXZtbcNMoU1LcGHPVPb
   3hJZw+O5pRgFA3CGFaY5R28vald55SlxWDy2+6AOkduMsVxKKyPDn6nDp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="378853606"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="378853606"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 04:21:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="738207069"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="738207069"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 28 Aug 2023 04:21:29 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qaaJB-00Fwti-3A;
        Mon, 28 Aug 2023 14:21:25 +0300
Date:   Mon, 28 Aug 2023 14:21:25 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Lee Jones <lee@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mfd: max8997: Simplify probe() and drop
 max8997_i2c_get_driver_data()
Message-ID: <ZOyDNfH7JE3wFa8C@smile.fi.intel.com>
References: <20230826094905.64430-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230826094905.64430-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Aug 26, 2023 at 10:49:05AM +0100, Biju Das wrote:
> Simplify probe() by using i2c_get_match_data() instead of
> max8997_i2c_get_driver_data() for retrieving match data from
> OF/ID tables.

...

> -	max8997->type = max8997_i2c_get_driver_data(i2c, id);
> +	max8997->type = (unsigned long)i2c_get_match_data(i2c);

You need to be consistent inside your patches with the casting...

-- 
With Best Regards,
Andy Shevchenko


