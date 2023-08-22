Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 784C2783AC8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Aug 2023 09:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233303AbjHVHVt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Aug 2023 03:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233306AbjHVHVo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2023 03:21:44 -0400
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A08ECCD;
        Tue, 22 Aug 2023 00:21:33 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-48d0e739e32so746506e0c.3;
        Tue, 22 Aug 2023 00:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692688892; x=1693293692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tEqj/7VMYcFHe/k0i7FuQIhSZcp2uVDnPoA7oQf1bW4=;
        b=L8d6Ep+PIdFwTDIdiKx5OJwgSObKATwC0NbD7IbnJfhmDMFtOZInIhMIEhQZr+ACrb
         RqPlTfla2JB0vIUhcRQNeaoQCWJxA4alpOSzSLG3R7UeF6NnIpgoUA7JGgihIIIS0Pnn
         ea0m5t4CekPSUgKPnIIAFwpPLMuTlBs5xtI/JW56XS5pjpcKwIOflk0ZToVUmY4ZnNxj
         Qo1ANOexVRXJc+c9V9Nt/cZfrHjelBp6H38unEJ3QuSFeTRZnGFGYySDcqiVLrz0U1n2
         nqzViE67Drh+WnVFulWYuSJZ4QtEtNqq7CDrhSfOyGjcPKKUapbJdpwJj1UGpA9ZAAi1
         v1Yg==
X-Gm-Message-State: AOJu0YyJU0arX4eyMnRpKAt9U3+tX8KeNo/CxxGcHmgipa+9Y+WdvEs1
        1mL0yNs77zkGyZkesYkgNP8kdwq0+CQk8Q==
X-Google-Smtp-Source: AGHT+IGhHYL1QXzaQc6nJh4ze05UBS5daFHUNbuUEYU1M8Bid91oCLBeQsuI9OpMhfP6qpvmXJp//A==
X-Received: by 2002:a1f:dd44:0:b0:48d:2bcf:f959 with SMTP id u65-20020a1fdd44000000b0048d2bcff959mr4937878vkg.3.1692688892140;
        Tue, 22 Aug 2023 00:21:32 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id w25-20020ac5cc79000000b0048d3a82a9dcsm502758vkm.28.2023.08.22.00.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 00:21:31 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-48cfdfa7893so958093e0c.0;
        Tue, 22 Aug 2023 00:21:31 -0700 (PDT)
X-Received: by 2002:a1f:c5c4:0:b0:48d:9a8:e2f6 with SMTP id
 v187-20020a1fc5c4000000b0048d09a8e2f6mr5726315vkf.14.1692688891082; Tue, 22
 Aug 2023 00:21:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230820184402.102486-1-biju.das.jz@bp.renesas.com>
 <20230820184402.102486-3-biju.das.jz@bp.renesas.com> <ZONgzqlS8bGP0umn@smile.fi.intel.com>
 <CAMuHMdVY6VNFhMMzub9RrXd1zo=_7brQVtoBtogNuVfhbkg_tA@mail.gmail.com>
 <ZOOBw/3fqdinIwCh@smile.fi.intel.com> <CAMuHMdW8mqtceDxuZ4Ccq0Wrg8ySfFzVC3OBB0AqvfSR-54KYA@mail.gmail.com>
 <ZOOaFioDSpasda82@smile.fi.intel.com>
In-Reply-To: <ZOOaFioDSpasda82@smile.fi.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 22 Aug 2023 09:21:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_4Mg==Jh14K0ecVXfLCDt-RbNia5gCwLPjPj3tBQbsA@mail.gmail.com>
Message-ID: <CAMuHMdU_4Mg==Jh14K0ecVXfLCDt-RbNia5gCwLPjPj3tBQbsA@mail.gmail.com>
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
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy,

CC DT

On Mon, Aug 21, 2023 at 7:09 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Aug 21, 2023 at 05:40:05PM +0200, Geert Uytterhoeven wrote:
> > On Mon, Aug 21, 2023 at 5:25 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Mon, Aug 21, 2023 at 03:27:43PM +0200, Geert Uytterhoeven wrote:
> > > > On Mon, Aug 21, 2023 at 3:04 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Sun, Aug 20, 2023 at 07:44:00PM +0100, Biju Das wrote:
>
> ...
>
> > > > > For all your work likes this as I noted in the reply to Guenter that
> > > > > the couple of the selling points here are:
> > > > > 1) avoidance of the pointer abuse in OF table
> > > > >    (we need that to be a valid pointer);
> > > >
> > > > There is no pointer abuse: both const void * (in e.g. of_device_id)
> > > > and kernel_ulong_t (in e.g. i2c_device_id) can be used by drivers
> > > > to store a magic cookie, being either a pointer, or an integer value.
> > > > The same is true for the various unsigned long and void * "driver_data"
> > > > fields in subsystem-specific driver structures.
> > >
> > > (void *)5 is the abuse of the pointer.
> > > We carry something which is not a valid pointer from kernel perspective.
> >
> > But the data field is not required to be a valid pointer.
> > What kind and type of information it represents is specific to the driver.
>
> Where to find necessary information which is not always an integer constant.
> For example, for the driver data that has callbacks it can't be invalid pointer.

If the driver uses it to store callbacks, of course it needs to be a
valid pointer. But that is internal to the driver.  It is not that
we're passing random integer values to a function that expects a
pointer that can actually be dereferenced.

> Since OF ID table structure is universal, it uses pointers. Maybe you need to
> update it to use plain integer instead?

It is fairly common in the kernel to use void * to indicate a
driver-specific cookie, being either a real pointer or an integral
value, that is passed verbatim.  See also e.g. the "dev" parameter
of request_irq().

> I think there is no more sense to continue this. We have to admit we have
> a good disagreement on this and I do not see any way I can agree with your
> arguments. Note, I'm fine if you "fix" OF ID structure to use kernel_ulong_t.

of_device_id is also used in userspace (e.g. modutils), but I believe
that uses a copy of the structure definition, not the definition from
the kernel headers. Still, changing the type would be a lot of work,
for IMHO no real gain.

> The only objection there is that it may not carry on the const qualifier,
> which I personally find being a huge downside of the whole driver_data.
> I believe you haven't objected that.

Having const is nice, indeed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
