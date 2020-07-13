Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 459CB21D4EF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2020 13:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729027AbgGML2P (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jul 2020 07:28:15 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:38668 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728714AbgGML2P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 07:28:15 -0400
Received: by mail-ot1-f65.google.com with SMTP id t18so9232561otq.5;
        Mon, 13 Jul 2020 04:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VmnKT8NempII3Hl6CSCL6SevjCL0TxGwM55hoFOSL6w=;
        b=ijwSZrezftp9qiGvFtUXn2p2heic3ZTiiOAt9gFJ2ikEyH8XsC1lh4nFom+Cizq++w
         Sh+WrL5pbGAlIb8eW7mBKWVoiqIq9UoFpJQ0woGNKtplXr3tLuftJ4Mr1LiJ1KqcX8kL
         GNigjDIIYoZrdj8Gl5dJavVnyy7PXRsxe++6DZ71zOZX4i1IGWTHgXsrRM3BqlCs+2D/
         srdsgT17nZdoUxoE90UtLCjyroKH5DYdWJplVhU9VdbirodGJJjySyl4lHX0I+BPBE0z
         WzkyAyKsWmPkFYbWfONZzKKLTN9gtx3hh/ha6Cu6s5EtxrI8ObeGJQKloMhGSNaOrS1H
         Qz4A==
X-Gm-Message-State: AOAM532oppO0oxEQDhBEwg7TF8Ms5wyreyfu1+2N6PeHVYqL21D6F9Sm
        KGr3kBYRP0e3pAAfUwTSKb6VHNJRzT2P9aJjaMY=
X-Google-Smtp-Source: ABdhPJwv4h+C8McCqHPa2Ma5j3n5B0iRYxepvun9IsQB2dq8KH6i5EsEEc/F6rTu4L3Gfc2JnGupkQa9YqmL6akFntg=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr65107444otb.107.1594639694020;
 Mon, 13 Jul 2020 04:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594230511-24790-6-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594230511-24790-6-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Jul 2020 13:28:03 +0200
Message-ID: <CAMuHMdWDyxypASwxxjfyYw7tOxkwWXTjC=NeHZj9B8kaYjO9WQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] arm64: defconfig: Enable R8A774E1 SoC
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 8, 2020 at 7:48 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Enable the Renesas RZ/G2H (R8A774E1) SoC in the ARM64 defconfig.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
