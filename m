Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7C985A0904
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Aug 2022 08:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbiHYGmq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Aug 2022 02:42:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbiHYGmp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Aug 2022 02:42:45 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3D5352E54
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 23:42:44 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id h21so14526298qta.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 23:42:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=ET9yqLAit6sT48MzSwQFuWoaAihOSUXTJdmwzfrY3Bw=;
        b=qoebcWA3F3+PxBk9NvSYRiijqh+1eTrQbSBGdciB2TBhy5nnCbYNkGUp+fW3eeoCIl
         MJeIoomm275a3lyyNABm7KCNOXM1zL9H7dRhAdTloCJa9Gst5uQYRsvP7lTsJnselfji
         igHa725aNeVIXHQZdH6AnmO4oyrxXUIThanj951/9vVpa/iNTKyUfJz8owndeMrIvjNt
         c+zjPskcX0rFsRytSPOwLrtau/l8PV5fi6DnHMWwp77KJPwIVHPhg4TCnLdyjjIkjFYS
         9OzYksDVWH0bysmle7zAzoJwfsfOJRKhKP56yzeeFZjOT8o1WYuPSS6Ru/s6pd89RUf+
         pAoQ==
X-Gm-Message-State: ACgBeo0cu0Ny0a88uiFXP07yKl+V2auOQlr4tbF85dy5cbytMwtCeUz6
        NnHiUHdCXreGU7PXRfoLnV6DMtMX0uIrBg==
X-Google-Smtp-Source: AA6agR5k8oovbGNvPdJN94/Adje0qoj8X521Zkh8xB7XysK+8JBROjV3x6rVsRGIkNBsC0QqD2TjeA==
X-Received: by 2002:ac8:7d48:0:b0:344:55b4:1897 with SMTP id h8-20020ac87d48000000b0034455b41897mr2407200qtb.309.1661409763564;
        Wed, 24 Aug 2022 23:42:43 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id bs43-20020a05620a472b00b006b9b7879964sm17039948qkb.28.2022.08.24.23.42.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 23:42:42 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-3378303138bso476748957b3.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Aug 2022 23:42:42 -0700 (PDT)
X-Received: by 2002:a5b:bcd:0:b0:68f:b4c0:7eca with SMTP id
 c13-20020a5b0bcd000000b0068fb4c07ecamr2219349ybr.202.1661409762271; Wed, 24
 Aug 2022 23:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <87sflmuyf4.wl-kuninori.morimoto.gx@renesas.com>
 <YwXxT0Gr1KQQb71F@pendragon.ideasonboard.com> <CAGETcx-4+RkgXZjK6yDMr97Q2iUDJxosqp9s2EyhFW7+WCcFrw@mail.gmail.com>
 <874jy12kl7.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <874jy12kl7.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 25 Aug 2022 08:42:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU=Rw=NdDHAmZqJTb5vWmi5Kw0Kp-nCKjcSpfeoCTzGog@mail.gmail.com>
Message-ID: <CAMuHMdU=Rw=NdDHAmZqJTb5vWmi5Kw0Kp-nCKjcSpfeoCTzGog@mail.gmail.com>
Subject: Re: fw_devlink.strict=1 breaks sound card probe ?
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Saravana Kannan <saravanak@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Thu, Aug 25, 2022 at 3:11 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > > > To probe "Sound Card", it needs other necessary drivers.
> > > > But it seems some necessary drivers are not probed by above patch.
> > > > In my quick check, "HDMI" and 1 of "Sound Codec" drivers are not probed.
> (snip)
> > > Saravana is more familiar with devlink than I am, so he may be able to
> > > diagnose that without further information, but otherwise it would be
> > > helpful if you could provide some logs. Enabling the debug messages in
> > > drivers/base/dd.c can provide some insight. The contents of the debugfs
> > > devices_deferred file can also be useful, as well as the
> > > consumer/supplier links in sysfs for all the devices involved with the
> > > sound card.
>
> Thanks !
>
> This devices_deferred file (which I didn't know) helped my issue.
> It was my fault. My .config had been missing necessary driver
> (= CONFIG_REGULATOR_FIXED_VOLTAGE).
>
> ... but... why it had been working without it before... ?

I guess the adi,adv7513 and ti,pcm3168a drivers consider regulators
optional, so when they probe, they succeed?

With devlinks enabled, they are never probed, as their dependencies
didn't probe due to the missing regulator driver.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
