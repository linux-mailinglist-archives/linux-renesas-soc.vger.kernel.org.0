Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78AA74EB138
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 18:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239128AbiC2QDn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 12:03:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238372AbiC2QDm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 12:03:42 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA25B51591;
        Tue, 29 Mar 2022 09:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648569719; x=1680105719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XtK+qF/NBtqnWJTk/2k8vIkRlnahWCMn9PfN5nUzZwM=;
  b=FKfTARM6EyqwtUXkGLwEvIuESa3RgovvQSDeX+Cda+Kc+oon1oFdMu8M
   XhoNKPiE6dq+ddnnfOtlCzQd0HYqrevdODWZ+PRgykxr7RZAEgR/RqNU3
   wFGWv8mWyYCNblAdSHjFTB4KB7LfY+Vw+MIYg4FY+VR4mscsbSyoA/aU2
   8DDVcW5Czf9v+SgDWW5kWjmZMe5nKqOXt3PKZQyNfe2VOLD7qXVCwMgNl
   EoZ/m91VarlCE5fJ8aoHVbdRWZguS93qc+twjoINvs2Ror00CZbkTmXcV
   kpQgR6HEyQcc4HAm7okp7iagPP1X6u7vxKeGDWO5yYoMOPcDf+u9ilwV/
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259470594"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="259470594"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 09:01:51 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="787639883"
Received: from smile.fi.intel.com ([10.237.72.59])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 09:01:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nZEHS-008qQf-MU;
        Tue, 29 Mar 2022 19:01:14 +0300
Date:   Tue, 29 Mar 2022 19:01:14 +0300
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
        Clement Leger <clement.leger@bootlin.com>
Subject: Re: [PATCH v3 00/10] serial: 8250: dw: RZN1 DMA support
Message-ID: <YkMtShbk3rcFhm+p@smile.fi.intel.com>
References: <20220329152430.756947-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329152430.756947-1-miquel.raynal@bootlin.com>
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

On Tue, Mar 29, 2022 at 05:24:20PM +0200, Miquel Raynal wrote:
> Hello,
> 
> Support for the RZN1 DMA engine allows us adapt a little bit the 8250 DW
> UART driver with to bring DMA support for this SoC.
> 
> This short series applies on top of the series bringing RZN1 DMA
> support, currently on its v5, see [1]. Technically speaking, only the DT
> patch needs to be applied after [1]. The other patches can come in at
> any moment, because if no "dmas" property is provided in the DT, DMA
> support will simply be ignored.
> 
> [1] https://lore.kernel.org/dmaengine/20220315191255.221473-1-miquel.raynal@bootlin.com/T/#m0ef3323abce3eec961e142bf2fb35e95b9045fc5

Thanks for a new version!

It becomes definitely closer to the good enough state.
Since I have comments and we still in the middle of the merge window
we have time to address them.

-- 
With Best Regards,
Andy Shevchenko


