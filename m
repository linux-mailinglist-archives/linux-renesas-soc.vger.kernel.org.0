Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 190794DDB11
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 14:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236930AbiCRN62 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 09:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236846AbiCRN6Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 09:58:25 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E4BF194ABE;
        Fri, 18 Mar 2022 06:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647611825; x=1679147825;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=elitOA6xokx3WprER2CkeZyDYbP3ww/tdThujcKu+9E=;
  b=CfgKQlifsKwNDfsDSHf0SfUef8tbxTWjMP3yM9VvgrOn6mNRamAgzs7D
   ZiFCEQAvO9STdxshqf8KIF8MhiehgxsgKJcdrg6iK4jAQhSvd7UW+A4Hb
   vIWnmo2wRkS+aZoHndKE/Zq60VDb6Fh0o3sfV7fWSTL/yr/YpU4IBCgKd
   9WOmMn/Vpb8GPY7rMSeiMhSllUY19CHgfgmJMBs6b8JA2tBOUCrhXxCzi
   JS6dnJaSh0jGUhB3UTXjaREUSi2DiOvPoiXwnGvDFUnhPsZo7/xBg9W3E
   RyjVePayyOWH1A0YowPDW1KEN0W3Y5cDPFwIqxz/UPSaeGb+rPsigIW5V
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="237751030"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="237751030"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 06:57:04 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="715491414"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 06:57:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nVD5Z-002G8A-Mm;
        Fri, 18 Mar 2022 15:56:21 +0200
Date:   Fri, 18 Mar 2022 15:56:21 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 04/10] serial: 8250: dw: Allow to use a fallback CPR
 value if not synthesized
Message-ID: <YjSPhRlaSrqLCgw5@smile.fi.intel.com>
References: <20220317174627.360815-1-miquel.raynal@bootlin.com>
 <20220317174627.360815-5-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317174627.360815-5-miquel.raynal@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 17, 2022 at 06:46:21PM +0100, Miquel Raynal wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
> 
> DW UART controllers can be synthesized without the CPR register.
> In this case, allow to the platform information to provide a CPR value.

...

>  void dw8250_setup_port(struct uart_port *p)
>  {
>  	struct uart_8250_port *up = up_to_u8250p(p);
> +	const struct dw8250_platform_data *pdata = device_get_match_data(up->port.dev);

Why not p->dev?

...

>  	reg = dw8250_readl_ext(p, DW_UART_CPR);
> +	if (!reg && pdata)
> +		reg = pdata->cpr;

Perhaps

	if (!reg) {
		if (pdata)
			reg = pdata->cpr;
		dev_dbg("CPR is not available, using %x instead\n", reg);
	}

?

>  	if (!reg)
>  		return;

-- 
With Best Regards,
Andy Shevchenko


