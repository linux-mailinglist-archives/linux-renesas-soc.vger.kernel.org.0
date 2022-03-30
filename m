Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 578294EC65C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 16:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346709AbiC3OWJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 10:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346706AbiC3OWJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 10:22:09 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3BFECC526;
        Wed, 30 Mar 2022 07:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648650023; x=1680186023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eYFvp/7iPp9R6X31PSbuF5mo1ECcI06+2yE4CXhJT4A=;
  b=YHBegQpZq8bBbKSfOS1rnjo9gkbRbIrp9683uJcb5UzsjpsCvd9ymxB2
   W15y80CEoFTZSXQUy2OPU1pn1zbiKoA+7KHsLYxbDIytTpIdlGKFx4MFZ
   NiULY8SyOXgBRxz9bk5fwTI8zdVbEDb9q914Am14+dSV/kRJnFlTCZv3n
   QcXCkXmq6BwlxGUgcfYH8uFzsFYt2polJYALsZFrz5LfoRJ/EAkak5PUS
   qbU9Zhfc2zD1CdP5bn/Hfy/jaCvMEE8VFHhGWUrdM5ELpRC2AfY48CzOl
   4rtGlHE0aq9ah1hFQJH3gx39tyySuUfVBQ8GJ18oMOPc6hHqX87hRAN3k
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259739167"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="259739167"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 07:20:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="565561989"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 07:20:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nZZAn-009Rmj-W5;
        Wed, 30 Mar 2022 17:19:45 +0300
Date:   Wed, 30 Mar 2022 17:19:45 +0300
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
Subject: Re: [PATCH v4 8/9] serial: 8250: dw: Improve RZN1 support
Message-ID: <YkRnAfb7O0tcNXOz@smile.fi.intel.com>
References: <20220330132038.808679-1-miquel.raynal@bootlin.com>
 <20220330132038.808679-9-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330132038.808679-9-miquel.raynal@bootlin.com>
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

On Wed, Mar 30, 2022 at 03:20:37PM +0200, Miquel Raynal wrote:
> From: Phil Edworthy <phil.edworthy@renesas.com>
> 
> Renesas RZ/N1 SoC features a slightly modified DW UART.
> 
> On this SoC, the CPR register value is known but not synthetized in
> hardware. We hence need to provide a CPR value in the platform
> data. This version of the controller also relies on acting as flow
> controller when using DMA, so we need to provide the
> "is dma flow controller" quirk.

After modifying one of previous patches...

> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Co-developed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/tty/serial/8250/8250_dw.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> index 977a473535e8..195aa4516b2b 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -755,7 +755,10 @@ static const struct dw8250_platform_data dw8250_armada_38x_data = {
>  	.quirks = DW_UART_QUIRK_ARMADA_38X,
>  };
>  
> -static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {};
> +static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {

...this change...

> +	.quirks = DW_UART_QUIRK_IS_DMA_FC,
> +	.cpr = 0x00012f32,

> +};

...and this will disappear from this patch.

With it rebased,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

>  static const struct dw8250_platform_data dw8250_starfive_jh7100_data = {
>  	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
> -- 
> 2.27.0
> 

-- 
With Best Regards,
Andy Shevchenko


