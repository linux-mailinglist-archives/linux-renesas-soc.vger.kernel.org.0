Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A3754D5124
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Mar 2022 19:03:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233251AbiCJSEA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Mar 2022 13:04:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233059AbiCJSD4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 13:03:56 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50CE83F89B;
        Thu, 10 Mar 2022 10:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646935375; x=1678471375;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hhuqtfjl+z3/10L9z6E7QQCvlGg0n4WBiBPYdyCXHp8=;
  b=fmGDX/XSvDMRNk6TGjDcFD50Q5DbGBB+HyDMHCvxxy9E/UT0pg6pKaux
   7l0NdGvOIQdhNIxZLa0vR99yVBXIMvQaVhGxYxEIVCzjK3L6yTgYB2ifS
   Aeggn6BsKHrBm6qHQHbOulXOk09WP1kqKLA7fyBzr78jbdnSfWSYTaVgn
   4ANZ2ZRLM/uON097zQgiXxrhRE/xc00cZ8tEhSoOEGabibAVOTPXm5xgM
   CtwDvPstVgGG7waoyge0pnxwFharZ1mASk0tPuwhekp7XpRia1P5PXLGj
   HKdsoyGo30Td+srfK8y3GNhmAWaB+hwwfklJeDXo6MvXpZsOWqCeTVnb7
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="237495151"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="237495151"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 10:02:27 -0800
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="611831492"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 10:02:23 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nSN6a-00ErN9-5X;
        Thu, 10 Mar 2022 20:01:40 +0200
Date:   Thu, 10 Mar 2022 20:01:39 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-serial@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: Re: [PATCH 2/7] serial: 8250_dw: Move the per-device structure
Message-ID: <Yio9A3ZCDoAyoIMJ@smile.fi.intel.com>
References: <20220310161650.289387-1-miquel.raynal@bootlin.com>
 <20220310161650.289387-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310161650.289387-3-miquel.raynal@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 10, 2022 at 05:16:45PM +0100, Miquel Raynal wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
> 
> This structure needs to be reused from dwlib, so let's move it into a
> shared header. There is no functional change.

...

> +struct dw8250_data {
> +	struct dw8250_port_data	data;

> +	u8			usr_reg;

I believe types.h is already in the inclusion block.

> +	int			msr_mask_on;
> +	int			msr_mask_off;

> +	struct clk		*clk;
> +	struct clk		*pclk;

Do you need forward declarations?

> +	struct notifier_block	clk_notifier;
> +	struct work_struct	clk_work;

I haven't seen the change in the inclusion block.
Don't you miss necessary headers?

> +	struct reset_control	*rst;

Do you need forward declaration?

> +	unsigned int		skip_autocfg:1;
> +	unsigned int		uart_16550_compatible:1;
> +};

-- 
With Best Regards,
Andy Shevchenko


