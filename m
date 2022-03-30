Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D3E14EC657
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 16:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241633AbiC3OUm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 10:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346706AbiC3OUl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 10:20:41 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62F6ACC526;
        Wed, 30 Mar 2022 07:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648649936; x=1680185936;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZnKPBmrJJcVxUThnBm6xae0b8l2VzGWw5Q9VGVN6UZ0=;
  b=ZalvaPYZSImzolFpBMYQeIKjleyMhJZa3pj1TYRPYsp1gMdbv66YhOdH
   xEiPmLvV4lTRypPgDs0vKpreCQr1wlI8lsO/TGEYdo2LXIjOmBouxiusG
   iUDhDArMStB3OKOdVYBhWDRNYBMr25STV1EH3iQsI0AldowzvR7z5/2g0
   MchHZgQXg1ZU09fTazshYGgkU2D9I8oaQAthcS6odx22Xq2DCVLX4uL+d
   ALopK7iAZ2mdcBE85eKEGgKFHAfiSr4amTMfRtpv+UDfIRZKd3JoNlBzf
   c++P+GXstLlCQcRKubgTdRJsN3x47EtbTPyqttpH+dWZWDA5ChQNpHx1f
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="345990858"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="345990858"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 07:18:56 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="546878102"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 07:18:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nZZ9O-009Rk4-UY;
        Wed, 30 Mar 2022 17:18:18 +0300
Date:   Wed, 30 Mar 2022 17:18:18 +0300
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
Subject: Re: [PATCH v4 7/9] serial: 8250: dw: Add support for DMA flow
 controlling devices
Message-ID: <YkRmqj670Boa2yLA@smile.fi.intel.com>
References: <20220330132038.808679-1-miquel.raynal@bootlin.com>
 <20220330132038.808679-8-miquel.raynal@bootlin.com>
 <YkRmSv2y71dtXoaN@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YkRmSv2y71dtXoaN@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 30, 2022 at 05:16:42PM +0300, Andy Shevchenko wrote:
> On Wed, Mar 30, 2022 at 03:20:36PM +0200, Miquel Raynal wrote:
> > From: Phil Edworthy <phil.edworthy@renesas.com>

> One comment below, after addressing,

Missed comment:

> > +	/* Manually stop the Rx DMA transfer when acting as flow controller */

> > +	if (up->dma && up->dma->rx_running && rx_timeout && quirks & DW_UART_QUIRK_IS_DMA_FC) {

This is an interrupt context and I think it's better that we quit as earlier as
possible, meaning the quirk check should be first (i.o.w. from particular to
general when && is in use).

> > +		status = p->serial_in(p, UART_LSR);
> > +		if (status & (UART_LSR_DR | UART_LSR_BI)) {
> > +			writel(0, p->membase + RZN1_UART_RDMACR);
> > +			writel(1, p->membase + DW_UART_DMASA);
> > +		}
> > +	}

-- 
With Best Regards,
Andy Shevchenko


