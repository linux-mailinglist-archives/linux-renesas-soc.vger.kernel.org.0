Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AADBF782F19
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 19:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236958AbjHURJL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 13:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234315AbjHURJK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 13:09:10 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BD82CC;
        Mon, 21 Aug 2023 10:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692637749; x=1724173749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Kx2Z6zXSg7FjR9d76YhnSlg/BqV451Z7Jg0X5j32XXA=;
  b=iY8Om5I+UB+ysYU+5ex7tpQzPx5t0rwl1Jaai25s7YF5iUspPJ5Yi1Xh
   VPIImKQRynATwGh9sNXW/a8i/KUwJJceMgWdRJdeqKWDdrIZ1JOBUGi3k
   62EfonA1AwUhQ9aT9a8CIxUUD+06jeoqozEF4zLimWVs4QN5Lb6YGrrn1
   Xuhf/BppEmVfkxmIKBnn+20X4P7Y0PU5ckcHNCDhyFiOqNe6DtA7pw7hR
   OHahmvbD8BIk/yjXf8ep0bSIR5kUEugLAkOZeXBvB+G/8knIXQDte/Sy/
   c16H9FK2LwMuz55XZKruhqUu9NQ9lVp6QoO9E4SF8c+ixJpmg6eBjw1TT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="377394103"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="377394103"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 10:08:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="735910755"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="735910755"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 21 Aug 2023 10:08:41 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qY8OM-005pAd-3D;
        Mon, 21 Aug 2023 20:08:39 +0300
Date:   Mon, 21 Aug 2023 20:08:38 +0300
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
Message-ID: <ZOOaFioDSpasda82@smile.fi.intel.com>
References: <20230820184402.102486-1-biju.das.jz@bp.renesas.com>
 <20230820184402.102486-3-biju.das.jz@bp.renesas.com>
 <ZONgzqlS8bGP0umn@smile.fi.intel.com>
 <CAMuHMdVY6VNFhMMzub9RrXd1zo=_7brQVtoBtogNuVfhbkg_tA@mail.gmail.com>
 <ZOOBw/3fqdinIwCh@smile.fi.intel.com>
 <CAMuHMdW8mqtceDxuZ4Ccq0Wrg8ySfFzVC3OBB0AqvfSR-54KYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdW8mqtceDxuZ4Ccq0Wrg8ySfFzVC3OBB0AqvfSR-54KYA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 21, 2023 at 05:40:05PM +0200, Geert Uytterhoeven wrote:
> On Mon, Aug 21, 2023 at 5:25 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Aug 21, 2023 at 03:27:43PM +0200, Geert Uytterhoeven wrote:
> > > On Mon, Aug 21, 2023 at 3:04 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Sun, Aug 20, 2023 at 07:44:00PM +0100, Biju Das wrote:

...

> > > > For all your work likes this as I noted in the reply to Guenter that
> > > > the couple of the selling points here are:
> > > > 1) avoidance of the pointer abuse in OF table
> > > >    (we need that to be a valid pointer);
> > >
> > > There is no pointer abuse: both const void * (in e.g. of_device_id)
> > > and kernel_ulong_t (in e.g. i2c_device_id) can be used by drivers
> > > to store a magic cookie, being either a pointer, or an integer value.
> > > The same is true for the various unsigned long and void * "driver_data"
> > > fields in subsystem-specific driver structures.
> >
> > (void *)5 is the abuse of the pointer.
> > We carry something which is not a valid pointer from kernel perspective.
> 
> But the data field is not required to be a valid pointer.
> What kind and type of information it represents is specific to the driver.

Where to find necessary information which is not always an integer constant.
For example, for the driver data that has callbacks it can't be invalid pointer.

Since OF ID table structure is universal, it uses pointers. Maybe you need to
update it to use plain integer instead?

I think there is no more sense to continue this. We have to admit we have
a good disagreement on this and I do not see any way I can agree with your
arguments. Note, I'm fine if you "fix" OF ID structure to use kernel_ulong_t.
The only objection there is that it may not carry on the const qualifier,
which I personally find being a huge downside of the whole driver_data.
I believe you haven't objected that.

-- 
With Best Regards,
Andy Shevchenko


