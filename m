Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2EDA69AF41
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Feb 2023 16:15:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjBQPPH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Feb 2023 10:15:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbjBQPPG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 10:15:06 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B51A65698;
        Fri, 17 Feb 2023 07:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676646905; x=1708182905;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E3qSxYIBCl2wrHaPqs5aU1oaRCoayWAxvUunCUm7Ilc=;
  b=O84uQf5cmxRKo2DZLVQ00uodqMseDmhdiGSZ5NthNRWdS4jt/s6qnfsI
   hocT1/twLiNZLAx1uNxx58uFbnTuhq/fEpEiIRfUqHdVMhQqXHbHGaFUU
   07qp9FcLj/6sq0evevCeEJfjJEjzTA0JJTpXrejWvrPHO9XBB5/G4uZt4
   0a78A/CMO7GsWhzueEv17riXMxvsWK0ht9IodWwYOAgCKtvEUqP5ELuOY
   mOHpz/XXtH70o7RTcNLCwTwD3onPeCeSv8YNg3NvaZKyIfS5R8EUD6+oz
   Z8+xvLzs/t/IeoLjOWWRZ1KRJWpnz3pySfxsJoiNBsVylFpDs1+YZxfXw
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="332009732"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="332009732"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 07:15:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="999475987"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="999475987"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 17 Feb 2023 07:15:03 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pT2Rx-008GSM-0V;
        Fri, 17 Feb 2023 17:15:01 +0200
Date:   Fri, 17 Feb 2023 17:15:00 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v4 6/6] serial: 8250_em: Add
 serial8250_em_{reg_update(),out_helper()}
Message-ID: <Y++Z9G/ouZQE/BTM@smile.fi.intel.com>
References: <20230217114255.226517-1-biju.das.jz@bp.renesas.com>
 <20230217114255.226517-7-biju.das.jz@bp.renesas.com>
 <Y++LqQIHuO8BGTm2@smile.fi.intel.com>
 <OS0PR01MB5922982DB09B8F1DFD70602186A19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922982DB09B8F1DFD70602186A19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Feb 17, 2023 at 02:35:16PM +0000, Biju Das wrote:
> Hi Andy,
> > Subject: Re: [PATCH v4 6/6] serial: 8250_em: Add
> > serial8250_em_{reg_update(),out_helper()}
> > On Fri, Feb 17, 2023 at 11:42:55AM +0000, Biju Das wrote:

...

> > > +	switch (off) {
> > > +	case UART_FCR_EM:
> > > +		fcr = value;
> > > +		break;
> > > +	case UART_LCR:
> > > +		lcr = value;
> > > +		break;
> > > +	case UART_MCR:
> > > +		mcr = value;
> > 
> > Missing break; statement.
> 
> OK, will fix this in next version.
> 
> The original driver has some missing breaks[1].
> So for consistency I dropped this. same for below.

I see. Perhaps you can add another patch that adds them there first?

> [1] https://elixir.bootlin.com/linux/v6.2-rc8/source/drivers/tty/serial/8250/8250_em.c#L45

> > > +	}

-- 
With Best Regards,
Andy Shevchenko


