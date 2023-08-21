Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECC6A782D6B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 17:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbjHUPkW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 11:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231559AbjHUPkV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 11:40:21 -0400
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5E4E2;
        Mon, 21 Aug 2023 08:40:19 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-591ba8bd094so18491997b3.3;
        Mon, 21 Aug 2023 08:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692632419; x=1693237219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kP9gi/VCwLulHXyLZ5sM3y+duUGtwltc7tGwYZd9ZQ=;
        b=LXcMfI4Z32IKr4YSJZHWk81c/ZyJekZqsymSd07Bg9Bxrn6l817tM2qWJSQ5IQHONB
         XOSYW47FJV5iymEeUUE7gUQT+GQS4fREejz+CEujlxiHFS30LM4z9nLc/lyge3qe9dKb
         KgFLZuMBFagcSTMk/8x7tuy6cxeKNd7WREhN0xsTTnIaMrdUCd9pr33hEyQYHkj+ukFE
         3TeZFQuK19xaLmgZnth83RYbPEN4JUNgPTH6dzseJOGHmCQ5Vn99DOOl9sh6mHHQhrmy
         E7kAZJF8E/l0Q6m1C3PwiluBIOugjDzifyKNZytDINsmfTr4Xhfgg5VzE+iqDSlICZp6
         /M0g==
X-Gm-Message-State: AOJu0YzIrbOzeTMklS+ho1WE94M8/OcjbVJskSRaVWJbxHuC5gcwkdid
        yr3iGlQWPYPxZ/SRBkQZcXxZZTrskDKCjw==
X-Google-Smtp-Source: AGHT+IGSF5X/qkJjS9rTUBI5kCqIVwrBDpaH7VBbdlYG7oa+dGKQW6Xn8proof6uuJg8ZzHv+KmsNg==
X-Received: by 2002:a0d:eb10:0:b0:586:c0bc:77a2 with SMTP id u16-20020a0deb10000000b00586c0bc77a2mr7998988ywe.0.1692632418565;
        Mon, 21 Aug 2023 08:40:18 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id s19-20020a81bf53000000b00589f590be00sm2248885ywk.66.2023.08.21.08.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 08:40:18 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-d45caf42d73so3428116276.2;
        Mon, 21 Aug 2023 08:40:17 -0700 (PDT)
X-Received: by 2002:a25:c04e:0:b0:d06:49e9:a29c with SMTP id
 c75-20020a25c04e000000b00d0649e9a29cmr7054619ybf.34.1692632417464; Mon, 21
 Aug 2023 08:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230820184402.102486-1-biju.das.jz@bp.renesas.com>
 <20230820184402.102486-3-biju.das.jz@bp.renesas.com> <ZONgzqlS8bGP0umn@smile.fi.intel.com>
 <CAMuHMdVY6VNFhMMzub9RrXd1zo=_7brQVtoBtogNuVfhbkg_tA@mail.gmail.com> <ZOOBw/3fqdinIwCh@smile.fi.intel.com>
In-Reply-To: <ZOOBw/3fqdinIwCh@smile.fi.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Aug 2023 17:40:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW8mqtceDxuZ4Ccq0Wrg8ySfFzVC3OBB0AqvfSR-54KYA@mail.gmail.com>
Message-ID: <CAMuHMdW8mqtceDxuZ4Ccq0Wrg8ySfFzVC3OBB0AqvfSR-54KYA@mail.gmail.com>
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
        linux-renesas-soc@vger.kernel.org
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

On Mon, Aug 21, 2023 at 5:25 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Aug 21, 2023 at 03:27:43PM +0200, Geert Uytterhoeven wrote:
> > On Mon, Aug 21, 2023 at 3:04 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Sun, Aug 20, 2023 at 07:44:00PM +0100, Biju Das wrote:
>
> ...
>
> > > For all your work likes this as I noted in the reply to Guenter that
> > > the couple of the selling points here are:
> > > 1) avoidance of the pointer abuse in OF table
> > >    (we need that to be a valid pointer);
> >
> > There is no pointer abuse: both const void * (in e.g. of_device_id)
> > and kernel_ulong_t (in e.g. i2c_device_id) can be used by drivers
> > to store a magic cookie, being either a pointer, or an integer value.
> > The same is true for the various unsigned long and void * "driver_data"
> > fields in subsystem-specific driver structures.
>
> (void *)5 is the abuse of the pointer.
> We carry something which is not a valid pointer from kernel perspective.

But the data field is not required to be a valid pointer.
What kind and type of information it represents is specific to the driver.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
