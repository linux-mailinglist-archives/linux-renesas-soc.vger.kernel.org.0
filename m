Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD6B4EB105
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 29 Mar 2022 17:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238991AbiC2PwQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 29 Mar 2022 11:52:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239017AbiC2PwP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Mar 2022 11:52:15 -0400
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A678BF75;
        Tue, 29 Mar 2022 08:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648569031; x=1680105031;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d4GBbJK14ChjbYHawno7PaODDTR33v0WF8iAVJmhLNQ=;
  b=clP1NLhNF39YoJCVTmxN50E/oH/dVwp+nzT0znxSOpdfPEwZBPWZXkUb
   IOL5GEnpp3WKKd/m+3gS7oitPPsIN/+Bh4ZEXI954KcfzYDs+PjShmmHI
   24OvYkt7EEI8CuqIfDumHwOj2zoS9HPABT2qIkdhkmvI5Z3R0qZwf6zLD
   AY4lhIhZI8VgnHo235+yFEmvkGCxD1j4wdAqu7xo1zsysr/U+W9EWtDaa
   LFLJBvHtfXBt+F+V8elnxqAf+FXdFRoxEL80U0NqQuX8t0le4McNcUNEM
   Ex+86exENw/br+KYk9h42hpFHhFL5ULJs5F2jYhCuSK1j4Uq4cwyLTpTC
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="319979170"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="319979170"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 08:50:30 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; 
   d="scan'208";a="502930214"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2022 08:50:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nZE6T-008q7N-1U;
        Tue, 29 Mar 2022 18:49:53 +0300
Date:   Tue, 29 Mar 2022 18:49:52 +0300
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
Subject: Re: [PATCH v3 05/10] serial: 8250: dw: Allow to use a fallback CPR
 value if not synthesized
Message-ID: <YkMqoGIwEBVKtdXG@smile.fi.intel.com>
References: <20220329152430.756947-1-miquel.raynal@bootlin.com>
 <20220329152430.756947-6-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329152430.756947-6-miquel.raynal@bootlin.com>
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

On Tue, Mar 29, 2022 at 05:24:25PM +0200, Miquel Raynal wrote:
> DW UART controllers can be synthesized without the CPR register.
> In this case, allow to the platform information to provide a CPR value.

> +	const struct dw8250_platform_data *pdata = device_get_match_data(p->dev);

Hmm... So, we will have two functions that do the same.
Perhaps you may store somewhere the pdata pointer (or contents) once
and call these functions at the time that the pdata is known to be set.
That's how usual pattern looks like. Calling device_get_match_data()
several times is unusual and potentially might be error prone.

...

>  	reg = dw8250_readl_ext(p, DW_UART_CPR);
> +	if (!reg) {

> +		if (pdata)
> +			reg = pdata->cpr;

If you store the content this becomes something like:

		reg = data->pdata.cpr;

But, please experiment a bit with it and choose the best option.

> +		dev_dbg(p->dev, "CPR is not available, using %x instead\n", reg);
> +	}

> +

No need of this blank line.

>  	if (!reg)
>  		return;

-- 
With Best Regards,
Andy Shevchenko


