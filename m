Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF647C7E8F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Oct 2023 09:28:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjJMH2r convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Oct 2023 03:28:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbjJMH2q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2023 03:28:46 -0400
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A03BD;
        Fri, 13 Oct 2023 00:28:44 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d8a000f6a51so1952631276.3;
        Fri, 13 Oct 2023 00:28:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697182124; x=1697786924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O+WBXNRhAR0kRrLkPQsIjB2me2dEptu6CHQ6Hg/HEvw=;
        b=AdRHt1xWq0bGkcFq1s4Yru1j3YuSz0WJgz221EvzV0wrJxdO8TO+3v9w/27RMVx8bn
         zABYsbb5bdOIhbH8fyj77r1EHca1Ocu/hRjVus4q6FIwySDbKTgR+MmNS1A3N02qR9ax
         mCo9jPYUom6cC8wM3oFdx2+/ihvJ9n6mr/IIqN2JpLr/Jqms2jOiKlVFrldpZCrZiYD7
         sYDZE5T8F7WClivWsCDFeZ2xsJyQ/hYvEPa40duBhlo3j9KSug1fVUJbxV62b0E8SKS6
         Z0fLIfsF5JnK1M+i3u0R1ekuzcvTi0C996SzhNkcuMOAywzE/+qNQaaUwpg2fLCV3G7/
         6Qow==
X-Gm-Message-State: AOJu0YwU4ZABX2GXZq1Fewm1lqlOLdn6sQRYWU+blOQ774u/xe6aPr33
        rr5uLg6TfSQxbgVvxjYS5TNau/sHOOQE3w==
X-Google-Smtp-Source: AGHT+IGDjaijHhnf2UW+UfH0X9SgFRvxG3m6vb411EIdys5DLfyfFhrVJfbiVvsRRZEn8ZOLqNsZHg==
X-Received: by 2002:a5b:f0c:0:b0:d05:59cd:a89d with SMTP id x12-20020a5b0f0c000000b00d0559cda89dmr23154364ybr.30.1697182123862;
        Fri, 13 Oct 2023 00:28:43 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id v38-20020a25fc26000000b00d7e339ada01sm351773ybd.20.2023.10.13.00.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Oct 2023 00:28:43 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5a7c08b7744so21915377b3.3;
        Fri, 13 Oct 2023 00:28:42 -0700 (PDT)
X-Received: by 2002:a0d:dc81:0:b0:589:e7c1:96f2 with SMTP id
 f123-20020a0ddc81000000b00589e7c196f2mr26603024ywe.46.1697182122538; Fri, 13
 Oct 2023 00:28:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231012121618.267315-1-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdWAk9kJBGGq9K-RnC0HFZk1XbaosTBO2OW1kpYFPh1Mqg@mail.gmail.com> <TYBPR01MB5341F5AAE321E3E373012E4DD8D2A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5341F5AAE321E3E373012E4DD8D2A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 13 Oct 2023 09:28:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU9Udd7xX7Us+3T06YMLAb4y0xnSOipN-5c-d-MfpvKdg@mail.gmail.com>
Message-ID: <CAMuHMdU9Udd7xX7Us+3T06YMLAb4y0xnSOipN-5c-d-MfpvKdg@mail.gmail.com>
Subject: Re: [PATCH net-next] rswitch: Add PM ops
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "s.shtylyov@omp.ru" <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
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

Hi Shimoda-san,

On Fri, Oct 13, 2023 at 4:10 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Thursday, October 12, 2023 9:35 PM
> > On Thu, Oct 12, 2023 at 2:16 PM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > Add PM ops for Suspend to Idle. When the system suspended,
> > > the Ethernet Serdes's clock will be stopped. So, this driver needs
> > > to re-initialize the Ethernet Serdes by phy_init() in
> > > renesas_eth_sw_resume(). Otherwise, timeout happened in phy_power_on().
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > Thanks for your patch!
>
> Thank you for your review!
>
> > > --- a/drivers/net/ethernet/renesas/rswitch.c
> > > +++ b/drivers/net/ethernet/renesas/rswitch.c
> > > @@ -17,6 +17,7 @@
> > >  #include <linux/of_net.h>
> > >  #include <linux/phy/phy.h>
> > >  #include <linux/platform_device.h>
> > > +#include <linux/pm.h>
> > >  #include <linux/pm_runtime.h>
> > >  #include <linux/rtnetlink.h>
> > >  #include <linux/slab.h>
> > > @@ -1315,6 +1316,7 @@ static int rswitch_phy_device_init(struct rswitch_device *rdev)
> > >         if (!phydev)
> > >                 goto out;
> > >         __set_bit(rdev->etha->phy_interface, phydev->host_interfaces);
> > > +       phydev->mac_managed_pm = true;
> > >
> > >         phydev = of_phy_connect(rdev->ndev, phy, rswitch_adjust_link, 0,
> > >                                 rdev->etha->phy_interface);
> > > @@ -1991,11 +1993,52 @@ static void renesas_eth_sw_remove(struct platform_device *pdev)
> > >         platform_set_drvdata(pdev, NULL);
> > >  }
> > >
> > > +static int __maybe_unused renesas_eth_sw_suspend(struct device *dev)
> > > +{
> > > +       struct rswitch_private *priv = dev_get_drvdata(dev);
> > > +       struct net_device *ndev;
> > > +       int i;
> >
> > unsigned int (also below)
>
> I don't know why unsigned int is needed. Other functions use

There's this old mantra "prefer unsigned over signed in C",
and a valid port array index here is always unsigned.

> rswitch_for_each_enabled_port{_continue_reverse}() with int.
> Especially, rswitch_for_each_enabled_port_continue_reverse()
> has the following code, unsigned int will not work correctly:

Oh, there is also a reverse variant, which indeed needs a signed
iterator, currently...

> ---
> #define rswitch_for_each_enabled_port_continue_reverse(priv, i) \
>         for (i--; i >= 0; i--)                                  \

I think this can be made to work with an unsigned iterator using

    for (; i-- > 0; )

>                 if (priv->rdev[i]->disabled)                    \
>                         continue;                               \
>                 else
> ---
>
> So, I would like to keep this for consistency with other functions'
> implementation. But, what do you think?

Consistency is good...
Surprising readers (why is this signed?) is bad...
It's hard to keep a good balance...

BTW, perhaps it would make sense to use the reverse order in suspend?
Although it probably doesn't matter, as rswitch_deinit() uses the
non-reverse order, too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
