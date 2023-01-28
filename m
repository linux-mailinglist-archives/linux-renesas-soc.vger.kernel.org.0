Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D09467F5A9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Jan 2023 08:35:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233851AbjA1HfZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 28 Jan 2023 02:35:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232159AbjA1HfS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 28 Jan 2023 02:35:18 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 234334DBE0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jan 2023 23:34:57 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id q9so4563643pgq.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jan 2023 23:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VSzzcrZHpCAhZ5ULfCoy554S0eFulAfOQZjabEFT0U8=;
        b=T6LKh5CR8Si1HhKOUOGGGtZ6+5L8QCDzffO83OhZP2wPlLcupyHUy8bxsfcm8v8cZ/
         j/3yaxzN8/IO3o6B/J2ZsXS3POXQlpJG5U9RkT8mKeAbGUGrJsmRBdHQ2xULA4UQhGqf
         zKLVdpZ1DrH+Ji4aokYjjs7mbouXc5esEsTOJ/ntzTKiT6IkydC8+bkHwec1Og+MUxr0
         hXNtqQGQVu8qI2xASbYOzyQVR63cGIoNL3Me9EcDqvlg2CkGQqU8vPcIbc6cvzwKo+70
         ZUFzjUxjTnxSefwef5FGjcIYJ5dpXAlOlag4Rt23C89TQdrXibm+UEG3fZfhVxtUazd9
         9bkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VSzzcrZHpCAhZ5ULfCoy554S0eFulAfOQZjabEFT0U8=;
        b=YksvlvoCFzBNhEh1tflRuaWT+AqV7gi95JogbjBKQr810H1vu596w+tJNnsU+gmzIc
         Vu6ORgQOzY6I4kt5y05xzJITux4CCPxHB0tFi2x1rhHK9wReyVp8aNtbKRDF0hJYz9Fe
         D+rvHMZ7Sx3/TZf6n7E9HJpksFdCH1TvFO8bfcjAdhVtLcZTxpp8INb1wrH7ll2ru0ha
         YHNTfNcO0mK9DHdu3Xd+PBVAgYw4n3Xtd8AwCLTbbYf1Z9+0LVRxQ2dK+RXaj8qNsPtN
         yKwkAN/vZI/azZkqobMorFeCjpPyGibzzG6mt7Iusmb1umdrgCTxkTI1906qAGYkcQdB
         H5PQ==
X-Gm-Message-State: AFqh2kpUPS5gTibSS0CvyV/yXoxTz96GOn0p+tDRDOtoDbHGdazSeBan
        mRxMmAQ1pKdJRa+gUYy54evs+KZMgxqo2aPPnbDBnQ==
X-Google-Smtp-Source: AMrXdXswL1uNSyC4P6OZZsmWvEys2JlxAMsY9Dtx/ZhkSOaPgA1JW1DbGLOznM5iRN4ulYnMstMca6Cy78SGFhjnIGo=
X-Received: by 2002:aa7:820f:0:b0:58d:a713:d1dd with SMTP id
 k15-20020aa7820f000000b0058da713d1ddmr5316394pfi.59.1674891296202; Fri, 27
 Jan 2023 23:34:56 -0800 (PST)
MIME-Version: 1.0
References: <20230127001141.407071-1-saravanak@google.com> <20230127001141.407071-7-saravanak@google.com>
 <Y9OaaC806Ywg7rM9@smile.fi.intel.com>
In-Reply-To: <Y9OaaC806Ywg7rM9@smile.fi.intel.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Fri, 27 Jan 2023 23:34:19 -0800
Message-ID: <CAGETcx9XGq20kagmVXwEV6MF9mp9Ta5ra0+Ynhb7GiUKnxkWqg@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] driver core: fw_devlink: Allow marking a fwnode
 link as being part of a cycle
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
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 27, 2023 at 1:33 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Jan 26, 2023 at 04:11:33PM -0800, Saravana Kannan wrote:
> > To improve detection and handling of dependency cycles, we need to be
> > able to mark fwnode links as being part of cycles. fwnode links marked
> > as being part of a cycle should not block their consumers from probing.
>
> ...
>
> > +     list_for_each_entry(link, &fwnode->suppliers, c_hook) {
> > +             if (link->flags & FWLINK_FLAG_CYCLE)
> > +                     continue;
> > +             return link->supplier;
>
> Hmm...

Thanks!

>
>                 if (!(link->flags & FWLINK_FLAG_CYCLE))
>                         return link->supplier;
>
> ?
>
> > +     }
> > +
> > +     return NULL;
>
> ...
>
> > -     if (dev->fwnode && !list_empty(&dev->fwnode->suppliers) &&
> > -         !fw_devlink_is_permissive()) {
> > -             sup_fw = list_first_entry(&dev->fwnode->suppliers,
> > -                                       struct fwnode_link,
> > -                                       c_hook)->supplier;
> > +     sup_fw = fwnode_links_check_suppliers(dev->fwnode);
>
> dev_fwnode() ?
>
> ...
>
> > -     val = !list_empty(&dev->fwnode->suppliers);
> > +     mutex_lock(&fwnode_link_lock);
> > +     val = !!fwnode_links_check_suppliers(dev->fwnode);
>
> Ditto?

Similar response as Patch 1 and Patch 4.


-Saravana
