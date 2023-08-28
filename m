Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D756778ABC2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 12:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbjH1Ke2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 06:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbjH1Kd7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 06:33:59 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACEC7CF5;
        Mon, 28 Aug 2023 03:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693218818; x=1724754818;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sdSYV7PP0v0+b2NAwnX056871im1ZjuNdn/JF8Sj3jo=;
  b=F4t0dunV5GcJpK+8LmgIOPGTRMundpNcZqyyI6QFt/y1W7co609A93qy
   7+fCaeKmVtjhxz4mbRpRKuj4MFh8cfhheou6TCfVboWolujb5y+u5M8u4
   fDljg+tUjixIZ82arq6z99OB25vJlXsyn5fq9EKKU5tFq89tpL6XakzbY
   kP9KtUd+eM0sYON8nY5d1/VUleQvuHvWjnqs5gpj+vf2y77+Ahm66tYjT
   KyIgr7k0tmNFoUyKIGRgr0jJLSVgJuITHZiWdqOJQMZWenAZxXFCZUbb2
   CKBXfzrkJiV0/W5eymwSFZT3T3r67rOkWoLVu3CEdOsyZEYohSOHLf7kb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="372475895"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="372475895"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 03:33:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="1068991675"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="1068991675"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 28 Aug 2023 03:33:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qaZYj-00ENiZ-1U;
        Mon, 28 Aug 2023 13:33:25 +0300
Date:   Mon, 28 Aug 2023 13:33:25 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: tmp513: Drop enum tmp51x_ids and variable
 id from struct tmp51x_data
Message-ID: <ZOx39USpLOkk33gT@smile.fi.intel.com>
References: <20230825205345.632792-1-biju.das.jz@bp.renesas.com>
 <20230825205345.632792-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230825205345.632792-3-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,UPPERCASE_50_75 autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 25, 2023 at 09:53:44PM +0100, Biju Das wrote:

...

> +#define TMP51X_TEMP_CONFIG_GPM		FIELD_PREP(GENMASK(1, 0), 0)
> +#define TMP51X_TEMP_CONFIG_GP		FIELD_PREP(TMP51X_TEMP_CONFIG_GPM_MASK, 0)

> +#define TMP51X_TEMP_CONFIG_CONV_RATE	FIELD_PREP(GENMASK(9, 7), 0x7)

How is this different from (GENMASK(2, 0) << 7)?

> +#define TMP51X_TEMP_CONFIG_RC		FIELD_PREP(TMP51X_TEMP_CONFIG_RC_MASK, 1)
> +#define TMP51X_TEMP_CHANNEL_MASK(n)	FIELD_PREP(GENMASK(14, 11), GENMASK(n, 0) > 1)
> +#define TMP51X_TEMP_CONFIG_CONT		FIELD_PREP(TMP51X_TEMP_CONFIG_CONT_MASK, 1)

Looking at these I believe the FIELD_PREP() is overkill.

...

> +#define TMP51X_TEMP_CONFIG_DEFAULT(n) \
> +			(TMP51X_TEMP_CONFIG_GPM | TMP51X_TEMP_CONFIG_GP | \
> +			 TMP51X_TEMP_CONFIG_CONV_RATE | TMP51X_TEMP_CONFIG_RC | \
> +			 TMP51X_TEMP_CHANNEL_MASK(n) | TMP51X_TEMP_CONFIG_CONT)

Too many TABs

-- 
With Best Regards,
Andy Shevchenko


