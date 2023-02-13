Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 063B169467A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 14:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbjBMNFX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 08:05:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbjBMNFW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 08:05:22 -0500
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02EB986B2;
        Mon, 13 Feb 2023 05:05:20 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id f10so13569705qtv.1;
        Mon, 13 Feb 2023 05:05:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ohQOW8LhW84vMCNSb56DrthzGYUI9jdNgZMzgHCpWY=;
        b=Zlh5qoAl3fCEcMbEK9rg/9WeDctV4EQGcWR0frTB7c/GBgNCt4+7Ts63zSo1lc4YQV
         xpgIhm5Rnob1l6SoSUDI+lVt5uqraT5fyKE4153XBUjwc2YWFGFtnpc3bb2heF6JWvQx
         kyhGc4xgXtep74tlI2SvtxqGBXky9/yzVFF2CSwGCngckPATD4R8j0r1olrIimm1wle4
         5BxyrW5O68EolFxw82yMUmIKGue6s2DH7BS3/n5SXxO/XO+GnjZ3CKwCuppbo6UuKTR0
         JKytTk1ZpjZZJvI9LZRXK+wO2+MHRPinR03TzoUmMTH8kNcrKhnmHQjYjqI2u5yNZnwe
         A6Bg==
X-Gm-Message-State: AO0yUKWrAgtUMRZhH1uh1kT0ZYcHaPEXmNeH8K4EEAkebwSIqb+SYFVt
        oZ+zI7SDk0jDRLku6utVozjx0xAYiZcDuw==
X-Google-Smtp-Source: AK7set+P7Mw2nPhUgmD81nmUUkzW7RbPaVVVlEY2iY7e+ZVZ9hnBFfjJKiamdVKNPXV2/JCLhYYdhQ==
X-Received: by 2002:a05:622a:20e:b0:3b9:bb27:e11a with SMTP id b14-20020a05622a020e00b003b9bb27e11amr39857696qtx.0.1676293518472;
        Mon, 13 Feb 2023 05:05:18 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id a2-20020aed2782000000b003b9bcd88f7dsm9235333qtd.43.2023.02.13.05.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 05:05:18 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id g2so14229553ybk.8;
        Mon, 13 Feb 2023 05:05:18 -0800 (PST)
X-Received: by 2002:a25:8f82:0:b0:86e:1225:b335 with SMTP id
 u2-20020a258f82000000b0086e1225b335mr3099093ybl.455.1676293506630; Mon, 13
 Feb 2023 05:05:06 -0800 (PST)
MIME-Version: 1.0
References: <20230207014207.1678715-1-saravanak@google.com>
 <20230207014207.1678715-10-saravanak@google.com> <CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com>
 <CAGETcx8DaZqS7+47PhX4hQOfSk7AzPcTu=2i+4gAgXr6wyDNgg@mail.gmail.com>
In-Reply-To: <CAGETcx8DaZqS7+47PhX4hQOfSk7AzPcTu=2i+4gAgXr6wyDNgg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Feb 2023 14:04:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXNoYH8PJE1xb4PK-vzjXtOzrxNJoZhsHT-H4Ucm=7_ig@mail.gmail.com>
Message-ID: <CAMuHMdXNoYH8PJE1xb4PK-vzjXtOzrxNJoZhsHT-H4Ucm=7_ig@mail.gmail.com>
Subject: Re: [PATCH v3 09/12] of: property: Simplify of_link_to_phandle()
To:     Saravana Kannan <saravanak@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Len Brown <lenb@kernel.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Abel Vesa <abel.vesa@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Tony Lindgren <tony@atomide.com>,
        John Stultz <jstultz@google.com>,
        Doug Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maxim Kiselev <bigunclemax@gmail.com>,
        Maxim Kochetkov <fido_max@inbox.ru>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Colin Foster <colin.foster@in-advantage.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Jean-Philippe Brucker <jpb@kernel.org>,
        Vladimir Oltean <vladimir.oltean@nxp.com>,
        kernel-team@android.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Saravana,

