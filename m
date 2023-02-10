Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 393B2691F4A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Feb 2023 13:47:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbjBJMrq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Feb 2023 07:47:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbjBJMrp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2023 07:47:45 -0500
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FB1B6CC6F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 04:47:44 -0800 (PST)
Received: by mail-qt1-f171.google.com with SMTP id h24so5578366qtr.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 04:47:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yo8HAW/2I9qqLBb0C8Q04jemdvn4umc13vAZeV+rIME=;
        b=NzG1iyOYn4HBL0pAgPErDM5auqQfO16OvNx/6rLzH58dzszweM7K+j3zTI5lfVQvg/
         Mz5jF54y+YP3sjmFV5Rmau1YFGactpGmE4V7/eCa1ns1ulTkf9NPkJ4pPgvh85wSJ/O+
         W7so2DgFCPSgIlt+Y9NuOqlnfz7Au8/qhcSzck6eJHhDM9tMXkdy7y6Za3LO5tA+Ov3H
         lM2AlXKMc1T5lG/0cW/ccMWTmWfu3ULHWfV7x4jxD+Kh8BMUTLG10wW+VIxiSX/ZAYdd
         xqhNZRmLqH+58ciE2rNCH6n6DRnWCDKyGhnon/VvBaHuEXea/xnWXoNVeDXfEU130cLt
         BNpw==
X-Gm-Message-State: AO0yUKUVmvZREoHtlPcvBzhQvAEt4RD9TpZJHFHJTJQZMP0TtNBoVgGt
        qt3oUhAujSsyX66feBoBi8cIiQDCsYn64ku0
X-Google-Smtp-Source: AK7set99i9W5fM53xswxib/vYHfveZH935zOOF25uneWEHGKB931ElnsT9QcZLC4AYFxmWQVsVLu0g==
X-Received: by 2002:ac8:6d0:0:b0:3b9:bc8c:c206 with SMTP id j16-20020ac806d0000000b003b9bc8cc206mr8067341qth.17.1676033263532;
        Fri, 10 Feb 2023 04:47:43 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id u124-20020a376082000000b00702d1c6e7bbsm3405970qkb.130.2023.02.10.04.47.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 04:47:43 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id x71so5297949ybg.6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2023 04:47:42 -0800 (PST)
X-Received: by 2002:a25:928e:0:b0:8a0:2a4:a96c with SMTP id
 y14-20020a25928e000000b008a002a4a96cmr1408463ybl.380.1676033262738; Fri, 10
 Feb 2023 04:47:42 -0800 (PST)
MIME-Version: 1.0
References: <87edr8angv.wl-kuninori.morimoto.gx@renesas.com> <87a61wanfx.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a61wanfx.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 10 Feb 2023 13:47:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVtskw=zr-bKO5KZgMZ5ni6AapfBsy6Kyg_NB=rNCALZw@mail.gmail.com>
Message-ID: <CAMuHMdVtskw=zr-bKO5KZgMZ5ni6AapfBsy6Kyg_NB=rNCALZw@mail.gmail.com>
Subject: Re: [PATCH 3/9] clk: renesas: cpg-mssr: Fix MSSR register range for V4H
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

On Thu, Feb 2, 2023 at 2:03 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> The SRCR, SRSTCLR, MSTPCR and MSTPSR registers for R-Car V4H (R8A779G0)
> each have registers up to offset 0x74.
> This patch update it.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
