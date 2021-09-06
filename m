Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03C45401B62
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Sep 2021 14:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242222AbhIFMqO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Sep 2021 08:46:14 -0400
Received: from mail-vs1-f50.google.com ([209.85.217.50]:36452 "EHLO
        mail-vs1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242233AbhIFMqN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Sep 2021 08:46:13 -0400
Received: by mail-vs1-f50.google.com with SMTP id f6so5478356vsr.3;
        Mon, 06 Sep 2021 05:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cnCBbebPXaA36jrJPCmfTTq9HH9kcpc6X1fHNaC7g4A=;
        b=GZL1arkJ2Zo+LW22N3uP5iAnEkoSm7gwo/0J35oyL2tWUsX3tqX1XJuzyUFJKfMxpx
         g8ERVTC5694+sB+N4IyNiPR7Gt9EGqg1sTScEH0TW/yVpWNQ9SN1A47N/vXRl444zYSW
         cUVbjDHmJONRS7qbiX2LmRAB7B9poh+HD8cXizaVsvQFcTzdECGXtwLecW7hUnQ2K0Ka
         l4hlVFR/lD/pOIvWPvlvasQ05ePHSwbjYqtBEv6XsUCXgbY7VWPASAf2GIfSEmr616q9
         L/GC7DldqkaxzuUKkafSDEXYem1ei06dLhoA1WHqAd/9Zch+mIn2sJN1DPKnBcEcQiTs
         A5Aw==
X-Gm-Message-State: AOAM532XOm9cIKZK1l4z7HVYvs7t+vhRUtQ7g9u/Oz9gKl/0pwQ9Y+TN
        U7ouqpDwY2tt6rih1zKtsjuA0Bj9KVKqP1txYjg=
X-Google-Smtp-Source: ABdhPJzH05/6Sbxi5H5FKKv61J6+aqXpqPMze76DoCM4ZB3sfxnVaZPHGBTHR/qQrLnVqvb0klW4meWZV7A8wtgFOps=
X-Received: by 2002:a67:3289:: with SMTP id y131mr5812025vsy.37.1630932308528;
 Mon, 06 Sep 2021 05:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210814135526.15561-1-biju.das.jz@bp.renesas.com> <20210814135526.15561-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210814135526.15561-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Sep 2021 14:44:57 +0200
Message-ID: <CAMuHMdVQwOmu4vCJgSD8MBzAvQY8-FUQJv0OzX=NGqX5RppOGw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a07g044: Add SSI support
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Aug 14, 2021 at 3:55 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add SSI{0,1,2,3} nodes to RZ/G2L SoC DTSI.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