On Wed, Feb 8, 2023 at 3:08 AM Saravana Kannan <saravanak@google.com> wrote:
> On Tue, Feb 7, 2023 at 12:57 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Feb 7, 2023 at 2:42 AM Saravana Kannan <saravanak@google.com> wrote:
> > > The driver core now:
> > > - Has the parent device of a supplier pick up the consumers if the
> > >   supplier never has a device created for it.
> > > - Ignores a supplier if the supplier has no parent device and will never
> > >   be probed by a driver
> > >
> > > And already prevents creating a device link with the consumer as a
> > > supplier of a parent.
> > >
> > > So, we no longer need to find the "compatible" node of the supplier or
> > > do any other checks in of_link_to_phandle(). We simply need to make sure
> > > that the supplier is available in DT.
> > >
> > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> >
> > Thanks for your patch!
> >
> > This patch introduces a regression when dynamically loading DT overlays.
> > Unfortunately this happens when using the out-of-tree OF configfs,
> > which is not supported upstream.  Still, there may be (obscure)
> > in-tree users.
> >
> > When loading a DT overlay[1] to enable an SPI controller, and
> > instantiate a connected SPI EEPROM:
> >
> >     $ overlay add 25lc040
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /keys/status
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/pinctrl-0
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/pinctrl-names
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/cs-gpios
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/status
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /__symbols__/msiof0_pins
> >
> > The SPI controller and the SPI EEPROM are no longer instantiated.
> >
> >     # cat /sys/kernel/debug/devices_deferred
> >     e6e90000.spi    platform: wait for supplier msiof0
> >
> > Let's remove the overlay again:
> >
> >     $ overlay rm 25lc040
> >     input: keys as /devices/platform/keys/input/input1
> >
> > And retry:
> >
> >     $ overlay add 25lc040
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /keys/status
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/pinctrl-0
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/pinctrl-names
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/cs-gpios
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/status
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /__symbols__/msiof0_pins
> >     spi_sh_msiof e6e90000.spi: DMA available
> >     spi_sh_msiof e6e90000.spi: registered master spi0
> >     spi spi0.0: setup mode 0, 8 bits/w, 100000 Hz max --> 0
> >     at25 spi0.0: 512 Byte at25 eeprom, pagesize 16
> >     spi_sh_msiof e6e90000.spi: registered child spi0.0
> >
> > Now it succeeds, and the SPI EEPROM is available, and works.
> >
> > Without this patch, or with this patch reverted after applying the
> > full series:
> >
> >     $ overlay add 25lc040
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /keys/status
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/pinctrl-0
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/pinctrl-names
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/cs-gpios
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /soc/spi@e6e90000/status
> >     OF: overlay: WARNING: memory leak will occur if overlay removed,
> > property: /__symbols__/msiof0_pins
> >     OF: Not linking spi@e6e90000 to interrupt-controller@f1010000 - No
> > struct device
> >     spi_sh_msiof e6e90000.spi: DMA available
> >     spi_sh_msiof e6e90000.spi: registered master spi0
> >     spi spi0.0: setup mode 0, 8 bits/w, 100000 Hz max --> 0
> >     at25 spi0.0: 444 bps (2 bytes in 9 ticks)
> >     at25 spi0.0: 512 Byte at25 eeprom, pagesize 16
> >     spi_sh_msiof e6e90000.spi: registered child spi0.0
> >
> > The SPI EEPROM is available on the first try after boot.
>
> Sigh... I spent way too long trying to figure out if I caused a memory
> leak. I should have scrolled down further! Doesn't look like that part
> is related to anything I did.
>
> There are some flags set to avoid re-parsing fwnodes multiple times.
> My guess is that the issue you are seeing has to do with how many of
> the in memory structs are reused vs not when an overlay is
> applied/removed and some of these flags might not be getting cleared
> and this is having a bigger impact with this patch (because the fwnode
> links are no longer anchored on "compatible" nodes).
>
> With/without this patch (let's keep the series) can you look at how
> the following things change between each step you do above (add,
> remove, retry):
> 1) List of directories under /sys/class/devlink
> 2) Enable the debug logs inside __fwnode_link_add(),
> __fwnode_link_del(), device_link_add()

