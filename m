Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09BC8513375
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 14:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235021AbiD1MWR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 08:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346119AbiD1MWQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 08:22:16 -0400
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B28E7ADD4A;
        Thu, 28 Apr 2022 05:19:02 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id a5so3074818qvx.1;
        Thu, 28 Apr 2022 05:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qx+NlNMvZd/Uol0esYxQUqFnkcuFOYByfHMHURYPZNQ=;
        b=opZ4ZIQhDk+HBUXUxFxfeT1fqlcFL5VLZAV16itc4PbA5iq/rbbLnuiKKp+oxz8U4B
         3wVlNpMDnbkE72ZdlbuVN3F9vwVo607ngeLprDgiBZAqRbHcuJlh5yDs82Jpl+X1QP8s
         IntePXYinUyrZJR434MeOf4/WBOnbuN0Q4mqWuLoo6Y1xz4y3tuuLHB22QH3zJ64KZFD
         ERkeDaBrNAeXPrPaZdGIUTXkkCAUoZjiwpePyR/IoIz8DErfP3UHe669bqqvvRfNuIDN
         gO6h0REiCuYWKrRuKqB02x86SzNr9pinIWoaE4JPKEcQvnJb9jz7ZLdCgOkBtNEB5Qe9
         Lw2g==
X-Gm-Message-State: AOAM531+1McKxsU+cqa/HhdBqrfzlKjviRxz/UCuALWihv6hXknBvi5x
        +bkceTYDPd56jZGYukhgqigPcsnBx0mDNg==
X-Google-Smtp-Source: ABdhPJxFTMhR5WnU7Ph0RRtjZdgpXvzWY8LN4HbujjGYAUindYRhjSX3UqqC2JXYKTOvk15q6dCXiw==
X-Received: by 2002:a05:6214:e4a:b0:446:5408:56f1 with SMTP id o10-20020a0562140e4a00b00446540856f1mr24168991qvc.64.1651148341604;
        Thu, 28 Apr 2022 05:19:01 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id f20-20020ac87f14000000b002f3813335a9sm3926959qtk.0.2022.04.28.05.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 05:19:01 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id f38so8704100ybi.3;
        Thu, 28 Apr 2022 05:19:00 -0700 (PDT)
X-Received: by 2002:a25:8087:0:b0:641:dd06:577d with SMTP id
 n7-20020a258087000000b00641dd06577dmr30137878ybk.207.1651148340563; Thu, 28
 Apr 2022 05:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220425095244.156720-1-biju.das.jz@bp.renesas.com> <20220425095244.156720-7-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220425095244.156720-7-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 28 Apr 2022 14:18:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXW=P8Uyeb7A2SvMboRyet+nGWG+kxApjZngPNOVwT_2w@mail.gmail.com>
Message-ID: <CAMuHMdXW=P8Uyeb7A2SvMboRyet+nGWG+kxApjZngPNOVwT_2w@mail.gmail.com>
Subject: Re: [PATCH 6/6] clk: renesas: r9a07g043: Add WDT clock and reset entries
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
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 25, 2022 at 11:53 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add WDT{0,2} clock and reset entries to CPG driver.
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
