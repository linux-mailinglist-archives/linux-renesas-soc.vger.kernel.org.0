Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44DF3788125
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Aug 2023 09:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235422AbjHYHoD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Aug 2023 03:44:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238935AbjHYHnk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Aug 2023 03:43:40 -0400
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 391561FD9;
        Fri, 25 Aug 2023 00:43:37 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-59289606ca6so7607957b3.0;
        Fri, 25 Aug 2023 00:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692949416; x=1693554216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7IsCs0+Mg+50eQN87yyM5XGHM2tiVTdamu4pk2HN5II=;
        b=By5fItGWDShLQzzDg2DUD6SzDsJ3mrL7w/iuA0DDjv8rq1IZRp2blRagmWYdNpOZ+c
         sPnvsiVDI3mVt1UOPxiVzq2kRsUMHl2vJaCqOK1yc1iSct22TPTDmS4UHgAYVzWvv18B
         PnhB4Lb2LmnPmj0dSk0TIxKveeky1SE+SV5vAbJ0RYPJUFOI6o+O6Ew+7+UPJug/IwzI
         M0wUInROvSYfRxJ08WThbKS0cdzcXRjxA/5u+b6I7Kpc5dSM5jh4Euhr7wrG1C5iYkuV
         4vQ3p+L1Xi6zdHEPpc1N4hmu1dbgdAitOUp7xSEhr7RmPB5k4g3Q+tuiJtfMrvZ1CIuC
         rvWQ==
X-Gm-Message-State: AOJu0YwFgI0Mf8RC8TpSrQqjzmQJHC74WQdqx2J/H6qOVg9d9UnJVYG5
        Jpj3uHEQOyhtZstb6yTAoTl8erSi5JIHZA==
X-Google-Smtp-Source: AGHT+IFjleJbaGBPAJRxDjVgsJm6+XvIUs08gWZ+EZulN90aFvIelWIPeoE/k8AI654HT3fwk3JH1g==
X-Received: by 2002:a81:8405:0:b0:592:24d7:6673 with SMTP id u5-20020a818405000000b0059224d76673mr13179999ywf.15.1692949416046;
        Fri, 25 Aug 2023 00:43:36 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id r189-20020a0de8c6000000b0058390181d16sm380803ywe.30.2023.08.25.00.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 00:43:35 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d7838958d17so296696276.2;
        Fri, 25 Aug 2023 00:43:35 -0700 (PDT)
X-Received: by 2002:a05:6902:1884:b0:d78:2ea:4cc0 with SMTP id
 cj4-20020a056902188400b00d7802ea4cc0mr5055526ybb.39.1692949415429; Fri, 25
 Aug 2023 00:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230824204456.401580-1-biju.das.jz@bp.renesas.com>
 <20230824204456.401580-4-biju.das.jz@bp.renesas.com> <ZOgQ2Fc1J8V7rdm4@smile.fi.intel.com>
 <OS0PR01MB592292B941414BF452B14AB086E3A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <258bae5d-3602-4625-8ac1-375856d9b334@roeck-us.net>
In-Reply-To: <258bae5d-3602-4625-8ac1-375856d9b334@roeck-us.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 25 Aug 2023 09:43:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8uBnnofkpVZ93318FRaNZ32GfNg3rh6NR-KBR1LJx8Q@mail.gmail.com>
Message-ID: <CAMuHMdX8uBnnofkpVZ93318FRaNZ32GfNg3rh6NR-KBR1LJx8Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hwmon: tmp513: Replace tmp51x_ids->max_channels in
 struct tmp51x_data
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Eric Tremblay <etremblay@distech-controls.com>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
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

Hi Günter,

On Fri, Aug 25, 2023 at 9:36 AM Guenter Roeck <linux@roeck-us.net> wrote:
> On Fri, Aug 25, 2023 at 06:44:56AM +0000, Biju Das wrote:
> > > Subject: Re: [PATCH v2 3/3] hwmon: tmp513: Replace tmp51x_ids->max_channels
> > > in struct tmp51x_data
> > >
> > > On Thu, Aug 24, 2023 at 09:44:56PM +0100, Biju Das wrote:
> > > > The tmp512 chip has 3 channels whereas tmp513 has 4 channels. Avoid
> > > > using tmp51x_ids for this HW difference by replacing
> > > > tmp51x_ids->max_channels in struct tmp51x_data and drop
> > >
> > > You don't replace it, you replaced "id" by it.
> >  You are correct "id->max_channels"
> >
>
> "replacing tmp51x_ids->max_channels" is a bit difficult to read.
>
> > >
> > > > enum tmp51x_ids as there is no user.
> > >
> > > ...
> > >
> > > > +#define TMP51X_TEMP_CONFIG_DEFAULT(a) (0x8780 | GENMASK(11 + (a) - 1,
> > > > +11))
> > >
> > > This seems fragile ("a" can't be 0, and can't be > 4) and will give not
>
> Not really, because it is the number of channels and well known.
> We should not optimize the code for something that won't ever happen.
> The number of channels is 3 or 4, and the generated mask needs to be
> 0x3800 or 0x7800 depending on the chip. We could maybe have something
> like
>         #define CHANNEL_MASK(channels) (...)
> and or in the other bits separately.
>
> Anyway, maybe "a" is not the best variable name. Maybe use "channels"
> or "n".

> > > > - data->temp_config = (data->id == tmp513) ?
> > > > -                 TMP513_TEMP_CONFIG_DEFAULT : TMP512_TEMP_CONFIG_DEFAULT;
> > >
> > > Are those still being in use?
> >
> > Nope. Will remove it.
> >
> Not sure I understand. The above lines _are_ being removed
> (- in 1st column). What else is there to remove ?

The actual TMP51*TEMP_CONFIG_DEFAULT definitions are now unused.

Alternatively, rename them to TEMP_CONFIG_CH3 and TEMP_CONFIG_CH4,
and switch (data->max_channels) { ... }?
Sounds a bit silly, though, as we do have the formula to
generate the temp_config from the number of channels...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
