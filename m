Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86B1E50D9F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 09:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234757AbiDYHOF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 03:14:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232645AbiDYHOA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 03:14:00 -0400
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA4723BE5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 00:10:58 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id a5so11154748qvx.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 00:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UiAv8Aic2vVJVwyihga0T+23vlcl9W+2+olbQc8im/I=;
        b=t5P09mTYA95zaGlrYSGYaahTdLp9nTKWIyLKFMTJhk5FgMhIRdiKDIbK1VI+4unW4t
         hGRLszp5qTVjmh9iGRXCAtAPAqF+Gthoubmx5RhuTHGerebnbvv5pipKpNExt7yahK1K
         VtlGOenN8TXRLbYnKT3Wgu8TMd3OhLMQvLI5EeTStVx58S0uFPvhkHPulFtfIWRA/Xby
         ClDrIxLSwuwSrcXnlnrDm3KghuV51jAO0YISrlMubCczI0z5G2fvjy7/9muLkcCEhuGl
         TvA8XMCPi6zi/NVMIB9Lq4ShYZfeXBoPnlx7N0zgDDqXjWePt5Zy6M//L+ShVB7V2S8t
         T84A==
X-Gm-Message-State: AOAM5301dI3MLheAaCVgV7yrOSgkcP4y6/v1D6qlp6E0pR2CtNhnWbm+
        a7GZ34Arm6KngupcZSxBIuOY7S1qVEgs2A==
X-Google-Smtp-Source: ABdhPJyTN/f+lDkEMrDoXag2VFQpQthk+/2K0u/k82zbv8SbcwaWGQrmoUdzHPyWED1cymkGP85FZA==
X-Received: by 2002:ad4:4b0a:0:b0:456:390f:6fb1 with SMTP id r10-20020ad44b0a000000b00456390f6fb1mr2054235qvw.32.1650870657096;
        Mon, 25 Apr 2022 00:10:57 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id r12-20020ac85e8c000000b002f36944423bsm1251495qtx.87.2022.04.25.00.10.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 00:10:56 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-2f7b815ac06so62461767b3.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Apr 2022 00:10:56 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr15122808ywi.449.1650870656410; Mon, 25
 Apr 2022 00:10:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220423164443.146299-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220423164443.146299-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Apr 2022 09:10:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWOc_BskYpKnQJ-V5vo7cXuzFdW-deqDB4mquasows-8A@mail.gmail.com>
Message-ID: <CAMuHMdWOc_BskYpKnQJ-V5vo7cXuzFdW-deqDB4mquasows-8A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: sh: Make SND_SOC_RZ depend on ARCH_RZG2L
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Apr 23, 2022 at 6:44 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The SSI block is identical on Renesas RZ/G2L, RZ/G2UL and RZ/V2L SoC's, so
> instead of adding dependency for each SoC's add dependency on ARCH_RZG2L.
> The ARCH_RZG2L config option is already selected by ARCH_R9A07G043,
> ARCH_R9A07G044 and ARCH_R9A07G054.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
