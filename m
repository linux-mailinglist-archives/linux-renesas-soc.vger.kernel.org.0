Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D72BB5A17BB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Aug 2022 19:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241208AbiHYRKu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Aug 2022 13:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243042AbiHYRKi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Aug 2022 13:10:38 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 587FDDEC4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Aug 2022 10:10:33 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-333a4a5d495so557472827b3.10
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Aug 2022 10:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=r4O40tzBYlR7v9kkLNycoD4R+axDcYKyBaZOJJ8EmEw=;
        b=RUa0oGTMcDBF0w+fqAnjOLHk/R/+fIyIoo/BzRk1/ua14e8bQ5X9bZTKIWJT1QYD6J
         A/cPRfkqx47Wdbu3jnPdlJw2WrAJ5g2NEp9EBtcDe3xY8USuapFSGBJOF27DI4Y8cvxr
         AM8g2TpXT1vQ4E5vbNB7TZsbO1oIIW8PTu4UYQupUeZiuSx86WyYD4kKfJNx9D5QHbLf
         xKvPFJ5JWJpxtrm30XFXkmcDiCdrCP+dCY4tPG/4YW/28N7MZYInMKZEJqSlN+1+xd1a
         d8xUzRVXY//rAXCsM/b/uhNi8qz2GSff+sJRmd4Kc/VJrb5v1AK1mioLwTrOR8h4PcSN
         THGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=r4O40tzBYlR7v9kkLNycoD4R+axDcYKyBaZOJJ8EmEw=;
        b=FVtQ/y8f33U6CoDkyDzQz2DYYUrCTFcGKnFaWrMjyXnUnpj+3cLcqxqUJV3OGW4dvN
         /CyJjcUDNjvPA/Pibk75aAvYy/e+qzmI4a4Vq3OH6zo2+Hl2brL2HzixtwJAEEWNyhgp
         +vjntFIMbGvBMvbuBzmByTplkTacGIJWZwVLZ1j2UeXDX9k943KUzVnNzHlb17sFVB9t
         3PmddEECIthPbLlMtUQsf1wNji7W15xGDz0rhEwCWy/MhbseR2zAJXjRnvBoW+zd7+KK
         zfGc/xGYxoWY8M62SeiAlhp9K8xnMM5emP79eqJqlr6xn8iX3OERqnJ3erzrXGzRbvRo
         dC2w==
X-Gm-Message-State: ACgBeo2jFvPC3ubirw2hZNSoArr7VJdjizrPNvlBqZ6EOt3G+RsxHy89
        IS8PMwSe6gMovIastEDG7ENujXYXhN47QN+cPFHaDw==
X-Google-Smtp-Source: AA6agR7GCepZ3zaDoXgtd5TnXihHARa7E1XTnz3Ra/FQ4T1sEAZBeiMw7FQO1pqc96kJq3freQq84xKPdPjpM5TS//I=
X-Received: by 2002:a25:bd4d:0:b0:696:489a:3a86 with SMTP id
 p13-20020a25bd4d000000b00696489a3a86mr2262625ybm.447.1661447432453; Thu, 25
 Aug 2022 10:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <87sflmuyf4.wl-kuninori.morimoto.gx@renesas.com>
 <YwXxT0Gr1KQQb71F@pendragon.ideasonboard.com> <CAGETcx-4+RkgXZjK6yDMr97Q2iUDJxosqp9s2EyhFW7+WCcFrw@mail.gmail.com>
 <874jy12kl7.wl-kuninori.morimoto.gx@renesas.com> <CAMuHMdU=Rw=NdDHAmZqJTb5vWmi5Kw0Kp-nCKjcSpfeoCTzGog@mail.gmail.com>
In-Reply-To: <CAMuHMdU=Rw=NdDHAmZqJTb5vWmi5Kw0Kp-nCKjcSpfeoCTzGog@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 25 Aug 2022 10:09:56 -0700
Message-ID: <CAGETcx-QBuqTHPuSXMUHMzyhf45ZNsvPGCCZap3tWHrx2y0RwA@mail.gmail.com>
Subject: Re: fw_devlink.strict=1 breaks sound card probe ?
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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

On Wed, Aug 24, 2022 at 11:42 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Morimoto-san,
>
> On Thu, Aug 25, 2022 at 3:11 AM Kuninori Morimoto
> <kuninori.morimoto.gx@renesas.com> wrote:
> > > > > To probe "Sound Card", it needs other necessary drivers.
> > > > > But it seems some necessary drivers are not probed by above patch.
> > > > > In my quick check, "HDMI" and 1 of "Sound Codec" drivers are not probed.
> > (snip)
> > > > Saravana is more familiar with devlink than I am, so he may be able to
> > > > diagnose that without further information, but otherwise it would be
> > > > helpful if you could provide some logs. Enabling the debug messages in
> > > > drivers/base/dd.c can provide some insight. The contents of the debugfs
> > > > devices_deferred file can also be useful, as well as the
> > > > consumer/supplier links in sysfs for all the devices involved with the
> > > > sound card.
> >
> > Thanks !
> >
> > This devices_deferred file (which I didn't know) helped my issue.
> > It was my fault. My .config had been missing necessary driver
> > (= CONFIG_REGULATOR_FIXED_VOLTAGE).
> >
> > ... but... why it had been working without it before... ?

Hi Morimoto-san,

Hmmm... even if you didn't have the driver compiled in, fw_devlink
should have stopped blocking the probe after deferred_probe_timeout
expires and that value is defaulted to 10s (it extends on every
successful driver registration). Can you help figure out if that's
happening and if not, why not?

Thanks,
Saravana

>
> I guess the adi,adv7513 and ti,pcm3168a drivers consider regulators
> optional, so when they probe, they succeed?
>
> With devlinks enabled, they are never probed, as their dependencies
> didn't probe due to the missing regulator driver.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
