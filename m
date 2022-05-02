Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC8951728D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 May 2022 17:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385762AbiEBPeU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 May 2022 11:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385807AbiEBPd4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 May 2022 11:33:56 -0400
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F672719;
        Mon,  2 May 2022 08:30:26 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id kj8so4441211qvb.6;
        Mon, 02 May 2022 08:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M+nnzARipFBLna11ublAO2AvWfDSAMVRqL/BpCrG3GI=;
        b=sU+IzBDfAZ5Re89wzog4se4C9cxq/4sbe4x7PF9I3BcJ7YGe3NvoGfTcI4nNlUsIvC
         zZt8+RIQ7jZRvWHMJ8lgAHGIt1DPYVZhG+Wfm8lkR0mt1SNeb2ymAIomhjEFNVKGomcY
         w5YRoI+MXbLvrdk56EAKFCLT8is8hKxAILDGukhrZ3qU7Xr5E+iq/LvfFEbm0mWYTdUn
         MMtYiOYH4FQEuLG+QSDtJzWWkCkIZMA+Y7M+KLkatKTHg2mNJaNUqDkXcvKNF5EWlsoc
         MDgeWCK9PHsdwkURFmAC4T+S+tmCPG8RBPEVB9IXjrqsgy7wt9uIT+d8gm1a8LaQchbU
         PfCg==
X-Gm-Message-State: AOAM531YlA/gDoYR67k9uYU7qnqz/QJAyKPLKzMrMMYRL2UYoIWtvI6J
        Ftn4UR6lFWuaCYoePpktoK4Q8a7mNlv3uQ==
X-Google-Smtp-Source: ABdhPJywRlyn5SST4Qg9U54AYuk+HMobtY11LbYW5rXe0snjzjV0tngxYuNwSkNpaGrwnbowS7PtXA==
X-Received: by 2002:a05:6214:f24:b0:45a:8c3d:6911 with SMTP id iw4-20020a0562140f2400b0045a8c3d6911mr4393377qvb.1.1651505425991;
        Mon, 02 May 2022 08:30:25 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id y24-20020ac85258000000b002f39b99f675sm4515011qtn.15.2022.05.02.08.30.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 May 2022 08:30:25 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id j2so26720606ybu.0;
        Mon, 02 May 2022 08:30:25 -0700 (PDT)
X-Received: by 2002:a05:6902:389:b0:633:31c1:d0f7 with SMTP id
 f9-20020a056902038900b0063331c1d0f7mr10337968ybs.543.1651505425433; Mon, 02
 May 2022 08:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220501083450.26541-1-biju.das.jz@bp.renesas.com> <20220501083450.26541-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220501083450.26541-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 2 May 2022 17:30:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWqiDOyB_EPLGQZXbZvK0u+YJishKgA-t2Hh4hfSx4M8Q@mail.gmail.com>
Message-ID: <CAMuHMdWqiDOyB_EPLGQZXbZvK0u+YJishKgA-t2Hh4hfSx4M8Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: r9a07g043: Add clock and reset entries
 for ADC
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

On Sun, May 1, 2022 at 10:35 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add clock and reset entries for ADC block in CPG driver.
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
