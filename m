Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 894AD4EC63F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 16:12:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346640AbiC3OOZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 10:14:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343929AbiC3OOY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 10:14:24 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AD691DEC02;
        Wed, 30 Mar 2022 07:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648649559; x=1680185559;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kg+zdGzwUA59WgV1WWRA20SQP2lWVWwBmdCg813M660=;
  b=WBflqZviXezkkmq71LRseYy6kzN7D+vhafDqdY1+qsf2BqTDlqikszkC
   T3DQP5AaV0ouyXhBskO7h7v/a0/WDARwSaNPniL5ewjvEIBPLliJd9HRX
   F6sXKlw+UV1u+Ns1+Xp6Z7+hgLrIOGxelwJcFcP3fH0gV9CUNlLFYOWEL
   aTqi6/jPhECo19kTk2hRaChwaUjK6wBSWVIKNQgowLCb8yFsWjxFZUGGV
   LjDKFfEiCVnFS0RTg4i1KyWVcSzQzZPTaDgsjm+2EhFOnj2x4O6iRhBji
   wgfjb/RfNQB1sE1rhpIV3m1OzdlRInqFlcf/98w/hI1xd6SJZ/bPhYxXl
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="240147765"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="240147765"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 07:12:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="653845916"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 07:12:35 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nZZ34-009RYm-Rp;
        Wed, 30 Mar 2022 17:11:46 +0300
Date:   Wed, 30 Mar 2022 17:11:46 +0300
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
Subject: Re: [PATCH v4 4/9] serial: 8250: dw: Allow to use a fallback CPR
 value if not synthesized
Message-ID: <YkRlIrE0B6y6/zbf@smile.fi.intel.com>
References: <20220330132038.808679-1-miquel.raynal@bootlin.com>
 <20220330132038.808679-5-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330132038.808679-5-miquel.raynal@bootlin.com>
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

On Wed, Mar 30, 2022 at 03:20:33PM +0200, Miquel Raynal wrote:
> DW UART controllers can be synthesized without the CPR register.
> In this case, allow to the platform information to provide a CPR value.

...

> +#include <linux/property.h>

Doesn't belong to this patch.

...

>  	reg = dw8250_readl_ext(p, DW_UART_CPR);
> +	if (!reg) {
> +		reg = data->pdata->cpr;
> +		dev_dbg(p->dev, "CPR is not available, using 0x%08x instead\n", reg);
> +	}

> +

Redundant blank line.

>  	if (!reg)
>  		return;

-- 
With Best Regards,
Andy Shevchenko


