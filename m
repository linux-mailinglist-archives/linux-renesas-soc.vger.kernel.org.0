Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 159215EA808
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Sep 2022 16:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234714AbiIZOKi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Sep 2022 10:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234230AbiIZOKP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 10:10:15 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9818889925;
        Mon, 26 Sep 2022 05:20:44 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id w4so4185128qvp.2;
        Mon, 26 Sep 2022 05:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Th2841fA1SzRs0UF0aoj4t9jXQ9Paur2qzED8VSijKM=;
        b=5XyMkTd5TDf4hqt8ZoEgZUoDXYhlFbVs8Mao3gBZ2Fy2ibJEttKsxlkTxmqFhxNSxw
         HrZka0nITflwkx6AOAHlPPbizIQpihuOvQJLzfz00pOAP2nBeqFnSGLXQv4hL28PQIg7
         DNaOfKGFUsNTugPTfu5Eqw35eHQezbbTTIKdqcg2nUwos3mUOzVkplUr74D1fJizaM+o
         1rRLBC4Srupnvt7uiQkyGV5dBf9rjtSXwLe05zE24cnjH/Q8HRunAM+cXT2MG5VUn1D6
         TCtqGhnBGoThTgXrwDebIFiqVZXXB58kMWmr5oTi17feGhE9s8qvF1KdL/fw8anrSC6Q
         qZLw==
X-Gm-Message-State: ACrzQf1h/jc968QogZNHIrUYSWO9zfkLvM2j0kkQXZTBymvL/GaBNAHb
        OLpgb6Bohi+lJHT22SLnqOXspwoXI4bvxg==
X-Google-Smtp-Source: AMsMyM4PoZhVqDFvVEJsdvtPLZAt3z8Hzy5jfq/7tND20+qKhBHx3uFevFeWjGb00olOM3c1+e8M8Q==
X-Received: by 2002:a05:6214:e62:b0:4ac:aaf6:3944 with SMTP id jz2-20020a0562140e6200b004acaaf63944mr16340451qvb.9.1664194842742;
        Mon, 26 Sep 2022 05:20:42 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id o10-20020ac841ca000000b00339163a06fcsm10895306qtm.6.2022.09.26.05.20.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 05:20:42 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-3454b0b1b6dso66607907b3.4;
        Mon, 26 Sep 2022 05:20:41 -0700 (PDT)
X-Received: by 2002:a0d:dd09:0:b0:344:fca5:9b44 with SMTP id
 g9-20020a0ddd09000000b00344fca59b44mr20196508ywe.358.1664194841577; Mon, 26
 Sep 2022 05:20:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220922085511.1078256-1-biju.das.jz@bp.renesas.com>
 <Yy7ZcJ8h2VCtUDnW@shikoro> <TYCPR01MB5933319E9510B176644D2BC986539@TYCPR01MB5933.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB5933319E9510B176644D2BC986539@TYCPR01MB5933.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Sep 2022 14:20:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX0DJidfmjcKiDNm=82=cSLYRso+Kuq9HDxRCoubjHvsA@mail.gmail.com>
Message-ID: <CAMuHMdX0DJidfmjcKiDNm=82=cSLYRso+Kuq9HDxRCoubjHvsA@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: renesas_sdhi: Fix rounding errors
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Sun, Sep 25, 2022 at 7:06 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v3] mmc: renesas_sdhi: Fix rounding errors

> > > v2->v3:
> > >  * Renamed the variable new_clock_margin->new_upper_limit in
> > renesas_sdhi_clk_
> > >    update()
> > >  * Moved setting of new_upper_limit outside for loop.
> > >  * Updated the comment section to mention the rounding errors and
> > merged with
> > >    existing comment out side the for loop.
> > >  * Updated commit description.
> >
> > I really like the new variable names.
> >
> > > +    * To fix rounding errors, eg:- (533333333 Hz / 4 * 4 = 533333332
> > Hz
> > > +<
> >
> > (What is the '-' after 'eg:' for?)
>
> Regarding 'eg:-', I got this habit from school days. On exams, I usually
> write for eg:- to provide some examples.
>
> OK, Will remove '-' after 'eg:'.
>
> >
> > > +    * 533333333 Hz) add an upper limit of 1/1024 rate higher to the
> > clock
> > > +    * rate.
> >
> > I know Geert suggesgted this. I think, however, this description is
> > too short. It should be mentioned IMHO that this rounding error can
> > lead to the selection of a clock which is way off (the 400MHz one). I
> > liked this example from v2. Geert, what do you say?
>
> Yes, I can put back the real example from v2, if that is useful.
> 533MHz->400 MHz is a big jump due to this rounding error and it has
> impacted the performance.
>
> Waiting for Geert's feedback.

I agree with Wolfram.
I'll give your patch a try on my collective tomorrow.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
