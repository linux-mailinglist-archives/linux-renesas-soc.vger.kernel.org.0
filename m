Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BD23519A3E
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 10:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343614AbiEDIsJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 May 2022 04:48:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238384AbiEDIsI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 May 2022 04:48:08 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78C7E24599;
        Wed,  4 May 2022 01:44:33 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id y6so472142qke.10;
        Wed, 04 May 2022 01:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tHU8Jh2gD1KbYrotig296L1Sl2vLAPhvFyxncVomMrI=;
        b=6R+le3Vg4UQxyoR9e4u3/scRD/ju9FWlKGlxQgTsF3SsOtQlnM0sggWyTdNyI7jZ2s
         dnX8LeqSvtttyc6C79tG23sq2UPyCoCAnutHr+e6fq69guX7BaNzAfWD3vPpsEjt9quj
         QYaw5x2wif9D3OAMIj8Jzv62tXwG48Fc62JRM03RhAqNQEldLi3xFmuVLv11rzPZLK27
         T19W0/tQYbY/PpNQAC2btkAiBUGLLWNc8uN/Zv0cm19SCKWZULFQYW2ScMLVshBaNSub
         Aesae0KZiVeMtvKSI6IAsNr8Em6c+hka2Qch3xkZYHGLSfmCOYqrsGGdC/N5irSRZexO
         DICg==
X-Gm-Message-State: AOAM532o48TZtMoHj9wNgNsZ+6FfwQCRqrnYneUYv62pSRsU1w/CZU0m
        HLEwiIPNrh0sqa/d8s6SBWnQNXoYsYyRoQ==
X-Google-Smtp-Source: ABdhPJzvIiyO6oEvmcUmfUjrUDiw5RPBEA/up5kTvG2j0SRxEsIszgIZnhjYdzESADRBK2/3gOOHhw==
X-Received: by 2002:a37:c407:0:b0:69f:b2b5:94f5 with SMTP id d7-20020a37c407000000b0069fb2b594f5mr15101354qki.224.1651653872148;
        Wed, 04 May 2022 01:44:32 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id y144-20020a376496000000b0069fc13ce1efsm7085574qkb.32.2022.05.04.01.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 May 2022 01:44:31 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id g28so1210468ybj.10;
        Wed, 04 May 2022 01:44:31 -0700 (PDT)
X-Received: by 2002:a25:4506:0:b0:648:cfc2:301d with SMTP id
 s6-20020a254506000000b00648cfc2301dmr16685947yba.380.1651653871377; Wed, 04
 May 2022 01:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220503115557.53370-1-phil.edworthy@renesas.com> <20220503115557.53370-6-phil.edworthy@renesas.com>
In-Reply-To: <20220503115557.53370-6-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 4 May 2022 10:44:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUy=hYR-WDhVi-S+f2zjQfiW5_jnY=+Tb_L5zjR78fcvQ@mail.gmail.com>
Message-ID: <CAMuHMdUy=hYR-WDhVi-S+f2zjQfiW5_jnY=+Tb_L5zjR78fcvQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] clk: renesas: rzg2l: Move the DEF_MUX array size
 calc into the macro
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
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

On Tue, May 3, 2022 at 2:01 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> We only ever use ARRAY_SIZE() to populate the number of parents, so
> move this into the macro to always detect it automatically. This
> also makes the tables of clocks a little simpler.
> Similarly for the DEF_SD_MUX macro.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> ---
> v3:
>  - New patch inserted

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.19.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
