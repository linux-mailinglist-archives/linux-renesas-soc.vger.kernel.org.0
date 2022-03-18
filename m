Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5944DDB9F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 15:25:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232125AbiCRO1M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 10:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236864AbiCRO1L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 10:27:11 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3596813667D;
        Fri, 18 Mar 2022 07:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647613553; x=1679149553;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HVGWQSN8Ko7B/4rAfzeNU+LVyHQtN/f29tiIE9kf1RE=;
  b=KmH+BbfbTBGYroCeueCUpsf5b/rbJ5iUhc9RHXYs7P9zRMCS0Pqd8+00
   vJFFiBdXWOFlUccMx1cJSMiPXquGz7ldDUsDAbH57A559DjR0GlR0cRGP
   7yOuUc2l18OhXE1xDIvMxk/qoKxOpuoUAE7uTzUJRWmeP7jCH/bBR//mu
   cQAzJVHJeAsaDhm4XpQbb5eK/i5DQ4VhCYcM5t29niqf/WRfIiLTb0sxf
   wPsZTOc3iIrg30O8Bg+rFjgxV4vIHrDeKcqgd2lYcrYNp/4nvfohBPAgc
   +GZdloD5FmHasyIT/wM9mA0Sd5pIkVZQHvUDyM902rGv1lgaXD5AjJBbZ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="257332515"
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="257332515"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 07:25:34 -0700
X-IronPort-AV: E=Sophos;i="5.90,192,1643702400"; 
   d="scan'208";a="513881332"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2022 07:25:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nVDX9-002GrW-EI;
        Fri, 18 Mar 2022 16:24:51 +0200
Date:   Fri, 18 Mar 2022 16:24:51 +0200
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
Subject: Re: [PATCH v2 08/10] serial: 8250: dw: Add support for DMA flow
 controlling devices
Message-ID: <YjSWM5ilahNBXF1b@smile.fi.intel.com>
References: <20220317174627.360815-1-miquel.raynal@bootlin.com>
 <20220317174627.360815-9-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317174627.360815-9-miquel.raynal@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-8.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 17, 2022 at 06:46:25PM +0100, Miquel Raynal wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
> 
> DW based controllers like the one on Renesas RZ/N1 must be programmed as
> flow controllers when using DMA.
> 
> * Table 11.45 of the system manual, "Flow Control Combinations", states
>   that using UART with DMA requires setting the DMA in the peripheral
>   flow controller mode regardless of the direction.
> 
> * Chapter 11.6.1.3 of the system manual, "Basic Interface Definitions",
>   explains that the burst size in the above case must be configured in
>   the peripheral's register DEST/SRC_BURST_SIZE.
> 
> Experiments shown that upon Rx timeout, the DMA transaction needed to be
> manually cleared as well.

...

> +#define DW_UART_TDMACR	0x10c /* DMA Control Register Transmit Mode */
> +#define DW_UART_RDMACR	0x110 /* DMA Control Register Receive Mode */

These are not Synposys ones.

...

> +static u32 dw8250_rzn1_get_dmacr_burst(int max_burst)
> +{
> +	if (max_burst >= 8)
> +		return DW_UART_xDMACR_8_WORD_BURST;
> +	else if (max_burst >= 4)
> +		return DW_UART_xDMACR_4_WORD_BURST;
> +	else
> +		return DW_UART_xDMACR_1_WORD_BURST;
> +}

Redundant 'else' in all cases.

-- 
With Best Regards,
Andy Shevchenko


