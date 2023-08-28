Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30F9E78AEBE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Aug 2023 13:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbjH1LZq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Aug 2023 07:25:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231356AbjH1LZh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 07:25:37 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F82192
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Aug 2023 04:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693221934; x=1724757934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CyWI73CSFvkOIcN2LWNQ42OVDDFnHPtsT54tYyT/6C8=;
  b=Dhp0/X93DhZUhTa/hJp6Ft+g0RSi21Fj6qJNm4QIzDwXOXIdJXVwjU0N
   EYPFwGAhRaoi5ILx5Tow44ZjVM7dGDRvNAJG/xQO+e2uIbT7vngYalpXq
   iaiu27kP+oSoOFgwW6GM9F1EfcirQhlPuiUNRogNbXx+yVMPuXWvyNFwp
   aJgDMhtC6att7dblN2XQH/uLflo5Pp82PQ+VNH5SQI8cjhbl6fKn/HBt7
   OVIUmhhK15K7IYViqlNiYPJH/So38APxv6roOIB3Y19sP8JJFTMlmF1Zb
   JgsNxdabNJBUhkn138sPUH7mZR3krGOR3HCgUQTB+Qb8Ou7miPh9eJKzu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="355404639"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="355404639"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 04:25:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="984851951"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="984851951"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 28 Aug 2023 04:25:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qaaN8-00G5G4-0i;
        Mon, 28 Aug 2023 14:25:30 +0300
Date:   Mon, 28 Aug 2023 14:25:29 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] regulator: ltc3589: Convert enum->pointer for data in
 the match tables
Message-ID: <ZOyEKbxoJ/rlN7PI@smile.fi.intel.com>
References: <20230826181909.96318-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230826181909.96318-1-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Aug 26, 2023 at 07:19:09PM +0100, Biju Das wrote:
> Convert enum->pointer for data in the match tables, so that the hw
> differences can be stored in pointer and there by simpily the code.
> 
> Add struct ltc3589_info for hw differences between the devices and replace
> ltc3589_variant->ltc3589_info for data in the match table. Simplify the
> probe() by replacing of_device_get_match_data() and ID lookup for
> retrieving data by i2c_get_match_data(). Drop enum ltc3589_variant and
> variant from struct ltc3589_info as there are no users.

...

> +struct ltc3589_info {
> +	int fixed_uV;
> +	const unsigned int *volt_table;
> +};

Can it consume less bytes on some architectures if you swap the order?

...

>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, ltc3589_i2c_id);

>  	{ },

Yeah, a side note about trailing comma in the terminator entries...

>  };
>  MODULE_DEVICE_TABLE(of, ltc3589_of_match);

-- 
With Best Regards,
Andy Shevchenko


