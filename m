Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D61C455FC5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 16:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232226AbhKRPtE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 10:49:04 -0500
Received: from mail-vk1-f172.google.com ([209.85.221.172]:42518 "EHLO
        mail-vk1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231920AbhKRPtC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 10:49:02 -0500
Received: by mail-vk1-f172.google.com with SMTP id b125so4043885vkb.9;
        Thu, 18 Nov 2021 07:46:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=shqi6GAZQi9nVTVL9z1EWiqg7vtbPf56eOryjn/ImXI=;
        b=sr2ayZAFy0xIdXylOnC34Z7cC/DiSQGOf3pnqx8cdmvFq30ti3aGjtw42uvRSHVNEk
         ZOp20IjmQlGRc5UV/uNtleT0CYmlNU5k6Kf0cRyKITGH2UYVB0noTwD2YkFX3pV7xDHS
         e3S90Q0P7cF/oBJm6qqQKWDC23dS83eaM3U5m5GUCAaZPHXsF1ZvXpq3pia6X1XBe/TV
         xmL/YnRXytp18YiudPLvej6VT/wGFnrf8YBylIOb0W9TCoGCBruz1E7OnEo8TugVQX35
         Y9nv+MpvkI1Y7+YEGGGvOXyzpRDsmZWD3AyoYEYaiKtqaVAYfEaFFb3LUXOhTXAELqK0
         4+pQ==
X-Gm-Message-State: AOAM530VsUupdMzNQnzK9Xg+a4JeXnV0GiCcCva0PTYE+yYEZU0TKi8/
        5QCwN4w1ksC9bnj+/6ZlGfwiuRR8ekC3Ig==
X-Google-Smtp-Source: ABdhPJwDPp6BWq6ryAgJCqUHaj+53QL74yofGpZS0crZnKgDO5BhZ+pAW0IDrWFKxLun6ZrflpO1rQ==
X-Received: by 2002:a05:6122:907:: with SMTP id j7mr106439572vka.12.1637250361043;
        Thu, 18 Nov 2021 07:46:01 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id r13sm89105vkl.13.2021.11.18.07.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 07:46:00 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id s17so4054496vka.5;
        Thu, 18 Nov 2021 07:46:00 -0800 (PST)
X-Received: by 2002:a05:6122:7d4:: with SMTP id l20mr9348507vkr.26.1637250360038;
 Thu, 18 Nov 2021 07:46:00 -0800 (PST)
MIME-Version: 1.0
References: <20211115142830.12651-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20211115142830.12651-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Nov 2021 16:45:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWyKt0XyLwXE8J5jvEhqtitHY5Lhw1zryY3uzJ4LN4PBg@mail.gmail.com>
Message-ID: <CAMuHMdWyKt0XyLwXE8J5jvEhqtitHY5Lhw1zryY3uzJ4LN4PBg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: cat875: Add rx/tx delays
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Willy Liu <willy.liu@realtek.com>,
        "David S. Miller" <davem@davemloft.net>,
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

On Mon, Nov 15, 2021 at 3:28 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The CAT875 sub board from Silicon Linux uses Realtek PHY.
>
> The phy driver commit bbc4d71d63549bcd003
> ("net: phy: realtek: fix rtl8211e rx/tx delay config") introduced
> NFS mount failure. Now it needs both rx/tx delays for the NFS mount to
> work.
>
> This patch fixes the NFS mount failure issue by adding "rgmii-id" mode
> on the avb device node.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Fixes: bbc4d71d63549bcd ("net: phy: realtek: fix rtl8211e rx/tx delay config")

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
