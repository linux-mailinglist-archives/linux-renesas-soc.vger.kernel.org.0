Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96A267F00CC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Nov 2023 16:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229776AbjKRP7P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 18 Nov 2023 10:59:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233106AbjKRP7D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 18 Nov 2023 10:59:03 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EACAC1BDB
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Nov 2023 07:58:05 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c50906f941so41635371fa.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 18 Nov 2023 07:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20230601.gappssmtp.com; s=20230601; t=1700323084; x=1700927884; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2EkBVgspkMYv5QxLZCvSB5wIue9VU/mFrUQVylTok0A=;
        b=lkd1XLocUlgLOK5+A4T7Wig8TPAi2qTEjHNbGxGuQ2y0oLtoboP+iEZ7eS172V3cFP
         nLxiC0W3c0FD2gQcZiy3a+Lbb5XHyH2OyRuYYBv5eahtKuGUyXaG2ApCfpY6jbNrhmEm
         fbMttVTlBau0IFG7kW3TnHQhrR8ABb+uvdswhpsAxhqOm3j0yrFShtPMJv6btafccTkP
         sruShAtwUVB0DWOdr3pD5tfl54H8xogXUpu0f+xqjC8FyE60QsCXus6VgNd05GEdmPka
         v0eSYSZRwBs5ost+gRwOBlhvhV4CcG+hHaH0dWZKZZ2wMsAm+lf0fEXbDiWxT/0Zgo5T
         onGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700323084; x=1700927884;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2EkBVgspkMYv5QxLZCvSB5wIue9VU/mFrUQVylTok0A=;
        b=F5YUDTTZFQ65/+rb6pNHEvcWSdDAxNNR11974lt8TKeCimBAQ+TsHX+4kxVd/V7f3Y
         rQMuYUX/mzA2RXzTuEgwffymV6fZ8fuSZ0fiBUPqGbtBcETj60ukQHi4Mvwn+SZGXCZ8
         sRgDm98srM2jywO6VoadiI4HsObCAFl88XHxaxWJwRXhQRTaKmfVEADnzmgxIKRhux0o
         6aH8LuPfsUwPRc1ffGVyhRoqsoO1t6owKPOh9YNyH/tXIAYX/rVgu2ejeFI61UbvluJq
         59fVvSNYcT85fKNq6jTS/eRt2fyExnWXZupcyj1JC9fSAzpRBo0YT37zQJHY7Xut+vLr
         5oBw==
X-Gm-Message-State: AOJu0YyZy2ysM9Dv0YPE/APLHhf6WMyLR1K9q+ugZXFZ6DPteeYRcVjj
        A4/EgOVBCI4XWHpf4XWJIcrPsA==
X-Google-Smtp-Source: AGHT+IG17Y+JgssSkZh3sxMOObt8MZzkEGw7pufoI+WSByyWRjb0Oy/4hXeYkB9571qKJOlmjDTogQ==
X-Received: by 2002:a2e:97c5:0:b0:2c6:f6cf:aaf6 with SMTP id m5-20020a2e97c5000000b002c6f6cfaaf6mr1912626ljj.46.1700323084088;
        Sat, 18 Nov 2023 07:58:04 -0800 (PST)
Received: from localhost (h-46-59-36-206.A463.priv.bahnhof.se. [46.59.36.206])
        by smtp.gmail.com with ESMTPSA id q5-20020a2e9145000000b002b736576a10sm551135ljg.137.2023.11.18.07.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 07:58:03 -0800 (PST)
Date:   Sat, 18 Nov 2023 16:58:02 +0100
From:   Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 5/5] net: ethernet: renesas: rcar_gen4_ptp: Break out
 to module
Message-ID: <ZVjfClFyO736qheC@oden.dyn.berto.se>
References: <20231117164332.354443-1-niklas.soderlund+renesas@ragnatech.se>
 <20231117164332.354443-6-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdWd7gK3_p4mhkKS4VJUw6WCAHEw-pkQ8DBABq7=np+1Vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWd7gK3_p4mhkKS4VJUw6WCAHEw-pkQ8DBABq7=np+1Vw@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your review.

On 2023-11-18 12:20:41 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> Thanks for your patch!
> 
> On Fri, Nov 17, 2023 at 5:45 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > The Gen3 gPTP support will be shared between the existing Renesas
> 
> Gen4
> 
> > Ethernet Switch driver and the upcoming Renesas Ethernet-TSN driver. In
> > preparation for this break out the gPTP support to its own module.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> > --- a/drivers/net/ethernet/renesas/Kconfig
> > +++ b/drivers/net/ethernet/renesas/Kconfig
> > @@ -44,7 +44,17 @@ config RENESAS_ETHER_SWITCH
> >         select CRC32
> >         select MII
> >         select PHYLINK
> > +       select RENESAS_GEN4_PTP
> >         help
> >           Renesas Ethernet Switch device driver.
> >
> > +config RENESAS_GEN4_PTP
> > +       tristate "Renesas R-Car Gen4 gPTP support"
> > +       depends on ARCH_RENESAS || COMPILE_TEST
> 
> Perhaps
> 
>     tristate "Renesas R-Car Gen4 gPTP support" if COMPILE_TEST
> 
> ?
> 
> The driver is already auto-selected when needed.

Good idea, will do for v2.

> 
> > +       select CRC32
> > +       select MII
> > +       select PHYLIB
> > +       help
> > +         Renesas R-Car Gen4 gPTP device driver.
> > +
> >  endif # NET_VENDOR_RENESAS
> 
> > --- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
> > +++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.c
> 
> > @@ -186,3 +188,6 @@ struct rcar_gen4_ptp_private *rcar_gen4_ptp_alloc(struct platform_device *pdev)
> >
> >         return ptp;
> >  }
> > +EXPORT_SYMBOL_GPL(rcar_gen4_ptp_alloc);
> > +
> > +MODULE_LICENSE("GPL");
> 
> Please add the other MODULE_*() definitions,too.

Wops, checkpatch only complained about MODULE_LICENSE, will fix for v2.

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

-- 
Kind Regards,
Niklas Söderlund
