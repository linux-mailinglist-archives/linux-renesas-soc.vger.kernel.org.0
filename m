Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 745CE4D675A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Mar 2022 18:15:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350644AbiCKRQn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Mar 2022 12:16:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350636AbiCKRQn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Mar 2022 12:16:43 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB9F61AD941;
        Fri, 11 Mar 2022 09:15:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647018939; x=1678554939;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qjDj1MlPQCYCGIPasVXStuQKCtbPfwXvLPxUEazTmck=;
  b=SW3VW2APb7r8XTt7N2UWCLkAogeuP8JwJ4Sux2l8Oa7HnlRkvDnc+Vcw
   yHZ+K6DQvrCZJEpQjM31a2sRvkf75Uesfe543Ba2AjpPbl7Z5ezKWovx1
   u22WU7A1OZa2jQBCSHQa5GjAh4lfB0/qaGdfKo+sqihO6kyF+HCfjYqoC
   IRHTAZXFYSjAkf9/yHLuMaW7uWdbb5HZ2ELPmFwQ0VPWG2GC2Olczjg19
   nH3KIq33E+WDNtBRmi53MWNILNExN3ufU7m2Coj0JnFC5KdQCKSEupGEW
   zzNZKI7T/LpzLjRf4BpkmqNpQLoEL8sK6ieo1Wd6jQeribHdeb/TOl+6u
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="236215532"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="236215532"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 09:15:39 -0800
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="496821336"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 09:15:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nSiqq-00FTpB-Fn;
        Fri, 11 Mar 2022 19:14:52 +0200
Date:   Fri, 11 Mar 2022 19:14:52 +0200
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
Subject: Re: [PATCH 6/7] serial: 8250_dw: Add support for RZ/N1 DMA
Message-ID: <YiuDjOFv2jmZrUpt@smile.fi.intel.com>
References: <20220310161650.289387-1-miquel.raynal@bootlin.com>
 <20220310161650.289387-7-miquel.raynal@bootlin.com>
 <YipCsO+UMcGOqLaG@smile.fi.intel.com>
 <20220310202743.1a2bf51d@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310202743.1a2bf51d@xps13>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 10, 2022 at 08:27:43PM +0100, Miquel Raynal wrote:
> andriy.shevchenko@linux.intel.com wrote on Thu, 10 Mar 2022 20:25:52
> +0200:
> > On Thu, Mar 10, 2022 at 05:16:49PM +0100, Miquel Raynal wrote:

...

> > > +/* Offsets for the Renesas RZ/N1 DesignWare specific registers */
> > > +/* DMA Software Ack */
> > > +#define RZN1_UART_DMASA			0xa8  
> > 
> > Is it specific to Renesas? IIRC it's Synopsys DesignWare register, makes
> > sense to use appropriate prefix or no prefix.
> 
> I have no idea, I can use a more common prefix.

It's a register described in Synopsys DesignWare specification. It's not
related to Renesas IP integration.

...

> > > +#define RZN1_UART_xDMACR_1_WORD_BURST	0
> > > +#define RZN1_UART_xDMACR_4_WORD_BURST	BIT(1)
> > > +#define RZN1_UART_xDMACR_8_WORD_BURST	(BIT(1) | BIT(2))  
> > 
> > This looks like incorrect use of BIT() macro.
> > Please, use plain decimal integers. Something like
> > 
> > 	1	(0 << 1)
> > 	4	(1 << 1)
> > 	8	(3 << 1)
> > 
> > If I'm mistaken, describe the meaning of each bit there.
> 
> Matter of taste, I believe, whatever.

Actually no, when one uses BIT() masks it implies that in the datasheet each
bit is meaningful. So, please clarify this and update accordingly.

...

> > > +	data->is_rzn1 = of_device_is_compatible(dev->of_node, "renesas,rzn1-uart");
> > 
> > Device property API.
> 
> I'm not sure to get what you mean here again. The Information is in the
> device tree, the compatible string already gives us what we need, why
> would we need a device property? (or perhaps I misunderstand what
> "device property API" means)

Use non-OF APIs, which usually starts with device_property_ or fwnode_.
But Geert already suggested something better.

> > >  	/* Always ask for fixed clock rate from a property. */
> > >  	device_property_read_u32(dev, "clock-frequency", &p->uartclk);

-- 
With Best Regards,
Andy Shevchenko