Without "of: property: Simplify of_link_to_phandle()":

  - Adding overlay:

        spi@e6e90000 Linked as a fwnode consumer to clock-controller@e6150000
        spi@e6e90000 Linked as a fwnode consumer to system-controller@e6180000
        spi@e6e90000 Linked as a fwnode consumer to pinctrl@e6060000
        spi@e6e90000 Linked as a fwnode consumer to gpio@e6055000
        platform e6e90000.spi: Linked as a consumer to e6055000.gpio
        spi@e6e90000 Dropping the fwnode link to gpio@e6055000
        platform e6e90000.spi: Linked as a consumer to e6060000.pinctrl
        spi@e6e90000 Dropping the fwnode link to pinctrl@e6060000
        spi@e6e90000 Dropping the fwnode link to system-controller@e6180000
        platform e6e90000.spi: Linked as a consumer to e6150000.clock-controller
        spi@e6e90000 Dropping the fwnode link to clock-controller@e6150000

        +platform:e6055000.gpio--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6055000.gpio--platform:e6e90000.spi
        +platform:e6060000.pinctrl--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6060000.pinctrl--platform:e6e90000.spi
        +platform:e6150000.clock-controller--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6150000.clock-controller--platform:e6e90000.spi
        -platform:e6060000.pinctrl--platform:keys ->
../../devices/virtual/devlink/platform:e6060000.pinctrl--platform:keys

        SPI EEPROM works

  - Removing overlay:

        platform keys: Linked as a sync state only consumer to e6055000.gpio

        -platform:e6055000.gpio--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6055000.gpio--platform:e6e90000.spi
        -platform:e6060000.pinctrl--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6060000.pinctrl--platform:e6e90000.spi
        -platform:e6150000.clock-controller--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6150000.clock-controller--platform:e6e90000.spi

        platform:e6060000.pinctrl--platform:keys link is not recreated?!?!?

  - Adding overlay again:

        No debug output
        No change in sys/class/devlink?!?!?
        SPI EEPROM works


With "of: property: Simplify of_link_to_phandle()":

  - Adding overlay:

        spi@e6e90000 Linked as a fwnode consumer to
interrupt-controller@f1010000
        spi@e6e90000 Linked as a fwnode consumer to clock-controller@e6150000
        spi@e6e90000 Linked as a fwnode consumer to system-controller@e6180000
        spi@e6e90000 Linked as a fwnode consumer to msiof0
        spi@e6e90000 Linked as a fwnode consumer to gpio@e6055000
        platform e6e90000.spi: Linked as a consumer to e6055000.gpio
        spi@e6e90000 Dropping the fwnode link to gpio@e6055000
        spi@e6e90000 Dropping the fwnode link to system-controller@e6180000
        platform e6e90000.spi: Linked as a consumer to e6150000.clock-controller
        spi@e6e90000 Dropping the fwnode link to clock-controller@e6150000
        platform e6e90000.spi: Linked as a consumer to soc
        spi@e6e90000 Dropping the fwnode link to interrupt-controller@f1010000

        +platform:e6055000.gpio--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6055000.gpio--platform:e6e90000.spi
        +platform:e6150000.clock-controller--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6150000.clock-controller--platform:e6e90000.spi
        +platform:soc--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:soc--platform:e6e90000.spi

        -platform:e6060000.pinctrl--platform:keys ->
../../devices/virtual/devlink/platform:e6060000.pinctrl--platform:keys

        SPI EEPROM does not work

  - Removing overlay:

        platform keys: Linked as a sync state only consumer to e6055000.gpio
        spi@e6e90000 Dropping the fwnode link to msiof0

        -platform:e6055000.gpio--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6055000.gpio--platform:e6e90000.spi
        -platform:e6150000.clock-controller--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:e6150000.clock-controller--platform:e6e90000.spi
        -platform:soc--platform:e6e90000.spi ->
../../devices/virtual/devlink/platform:soc--platform:e6e90000.spi

        platform:e6060000.pinctrl--platform:keys link is not recreated?!?!?


  - Adding overlay again:

        No debug output
        No change in sys/class/devlink?!?!?
        SPI EEPROM works

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
