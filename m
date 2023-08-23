Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24311785C39
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Aug 2023 17:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236785AbjHWPgq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Aug 2023 11:36:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234563AbjHWPgp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Aug 2023 11:36:45 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9785E4E;
        Wed, 23 Aug 2023 08:36:43 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-63f7c242030so28840746d6.3;
        Wed, 23 Aug 2023 08:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692805003; x=1693409803;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G5XEZspQ0af3L5iLDdPdO0en+k4F3L3wKwjw9DDXhkg=;
        b=iWdOcdh5z/U06VuIrBCoBja7hFJ/AGlGolkUIpNjK5kzZ4/A7SoXg6ybGjpuG+8oZk
         QXGZjP5xnndaMuTjMdwxpaWrayFgqQLe6MK8/Wf1K2tBdfsMS71tzW67KP17gYOXcjd5
         Gy5th3MaLEy4TTyrGNq7yap4DafCyUOHWCn2IrR/1Oi3hr4u7oampDXodMh2jdFw/mLj
         oVgpta/5fRJ//2KPA5GrAP94/nKE/khakh6adVQaxA4vOZWNRdfgYZ809YeYl4qFo9f1
         6adGIx5A/yYGyT4i8lmFNldERdg2OZvc1AxXzs8Qyue/+D0WzzpV4hZ+uo/P7IOv4aMy
         Tm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692805003; x=1693409803;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G5XEZspQ0af3L5iLDdPdO0en+k4F3L3wKwjw9DDXhkg=;
        b=BuXzIRWRyY1bvTURPCafXh+hwu+F7/dBPHO0yjuXy5cShrlEqMC9CPkMMvraDqnn4e
         o8JV9l3rFPzY5jqFs8cHR0nAVRJKEqbvh5Jdp86y2CxAHn9AsSoIcjSzWiCahTK416Sr
         /SHTkSOPga5yxDvHxrjgOd6HEZFCWEm2EBBLjR43LEcU53vFOgmvlpkMmA66jtknXD8d
         5i7GyV/rGIIY3fbmhH4ZrA7UsTDVwhQ0uEpAQkuKP++dniOEwUw3VwTbj8cUxB7rRZ8o
         V/N+iIUV1nOr93rcucLbZYK513oAUAaKWqzihx5rhJ4SYOFZeA3ilOre2wm9SD+Hv7AM
         OOGg==
X-Gm-Message-State: AOJu0Yw5q572GX5WnwMT8fkeImonRhsDC7vNY9NgmUNsHyv4z7WEraZp
        G5Gl7CrobS9XivCvUFJ7ihg=
X-Google-Smtp-Source: AGHT+IFvmFm4Niz/eGVfH8POfrgqx95eyE/Oxr2Om+sD86FOq86o0elUzKPAkmtYUMiDRpJaHTLZMA==
X-Received: by 2002:a05:6214:2cc2:b0:647:3387:fe44 with SMTP id lf2-20020a0562142cc200b006473387fe44mr11726108qvb.5.1692805002777;
        Wed, 23 Aug 2023 08:36:42 -0700 (PDT)
Received: from penguin ([205.220.129.23])
        by smtp.gmail.com with ESMTPSA id i8-20020a0cf388000000b0063d5d173a51sm4645847qvk.50.2023.08.23.08.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 08:36:42 -0700 (PDT)
Date:   Wed, 23 Aug 2023 08:36:18 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andi Shyti <andi.shyti@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH 2/4] usb: typec: tcpci_rt1711h: Convert enum->pointer for
 data in the match tables
Message-ID: <ZOYncrsD/EweSa8c@penguin>
References: <ZONgzqlS8bGP0umn@smile.fi.intel.com>
 <CAMuHMdVY6VNFhMMzub9RrXd1zo=_7brQVtoBtogNuVfhbkg_tA@mail.gmail.com>
 <ZOOBw/3fqdinIwCh@smile.fi.intel.com>
 <CAMuHMdW8mqtceDxuZ4Ccq0Wrg8ySfFzVC3OBB0AqvfSR-54KYA@mail.gmail.com>
 <ZOOaFioDSpasda82@smile.fi.intel.com>
 <CAMuHMdU_4Mg==Jh14K0ecVXfLCDt-RbNia5gCwLPjPj3tBQbsA@mail.gmail.com>
 <ZOSfrHUDpaax1FS4@smile.fi.intel.com>
 <CAMuHMdVwy72utSLBFro7emgG5Hx6xzD8MHwXczAyJJvBpVDgYg@mail.gmail.com>
 <ZOSlRhLiYoZmcDfT@smile.fi.intel.com>
 <20230823144905.mep6w6fctwcxxrhz@intel.intel>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230823144905.mep6w6fctwcxxrhz@intel.intel>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 23, 2023 at 04:49:05PM +0200, Andi Shyti wrote:
