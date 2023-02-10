Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D73486922BD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 16:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231985AbjBJP4l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 10:56:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232340AbjBJP4k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 10:56:40 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CF3678D5A;
        Fri, 10 Feb 2023 07:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676044599; x=1707580599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fkT5K6peTGGXSVyjcxxXx7c6n3QEMd4i+IqyHTTd1HM=;
  b=BcV9MaookHpC3JvS2ll3P96NRQpfYrGx4t75VH35RtUsT6uE/1pho2zH
   Fgx2XD2bqwb818Wn3njqIxe1u0fWpGVgUDaVTGbS3AFOjwLhYqn1Dhoy0
   OwgQ7jUun6Eli+lhfgXcTXI4JJKvtKU+jG15uSYrlPEoyOzjmaKZ9SIZn
   RF/EVavaHaJuQH3I8m0YAkCB2faQYjmykROg/KpGnlEcclQbUWu48V5tw
   yq7vGXSDyRCwgXFEBJ8pbi7PXTM0PR+2J/PMxnx34FwbbP2CgzYC5Qtfr
   CYFTJ/31F8Lmtoviy4XqvAMetZS3r4zeYp08WnXSgbrYXY4HN/CcmtqU0
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="416675311"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="416675311"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 07:56:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="996988881"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="996988881"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 10 Feb 2023 07:56:35 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1pQVlJ-005742-0G;
        Fri, 10 Feb 2023 17:56:33 +0200
Date:   Fri, 10 Feb 2023 17:56:32 +0200
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
Message-ID: <Y+ZpMEqKwFzJaDat@smile.fi.intel.com>
References: <20230209132630.194947-1-biju.das.jz@bp.renesas.com>
 <20230209132630.194947-2-biju.das.jz@bp.renesas.com>
 <4470e054-ebe6-b3ca-ffd7-1c7c3ae09f1a@linux.intel.com>
 <OS0PR01MB5922AC5FF10FFF5F8590B8AA86D99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y+VrOGR+7LbBMahz@smile.fi.intel.com>
 <OS0PR01MB5922C55E79014C84C742AE0886DE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <Y+YjdghwT2msRriZ@smile.fi.intel.com>
 <OS0PR01MB5922760B8431C526369EED7986DE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB5922760B8431C526369EED7986DE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Feb 10, 2023 at 11:53:43AM +0000, Biju Das wrote:
> > Subject: Re: [PATCH 1/3] serial: 8250: Identify Renesas RZ/V2M 16750 UART
> > On Fri, Feb 10, 2023 at 07:14:54AM +0000, Biju Das wrote:

...

> > What I don't like is increasing quirks in the 8250_port. Can't you simply
> > use FIXED_PORT facility?
> > Again, look how 8250_mid is written.
> 
> Coll. I have referred 8250_mid and added below changes and it is working as expected.
> I will sent next version after incorporating comments from Geert and ilpo.

Glad to hear that and thank you for cooperation!

-- 
With Best Regards,
Andy Shevchenko


