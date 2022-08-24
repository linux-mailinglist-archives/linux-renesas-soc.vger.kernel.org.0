Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 671B35A017C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Aug 2022 20:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238644AbiHXSli (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Aug 2022 14:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232226AbiHXSli (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2022 14:41:38 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B79BB79A5E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 11:41:36 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-334dc616f86so483421047b3.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 11:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=lNX/BcqYJYdLMEfvSJcFHUwAiHG3ZCAnWSKjgUOUjTo=;
        b=QEgnyj9DuzfNdTFc+DyOTh6glJQmT7oHTydMvJUVTvdO8SOBeY24GiZ/uBZVZvYKl1
         mT7hJc0AOiT7bKPpNgdXh8LpLTtbJaOug3Zk5GmdrT4K5tb48u0ljpzUxHUoOIosOmes
         Rx3MCENJoCKpHp9w9vH4y674ArLinr2SiOgpTSCJgXClA9WDauHRR06yQ6cEqSPxxnl4
         ++tX1ng94fRZWH3ibqcyRKcuXUPWUeBKd83mty+NjhLucxIB2ggJTv8wkPiuFFR5fqnR
         nzAPVal1C6SdLoksr5q/zwikg8jmczFAdd+lUNnJLgV4F0eNcgUTXeNrSA/6ZTo8PaKJ
         ozqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=lNX/BcqYJYdLMEfvSJcFHUwAiHG3ZCAnWSKjgUOUjTo=;
        b=gPGvjeNi1ye6NQXOIelhojs+myFIBStt+bz3vXMvMAEHF+6K3ohQyYC3PxjPR17rsk
         x/4qlzWiPprIt9P+honfrLGaTUywDrB36BQPXDNkqR38yq9ct9hM9MQZ1GxSEFEQClPp
         2IKFvNK3zGwByTyVJ77TPZrbWEzJlyXWZCFKfmmOWNz+JiWhqUWvMjPxnuX1JjyBGcmH
         trLIWGo6isxXeAjfnhY9RIKkcBtJgEO71ZwblWr+s/CLKhZRq4YY3a6EwXQLVZjvtaGr
         s54PseU78NoXA/87MQDP8RH3GPXXj2ZgtNqTDt3wJC0uCr78UwjirBW8IIQM9W2qo006
         GicA==
X-Gm-Message-State: ACgBeo1qPfGdLjmWPV/TUzTLcOL+hl9VXJreAtBitEQ4i0zCm6sCsnoX
        vqK8Dp5mfroQm8ybGkPteJfMt8h2bbb+8IXmIIFYR6fUdkzHgQ==
X-Google-Smtp-Source: AA6agR5tNAzxYnGCxCojee5qmrC6x9mY15Ia3ELbpn+mEfk5lA/EVGg46MTXDDvNKAfisPNJXOW2L33jF1IVMFpL0/s=
X-Received: by 2002:a25:ef0f:0:b0:695:b3d1:15c1 with SMTP id
 g15-20020a25ef0f000000b00695b3d115c1mr469471ybd.80.1661366495836; Wed, 24 Aug
 2022 11:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <87sflmuyf4.wl-kuninori.morimoto.gx@renesas.com> <YwXxT0Gr1KQQb71F@pendragon.ideasonboard.com>
In-Reply-To: <YwXxT0Gr1KQQb71F@pendragon.ideasonboard.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 24 Aug 2022 11:40:58 -0700
Message-ID: <CAGETcx-4+RkgXZjK6yDMr97Q2iUDJxosqp9s2EyhFW7+WCcFrw@mail.gmail.com>
Subject: Re: fw_devlink.strict=1 breaks sound card probe ?
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 24, 2022 at 2:37 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Morimoto-san,
>
> On Wed, Aug 24, 2022 at 03:13:04AM +0000, Kuninori Morimoto wrote:
> >
> > Hi Renesas-ML
> > Cc Saravana, Greg, Laurent, Geert
> >
> > I'm now testing v6.0.0-rc2 kernel on ULCB-KF board, and I noticed
> > it doesn't probe sound card.
> > I git-bisected and noticed that this patch breaks sound probe.
> >
> >       commit 71066545b48e4259f89481199a0bbc7c35457738
> >       ("driver core: Set fw_devlink.strict=1 by default")
> >
> > I could re-probe sound card if I reverted it.
> > (My .config is using Y for all drivers)
> >
> > I'm not well understanding about this patch,
> > but it seems it is related to deferred probe.
> >
> > My sound card needs many drivers to probe.
> >
> >       HDMI
> >       Sound CPU
> >       Sound Codec x 2 (depends on I2C)
> >       Sound Card
> >
> > To probe "Sound Card", it needs other necessary drivers.
> > But it seems some necessary drivers are not probed by above patch.
> > In my quick check, "HDMI" and 1 of "Sound Codec" drivers are not probed.
> >
> > How can I solve this issue, or where I can check ?
>
> Saravana is more familiar with devlink than I am, so he may be able to
> diagnose that without further information, but otherwise it would be
> helpful if you could provide some logs. Enabling the debug messages in
> drivers/base/dd.c can provide some insight. The contents of the debugfs
> devices_deferred file can also be useful, as well as the
> consumer/supplier links in sysfs for all the devices involved with the
> sound card.

Thanks Laurent!

Kuninori, Those are exactly the things I'd need. And a pointer to the
dts (not DTSI) file that corresponds to the board.

Also, (I don't think it'll help but might give info for debugging),
try booting with deferred_probe_timeout=0 and
deferred_probe_timeout=1.

-Saravana
