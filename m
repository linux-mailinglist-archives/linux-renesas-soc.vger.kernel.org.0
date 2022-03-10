Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 549044D5118
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Mar 2022 19:01:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243831AbiCJSBH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Mar 2022 13:01:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238595AbiCJSBG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Mar 2022 13:01:06 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D55731965F1;
        Thu, 10 Mar 2022 10:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646935205; x=1678471205;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=21WbDpnT5KaUZNJS8Srkl3mjThzdzM2yhL4rPS9uy7E=;
  b=ca6AT8HHfulYANIrRD/YQxnv9kiirvnnMzIh5/J7y61unbvjDiINm9ji
   EEPcELDeioXBDG2ms8hMHh8NH+X5eyNHBHznkegtSJ8OQ46sozE3YM8sh
   vA0s1++jbgsx6h7qielK6EofXyZrfxn9wPIxE4O9cF4wV/NPy4W6F78c2
   godTmhjZW3Zf5qrphkOPd5nvfhG4TJjIckjkxFh5rvdqsRyYNmpn1vBt9
   IXwNiDtzhJ5lQ9n/XmIGm1OPYmLt5eEuRJcBy3RSaKmY1KiocSuX/aXHs
   wGFPUsU6MHavOaiCKRc7gKMVUE9t3CgVmR/gMKgsw4OIw7QJAqYvR4loO
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="242768860"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="242768860"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 10:00:05 -0800
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="644540769"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 10:00:01 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nSN4I-00ErKM-2L;
        Thu, 10 Mar 2022 19:59:18 +0200
Date:   Thu, 10 Mar 2022 19:59:17 +0200
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
Subject: Re: [PATCH 1/7] serial: 8250_dma: Use ->tx_dma function pointer to
 start next DMA
Message-ID: <Yio8dcOPPyCWbBMa@smile.fi.intel.com>
References: <20220310161650.289387-1-miquel.raynal@bootlin.com>
 <20220310161650.289387-2-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310161650.289387-2-miquel.raynal@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Mar 10, 2022 at 05:16:44PM +0100, Miquel Raynal wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
> 
> The 8250 driver is quite flexible. Regarding DMA handling, there is the
> possibility to either use the default helper (serial8250_tx_dma()) or
> call a specific function. Only the omap and brcm implementation do
> that. In both cases, they don't use the serial8250_tx_dma() helper at
> all.
> 
> As we are going to write a new DMA handling function for the RZ/N1 SoCs
> which will use the serial8250_tx_dma() implementation (preceded by a
> couple of register writes), we need the ->tx_dma() pointer to link to
> our own function, but within the __dma_tx_complete() helper we also need
> to call our own implementation instead of the default one directly.
> 
> In order to do that, let's call ->tx_dma() instead of
> serial8250_tx_dma() from __dma_tx_complete().

In 8250 driver the pattern is to give the generic function "do" name and
then call it in a wrapper:

	if (->foo())
		return ->foo();

	return serial8250_do_foo();

There are plenty of examples in that driver.

-- 
With Best Regards,
Andy Shevchenko


