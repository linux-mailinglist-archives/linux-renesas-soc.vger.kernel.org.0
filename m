Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52EFD7841ED
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 15:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236056AbjHVNXv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 09:23:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbjHVNXv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 09:23:51 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98DE6BE;
        Tue, 22 Aug 2023 06:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692710629; x=1724246629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=twx6/j2EaQVxgj0zNRMJkSr7E72aAY0SfPZA1DQPxSI=;
  b=nlhJApy4KZKpWipMQV6IKu6XdXiP0pPxRZFkab6hvM//38IAPjf0CNfz
   +GggzfpgjBJPKoR63Tt4L/kckSMBvKDQnawoQxXbZA6T/BalhLcuWjdBy
   RRRZJe8KErx8CIS8o5hCcOW2rIEFMwAgZEknX8mcNfZNXtRoDe4uKUTan
   aYJfhFW/GjAtcuoSBTV/HBYvkeDSg3QoDi3dd3cj27q8hga+3lJwC3zDx
   2b6OdSyJ6w2RI94t7rjxgqKtASJCTgXouu+gxkj44dvvE/AKgMjz11SDC
   038vwpGJS8ttsrY4C0s86P3Zgj7REyNPVUMaSb6h6ip2CicWs1J02gfed
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="354214410"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="354214410"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 06:23:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="713160209"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="713160209"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 22 Aug 2023 06:23:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qYRMD-00C2Cz-1z;
        Tue, 22 Aug 2023 16:23:41 +0300
Date:   Tue, 22 Aug 2023 16:23:41 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 2/4] usb: typec: tcpci_rt1711h: Convert enum->pointer for
 data in the match tables
Message-ID: <ZOS23WxLeNe6nqLE@smile.fi.intel.com>
References: <ZONgzqlS8bGP0umn@smile.fi.intel.com>
 <CAMuHMdVY6VNFhMMzub9RrXd1zo=_7brQVtoBtogNuVfhbkg_tA@mail.gmail.com>
 <ZOOBw/3fqdinIwCh@smile.fi.intel.com>
 <CAMuHMdW8mqtceDxuZ4Ccq0Wrg8ySfFzVC3OBB0AqvfSR-54KYA@mail.gmail.com>
 <ZOOaFioDSpasda82@smile.fi.intel.com>
 <CAMuHMdU_4Mg==Jh14K0ecVXfLCDt-RbNia5gCwLPjPj3tBQbsA@mail.gmail.com>
 <ZOSfrHUDpaax1FS4@smile.fi.intel.com>
 <CAMuHMdVwy72utSLBFro7emgG5Hx6xzD8MHwXczAyJJvBpVDgYg@mail.gmail.com>
 <ZOSlRhLiYoZmcDfT@smile.fi.intel.com>
 <OS0PR01MB5922715864D3A25CFBFD0922861FA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OS0PR01MB5922715864D3A25CFBFD0922861FA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
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

On Tue, Aug 22, 2023 at 12:51:04PM +0000, Biju Das wrote:
> > On Tue, Aug 22, 2023 at 02:00:05PM +0200, Geert Uytterhoeven wrote:
> > > On Tue, Aug 22, 2023 at 1:44 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Tue, Aug 22, 2023 at 09:21:19AM +0200, Geert Uytterhoeven wrote:
> > > > > On Mon, Aug 21, 2023 at 7:09 PM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Mon, Aug 21, 2023 at 05:40:05PM +0200, Geert Uytterhoeven wrote:
> > > > > > > On Mon, Aug 21, 2023 at 5:25 PM Andy Shevchenko
> > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > On Mon, Aug 21, 2023 at 03:27:43PM +0200, Geert Uytterhoeven
> > wrote:
> > > > > > > > > On Mon, Aug 21, 2023 at 3:04 PM Andy Shevchenko
> > > > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > > > On Sun, Aug 20, 2023 at 07:44:00PM +0100, Biju Das wrote:

...

> > > > > > > > > > For all your work likes this as I noted in the reply to
> > > > > > > > > > Guenter that the couple of the selling points here are:
> > > > > > > > > > 1) avoidance of the pointer abuse in OF table
> > > > > > > > > >    (we need that to be a valid pointer);
> > > > > > > > >
> > > > > > > > > There is no pointer abuse: both const void * (in e.g.
> > > > > > > > > of_device_id) and kernel_ulong_t (in e.g. i2c_device_id)
> > > > > > > > > can be used by drivers to store a magic cookie, being either
> > a pointer, or an integer value.
> > > > > > > > > The same is true for the various unsigned long and void *
> > "driver_data"
> > > > > > > > > fields in subsystem-specific driver structures.
> > > > > > > >
> > > > > > > > (void *)5 is the abuse of the pointer.
> > > > > > > > We carry something which is not a valid pointer from kernel
> > perspective.
> > > > > > >
> > > > > > > But the data field is not required to be a valid pointer.
> > > > > > > What kind and type of information it represents is specific to
> > the driver.
> > > > > >
> > > > > > Where to find necessary information which is not always an integer
> > constant.
> > > > > > For example, for the driver data that has callbacks it can't be
> > invalid pointer.
> > > > >
> > > > > If the driver uses it to store callbacks, of course it needs to be
> > > > > a valid pointer. But that is internal to the driver.  It is not
> > > > > that we're passing random integer values to a function that
> > > > > expects a pointer that can actually be dereferenced.
> > > > >
> > > > > > Since OF ID table structure is universal, it uses pointers.
> > > > > > Maybe you need to update it to use plain integer instead?
> > > > >
> > > > > It is fairly common in the kernel to use void * to indicate a
> > > > > driver-specific cookie, being either a real pointer or an integral
> > > > > value, that is passed verbatim.  See also e.g. the "dev" parameter
> > > > > of request_irq().
> > > >
> > > > Yes, that parameter is void * due to calling kfree(free_irq(...)).
> > > > So, that's argument for my concerns.
> > >
> > > Sorry, I don't understand this comment.
> > > (kfree(free_irq(...)) is only called in pci_free_irq()?)
> > 
> > Passing void * for a "driver cookie" makes sense due to possibility of the
> > passing it to other functions that want to have void * as your example
> > shows.
> > And that supports my idea of having void * over the unsigned long.
> 
> U-boot also uses unsigned long for .data in struct udevice_id. There may be a
> reason for it instead of void* ??

U-Boot to be honest not the best example of the code and I believe the reason
why is pure historical. unsigned long and void * are both architecture dependent,
so the one vs. another is only for the convenience here or there. The only thing
so far is to preserve the const qualifier, which you can not achieve with integer.

-- 
With Best Regards,
Andy Shevchenko


