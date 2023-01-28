Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A477E67F59E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jan 2023 08:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbjA1HeX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 28 Jan 2023 02:34:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233486AbjA1HeS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 28 Jan 2023 02:34:18 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF22F3E0B9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jan 2023 23:34:15 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id v6-20020a17090ad58600b00229eec90a7fso9856499pju.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jan 2023 23:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JmYzUfpePnB9x0ifwB4TcXSt5sKNdFWyl1mCK+EAt64=;
        b=sv7EliM4oDY/KPMKE8veikhHJX+n9dLGSJXbCDuMHFjzqR7z9a2A2QV0Mh8ISNJelb
         gtq6p0Fg/Nut/liGUX0fm5Rk2UCPdlMtAIeuzXuG81EhF5FN+1OT97xlFykF9szLWMS4
         8oPe32ivIGTGX8kQAMo4euFp43ngRX7rwTwv/ZwMPigJ7gZe5wrGfY/gqQEhcnUf3Gyc
         oh+BuS8UwHELgpD/F96tP8E+jrdU7YLguXAyMz81xKVFLTC1Gz5BcrUhBkvXAQQlijpA
         0HbWPf1qfSqLRrt007E+Zwqukn5gwceaXzjcltqaIfqgwrNQ1c4yHM1y2KkqvVbTGVs0
         wj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JmYzUfpePnB9x0ifwB4TcXSt5sKNdFWyl1mCK+EAt64=;
        b=QaoONMCNbB9apsQVvpY/WVZIZMSWw/PGAOLmxqGPVAysOiBoHBdA9zYraK6acZB39h
         AUt4hgPy4T+NLeQdjYKzt42bsXH3WxvAqSp2P8SOVWlTp/viH1w872tRuzJYo7NlTkyJ
         zWV/n2MXjCfZJjBaoNoDlYCNFIzjdd8p3rA1m6aL4KZbV4ZCikQxk64k+6lNi7e2/7ki
         omvZaOgLwCPXbcYSRIDEyk/kyUCL+pvaLqCh+7o/9Sa9vmS3UvUTI39ffmn74pbei13k
         qClY34hwIFDcRGgnWlJSo5PNjyC9VZJR1JBG90xKwwxH7L+WrbEVY5mXRomREpk7wOqC
         BotA==
X-Gm-Message-State: AFqh2kqfB3D68HGV2ZCRMk+F2e/sHzxger1bH/HKlwQoFYcHhN7R8jCr
        MgnDfxobhY90jcsq6wrPVoEVgpBdVANg9bSGYwfqNg==
X-Google-Smtp-Source: AMrXdXuNSDnsr/Epdkz/K+Dti20l9M0DJ83VLBWJ4Gvg9ChW/l3gOz1X2smf3HJfp3CmcVkj9QCLVhHNnTBqoV7Qy3A=
X-Received: by 2002:a17:902:8304:b0:194:6253:d685 with SMTP id
 bd4-20020a170902830400b001946253d685mr4962773plb.3.1674891255033; Fri, 27 Jan
 2023 23:34:15 -0800 (PST)
MIME-Version: 1.0
References: <20230127001141.407071-1-saravanak@google.com> <20230127001141.407071-5-saravanak@google.com>
 <Y9OY6pMwYtab1Avd@smile.fi.intel.com>
In-Reply-To: <Y9OY6pMwYtab1Avd@smile.fi.intel.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Fri, 27 Jan 2023 23:33:38 -0800
Message-ID: <CAGETcx_sm5Efy=80kc9gNTaZgvOQzBGxwWA1n+bPJYWg43OebA@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] gpiolib: Clear the gpio_device's fwnode
 initialized flag before adding
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 27, 2023 at 1:27 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Jan 26, 2023 at 04:11:31PM -0800, Saravana Kannan wrote:
> > Registering an irqdomain sets the flag for the fwnode. But having the
> > flag set when a device is added is interpreted by fw_devlink to mean the
> > device has already been initialized and will never probe. This prevents
> > fw_devlink from creating device links with the gpio_device as a
> > supplier. So, clear the flag before adding the device.
>
> ...
>
> > +     /*
> > +      * If fwnode doesn't belong to another device, it's safe to clear its
> > +      * initialized flag.
> > +      */
> > +     if (!gdev->dev.fwnode->dev)
> > +             fwnode_dev_initialized(gdev->dev.fwnode, false);
>
> Do not dereference fwnode in struct device. Use dev_fwnode() for that.
>
>         struct fwnode_handle *fwnode = dev_fwnode(&gdev->dev);
>
>         if (!fwnode->dev)
>                 fwnode_dev_initialized(fwnode, false);

Honestly, we should work towards NOT needing dev_fwnode(). The
function literally dereferences dev->fwnode or the one inside of_node.
So my dereference is fine. The whole "fwnode might not be set for
devices with of_node" is wrong and we should fix that instead of
writing wrappers to work around it.

Also, for now I'm going to leave this as if for the same reasons as I
mentioned in Patch 1.

>
> + Blank line.

Ack.


-Saravana

>
> >       ret = gcdev_register(gdev, gpio_devt);
> >       if (ret)
> >               return ret;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
