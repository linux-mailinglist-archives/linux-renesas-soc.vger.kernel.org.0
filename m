Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8706912CE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Feb 2023 22:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbjBIVxG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Feb 2023 16:53:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjBIVxG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 16:53:06 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F1BB63116;
        Thu,  9 Feb 2023 13:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675979585; x=1707515585;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/FbvXg6uwopqHqmN55eSAsWS8YDh01Z5Chb6f9kp8jo=;
  b=mYSARyRQqMnVtSy6d+YH2n10wnmkjv8soqsjE41Zh/ZqofEMlSWy2ULk
   DTDYf7QMIIq1U217OKrhx6FX2WxbF/v+Ajca8MvYb6b4pYryiA8BFW4JI
   VOaJX4ejhkxWVP3emuTRZlnUcIeDdvlFcZLf2b9RY+ZITZMGpW0621yzQ
   k3v9KuXXN+RRrahpFFgOfF0mLf3zM9S9RgVcNaV/ItsFOybHAVn7sR9oP
   cYW5xr63FadLYoMVqPmjPbUlzDz8A5G5DpDixxipPMLgXL+jbD3njEtwE
   xHaINMkonHEIHeeM3Zq2w3CPSKindXospOF5uTxj3esSYJutmy2Kns0TN
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="313901631"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; 
   d="scan'208";a="313901631"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 13:53:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="617684713"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; 
   d="scan'208";a="617684713"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 09 Feb 2023 13:52:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pQEqe-004n6z-1Z;
        Thu, 09 Feb 2023 23:52:56 +0200
Date:   Thu, 9 Feb 2023 23:52:56 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Eric Tremblay <etremblay@distech-controls.com>,
        Wander Lairson Costa <wander@redhat.com>,
        linux-serial <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/3] serial: 8250: Identify Renesas RZ/V2M 16750 UART
Message-ID: <Y+VrOGR+7LbBMahz@smile.fi.intel.com>
References: <20230209132630.194947-1-biju.das.jz@bp.renesas.com>
 <20230209132630.194947-2-biju.das.jz@bp.renesas.com>
 <4470e054-ebe6-b3ca-ffd7-1c7c3ae09f1a@linux.intel.com>
 <OS0PR01MB5922AC5FF10FFF5F8590B8AA86D99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OS0PR01MB5922AC5FF10FFF5F8590B8AA86D99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 09, 2023 at 02:28:55PM +0000, Biju Das wrote:
> > From: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> > Sent: Thursday, February 9, 2023 2:09 PM
> > On Thu, 9 Feb 2023, Biju Das wrote:

> > > +	[PORT_16750] = {
> > > +		.name		= "Renesas RZ/V2M 16750",
> > > +		.fifo_size	= 64,
> > > +		.tx_loadsz	= 64,
> > > +		.fcr		= UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_10 |
> > > +				  UART_FCR7_64BYTE,
> > > +		.rxtrig_bytes	= {1, 16, 32, 56},
> > > +		.flags		= UART_CAP_FIFO | UART_CAP_AFE,
> > > +	},
> > 
> > Eh, how can you reuse [PORT_16750] again in the initializer like that?
> 
> Oops. Missed it. Is it ok to introduce PORT_RENESAS_16750_F64 instead
> as PORT_16750 is used by TI16750?

What the difference to the 16750 from TI that prevents you from using it?

-- 
With Best Regards,
Andy Shevchenko


