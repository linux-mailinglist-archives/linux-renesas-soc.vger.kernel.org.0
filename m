Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2919F782D2B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 17:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233083AbjHUPZA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 11:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236263AbjHUPY7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 11:24:59 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 097AAE9;
        Mon, 21 Aug 2023 08:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692631498; x=1724167498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=lPfRKlKghnTIu6lxS3petCK7GMlzNdWzfWp3JYjwCEY=;
  b=EaxWe9xwwiu6d9zRqQZ9w/kcWe5jjBgBqhkq6b2Vmereslt5MuequP+f
   AqyL2JD+ltwueKlQcZD1l81I85jeV6R58u00+xklgfZVONS1dP0o8Cvmo
   owizFFqSlYfyF/hKghrASpM7HFyF7Y8VrQoZbCiQEg2T4RDYfHdxrsMoJ
   wYt1o+yOBQBQQ2texDudZhdepbfYtNiPFOoVwm4D00yqI1D6ry89/NgG9
   WuXw7HbP5hNs5bkREEVczmugjb/VqmbPj8ZdMYjBisBX88gbn6NpyAhQq
   XS/+AiWw/zRZBVekTWQ2aDletlidmcWojdvid5Rk7vQ01sDuZxYrCI5MC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="376366726"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="376366726"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 08:24:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="805954485"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="805954485"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 21 Aug 2023 08:24:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qY6lw-002Fsl-0A;
        Mon, 21 Aug 2023 18:24:52 +0300
Date:   Mon, 21 Aug 2023 18:24:51 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] usb: typec: tcpci_rt1711h: Convert enum->pointer for
 data in the match tables
Message-ID: <ZOOBw/3fqdinIwCh@smile.fi.intel.com>
References: <20230820184402.102486-1-biju.das.jz@bp.renesas.com>
 <20230820184402.102486-3-biju.das.jz@bp.renesas.com>
 <ZONgzqlS8bGP0umn@smile.fi.intel.com>
 <CAMuHMdVY6VNFhMMzub9RrXd1zo=_7brQVtoBtogNuVfhbkg_tA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVY6VNFhMMzub9RrXd1zo=_7brQVtoBtogNuVfhbkg_tA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 21, 2023 at 03:27:43PM +0200, Geert Uytterhoeven wrote:
> On Mon, Aug 21, 2023 at 3:04 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Sun, Aug 20, 2023 at 07:44:00PM +0100, Biju Das wrote:

...

> > For all your work likes this as I noted in the reply to Guenter that
> > the couple of the selling points here are:
> > 1) avoidance of the pointer abuse in OF table
> >    (we need that to be a valid pointer);
> 
> There is no pointer abuse: both const void * (in e.g. of_device_id)
> and kernel_ulong_t (in e.g. i2c_device_id) can be used by drivers
> to store a magic cookie, being either a pointer, or an integer value.
> The same is true for the various unsigned long and void * "driver_data"
> fields in subsystem-specific driver structures.

(void *)5 is the abuse of the pointer.
We carry something which is not a valid pointer from kernel perspective.

-- 
With Best Regards,
Andy Shevchenko


