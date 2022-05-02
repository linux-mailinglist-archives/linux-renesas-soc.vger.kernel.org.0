Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 205F2517286
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 17:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385754AbiEBPc7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 11:32:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357710AbiEBPc6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 11:32:58 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A5AD12AA4;
        Mon,  2 May 2022 08:29:29 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id t16so11307470qtr.9;
        Mon, 02 May 2022 08:29:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a2BEqHJFNSz8tuAr+Kogbbg37BiUYdiTL990+3SjW7U=;
        b=TMwuNV7UDTUQhVXCB6nipKiUWNS+htxsPkrUhkgVXToaJxbrbCJJQLcC2Ol6EOwAc4
         gxuDRxXKjJVJd7d1S5HlJp7Yl0Za/BIzt3WqHtCl5S/hObhjoEkSlshVCz4RE81VwZjQ
         +iaW+dqawpQgcflJnV9dICJzFw7YaT/1l12ZZoPLMekAboyowAwKsygnfx+RDx4cpIwm
         o9tnlFCSe8h/bFEutUtX0uG6Z80M4bRzrP0JS4Rwa8OfAoxP/ICHCq4+bwv6eIBndaIL
         DQBFvVOHTJeUO5goFPdtpmmWG5tiZk4Id4Kx6NAUxdol1xm36sbvv8lNx9mbtpbWmcl5
         nSEQ==
X-Gm-Message-State: AOAM530K0UIA3JO57PHvjdHfPi/tbN+K+gzJzd8v7dErdD0lFctwedRY
        poYT+Wker0/txVThqqf3mUrxBZaHx+V1ng==
X-Google-Smtp-Source: ABdhPJxeWwRANfP9zlRFEQmTmpWXCDp0JcOqIS3KqAvYuIPQYH6Qiu+dMcUUZ0ApwOTW0+o6Kl8doA==
X-Received: by 2002:a05:622a:1316:b0:2f3:64cf:2b3d with SMTP id v22-20020a05622a131600b002f364cf2b3dmr10990747qtk.205.1651505368197;
        Mon, 02 May 2022 08:29:28 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id c14-20020ac853ce000000b002f39b99f67fsm4330592qtq.25.2022.05.02.08.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 08:29:28 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-2f7b815ac06so151819577b3.3;
        Mon, 02 May 2022 08:29:27 -0700 (PDT)
X-Received: by 2002:a81:547:0:b0:2f8:6e8:19d7 with SMTP id 68-20020a810547000000b002f806e819d7mr11585504ywf.383.1651505367551;
 Mon, 02 May 2022 08:29:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220501083450.26541-1-biju.das.jz@bp.renesas.com> <20220501083450.26541-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220501083450.26541-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 May 2022 17:29:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVLr+hHyM75xe-7Q+wHmvU8L0e6rCA4MSXyGCm1oMiANw@mail.gmail.com>
Message-ID: <CAMuHMdVLr+hHyM75xe-7Q+wHmvU8L0e6rCA4MSXyGCm1oMiANw@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: r9a07g043: Add RSPI clock and reset entries
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, May 1, 2022 at 10:35 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add RSPI{0,1,2} clock and reset entries to CPG driver.
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
