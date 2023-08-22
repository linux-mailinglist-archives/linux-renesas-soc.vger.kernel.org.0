Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD2778405C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 14:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235174AbjHVMIs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 08:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234679AbjHVMIr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 08:08:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD6D391;
        Tue, 22 Aug 2023 05:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692706125; x=1724242125;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=lflceObfNn/sO0Z4OMjLLSvLXV1qjgkqm1ONN/AVPKQ=;
  b=M6WsalMxFzSL3Y+rOAU4Gf3K8hFWk0BlLUULRQ6M2sAnLNAVdU/Bjo1v
   SWnWw9jy28eS9wgPfCm6gusZ4CZP8uVxlBl0akotneaeePP7iRQ1Q/6yR
   bfW/1JWcDD8276lii17MqWk0ewUTBeKEu/VjFogjjpT7wHboUE64Sk8Ki
   x8oHm98BOQ0KlgSKX5z7B/o4ksSj3xZMXylFVEfACfAbsrH6D0I1YriyT
   5LiGUgqLLLJxQ8o8aru4Q2TPiSeHautppOWkVt6K/awtgJiqk9fMSc1ce
   lkFcj3U29z1m9LnYrQJuDYPi4mxgnmZux6nXHrsovuGDjN0FvdAG2cd3A
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="373840114"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="373840114"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 05:08:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="1067041050"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="1067041050"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 22 Aug 2023 05:08:40 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qYQBa-009TIi-2N;
        Tue, 22 Aug 2023 15:08:38 +0300
Date:   Tue, 22 Aug 2023 15:08:38 +0300
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
        linux-renesas-soc@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 2/4] usb: typec: tcpci_rt1711h: Convert enum->pointer for
 data in the match tables
Message-ID: <ZOSlRhLiYoZmcDfT@smile.fi.intel.com>
References: <20230820184402.102486-1-biju.das.jz@bp.renesas.com>
 <20230820184402.102486-3-biju.das.jz@bp.renesas.com>
 <ZONgzqlS8bGP0umn@smile.fi.intel.com>
 <CAMuHMdVY6VNFhMMzub9RrXd1zo=_7brQVtoBtogNuVfhbkg_tA@mail.gmail.com>
 <ZOOBw/3fqdinIwCh@smile.fi.intel.com>
 <CAMuHMdW8mqtceDxuZ4Ccq0Wrg8ySfFzVC3OBB0AqvfSR-54KYA@mail.gmail.com>
 <ZOOaFioDSpasda82@smile.fi.intel.com>
 <CAMuHMdU_4Mg==Jh14K0ecVXfLCDt-RbNia5gCwLPjPj3tBQbsA@mail.gmail.com>
 <ZOSfrHUDpaax1FS4@smile.fi.intel.com>
 <CAMuHMdVwy72utSLBFro7emgG5Hx6xzD8MHwXczAyJJvBpVDgYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVwy72utSLBFro7emgG5Hx6xzD8MHwXczAyJJvBpVDgYg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 22, 2023 at 02:00:05PM +0200, Geert Uytterhoeven wrote:
> On Tue, Aug 22, 2023 at 1:44 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Tue, Aug 22, 2023 at 09:21:19AM +0200, Geert Uytterhoeven wrote:
> > > On Mon, Aug 21, 2023 at 7:09 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Mon, Aug 21, 2023 at 05:40:05PM +0200, Geert Uytterhoeven wrote:
> > > > > On Mon, Aug 21, 2023 at 5:25 PM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Mon, Aug 21, 2023 at 03:27:43PM +0200, Geert Uytterhoeven wrote:
> > > > > > > On Mon, Aug 21, 2023 at 3:04 PM Andy Shevchenko
> > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > On Sun, Aug 20, 2023 at 07:44:00PM +0100, Biju Das wrote:

...

> > > > > > > > For all your work likes this as I noted in the reply to Guenter that
> > > > > > > > the couple of the selling points here are:
> > > > > > > > 1) avoidance of the pointer abuse in OF table
> > > > > > > >    (we need that to be a valid pointer);
> > > > > > >
> > > > > > > There is no pointer abuse: both const void * (in e.g. of_device_id)
> > > > > > > and kernel_ulong_t (in e.g. i2c_device_id) can be used by drivers
> > > > > > > to store a magic cookie, being either a pointer, or an integer value.
> > > > > > > The same is true for the various unsigned long and void * "driver_data"
> > > > > > > fields in subsystem-specific driver structures.
> > > > > >
> > > > > > (void *)5 is the abuse of the pointer.
> > > > > > We carry something which is not a valid pointer from kernel perspective.
> > > > >
> > > > > But the data field is not required to be a valid pointer.
> > > > > What kind and type of information it represents is specific to the driver.
> > > >
> > > > Where to find necessary information which is not always an integer constant.
> > > > For example, for the driver data that has callbacks it can't be invalid pointer.
> > >
> > > If the driver uses it to store callbacks, of course it needs to be a
> > > valid pointer. But that is internal to the driver.  It is not that
> > > we're passing random integer values to a function that expects a
> > > pointer that can actually be dereferenced.
> > >
> > > > Since OF ID table structure is universal, it uses pointers. Maybe you need to
> > > > update it to use plain integer instead?
> > >
> > > It is fairly common in the kernel to use void * to indicate a
> > > driver-specific cookie, being either a real pointer or an integral
> > > value, that is passed verbatim.  See also e.g. the "dev" parameter
> > > of request_irq().
> >
> > Yes, that parameter is void * due to calling kfree(free_irq(...)).
> > So, that's argument for my concerns.
> 
> Sorry, I don't understand this comment.
> (kfree(free_irq(...)) is only called in pci_free_irq()?)

Passing void * for a "driver cookie" makes sense due to possibility of the
passing it to other functions that want to have void * as your example shows.
And that supports my idea of having void * over the unsigned long.

-- 
With Best Regards,
Andy Shevchenko


