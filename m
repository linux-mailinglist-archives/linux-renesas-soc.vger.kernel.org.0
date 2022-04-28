Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2478E513389
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 14:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346174AbiD1MY5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 08:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346140AbiD1MY5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 08:24:57 -0400
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BF8623141;
        Thu, 28 Apr 2022 05:21:43 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id e128so3404418qkd.7;
        Thu, 28 Apr 2022 05:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/PbigPTWj4Xm7KND44OD/wVqPR7G98zF/Hmzsub2yXM=;
        b=r977DB+mpHnNS+J1jrOiLnR64MJMCle2HoRdDuRGI4E7nejlwxy1M1YM1SlTNo5OIx
         P3Ei6pTNLrYEnVEimXT2V1nEj4rW12jsBh9KVdbfIbk3ZrmKMvtuFOTTL9VN8btjj+gs
         5wvq1jN3jX0R3pqkb8seTjKVbftf5vZjXQSJWyvS5UZrLTrmQqXtk0o+AU755+Hh87DP
         BzkHOgtFfuR+A9ZeNMM/Kj9CrVIBQnYTMffB0CSpB3XwP8QfIFEToMaaitkltZH/7WsB
         1RQsFMcmgOiVvW3B3RsU9jSjQ8ufY6UeeahDcU5imYajBhG6X3ORzA2ci34ZaX3UxKo7
         ulYw==
X-Gm-Message-State: AOAM531C5cgXq488P7Pmw2n+s4kROfua8OUMeGmjHATCagFAFsACl/Du
        PzOIPkzC5VPX2LL9H3xXDTKOWaErV8abGQ==
X-Google-Smtp-Source: ABdhPJxpHBViFLHkY96mqPkJrJ0iWvk7sKqTnsAVnCGrXEsTQJ1S7y32UVvU3WJRNWjkdrcQm/iRbQ==
X-Received: by 2002:a05:620a:2988:b0:69c:6fef:4661 with SMTP id r8-20020a05620a298800b0069c6fef4661mr19176370qkp.165.1651148501929;
        Thu, 28 Apr 2022 05:21:41 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id bq37-20020a05620a46a500b0069f67110f37sm5597007qkb.117.2022.04.28.05.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 05:21:41 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id g28so8656534ybj.10;
        Thu, 28 Apr 2022 05:21:41 -0700 (PDT)
X-Received: by 2002:a25:3492:0:b0:645:6f78:b3b4 with SMTP id
 b140-20020a253492000000b006456f78b3b4mr31820682yba.546.1651148501466; Thu, 28
 Apr 2022 05:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220425095244.156720-1-biju.das.jz@bp.renesas.com> <20220425095244.156720-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220425095244.156720-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 14:21:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVR6n61Y6U1KxtCvmA_SoR2vuV0AWC9vS1GdjV9SbuTug@mail.gmail.com>
Message-ID: <CAMuHMdVR6n61Y6U1KxtCvmA_SoR2vuV0AWC9vS1GdjV9SbuTug@mail.gmail.com>
Subject: Re: [PATCH 2/6] clk: renesas: r9a07g043: Add SSIF-2 clock and reset entries
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 25, 2022 at 11:53 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add SSIF-2{0,1,2,3} clock and reset entries in CPG driver.
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
