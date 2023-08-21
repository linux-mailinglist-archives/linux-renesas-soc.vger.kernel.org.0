Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DAA9782DC9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 18:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234376AbjHUQF0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 12:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232742AbjHUQF0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 12:05:26 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 146ADF3;
        Mon, 21 Aug 2023 09:05:24 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1bdbf10333bso27465985ad.1;
        Mon, 21 Aug 2023 09:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692633923; x=1693238723;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XWK1HH23r9o419mbD5BW98lOuS45U516ID98RVbvasY=;
        b=EfFSRbGRqG6pNtt0nW3z6DUT/HW68radcryYLwzKAwcd3WujOTlkVPq9qciteVLBSD
         HZ3V9fLu+hlUX0hxEX1dOjF68cv8dxDB8djp7i3I5bCEwrT8RdSvSHONa/yMtS2Nwfhp
         aj3f/KzPI4UU4gDM2QYiukGnq0AA8JelluGsU8KAKmO9fbNJhcwrWlDZglPyqX46NlYD
         RjECnf5oqw/It2pAz9KpSL9eZqnfK7xQMDbVxFNkNVVFhU+NHv3S5TU4+8NJ5emnxT2i
         W6uViSsye5n+/8ImgL0iXRuc471QZuj247Vzfr2HQrWWEf4FzL3a/3ghQmHaoa5v9F9b
         M8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692633923; x=1693238723;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XWK1HH23r9o419mbD5BW98lOuS45U516ID98RVbvasY=;
        b=IbVRnVmR90VpjYSC6wMo5oX1oKPbzvIew/D5Zzjl6+f12NlNzvRSdAbDfZxu/X/QEA
         En55OSln+hOzm0incDj7c98UAaesehGOdGQc+M6PwDqdkeFu0MA9SVzR12bw+fH8+ruI
         O4Ia0LAYb9kYE9zXbVFTYOmSkKlzA6FHz3c1EJhnav3ngAbwYDpa9TQ+fYxFeAMZurYc
         m0VKqJX4iC1sgI2AS7kzcqXGmW/GbTCDsO9cYnm9Pj3KDa3bAnjnZMUHEAqlwG8fLQkc
         4qmyfiDKFUJ5Y+AN/80o0ktrMOK688ZsH/P0kte60wABTBj3CBuRFgqHgYe+aI6H74tM
         SlNw==
X-Gm-Message-State: AOJu0Yx1H5ldiAWb93m77MVS6tFgnfOotj9Qzq1j4WW6AxK5Nn/CAoW1
        Qhz+51i8jxm2NAEZzBTI6Xw=
X-Google-Smtp-Source: AGHT+IGvkd4m+xU7IFk2A/i5CBBA1nrc5pCZ2PvpZr4rCoTACFvVMMDwvRjSWmmpqQV05SdWHdcTSQ==
X-Received: by 2002:a17:902:da87:b0:1bc:7001:6e5e with SMTP id j7-20020a170902da8700b001bc70016e5emr9784103plx.32.1692633923276;
        Mon, 21 Aug 2023 09:05:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id iz18-20020a170902ef9200b001bc6e6069a6sm7260796plb.122.2023.08.21.09.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 09:05:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 21 Aug 2023 09:05:21 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] usb: typec: tcpci_rt1711h: Convert enum->pointer for
 data in the match tables
Message-ID: <c7c2bf38-2275-4f28-9824-929568519131@roeck-us.net>
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
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Aug 21, 2023 at 05:40:05PM +0200, Geert Uytterhoeven wrote:
> Hi Andy,
> 
> On Mon, Aug 21, 2023 at 5:25 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Mon, Aug 21, 2023 at 03:27:43PM +0200, Geert Uytterhoeven wrote:
> > > On Mon, Aug 21, 2023 at 3:04 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > On Sun, Aug 20, 2023 at 07:44:00PM +0100, Biju Das wrote:
> >
> > ...
> >
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
> 

Exactly.

Guenter
