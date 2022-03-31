Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01D2B4ED8A2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Mar 2022 13:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235291AbiCaLnB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 31 Mar 2022 07:43:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232724AbiCaLmx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 31 Mar 2022 07:42:53 -0400
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD0701546BD;
        Thu, 31 Mar 2022 04:41:06 -0700 (PDT)
Received: by mail-qk1-f170.google.com with SMTP id 1so19478550qke.1;
        Thu, 31 Mar 2022 04:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p/ZqnW0LgKQLEY4IaJ/WNa8z5z7Yb6gZ+rRSVKouz3E=;
        b=tGCm3glpyaYG4a1m7/U7Gjcu8FtQExqat5MpnoTGLU4WtJzkrpsqR8itKG+N0jEXuV
         mBnr7UQYkrbhHaxXvXV8YwElo7jXZUuz36Si6NJAK0YxNp9dB2R0LLVKOjp+Do3aiY8d
         sZmcEncz10e6mwI/rV9hfYtej5NKIGxXXEtkxWFKmjDrBCpEhwj4CuadQOfjGpUCwa/8
         vTcJtf8kqh44v/KanuAE70Thk3yHyAtdq9QHmsVmEJj0WUlGLe3POq7BBT5G9Sbhmq1d
         P7Ujpowmidjy/3nreSx5VKdzGzMCAJgm1HqT6ANvzETOn6oVbvO9YVVxqQXWB+XqNTx2
         CJpQ==
X-Gm-Message-State: AOAM531USPCkr7zOTgNlhayWid8YUdpCg/ciKbogawn4X9I0pOM3cQvS
        JTNF2l1YmRK364bkUsJW0eYtcvWCh0qUfA==
X-Google-Smtp-Source: ABdhPJxBkTM6JICVo0P8GtvCViZoJtsZCa4Qq3ksd1oQuevbvrLrFYZdOCMkIF5nvr1TMzO3vMh4iw==
X-Received: by 2002:a05:620a:17a6:b0:67d:85e6:a86b with SMTP id ay38-20020a05620a17a600b0067d85e6a86bmr2813003qkb.771.1648726865235;
        Thu, 31 Mar 2022 04:41:05 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id bp31-20020a05622a1b9f00b002e21e80ecd8sm18789795qtb.45.2022.03.31.04.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Mar 2022 04:41:04 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-2e5757b57caso250960537b3.4;
        Thu, 31 Mar 2022 04:41:04 -0700 (PDT)
X-Received: by 2002:a81:59c4:0:b0:2e5:c7c3:5d29 with SMTP id
 n187-20020a8159c4000000b002e5c7c35d29mr4448584ywb.512.1648726864297; Thu, 31
 Mar 2022 04:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220315154649.22343-1-biju.das.jz@bp.renesas.com> <20220315154649.22343-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220315154649.22343-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 31 Mar 2022 13:40:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX1nsyQxPTVK6v=zZBeXBE555uzTWCpCiTSDuRi__S6Hw@mail.gmail.com>
Message-ID: <CAMuHMdX1nsyQxPTVK6v=zZBeXBE555uzTWCpCiTSDuRi__S6Hw@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: r9a07g043: Add ethernet clock sources
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
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

On Tue, Mar 15, 2022 at 4:47 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Ethernet reference clock can be sourced from PLL5_500 or PLL6. Add
> support for ethernet source clock selection using SEL_PLL_6_2 mux.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
