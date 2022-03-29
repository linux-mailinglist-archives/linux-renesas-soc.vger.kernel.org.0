Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 293FB4EB108
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 17:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239017AbiC2Pxd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 11:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238845AbiC2Pxc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 11:53:32 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 782FD14DFEE;
        Tue, 29 Mar 2022 08:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648569109; x=1680105109;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GMfvqPfppBDRudk8mHfrFDRT2z+zS3rqXq/teqPq+08=;
  b=H3p5Euh9Zp+aeChXSVEWTXe0GKALzKmLCj6soOkIBg18yguoHVPcJdRk
   nymZCXljmnixYhH1QS93d4owReFOBLWlKqwT8byQTugHzZ5anGSDHRC+p
   vxIfyRoNrS0Is7u+KRya21RAGFkq/VIyga9Qm8iVk8Pon5wE1ZZMAM04D
   1HJJoXLkOIdqeZSF38tPjq5lRceUe3Kst9r6RaXyi05u64WplNSBFnZYZ
   XaZjJ5FNDehoxk3EmTFdrvI/r0lCyvoM8hA/It20tHmPgKKFo3TmmuaMq
   6rI+SvkIsDyuBgJlH/aWuv0NRSvY6eCHoItR15EN/J/cK8p1tkkP9y7GU
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="256859157"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="256859157"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 08:51:48 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="585623469"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 08:51:44 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nZE7i-008qA2-TB;
        Tue, 29 Mar 2022 18:51:10 +0300
Date:   Tue, 29 Mar 2022 18:51:10 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [PATCH v3 04/10] serial: 8250: dw: Create a more generic
 platform data structure
Message-ID: <YkMq7uQXR+GiM7lr@smile.fi.intel.com>
References: <20220329152430.756947-1-miquel.raynal@bootlin.com>
 <20220329152430.756947-5-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329152430.756947-5-miquel.raynal@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 29, 2022 at 05:24:24PM +0200, Miquel Raynal wrote:
> Before adding more platform data information, let's turn the quirks
> information as being a member of a wider structure. More fields will be
> added later.

>  	struct device_node *np = p->dev->of_node;
> -	unsigned int quirks = (unsigned int)device_get_match_data(p->dev);
> +	const struct dw8250_platform_data *pdata = device_get_match_data(p->dev);
> +	unsigned int quirks = pdata ? pdata->quirks : 0;

I remember Greg is not fan of ternary operators. Taking into account my
suggestion in the next patch, I think this can simply become

	unsigned int quirks = data->pdata.quirks;

-- 
With Best Regards,
Andy Shevchenko


