Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFA87B14EF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Sep 2023 09:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjI1HdQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Sep 2023 03:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbjI1HdP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Sep 2023 03:33:15 -0400
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EF9792;
        Thu, 28 Sep 2023 00:33:14 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-59c04237bf2so162535637b3.0;
        Thu, 28 Sep 2023 00:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695886393; x=1696491193;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=geNha/O49ZCv7df3vTVQZ8/LqB7mDG8SKl0+M/7A6cs=;
        b=N7IuEm2bZQMV0AqjuPOjb4QXldaCZ5poVoaF4fKyjoHAllTMRuA4TwrYy9ghgRKo+5
         zzi9bxFtXyrslUQe/5jD7AuWJPyON9BdKWEovYzDcc6GxIHO01hNifjsCOKfAl6aliUg
         rWBob8wdqTALnw7HvDG7xdRntCqk/AZ6MJL71tt6uMyT78DBzx/KrWOgjOT1YsWfU1RS
         CjOiIM/Kn1uaQXq1H4uZ800fZ48nzdCxdsiwu7k0XcVVpJYgL8NECWCOV70FXiVs9Pqp
         o614KDvJpRow7scbajGmKbFMzqtnxG+/MkmhUeiwrI8yglfp2MELL/84+c9pwoCgkObv
         WT0w==
X-Gm-Message-State: AOJu0YyXNKP9kpbRxvkW4FiKo5TfIREuQzv9F+SOGsKQpvIBM0/xsE0X
        k4/muTuEEFAGL76CT0dPpxgNm4TzRj+eDQ==
X-Google-Smtp-Source: AGHT+IETH6wkKnGSs3qtL6Q54Ny40BG7hY5Vor1e/GpFfEVkwUDy40Mf7BdC4kR46tkA2CKwL43MFA==
X-Received: by 2002:a81:c309:0:b0:59b:5696:c33 with SMTP id r9-20020a81c309000000b0059b56960c33mr430888ywk.46.1695886392898;
        Thu, 28 Sep 2023 00:33:12 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id b145-20020a0dd997000000b00583d1fa1fccsm4352778ywe.0.2023.09.28.00.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 00:33:11 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-59c04237bf2so162535247b3.0;
        Thu, 28 Sep 2023 00:33:11 -0700 (PDT)
X-Received: by 2002:a0d:dd83:0:b0:583:d6bb:4e96 with SMTP id
 g125-20020a0ddd83000000b00583d6bb4e96mr509648ywe.8.1695886391465; Thu, 28 Sep
 2023 00:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230926123054.3976752-1-yoshihiro.shimoda.uh@renesas.com>
 <c88ebcd5-614d-41ce-9f13-bc3c0e4920d7@lunn.ch> <TYBPR01MB5341BA14DCF0BEEFBBED95D0D8C1A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5341BA14DCF0BEEFBBED95D0D8C1A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Sep 2023 09:32:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW+f_XJNFBDOkVN06NQ93vBgd4yYSQ00APX9imasHnSiw@mail.gmail.com>
Message-ID: <CAMuHMdW+f_XJNFBDOkVN06NQ93vBgd4yYSQ00APX9imasHnSiw@mail.gmail.com>
Subject: Re: [PATCH net v3] rswitch: Fix PHY station management clock setting
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        "s.shtylyov@omp.ru" <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Thu, Sep 28, 2023 at 4:13 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Andrew Lunn, Sent: Wednesday, September 27, 2023 9:44 PM
> > > +   /* MPIC.PSMCS = (clk [MHz] / (MDC frequency [MHz] * 2) - 1.
> > > +    * Calculating PSMCS value as MDC frequency = 2.5MHz. So, multiply
> > > +    * both the numerator and the denominator by 10.
> > > +    */
> > > +   etha->psmcs = clk_get_rate(priv->clk) / 100000 / (25 * 2) - 1;
> > >  }
> > >
> > >  static int rswitch_device_alloc(struct rswitch_private *priv, int index)
> > > @@ -1900,6 +1907,10 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
> > >             return -ENOMEM;
> > >     spin_lock_init(&priv->lock);
> > >
> > > +   priv->clk = devm_clk_get(&pdev->dev, NULL);
> > > +   if (IS_ERR(priv->clk))
> > > +           return PTR_ERR(priv->clk);
> > > +
> >
> > /**
> >  * clk_get_rate - obtain the current clock rate (in Hz) for a clock source.
> >  *              This is only valid once the clock source has been enabled.

Whether clk_get_rate() works when the clock is still disabled actually
depends on the clock driver implementation/hardware.  It's not
guaranteed, so generic code cannot make that assumption.
It should work fine on all Renesas on-SoC clock generators.

> >  * @clk: clock source
> >  */
> > unsigned long clk_get_rate(struct clk *clk);
> >
> > I don't see the clock being enabled anywhere.
>
> Since GENPD_FLAG_PM_CLK is set in the drivers/pmdomain/renesas/rcar-gen4-sysc.c,
> pm_runtime_get_sync() will enable the clock. That's why this code works correctly
> without clk_enable() calling.
>
> > Also, is the clock documented in the device tree binding?
>
> Yes, but this is a "clocks" property only though. In the dt-bindings doc:
> ---
> examples:
> ...
>         clocks = <&cpg CPG_MOD 1505>;
> ---
>
> And, in the drivers/clk/renesas/r8a779f0-cpg-mssr.c:
> ---
>         DEF_FIXED("rsw2",       R8A779F0_CLK_RSW2,      CLK_PLL5_DIV2,  5, 1),
> ...
>         DEF_MOD("rswitch2",     1505,   R8A779F0_CLK_RSW2),
> ---
> So, the device will get the paranet clock " R8A779F0_CLK_RSW2".
> And according to the clk_summary in the debugfs:
> ---
> # grep rsw /sys/kernel/debug/clk/clk_summary
>              rsw2                     1        1        0   320000000          0     0  50000         Y
>                 rswitch2              1        1        0   320000000          0     0  50000         Y
> ---
>
> I found that i2c-rcar.c and pwm-rcar.c are also the same implementation
> which call clk_get_rate() without clk_enable(). But, perhaps, we should enable
> the clock by clk API?
>
> To Geert-san, do you have any opinion?

As the device is part of a clock domain, the clock is managed through
Runtime PM, and there is no need to enable or disable manually.
Just make sure to call pm_runtime_resume_and_get() before accessing
any register of the device.

Calling clk_get_rate() at any time is fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
