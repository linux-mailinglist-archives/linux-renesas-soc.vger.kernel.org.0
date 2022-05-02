Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD67517283
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 17:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377682AbiEBPcd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 11:32:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239467AbiEBPcd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 11:32:33 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8625F5F;
        Mon,  2 May 2022 08:29:04 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id e17so10409546qvj.11;
        Mon, 02 May 2022 08:29:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zWArnVQeFAr+HIdl/HHIHZVeIFDGQXmxNfCa+51obnw=;
        b=0AmTeVVo92eqZnHBBD1QQonV4hocsaCwq6lmcTk0Ei0YKEz9t9XmOpqU1vCLPS6uLO
         oyThztb67gTEzsxqWDYz/tiDi14g4awfNYzOwM4Bstu1oAk/iIEClDAf8pAJvZIIjsSS
         umsDy8FwbR/7sW3RqGlIlNCRev3m4WWd12rpu92oyIOVeiY7osD8Hf60kJfUS6zUsO7r
         lcqyFE6Jgb/B5j7wMiIqrP1NxC8i2E/UNlIroHUxFzMQq9m+LWCl8t7ZWu5p/h9lhYXS
         cDXnh2TSP2EFH8PfoR9p9G5N2/+KhhLzClXgvHI7DZyJBtFNyk9Ejbtvew0njWRUlFbc
         Jc+Q==
X-Gm-Message-State: AOAM530XNH8to7rgcjgJJBovlfOm/fZBFCE1aj35JEpEUDjceRNCvXp8
        V02GhePiI9ga2cZrLWAYNS6W4wyzgCYqlw==
X-Google-Smtp-Source: ABdhPJx45MP70L6GZYNp6wMOqxGoygA4lf0CDn82bK2jFtvBM2qxNRSB9MHx3uDfRhgDX2cGIHaJrw==
X-Received: by 2002:a0c:d6ce:0:b0:443:f22e:6dd with SMTP id l14-20020a0cd6ce000000b00443f22e06ddmr10011393qvi.111.1651505343152;
        Mon, 02 May 2022 08:29:03 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id r6-20020ac87946000000b002f39b99f691sm4359753qtt.43.2022.05.02.08.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 08:29:02 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id w187so26647217ybe.2;
        Mon, 02 May 2022 08:29:02 -0700 (PDT)
X-Received: by 2002:a25:4506:0:b0:648:cfc2:301d with SMTP id
 s6-20020a254506000000b00648cfc2301dmr10602910yba.380.1651505342164; Mon, 02
 May 2022 08:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220501083450.26541-1-biju.das.jz@bp.renesas.com> <20220501083450.26541-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220501083450.26541-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 May 2022 17:28:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVDh_0RJux7QimzwE0df7R-5Y9PPKR_G58+p2rpfgFp=w@mail.gmail.com>
Message-ID: <CAMuHMdVDh_0RJux7QimzwE0df7R-5Y9PPKR_G58+p2rpfgFp=w@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: renesas: r9a07g043: Add clock and reset entries
 for SPI Multi I/O Bus Controller
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On Sun, May 1, 2022 at 10:35 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add clock and reset entries for SPI Multi I/O Bus Controller.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
