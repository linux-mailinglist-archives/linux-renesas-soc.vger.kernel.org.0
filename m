Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5C515188FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 17:48:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237302AbiECPwJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 11:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233111AbiECPwI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 11:52:08 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id E26F039824
        for <linux-renesas-soc@vger.kernel.org>; Tue,  3 May 2022 08:48:34 -0700 (PDT)
Received: (qmail 1090066 invoked by uid 1000); 3 May 2022 11:48:33 -0400
Date:   Tue, 3 May 2022 11:48:33 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        USB mailing list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 4/4] USB: gadget: Add a new bus for gadgets
Message-ID: <YnFO0Qr8RY7peFCg@rowland.harvard.edu>
References: <YjeEbHL8ITkW692W@rowland.harvard.edu>
 <YmKt3kH+85kjzdbL@kroah.com>
 <YmSc29YZvxgT5fEJ@rowland.harvard.edu>
 <YmSo6fU1FlNq8cOZ@rowland.harvard.edu>
 <YmSpKpnWR8WWEk/p@rowland.harvard.edu>
 <YmSpdxaDNeC2BBOf@rowland.harvard.edu>
 <alpine.DEB.2.22.394.2205031209030.681336@ramsan.of.borg>
 <YnFCEn45XwDWM/9Y@rowland.harvard.edu>
 <CAMuHMdVDK0W0T3=+2c1E6wtwy5JTUemTGYyj3PFuVUhK++AzrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVDK0W0T3=+2c1E6wtwy5JTUemTGYyj3PFuVUhK++AzrA@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 03, 2022 at 05:27:08PM +0200, Geert Uytterhoeven wrote:
> Hi Alan,
> 
> On Tue, May 3, 2022 at 5:14 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > On Tue, May 03, 2022 at 12:14:30PM +0200, Geert Uytterhoeven wrote:
> > > On Sat, 23 Apr 2022, Alan Stern wrote:
> > > > This patch adds a "gadget" bus and uses it for registering gadgets and
> > > > their drivers.  From now on, bindings will be managed by the driver
> > > > core rather than through ad-hoc manipulations in the UDC core.
> > > >
> > > > As part of this change, the driver_pending_list is removed.  The UDC
> > > > core won't need to keep track of unbound drivers for later binding,
> > > > because the driver core handles all of that for us.
> > > >
> > > > However, we do need one new feature: a way to prevent gadget drivers
> > > > from being bound to more than one gadget at a time.  The existing code
> > > > does this automatically, but the driver core doesn't -- it's perfectly
> > > > happy to bind a single driver to all the matching devices on the bus.
> > > > The patch adds a new bitflag to the usb_gadget_driver structure for
> > > > this purpose.
> > > >
> > > > A nice side effect of this change is a reduction in the total lines of
> > > > code, since now the driver core will do part of the work that the UDC
> > > > used to do.
> > > >
> > > > A possible future patch could add udc devices to the gadget bus, say
> > > > as a separate device type.
> > > >
> > > > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > >
> > > Thanks for your patch, which is now commit fc274c1e997314bf ("USB:
> > > gadget: Add a new bus for gadgets") in usb-next.
> > >
> > > This patch cause a regression on the Renesas Salvator-XS development
> > > board, as R-Car H3 has multiple USB gadget devices:
> >
> > Then these gadgets ought to have distinct names in order to avoid the
> > conflict below:
> >
> > >     sysfs: cannot create duplicate filename '/bus/gadget/devices/gadget'
> > >     CPU: 2 PID: 1 Comm: swapper/0 Not tainted 5.18.0-rc1-arm64-renesas-00074-gfc274c1e9973 #1587
> > >     Hardware name: Renesas Salvator-X 2nd version board based on r8a77951 (DT)
> > >     Call trace:
> > >      dump_backtrace+0xcc/0xd8
> > >      show_stack+0x14/0x30
> > >      dump_stack_lvl+0x88/0xb0
> > >      dump_stack+0x14/0x2c
> > >      sysfs_warn_dup+0x60/0x78
> > >      sysfs_do_create_link_sd.isra.0+0xe4/0xf0
> > >      sysfs_create_link+0x20/0x40
> > >      bus_add_device+0x64/0x110
> > >      device_add+0x31c/0x850
> > >      usb_add_gadget+0x124/0x1a0
> > >      usb_add_gadget_udc_release+0x1c/0x50
> > >      usb_add_gadget_udc+0x10/0x18
> > >      renesas_usb3_probe+0x450/0x728
> > ...
> >
> > Having three gadget devices, all named "gadget", doesn't seem like a
> > good idea.
> 
> I'm not so sure where these names are coming from.
> `git grep '"gadget"'` points to the following likely targets:
> 
> drivers/usb/gadget/udc/core.c:  dev_set_name(&gadget->dev, "gadget");
> drivers/usb/renesas_usbhs/mod_gadget.c: gpriv->mod.name         = "gadget";
> 
> Changing both names reveals the problem is actually caused by
> the former ;-)

Ah, good.

One way to attack this would be to keep a static counter and dynamically 
set the name to "gadget.%d" using the counter's value.  Or keep a bitmap 
of allocated gadget numbers and use the first available number.

Felipe, Greg, any opinions?

Ironically, the UDC driver itself provides a name in gadget->name.  But 
that string isn't unique either (in renesas-usb3, for instance, it is 
always set to "renesas_usb3"), so it won't help solve this problem.

> > This doesn't seem like it should be too hard to fix, although I'm not
> > at all familiar with the renesas-usb3 driver.  Do you know who maintains
> > that driver?  Is it you?
> 
> Adding Shimoda-san to CC (but he's enjoying Golden Week).

It looks like the problem has to be solved in the gadget core rather 
than in the UDC driver.  So we won't need to modify the driver after 
all.

Alan Stern
