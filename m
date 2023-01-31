Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6EC2682321
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Jan 2023 05:02:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbjAaEB6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Jan 2023 23:01:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbjAaEB4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2023 23:01:56 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 813A132530
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jan 2023 20:01:54 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id v23so13821082plo.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Jan 2023 20:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h4HuA3j2EBy5AxpIc4hMqjnFXhEdbAZiZIV8HHy46jY=;
        b=HEWCwGkRH9bAZ7lLPQDJSVH0O3fsFMA4fAd6IgZJbbsN8U3WfErm8xeGa57wmhhtUe
         PJiCMlfFV2BJCaVCwryDX5vOjVCTFDnxFCq7mDnH4zWHzcbksJhEGNuKtI6VgIifcFsr
         CGDUaeiWYBZZxs/XSNliTfREJ1U9G4vD/0IZZ8Ho49yWo8NtR1+gqCPH0zg89t7bS8y5
         xC9kCK/pmKGmiGaHNn5zFH7yC5Gjph0ndJBvQTO0duLUlAQhS7Nbi+BryMBaFP3IiBTo
         B+ShicADflC9/EVZ7txCK4eYJFONVqnY7l3hQsyQeFSMctpTfS5T/s/SWMvdLsyOr/vv
         ffXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4HuA3j2EBy5AxpIc4hMqjnFXhEdbAZiZIV8HHy46jY=;
        b=SZIGMwwmlisDOX8oAcIrirlYyG6XXH5l0KJWhAXo7h9f2UY6orR9WpEP4yhxBmlugt
         NSDBa/UQyjyDM/SBM8Rn4Mqkthya2auxn1tYwcIPKe3WMvUoEI2Un6x+RSA87y+8rhYZ
         UFQWy8gYFQFFLvItsVwvT813UyUq0iNyUpEDeuphM4Ln2yKTfPFEpfzTuONWPyL9a8AW
         9aOAJ5aifngZAo2IL+uGshe1jdNb2i6Gjda8jSjA0a5BfbWCme/6rnOboRtE1khmdyqt
         XLb6PT3SqTOv7a2rqoER1OsvZ05LEvcb6PZmcY0tIwDaw+Al2CyT9DP9Uiw/25bWAQkT
         QdVw==
X-Gm-Message-State: AO0yUKVmDD14nppPIAFl8hXEWBWSa6kQ2WX7AEttTEf1ddWTxVSv1PD8
        b5K3wZBZFb++RayHAm18e91hxTY1hC270LomrhsEig==
X-Google-Smtp-Source: AK7set9O/ZL92MGFaieNvwAJ5CCNGhB9xx1mRSajxQzhHpp9Wy4/L2V5dizdMVSjKAlymvGjH465mDdS/mVCT2tdPuY=
X-Received: by 2002:a17:90a:64c5:b0:22b:ef05:ea5b with SMTP id
 i5-20020a17090a64c500b0022bef05ea5bmr4316599pjm.50.1675137713729; Mon, 30 Jan
 2023 20:01:53 -0800 (PST)
MIME-Version: 1.0
References: <20230127001141.407071-1-saravanak@google.com> <20230127001141.407071-5-saravanak@google.com>
 <20230130143153.67dsxn4lugfetfwb@bogus> <Y9fe2arI8afeURWn@smile.fi.intel.com>
In-Reply-To: <Y9fe2arI8afeURWn@smile.fi.intel.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 30 Jan 2023 20:01:17 -0800
Message-ID: <CAGETcx9aPp+JU-hO+fGyGps6jaoKoFzZd2zzy5YZBKoU8G=OhA@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] gpiolib: Clear the gpio_device's fwnode
 initialized flag before adding
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Len Brown <lenb@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux Kernel Functional Testing <lkft@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        John Stultz <jstultz@google.com>,
        Doug Anderson <dianders@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maxim Kiselev <bigunclemax@gmail.com>,
        Maxim Kochetkov <fido_max@inbox.ru>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Colin Foster <colin.foster@in-advantage.com>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Jean-Philippe Brucker <jpb@kernel.org>,
        kernel-team@android.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 30, 2023 at 7:14 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Jan 30, 2023 at 02:31:53PM +0000, Sudeep Holla wrote:
> > On Thu, Jan 26, 2023 at 04:11:31PM -0800, Saravana Kannan wrote:
> > > Registering an irqdomain sets the flag for the fwnode. But having the
> > > flag set when a device is added is interpreted by fw_devlink to mean the
> > > device has already been initialized and will never probe. This prevents
> > > fw_devlink from creating device links with the gpio_device as a
> > > supplier. So, clear the flag before adding the device.
>
> ...
>
> > > +   /*
> > > +    * If fwnode doesn't belong to another device, it's safe to clear its
> > > +    * initialized flag.
> > > +    */
> > > +   if (!gdev->dev.fwnode->dev)
> > > +           fwnode_dev_initialized(gdev->dev.fwnode, false);
> >
> > This is the one causing the kernel crash during the boot on FVP which
> > Naresh has reported. Just reverted this and was able to boot, confirming
> > the issue with this patch.
>
> I'm wondering if
>
>         if (!dev_fwnode(&gdev->dev)->dev)
>                 fwnode_dev_initialized(&dev_fwnode(gdev->dev), false);
>
> works.

No, that won't help. The problem was that with arm32, we have gpio
devices created without any of_node or fwnode. So I can't assume
fwnode will always be present.

-Saravana
