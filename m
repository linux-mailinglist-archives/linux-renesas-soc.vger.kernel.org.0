Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD7CB67AB3B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jan 2023 08:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbjAYHzR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Jan 2023 02:55:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjAYHzQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 02:55:16 -0500
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1849E3A8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 23:55:14 -0800 (PST)
Received: by mail-qv1-f49.google.com with SMTP id j9so13594096qvt.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 23:55:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GRUw71aPz1kjWD6DJ98U4kWlBQILp0KezH+9vhP8mAk=;
        b=JO0x49vU9GqffHeag8TanA4FLsOBjuPy0OIjf0FZJjbJp8ZPK/smM28PDyZbZx7py3
         cWZYjxNolPB7prYHMP9jCtLrCqzh/5GjyXqBfING4ozcR6Ag9vPo2za7bkSJeOKNIM+4
         /OQxiVaTJJYVVgqExxMlu56Fan5x/O/UAn+Fq3Vxdcm6fJ4Uh+Q7+nRmtBwQypGyNiiC
         t1DB9ziiLTP++D7/Q98pTWa2ly1FP8weT537FsZxrOQTB+XbY4mx8Sz3pkrVQWZFaKbG
         mUD9/Ivt76uxVNYuVZ99k6ph2YMSM/DgPbK+NaireAImW8nbcvxjHHNmtccv9pxrEZHp
         /tag==
X-Gm-Message-State: AFqh2krYLzvXcGmYavl6OZu31EE8RKUjDySfuBMGu8+G9gp/Gm9ZMnNP
        CaKJ5ABiwXgOHeUFeGS62kpCQIkS+H0j/g==
X-Google-Smtp-Source: AMrXdXucwO7JhS/53TCZ/ncuDPJEkU6xoCPC5EUsD3dZm0ucO67wX+Bj5cgMwk3bH8BlxCTOmLqgOg==
X-Received: by 2002:a0c:9003:0:b0:4c6:e1ba:b1a with SMTP id o3-20020a0c9003000000b004c6e1ba0b1amr42477934qvo.10.1674633313899;
        Tue, 24 Jan 2023 23:55:13 -0800 (PST)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id h11-20020ac8776b000000b003b62e9c82ebsm2834234qtu.48.2023.01.24.23.55.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 23:55:13 -0800 (PST)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-4a2f8ad29d5so252020587b3.8
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Jan 2023 23:55:13 -0800 (PST)
X-Received: by 2002:a81:6e46:0:b0:37e:6806:a5f9 with SMTP id
 j67-20020a816e46000000b0037e6806a5f9mr3722762ywc.47.1674633313188; Tue, 24
 Jan 2023 23:55:13 -0800 (PST)
MIME-Version: 1.0
References: <878rhrfgv0.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <878rhrfgv0.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Jan 2023 08:55:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXQ_t8Jn8j3Haa65G6SPQREnWV+YZfDZ8q8yxk8rukUJg@mail.gmail.com>
Message-ID: <CAMuHMdXQ_t8Jn8j3Haa65G6SPQREnWV+YZfDZ8q8yxk8rukUJg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: tidyup CPU6 connection for Audio
 Graph Card2 MIX + TDM Split
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Wed, Jan 25, 2023 at 4:11 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> commit fb10d95e47f4 ("arm64: dts: renesas: add ulcb{-kf} Audio Graph
> Card2 MIX + TDM Split dtsi") added Audio Graph Card2 MIX + TDM Split
> dtsi support, but CPU6 is using Capture, not Playback.
> This patch fixup it.
>
> Fixes: fb10d95e47f4 ("arm64: dts: renesas: add ulcb{-kf} Audio Graph Card2 MIX + TDM Split dtsi")
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
> > Geert
>
> This patch is for renesas-devel/renesas-dts-for-v6.3 branch

Thanks, I will fold this into the original in renesas-devel for v6.3.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
