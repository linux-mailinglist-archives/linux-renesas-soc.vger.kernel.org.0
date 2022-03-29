Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E3684EB131
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 18:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239116AbiC2QDE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 12:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239139AbiC2QCz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 12:02:55 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 687415132F;
        Tue, 29 Mar 2022 09:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648569672; x=1680105672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aEPC4YrzP9t7pn8bh0+Pf1G7y3lC+2GOyBH3k59DyRU=;
  b=BpnBzCacelFrmo63xBRSJ3S3bktxcjxhRJvXxU8rdLb06SDy6YSCCfaY
   osJFoIEBROz9C8kdF+ZYnZyUCZDnPEr5CjF1Y90wy8igScdTCe6HjpUn2
   wL7MOSexKzavKkZWKtQ6Qt286bfZwIjoI3ajvwZ8a/7W/3FgrCzOvBqLs
   ZiMARhiSqKORjyZkk8sq27KwnXbZ8Ib1lndzeSo5kXwxlisiD5oIWgA47
   zk1UmCr2LRcA5AG7p4dEstvFb+44P84lIWTVSn72wngfgpMCAaxN/JXtn
   ZzuxYoYioy+myvzw5twinob0phuEItFDlTxlfwtxFG2BpBjSGIA7ByQZA
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259256534"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="259256534"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 09:00:40 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="519009137"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 09:00:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nZEGJ-008qOb-1p;
        Tue, 29 Mar 2022 19:00:03 +0300
Date:   Tue, 29 Mar 2022 19:00:02 +0300
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
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: Re: [PATCH v3 09/10] serial: 8250: dw: Improve RZN1 support
Message-ID: <YkMtAnySw3wdttUf@smile.fi.intel.com>
References: <20220329152430.756947-1-miquel.raynal@bootlin.com>
 <20220329152430.756947-10-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329152430.756947-10-miquel.raynal@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Mar 29, 2022 at 05:24:29PM +0200, Miquel Raynal wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
> 
> Renesas RZ/N1 SoC features a slightly modified DW UART.
> 
> On this SoC, the CPR register value is known but not synthetized in
> hardware. We hence need to provide a CPR value in the platform
> data. This version of the controller also relies on acting as flow
> controller when using DMA, so we need to provide the
> 'IS_DMA_FLOW_CONTROLLER' quirk.

...

> -	{ .compatible = "renesas,rzn1-uart" },
> +	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

Btw, you may avoid if (pdata) checks if you add a stub in the first place here.
It will also make this patch shorter.

-- 
With Best Regards,
Andy Shevchenko


