Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 480FA686732
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Feb 2023 14:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbjBANmO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Feb 2023 08:42:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232346AbjBANmK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Feb 2023 08:42:10 -0500
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A58544DBF0
        for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Feb 2023 05:41:59 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id g7so971380qto.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Feb 2023 05:41:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoTCvQEFQahRSY53gAZtdYuQP50xjYNIl+h3E+Avkds=;
        b=3+GN3gLREeo4hKPYLY8ZhE0y53/31+RQgorc27IBd/5q49bzY8zFBENbBoiaYdE4bK
         LDMO0lJ9/YB2k2uyV3ezsPJgukVMkAqkE71d79b4OH5gfuhe8ZexDICy3k5Q2c6MwNYl
         dE9lkexk2KpF+v73rCC7ISU/azo9QXwVssjrL2UWvnsYD3qNgEXr+PfzfgXkdRnvYo1K
         tUrCqHgbcCczGVeYNzvgfYSdrCuTu6nb1Ngo/2LI6+qqKj2zZQHzfeMVZS5GEkmvhYzN
         FdPHruo2iEiZ9lPjoO/JGi8sXfYZO4wbBlEo/im2/bkUMajtFG4PZHt/OHIVx1nkyoeo
         lKiw==
X-Gm-Message-State: AO0yUKVeFhtihhJmppv5DS/iVBxv/QrVrc+LdDTXDq2g8XHQAE0n/Tdf
        0r8TkA65Wn++M6kc3COfdDbNbOZtIzQniQ==
X-Google-Smtp-Source: AK7set+jTl2xnweTfSDjrDDvDLJKyHhgMp6QNrhStUYbsN9ZaoKokZjS9OOS0jqjhHMOEmJeMyqMgw==
X-Received: by 2002:ac8:5c94:0:b0:3b8:6d3a:5ec7 with SMTP id r20-20020ac85c94000000b003b86d3a5ec7mr4630681qta.22.1675258918458;
        Wed, 01 Feb 2023 05:41:58 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id f12-20020ac86ecc000000b003b835e7e283sm8670837qtv.44.2023.02.01.05.41.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 05:41:58 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-50e7a0f0cc8so184242867b3.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Feb 2023 05:41:58 -0800 (PST)
X-Received: by 2002:a0d:f106:0:b0:507:86ae:c733 with SMTP id
 a6-20020a0df106000000b0050786aec733mr328373ywf.358.1675258917865; Wed, 01 Feb
 2023 05:41:57 -0800 (PST)
MIME-Version: 1.0
References: <20201210142021.163182-1-julien.massot@iot.bzh>
 <TYBPR01MB53098A6476F176914F71239886CB0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
 <5526f9b5-59b2-492b-f541-8381894a005f@iot.bzh> <CAMuHMdVhVViA4zyiHNMdc_Y1NR7GXp=-wYtWvy1pTbFhFNkfZg@mail.gmail.com>
 <85ac5ee3-c5c6-79f7-702d-68dc6499ac7f@iot.bzh>
In-Reply-To: <85ac5ee3-c5c6-79f7-702d-68dc6499ac7f@iot.bzh>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 1 Feb 2023 14:41:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV4J=OG47rM-qVO0aCSuJ31kf7g2yCoHPQyiLnomqHsXw@mail.gmail.com>
Message-ID: <CAMuHMdV4J=OG47rM-qVO0aCSuJ31kf7g2yCoHPQyiLnomqHsXw@mail.gmail.com>
Subject: Re: [PATCH 0/5] clk: renesas: Add MFIS clock
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
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

Hi Julien,

On Fri, Dec 11, 2020 at 2:06 PM Julien Massot <julien.massot@iot.bzh> wrote:
> > Is it OK if I postpone applying this (possibly squashed into a single commit)
> > until you have posted an MFIS driver?
> Yes it does make sense, the mailbox driver could take longer
> to be reviewed. I was more looking at how to break dependencies if
> the mailbox driver will go into a different tree.

Do you still plan to work on the mailbox driver?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
