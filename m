Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA50F600BA7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Oct 2022 11:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbiJQJ4a (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Oct 2022 05:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbiJQJ43 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Oct 2022 05:56:29 -0400
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED29433403;
        Mon, 17 Oct 2022 02:56:28 -0700 (PDT)
Received: by mail-qv1-f43.google.com with SMTP id de14so7094371qvb.5;
        Mon, 17 Oct 2022 02:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gKRqDUtAHQUXUoHy9pqj/nWSaQny/hgTIVkVZktn0E=;
        b=H4G4o0CulucZpH0zEHozYdp2/mOYGcuYI+54INLK0K6LnklH0lcUmxZeUxsvb4ed2m
         m033mwjoRztqqw7TTTcSNQHfpRYMdcjZMW/5FqwLzHHotTkBH5o8gQrWPgN3nsdsEPCM
         sKjbn25VsLHCLwTasI4mVvTGqSre80oYh/54UAn4Gzc27AwizYAoR7iUBHBg487x5IlV
         IdS20/3giWmvBnvbJ2jZpL0K0yAPaSrnSGWRuJER91bJZQCLPrs1NdcnchPwvZ/FtN1T
         of50zYwZ2jyfYm3nq8AO628Ab70H6MqVz9Tdn+TGg2hYvZnbre7MviPj2lfygmRaFO3o
         2Jhw==
X-Gm-Message-State: ACrzQf1sFEnN5CnC+boZrwoeXf5MNr6N4hi8jEKUahb6iS2B2yJMO28v
        5Sg+wyLEOxq9yvmC4A4gw3KFCDBXYNZaTA==
X-Google-Smtp-Source: AMsMyM7PhEx0uzrtLzFx9atzkYKxEPzWkNgNYdGQoHis7daNO+NW85lF5Hlc4HhL1dbZshR+/nmeng==
X-Received: by 2002:a05:6214:5cc5:b0:4b3:ec9e:79d8 with SMTP id lk5-20020a0562145cc500b004b3ec9e79d8mr7621481qvb.61.1666000587690;
        Mon, 17 Oct 2022 02:56:27 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id f25-20020a05622a1a1900b00398df095cf5sm7697957qtb.34.2022.10.17.02.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 02:56:27 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id r3so12632888yba.5;
        Mon, 17 Oct 2022 02:56:27 -0700 (PDT)
X-Received: by 2002:a25:26c1:0:b0:6c3:bdae:c6d6 with SMTP id
 m184-20020a2526c1000000b006c3bdaec6d6mr8000372ybm.36.1666000586883; Mon, 17
 Oct 2022 02:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <20221005111855.553436-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20221005111855.553436-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 17 Oct 2022 11:56:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVDwe98RDC7tJv+ic8zfjWqE27YKZ_+mXDKraFifJjrmA@mail.gmail.com>
Message-ID: <CAMuHMdVDwe98RDC7tJv+ic8zfjWqE27YKZ_+mXDKraFifJjrmA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a07g044: Add MTU3a clock and reset entry
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
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

On Wed, Oct 5, 2022 at 1:19 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add MTU3a clock and reset entry to CPG driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
