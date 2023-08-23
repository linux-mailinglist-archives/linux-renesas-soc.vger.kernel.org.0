Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3488785B0D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Aug 2023 16:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236664AbjHWOtQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Aug 2023 10:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236663AbjHWOtQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Aug 2023 10:49:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7AD5E6A;
        Wed, 23 Aug 2023 07:49:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3D0E96629C;
        Wed, 23 Aug 2023 14:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C4BEC433C8;
        Wed, 23 Aug 2023 14:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692802150;
        bh=9ljjf0tIGNJOKnhwUF512cYAgRc8CmDoikN3TdZHz20=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fT7n6Pj6ekWBHvDUQ85AfGyy00SxvgvWDHw2ExOuyCLtldknzj8fnZRbHe0OyVFso
         nG6ff6sf+hEmcgJEPfB5xb5/O7KQ5mtTo3NOv561yMdDg1AW8lhBNWQrvVqn4bLgi0
         fpzfsIo5FZ+Up1kRYo8/Ea7ChwVhd/cbE+e2O0aa6718Lj5OyjuWI6jL4zFFrwxQPb
         CAdyVVUzHzCvksdQxNiAo4fENQ+mAUoGImgsiEwYM2pyPQ0w4VFnXDtGACnujpxzFJ
         HY9th7aY1xjDza5a5NFDRBlkOMRWkndoXr0pvAmCM7Eew36BRLnoA0iH18Anj1IZNe
         jiPw3nN+VrLUA==
Date:   Wed, 23 Aug 2023 16:49:05 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 2/4] usb: typec: tcpci_rt1711h: Convert enum->pointer for
 data in the match tables
Message-ID: <20230823144905.mep6w6fctwcxxrhz@intel.intel>
References: <20230820184402.102486-3-biju.das.jz@bp.renesas.com>
 <ZONgzqlS8bGP0umn@smile.fi.intel.com>
 <CAMuHMdVY6VNFhMMzub9RrXd1zo=_7brQVtoBtogNuVfhbkg_tA@mail.gmail.com>
 <ZOOBw/3fqdinIwCh@smile.fi.intel.com>
 <CAMuHMdW8mqtceDxuZ4Ccq0Wrg8ySfFzVC3OBB0AqvfSR-54KYA@mail.gmail.com>
 <ZOOaFioDSpasda82@smile.fi.intel.com>
 <CAMuHMdU_4Mg==Jh14K0ecVXfLCDt-RbNia5gCwLPjPj3tBQbsA@mail.gmail.com>
 <ZOSfrHUDpaax1FS4@smile.fi.intel.com>
 <CAMuHMdVwy72utSLBFro7emgG5Hx6xzD8MHwXczAyJJvBpVDgYg@mail.gmail.com>
 <ZOSlRhLiYoZmcDfT@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZOSlRhLiYoZmcDfT@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Tue, Aug 22, 2023 at 03:08:38PM +0300, Andy Shevchenko wrote:
> On Tue, Aug 22, 2023 at 02:00:05PM +0200, Geert Uytterhoeven wrote:
> > On Tue, Aug 22, 2023 at 1:44 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Tue, Aug 22, 2023 at 09:21:19AM +0200, Geert Uytterhoeven wrote:
> > > > On Mon, Aug 21, 2023 at 7:09 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Mon, Aug 21, 2023 at 05:40:05PM +0200, Geert Uytterhoeven wrote:
> > > > > > On Mon, Aug 21, 2023 at 5:25 PM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > On Mon, Aug 21, 2023 at 03:27:43PM +0200, Geert Uytterhoeven wrote:
> > > > > > > > On Mon, Aug 21, 2023 at 3:04 PM Andy Shevchenko
> > > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > > On Sun, Aug 20, 2023 at 07:44:00PM +0100, Biju Das wrote:
> 
> ...
> 
> > > > > > > > > For all your work likes this as I noted in the reply to Guenter that
> > > > > > > > > the couple of the selling points here are:
> > > > > > > > > 1) avoidance of the pointer abuse in OF table
> > > > > > > > >    (we need that to be a valid pointer);
> > > > > > > >
> > > > > > > > There is no pointer abuse: both const void * (in e.g. of_device_id)
> > > > > > > > and kernel_ulong_t (in e.g. i2c_device_id) can be used by drivers
> > > > > > > > to store a magic cookie, being either a pointer, or an integer value.
> > > > > > > > The same is true for the various unsigned long and void * "driver_data"
> > > > > > > > fields in subsystem-specific driver structures.
> > > > > > >
> > > > > > > (void *)5 is the abuse of the pointer.
> > > > > > > We carry something which is not a valid pointer from kernel perspective.
> > > > > >
> > > > > > But the data field is not required to be a valid pointer.
> > > > > > What kind and type of information it represents is specific to the driver.
> > > > >
> > > > > Where to find necessary information which is not always an integer constant.
> > > > > For example, for the driver data that has callbacks it can't be invalid pointer.
> > > >
> > > > If the driver uses it to store callbacks, of course it needs to be a
> > > > valid pointer. But that is internal to the driver.  It is not that
> > > > we're passing random integer values to a function that expects a
> > > > pointer that can actually be dereferenced.
> > > >
> > > > > Since OF ID table structure is universal, it uses pointers. Maybe you need to
> > > > > update it to use plain integer instead?
> > > >
> > > > It is fairly common in the kernel to use void * to indicate a
> > > > driver-specific cookie, being either a real pointer or an integral
> > > > value, that is passed verbatim.  See also e.g. the "dev" parameter
> > > > of request_irq().
> > >
> > > Yes, that parameter is void * due to calling kfree(free_irq(...)).
> > > So, that's argument for my concerns.
> > 
> > Sorry, I don't understand this comment.
> > (kfree(free_irq(...)) is only called in pci_free_irq()?)
> 
> Passing void * for a "driver cookie" makes sense due to possibility of the
> passing it to other functions that want to have void * as your example shows.
> And that supports my idea of having void * over the unsigned long.

I actually agree with Andy here... not much to add to his
arguments but if a void * is used as an integer then just change
the type.

I also was quite puzzled when I started seeing this flow of
patches.

I would rather prefer to store pointers in u64 variables rather
than integers in a pointer.

Andi
