Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF2377C876
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Aug 2023 09:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234743AbjHOHUN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Aug 2023 03:20:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234643AbjHOHTy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2023 03:19:54 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF9FA10DD;
        Tue, 15 Aug 2023 00:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692083988; x=1723619988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9gzd7gG/ShVCI7IgV05b5xR08uqdrsUIJZfn6NJyZpM=;
  b=Ufzfz7/k4nfePfCjq5+Yq40Q++LDOGlBc086hyuOgs/oQem5D0uoS6gz
   iAayJQfAOfVpFX3uNnRceBKxLW53yCQHQEcACtnm7Afo4kCOhfm+Nrxcl
   wMZdnFqvFk8jAUmXbeAsd96K4x+DNI6CDr9L7dwsTjJEYtLC8/ijv9MEe
   94wPetEuK/Dtt2mkTUAi/m4UfMyVpnsEXvvMtkNpCstc0zp4UcQ/7+n2f
   b76eWGknIenvoz7H5D8oU/8pWjpjqH74mk/bRAOMNKj3JTQKO8IZYbSo9
   8Rdp5ILX4gvitM3ORo9IPBiDFJBD+s9wZ0SFrUaxqAlbB/ysqejS51/bx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="351807687"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="351807687"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 00:19:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="823743557"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="823743557"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Aug 2023 00:19:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qVoL9-0086DT-36;
        Tue, 15 Aug 2023 10:19:43 +0300
Date:   Tue, 15 Aug 2023 10:19:43 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Crt Mori <cmo@melexis.com>, Rob Herring <robh@kernel.org>,
        linux-iio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] iio: accel: bma180: Convert enum->pointer for data in
 the match table
Message-ID: <ZNsnD954MkGBVlV4@smile.fi.intel.com>
References: <20230812141044.151520-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230812141044.151520-1-biju.das.jz@bp.renesas.com>
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

On Sat, Aug 12, 2023 at 03:10:44PM +0100, Biju Das wrote:
> Convert enum->pointer for data in the match table, so that
> device_get_match_data() can do match against OF/ACPI/I2C tables, once i2c
> bus type match support added to it.
> 
> Replace enum->struct *bma180_part_info for data in the match table and
> simplify bma180_probe().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


