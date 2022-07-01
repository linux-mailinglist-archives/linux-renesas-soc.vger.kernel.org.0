Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94519562D63
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Jul 2022 10:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236228AbiGAIGa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Jul 2022 04:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236210AbiGAIG1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Jul 2022 04:06:27 -0400
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C37C56F364
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Jul 2022 01:06:24 -0700 (PDT)
Received: by mail-qv1-f51.google.com with SMTP id u7so3463512qvm.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Jul 2022 01:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=/COiBeSOj7s3O6lpVZOO2P12uW0pun0Wtvshxu82JUs=;
        b=BgVhhDDTtaO6JtLRu9sZ3GtH0DKy5pkHdb2DTwO57LplNIOtD77tDT0nrLj3gZNsac
         dYNNj3HuYm7JQswZfuBjQDbfAVUg1QNZCZFfwe3ljZlENxlFndfuqx5xXZI6LweduaNZ
         /lZ55vjd+68l876xQ1S1Q1jNpn/KgKO1GIepAKCZL7l2N4NdFYeGgRaGrBRO5KN4HCzL
         cY5Z2U3Uo6Ed+wIiwZxVXE0o5fbJgBKZ/y+VXfD4nueDMWCCsrmru20GyuiLt+CrShrg
         68nhk7dIv7RSG6fSTBvO+fjMweH5GXxQtqHFy8MyOdSqtSsts23DnpTGLCy2SFkn0pGd
         GlXw==
X-Gm-Message-State: AJIora8nkD3+Emv9ZGvRb4QbNjaXLaKi0tdyBQDB5uLIDDjNiiEZ9T0n
        cjbWYTymN1ePEmBAr3uvgTGjBBxPPYN2vA==
X-Google-Smtp-Source: AGRyM1tN2lb98pP4Ak6dgx/vXLAKiPTIZhFPyvo1115MsEXcwxSE8vRg3BceBiOVom17GVHyt2trig==
X-Received: by 2002:a05:6214:5195:b0:470:5190:b12 with SMTP id kl21-20020a056214519500b0047051900b12mr16227421qvb.59.1656662783715;
        Fri, 01 Jul 2022 01:06:23 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id c24-20020ac853d8000000b003171a5dc474sm14183943qtq.23.2022.07.01.01.06.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 01:06:23 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-31780ad7535so15952027b3.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Jul 2022 01:06:23 -0700 (PDT)
X-Received: by 2002:a0d:ead0:0:b0:31c:63c3:e615 with SMTP id
 t199-20020a0dead0000000b0031c63c3e615mr903031ywe.384.1656662782820; Fri, 01
 Jul 2022 01:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220628122330.28323-1-wsa+renesas@sang-engineering.com>
 <87v8skjp8f.wl-kuninori.morimoto.gx@renesas.com> <Yrvx0qRDf5V4C7jj@shikoro>
In-Reply-To: <Yrvx0qRDf5V4C7jj@shikoro>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Jul 2022 10:06:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXt099FGvhYeYs+bZ6cpCTd-AqJ7SW91BWMtyTnT4LTJQ@mail.gmail.com>
Message-ID: <CAMuHMdXt099FGvhYeYs+bZ6cpCTd-AqJ7SW91BWMtyTnT4LTJQ@mail.gmail.com>
Subject: Re: [RFC PATCH] arm64: dts: renesas: ebisu: add port node to ak4613
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Wed, Jun 29, 2022 at 8:34 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Thank you for contacting me,
> > and sorry for my bug.
>
> No worries, bugs happen all the time to all of us.
>
> > Could you try this patch ?
>
> Thank you! It works \o/
>
> > It should goto linus tree, but it seems not yet ??
>
> It is also not in renesas-drivers, this is why I am still seeing this
> issue. Now I know.

Strange, I thought it was included.
"git show --pretty=fuller" shows it was committed by Mark Bown on
June 8.  Looks like the branch with the commit was not included in
sound-asoc/for-next, only in sound-asoc/fixes, when I made last
renesas-drivers.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
