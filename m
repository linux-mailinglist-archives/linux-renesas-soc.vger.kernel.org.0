Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6AD4D6744
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Mar 2022 18:10:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349007AbiCKRLC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Mar 2022 12:11:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350430AbiCKRLA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Mar 2022 12:11:00 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B33B3E1B74;
        Fri, 11 Mar 2022 09:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647018597; x=1678554597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+2vSXrp9bpo3dFcT4oUhafdE88P9a2v3QaAMCpMts7c=;
  b=Hvup+avnCpfbKJw9T5pyClkyKxdW77QvsbMiWl2fu70S19qefuPZY+Ay
   E9E9TdoAYrug5TS28qKBxMmPxLwVgCBVvGU9B/6mQev1wgVBvOCcaOt9J
   ZjKIW/PQnHXoJpSX4ql0p2TqRrCFZ+IEC4kI3ZOTF/srcKgBJuFY1Cjvl
   4u/rA1xdfywy6m5k+MyJOgVJd5SHyaBcZMvBTotVUtBVxMp/3on2bYSm2
   iA15CKWH91SvVjs4jKcAeRBIMxGBdEjPHqh5Pk9x3KobLxC/Vsyb9TP28
   zynoVYMatHyQkpSKmB1CMmNBIgENCzbIvbFqj0B00SR0E13ck+CU5CyDk
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="280357545"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="280357545"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 09:09:57 -0800
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="643039346"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 09:09:53 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nSilK-00FTgA-TB;
        Fri, 11 Mar 2022 19:09:10 +0200
Date:   Fri, 11 Mar 2022 19:09:10 +0200
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
Subject: Re: [PATCH 5/7] serial: 8250_dw: Add a dma_capable bit to the
 platform data
Message-ID: <YiuCNl1ek7xmbNXn@smile.fi.intel.com>
References: <20220310161650.289387-1-miquel.raynal@bootlin.com>
 <20220310161650.289387-6-miquel.raynal@bootlin.com>
 <Yio+IdeWn+G7xcNv@smile.fi.intel.com>
 <20220310201351.1f15bf7e@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310201351.1f15bf7e@xps13>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 10, 2022 at 08:13:51PM +0100, Miquel Raynal wrote:
> andriy.shevchenko@linux.intel.com wrote on Thu, 10 Mar 2022 20:06:25
> +0200:
> > On Thu, Mar 10, 2022 at 05:16:48PM +0100, Miquel Raynal wrote:
> > > From: Phil Edworthy <phil.edworthy@renesas.com>

...

> > > +	/* If we have a valid fifosize and DMA support, try hooking up DMA */
> > > +	if (p->fifosize && data->dma_capable) {  
> > 
> > > +	if (reg & DW_UART_CPR_DMA_EXTRA)
> > > +		data->dma_capable = 1;  
> > 
> > How many designs will be broken by this change?
> 
> My understanding was that CPR registers where always synthesized until
> now even though it was not mandatory and that the RZN1 SoC was the
> first one to not embed it. My hope was that people using this driver
> would have brought "external" CPR support earlier if they needed it,
> but I understand this assumption might be wrong.
> 
> Anyway, I also hesitated to do something more custom for the RZN1 I'll
> try something else.

My point is that you have put this requirement to the above conditionals.
Have you checked all supported platforms that announce CPR that that bit
is set when DMA is indeed in use?

AFAIK on Intel SoCs the native UART DMA signalling is not used, the
integration between DMA and UART is done differently because it requires
more signals to connect. It might be that I misread the documentation
and this is not the case and we indeed set that bit as well.

Also, what to do with the platforms that have no CPR but support DMA currently?

...

> > > +	unsigned int		dma_capable:1;  
> > 
> > Note, we use up->dma == NULL for no-DMA, no additional flag is needed.
> > Just make sure that for your platform you enable DMA by filling that.
> 
> dma_capable is just a capability the SoC has. It was discovered at
> probe time and should be saved to know, later, if DMA can be hooked up
> or not. At the time we look at the CPR register we don't yet have DMA
> fields populated so its too early to set up->dma to NULL.

'up->dma == NULL' check will tell you that, no?

-- 
With Best Regards,
Andy Shevchenko


