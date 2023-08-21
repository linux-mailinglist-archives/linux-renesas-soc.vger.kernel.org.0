Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84C42782A80
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Aug 2023 15:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235410AbjHUN2C convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Aug 2023 09:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235395AbjHUN2B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Aug 2023 09:28:01 -0400
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C00EC;
        Mon, 21 Aug 2023 06:27:55 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-58c92a2c52dso37741127b3.2;
        Mon, 21 Aug 2023 06:27:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692624474; x=1693229274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bl8L4/wrgOzDTkMTIuu4dmFCcsWHeep6qwKw1QDF+MY=;
        b=EVkqzlnJlCmbnjuJI84ph3ViCAB932lSnmMdcneoQlfbOk/WYxZQgpHFq83JCR6k8O
         gCMZwSeOLFCR8Sq2jkYu9UUzcsKgDs/XOr8xvL+MTCL2ZRMxHIzSyEQmc6+sxIF6xLsP
         QbrILv6qE31Xwk0Z0USefWQSrs5lQx4zU+BXS2n7a1km6k3ph2D/T4MUPysPx0oyDKcM
         cdqGNwXeoCX/4YNe5nK5YlSHEHewdqXq1qF7ZY82dzT1LowWkxbVuUc87XVluQBtyPL6
         r5ukqZT+YpA75P1HFycQrmDWa3tB4UUMJ03RcVpvNc7qKBVK1uKC3LnBoWiUaDO4pp1G
         eB9g==
X-Gm-Message-State: AOJu0YytXe5Y+PJ/FmLTMuciZ2yo6nYv7/yG0/GPX0SEsULdM5w4oL0A
        mFWccVMaqNm20q3mk/IIWmYydOdCVjEOzA==
X-Google-Smtp-Source: AGHT+IG5IrXxSj3QtEMAL2DHFKBXVoSfj01gFBoLVQvAw2V+x6godn/6dOjYaaPxIxbHxeevj1ceHQ==
X-Received: by 2002:a25:f81b:0:b0:d3b:b36f:37b1 with SMTP id u27-20020a25f81b000000b00d3bb36f37b1mr7504291ybd.33.1692624474538;
        Mon, 21 Aug 2023 06:27:54 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id u27-20020a25f81b000000b00d1b86efc0ffsm1868007ybd.6.2023.08.21.06.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 06:27:54 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d6fcffce486so3260711276.3;
        Mon, 21 Aug 2023 06:27:54 -0700 (PDT)
X-Received: by 2002:a05:6902:18c2:b0:d74:62df:e803 with SMTP id
 ck2-20020a05690218c200b00d7462dfe803mr10163742ybb.0.1692624474155; Mon, 21
 Aug 2023 06:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230820184402.102486-1-biju.das.jz@bp.renesas.com>
 <20230820184402.102486-3-biju.das.jz@bp.renesas.com> <ZONgzqlS8bGP0umn@smile.fi.intel.com>
In-Reply-To: <ZONgzqlS8bGP0umn@smile.fi.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Aug 2023 15:27:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVY6VNFhMMzub9RrXd1zo=_7brQVtoBtogNuVfhbkg_tA@mail.gmail.com>
Message-ID: <CAMuHMdVY6VNFhMMzub9RrXd1zo=_7brQVtoBtogNuVfhbkg_tA@mail.gmail.com>
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
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Andy,

On Mon, Aug 21, 2023 at 3:04 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Sun, Aug 20, 2023 at 07:44:00PM +0100, Biju Das wrote:
> > Convert enum->pointer for data in the match tables, so that
> > device_get_match_data() can do match against OF/ACPI/I2C tables, once i2c
> > bus type match support added to it and it returns NULL for non-match.
> >
> > Therefore it is better to convert enum->pointer for data match and extend
> > match support for both ID and OF tables by using i2c_get_match_data() by
> > adding struct rt1711h_chip_info with did variable and replacing did->info
> > in struct rt1711h_chip. Later patches will add more hw differences to
> > struct rt1711h_chip_info and avoid checking did for HW differences.
>
> ...
>
> > +struct rt1711h_chip_info {
> > +     u16 did;
> > +};
> > +
> >  struct rt1711h_chip {
> >       struct tcpci_data data;
> >       struct tcpci *tcpci;
> >       struct device *dev;
> >       struct regulator *vbus;
> >       bool src_en;
> > -     u16 did;
> > +     const struct rt1711h_chip_info *info;
>
> Have you run pahole? I believe now you wasting a few more bytes
> (besides the pointer requirement) due to (mis)placing a new member.

Unfortunately you cannot really improve by reordering the members.
The old u16 fit in the hole after sr_en.
The new pointer info cannot fit in a hole anyway.

> For all your work likes this as I noted in the reply to Guenter that
> the couple of the selling points here are:
> 1) avoidance of the pointer abuse in OF table
>    (we need that to be a valid pointer);

There is no pointer abuse: both const void * (in e.g. of_device_id)
and kernel_ulong_t (in e.g. i2c_device_id) can be used by drivers
to store a magic cookie, being either a pointer, or an integer value.
The same is true for the various unsigned long and void * "driver_data"
fields in subsystem-specific driver structures.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
