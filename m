Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6370787D9E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Aug 2023 04:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232787AbjHYCYp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Aug 2023 22:24:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237610AbjHYCYb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2023 22:24:31 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3301CCB;
        Thu, 24 Aug 2023 19:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692930269; x=1724466269;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f82bEtM0XZPiS5OpFsZ8MaG9NjqCl0AA8I0uAHVTMsw=;
  b=bM3sRyWcoPNY9NpmxVx3OLIsV/ACSdvomesum7ns1uSy65WiQ8sbMNdb
   f9ASaOXN6Y3QiMUCHQpWvQsyk7UhERwYg0nn7IUn1iT4hdYk6Z0HVeVSy
   ISPjrTx1OafI5C88jr0NOTO5A04AIylrcNARsn95sdpFojwtluCOXumpl
   UHVt3klZXF49xKgcZGBFstEpzfkLn8XW6Juc2Fi6//fCmvTQbJGkRK2mO
   JhNKLMD/1xKP6lKUopsI+Df0EQTDagh0ZzU+Hpk2fNwJpoLjcA4cfEP3J
   Y8OngiOklFATVmPh3t6m/qbb//zAI5BuOpUb3AdqFVePB+LxK4SuWgLNf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="359609165"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="359609165"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 19:24:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="766802120"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="766802120"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 24 Aug 2023 19:24:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qZMUq-00E4CU-2j;
        Fri, 25 Aug 2023 05:24:24 +0300
Date:   Fri, 25 Aug 2023 05:24:24 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: tmp513: Replace tmp51x_ids->max_channels
 in struct tmp51x_data
Message-ID: <ZOgQ2Fc1J8V7rdm4@smile.fi.intel.com>
References: <20230824204456.401580-1-biju.das.jz@bp.renesas.com>
 <20230824204456.401580-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824204456.401580-4-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Aug 24, 2023 at 09:44:56PM +0100, Biju Das wrote:
> The tmp512 chip has 3 channels whereas tmp513 has 4 channels. Avoid
> using tmp51x_ids for this HW difference by replacing
> tmp51x_ids->max_channels in struct tmp51x_data and drop

You don't replace it, you replaced "id" by it.

> enum tmp51x_ids as there is no user.

...

> +#define TMP51X_TEMP_CONFIG_DEFAULT(a) (0x8780 | GENMASK(11 + (a) - 1, 11))

This seems fragile ("a" can't be 0, and can't be > 4) and will give not good
code generation (for GENMASK() use), besides it has 0x8780 magic. What is that?
Two bit field masks?

	(BIT(15) | (GENMASK((a) - 1, 0) << 11) | GENMASK(10, 7))

?

Also add a comment to explain "a" and other bits.

...

>  	case hwmon_temp:
> -		if (data->id == tmp512 && channel == 3)
> +		if (data->max_channels == channel)

This is not the same as it was previously. And looks like this kind of fix
(if I understood the previous patch correctly) should be done there.

Btw, avoid Yoda style

		if (channel == data->max_channels)

>  			return 0;

...

>  	ret = device_property_read_u32_array(dev, "ti,nfactor", nfactor,
> -					    (data->id == tmp513) ? 3 : 2);
> +					    data->max_channels - 1);
>  	if (ret >= 0)
> -		memcpy(data->nfactor, nfactor, (data->id == tmp513) ? 3 : 2);
> +		memcpy(data->nfactor, nfactor, data->max_channels - 1);

It looks like data->nfactor is of the same type as nfactor, right?
Why this can't be simplified to just

	device_property_read_u32_array(dev, "ti,nfactor",
				       data->nfactor, data->max_channels - 1);

...

> -	data->temp_config = (data->id == tmp513) ?
> -			TMP513_TEMP_CONFIG_DEFAULT : TMP512_TEMP_CONFIG_DEFAULT;

Are those still being in use?

> +	data->temp_config = TMP51X_TEMP_CONFIG_DEFAULT(data->max_channels);

-- 
With Best Regards,
Andy Shevchenko


