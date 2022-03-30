Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D06784EC612
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Mar 2022 15:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346406AbiC3OAn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Mar 2022 10:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245501AbiC3OAn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 10:00:43 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79B02CD316;
        Wed, 30 Mar 2022 06:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648648737; x=1680184737;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c/cD/nW6eeWW9QJw7zvNMbMYQ+wmVEYxVyrb381DpnM=;
  b=Qb8yuA/vwTmllOyQdSC0FP8smdVJYt65nIyWDSqyne/iw53ez/8CFK2V
   GJsKpZAlLsHiPdEfQf0bqBFKCklxK1LfCPn1BmoKdnp6eWn211t3FXodR
   KS/5R/YszLcLpTJXQq2i3ADSDesQKZmsqKMKgynw9nbSf5ZyEOyFchu3m
   Ce4MZioFcqMfW9oifdLqcw97au5SDIuo9ZvGNJox1U94uJNfn5qv3F5Kd
   6JdaI4STxdnlpYc50pTM5L7ND+opdXwcdjhIUJB59jGGnM8FH52Q3mUtR
   PvKia6gBt/qrmg2yd+4US0A8+LnuYL459119F19qFxLILq+dJIZWv8OMt
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="239478178"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="239478178"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 06:58:57 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; 
   d="scan'208";a="503324115"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 06:58:53 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nZYq3-009RDG-Oz;
        Wed, 30 Mar 2022 16:58:19 +0300
Date:   Wed, 30 Mar 2022 16:58:19 +0300
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
        Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [PATCH v4 2/9] serial: 8250: dw: Use the device API
Message-ID: <YkRh+1AUHSbJxQCq@smile.fi.intel.com>
References: <20220330132038.808679-1-miquel.raynal@bootlin.com>
 <20220330132038.808679-3-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330132038.808679-3-miquel.raynal@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 30, 2022 at 03:20:31PM +0200, Miquel Raynal wrote:
> Use the device API instead of the of_* API.
> While at it move this operation outside of the if block to reduce the
> indentation level.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Cc: Emil Renner Berthing <kernel@esmil.dk>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/tty/serial/8250/8250_dw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> index 1666041513a5..b6238b9bf0b2 100644
> --- a/drivers/tty/serial/8250/8250_dw.c
> +++ b/drivers/tty/serial/8250/8250_dw.c
> @@ -371,9 +371,9 @@ static bool dw8250_idma_filter(struct dma_chan *chan, void *param)
>  static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
>  {
>  	struct device_node *np = p->dev->of_node;
> +	unsigned long quirks = (unsigned long)device_get_match_data(p->dev);
>  
>  	if (np) {
> -		unsigned long quirks = (unsigned long)of_device_get_match_data(p->dev);
>  		int id;
>  
>  		/* get index of serial line, if found in DT aliases */
> -- 
> 2.27.0
> 

-- 
With Best Regards,
Andy Shevchenko


