Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06C1D784034
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 14:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233244AbjHVMAW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 08:00:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231618AbjHVMAW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 08:00:22 -0400
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F2C2CD9;
        Tue, 22 Aug 2023 05:00:19 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-591ba8bd094so27918937b3.3;
        Tue, 22 Aug 2023 05:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692705618; x=1693310418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxTeXgkR4B+bz9j7ts+Dd6lD/bh9gITVE8oZVXqGxhQ=;
        b=G+QIopnsID0Oqb2CL06p2o6u+dsW3m5y8xssZDsmpnEIHeTGu+OwWqoDQN7l8oKGuY
         lDA2JbCyU5X6p81qPxoECu9/rFXYnDQf4KMk95VNmNfq9j9Kx3+Kkb5oyqAvAslymYCL
         2vDFIU9w4rxw9yWdI66Baxutt7pVulLGFuUjn9Cp3COal3/WM3DHYTfxuITw2tnv1gJt
         B7cr3L6WLRjcXo1PsLFy/0ElgPAjuJEMSBzoTeJiSHbzV6TLZLFPJUVStudML0Xsi7Yi
         amcWrVntCNV0kyzeMfnUk2I7CFIw58A/1eyB7brxDzRUlhMXzVfoq5fMIE0WLn65Ifsk
         MANw==
X-Gm-Message-State: AOJu0YwYjT3matznXrwtwTLVBfo09oduyFQYlrcRBeDS78d+VEsF5WF8
        6YZgdIKv1M2YQCoSfDNB+Zw4Q5aI82GmLQ==
X-Google-Smtp-Source: AGHT+IFCNkIJMPVJLK87XIXzvxE3oHgc+DQqQVa3fwXhQgq5aSaNfTOMetSwGBAuvO83pi0CL1o+2A==
X-Received: by 2002:a81:bf4b:0:b0:58f:c78e:5918 with SMTP id s11-20020a81bf4b000000b0058fc78e5918mr7520682ywk.52.1692705618404;
        Tue, 22 Aug 2023 05:00:18 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id x7-20020a814a07000000b00565271801b6sm2753428ywa.59.2023.08.22.05.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 05:00:17 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d73ee75a796so4275306276.0;
        Tue, 22 Aug 2023 05:00:17 -0700 (PDT)
X-Received: by 2002:a25:7613:0:b0:d11:45d3:b25d with SMTP id
 r19-20020a257613000000b00d1145d3b25dmr10608665ybc.46.1692705617462; Tue, 22
 Aug 2023 05:00:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230820184402.102486-1-biju.das.jz@bp.renesas.com>
 <20230820184402.102486-3-biju.das.jz@bp.renesas.com> <ZONgzqlS8bGP0umn@smile.fi.intel.com>
 <CAMuHMdVY6VNFhMMzub9RrXd1zo=_7brQVtoBtogNuVfhbkg_tA@mail.gmail.com>
 <ZOOBw/3fqdinIwCh@smile.fi.intel.com> <CAMuHMdW8mqtceDxuZ4Ccq0Wrg8ySfFzVC3OBB0AqvfSR-54KYA@mail.gmail.com>
 <ZOOaFioDSpasda82@smile.fi.intel.com> <CAMuHMdU_4Mg==Jh14K0ecVXfLCDt-RbNia5gCwLPjPj3tBQbsA@mail.gmail.com>
 <ZOSfrHUDpaax1FS4@smile.fi.intel.com>
In-Reply-To: <ZOSfrHUDpaax1FS4@smile.fi.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Aug 2023 14:00:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVwy72utSLBFro7emgG5Hx6xzD8MHwXczAyJJvBpVDgYg@mail.gmail.com>
Message-ID: <CAMuHMdVwy72utSLBFro7emgG5Hx6xzD8MHwXczAyJJvBpVDgYg@mail.gmail.com>
Subject: Re: [PATCH 2/4] usb: typec: tcpci_rt1711h: Convert enum->pointer for
 data in the match tables
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy,

On Tue, Aug 22, 2023 at 1:44 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Aug 22, 2023 at 09:21:19AM +0200, Geert Uytterhoeven wrote:
> > On Mon, Aug 21, 2023 at 7:09 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Mon, Aug 21, 2023 at 05:40:05PM +0200, Geert Uytterhoeven wrote:
> > > > On Mon, Aug 21, 2023 at 5:25 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Mon, Aug 21, 2023 at 03:27:43PM +0200, Geert Uytterhoeven wrote:
> > > > > > On Mon, Aug 21, 2023 at 3:04 PM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > On Sun, Aug 20, 2023 at 07:44:00PM +0100, Biju Das wrote:
>
> ...
>
> > > > > > > For all your work likes this as I noted in the reply to Guenter that
> > > > > > > the couple of the selling points here are:
> > > > > > > 1) avoidance of the pointer abuse in OF table
> > > > > > >    (we need that to be a valid pointer);
> > > > > >
> > > > > > There is no pointer abuse: both const void * (in e.g. of_device_id)
> > > > > > and kernel_ulong_t (in e.g. i2c_device_id) can be used by drivers
> > > > > > to store a magic cookie, being either a pointer, or an integer value.
> > > > > > The same is true for the various unsigned long and void * "driver_data"
> > > > > > fields in subsystem-specific driver structures.
> > > > >
> > > > > (void *)5 is the abuse of the pointer.
> > > > > We carry something which is not a valid pointer from kernel perspective.
> > > >
> > > > But the data field is not required to be a valid pointer.
> > > > What kind and type of information it represents is specific to the driver.
> > >
> > > Where to find necessary information which is not always an integer constant.
> > > For example, for the driver data that has callbacks it can't be invalid pointer.
> >
> > If the driver uses it to store callbacks, of course it needs to be a
> > valid pointer. But that is internal to the driver.  It is not that
> > we're passing random integer values to a function that expects a
> > pointer that can actually be dereferenced.
> >
> > > Since OF ID table structure is universal, it uses pointers. Maybe you need to
> > > update it to use plain integer instead?
> >
> > It is fairly common in the kernel to use void * to indicate a
> > driver-specific cookie, being either a real pointer or an integral
> > value, that is passed verbatim.  See also e.g. the "dev" parameter
> > of request_irq().
>
> Yes, that parameter is void * due to calling kfree(free_irq(...)).
> So, that's argument for my concerns.

Sorry, I don't understand this comment.
(kfree(free_irq(...)) is only called in pci_free_irq()?)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