> Hi,
> 
> On Tue, Aug 22, 2023 at 03:08:38PM +0300, Andy Shevchenko wrote:
> > On Tue, Aug 22, 2023 at 02:00:05PM +0200, Geert Uytterhoeven wrote:
> > > On Tue, Aug 22, 2023 at 1:44 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Tue, Aug 22, 2023 at 09:21:19AM +0200, Geert Uytterhoeven wrote:
> > > > > On Mon, Aug 21, 2023 at 7:09 PM Andy Shevchenko
> > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > On Mon, Aug 21, 2023 at 05:40:05PM +0200, Geert Uytterhoeven wrote:
> > > > > > > On Mon, Aug 21, 2023 at 5:25 PM Andy Shevchenko
> > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > On Mon, Aug 21, 2023 at 03:27:43PM +0200, Geert Uytterhoeven wrote:
> > > > > > > > > On Mon, Aug 21, 2023 at 3:04 PM Andy Shevchenko
> > > > > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > > > > On Sun, Aug 20, 2023 at 07:44:00PM +0100, Biju Das wrote:
> > 
> > ...
> > 
> > > > > > > > > > For all your work likes this as I noted in the reply to Guenter that
> > > > > > > > > > the couple of the selling points here are:
> > > > > > > > > > 1) avoidance of the pointer abuse in OF table
> > > > > > > > > >    (we need that to be a valid pointer);
> > > > > > > > >
> > > > > > > > > There is no pointer abuse: both const void * (in e.g. of_device_id)
> > > > > > > > > and kernel_ulong_t (in e.g. i2c_device_id) can be used by drivers
> > > > > > > > > to store a magic cookie, being either a pointer, or an integer value.
> > > > > > > > > The same is true for the various unsigned long and void * "driver_data"
> > > > > > > > > fields in subsystem-specific driver structures.
> > > > > > > >
> > > > > > > > (void *)5 is the abuse of the pointer.
> > > > > > > > We carry something which is not a valid pointer from kernel perspective.
> > > > > > >
> > > > > > > But the data field is not required to be a valid pointer.
> > > > > > > What kind and type of information it represents is specific to the driver.
> > > > > >
> > > > > > Where to find necessary information which is not always an integer constant.
> > > > > > For example, for the driver data that has callbacks it can't be invalid pointer.
> > > > >
> > > > > If the driver uses it to store callbacks, of course it needs to be a
> > > > > valid pointer. But that is internal to the driver.  It is not that
> > > > > we're passing random integer values to a function that expects a
> > > > > pointer that can actually be dereferenced.
> > > > >
> > > > > > Since OF ID table structure is universal, it uses pointers. Maybe you need to
> > > > > > update it to use plain integer instead?
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
> > passing it to other functions that want to have void * as your example shows.
> > And that supports my idea of having void * over the unsigned long.
> 
> I actually agree with Andy here... not much to add to his
> arguments but if a void * is used as an integer then just change
> the type.
> 
> I also was quite puzzled when I started seeing this flow of
> patches.
> 
> I would rather prefer to store pointers in u64 variables rather
> than integers in a pointer.

I think pointers should be stored in pointers, and preserve constness.
The reason that many legacy device id structures use kernel_ulong_t to
store driver "cookie" is shortsightedness on our part long time ago.
Back then we just needed "a simple piece of data" to be attached, a
true/false flag or maybe a combination of flags. Nowadays we often
want to attach a structure describing a chip's parameters there with
several flags, maybe some methods, etc. So OF/DT folks did the right
thing, and used const void *, and we should try and convert the rest to
use const void * as well.

I posted RFC for this for I2C here:

https://lore.kernel.org/all/20230814-i2c-id-rework-v1-0-3e5bc71c49ee@gmail.com/

And then we can unify OF and legacy handling if driver tables.

Thanks.

-- 
Dmitry
