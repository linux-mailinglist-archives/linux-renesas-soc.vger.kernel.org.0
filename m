Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 582732F2E4E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 12:47:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730676AbhALLrK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 06:47:10 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:41935 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729208AbhALLrJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 06:47:09 -0500
Received: by mail-oi1-f181.google.com with SMTP id 15so2003093oix.8;
        Tue, 12 Jan 2021 03:46:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U7Nktnh/l9rKG6tJWkUhyTNNAYgf9+XYKRS4wqeDDLE=;
        b=gU9VDu1zAdfejK3goQZp0Cehz8sslSfh76y6uGYoQM9dT26Ge8zdeXFZaGq1t4dfCN
         WqrFRceyqnY4OfFvUK0SRVJUmYhMUdR2RcL+/yMOUk4xmJ50EP8LvBVUM7ERl76DYApS
         f2e56eOEx66EGDN4ii7BBsE35yRp2uOUShkMjigIV+5RdTr2KtN+/EdhmRiTE1EcAtR+
         UL94/Wp1XRI6lkYykDVoZGkqb9vyWjjB+N1WWe1IOlcJ+9ETVYvBgAWUJAnPM8Xm6O8t
         Y9Cj8f2pstMc2DX0lDHuYXpjKAdjddXL9f+8z98wI8CG91YgC7nzX1ukrkalMqS+/Hhn
         Jn/Q==
X-Gm-Message-State: AOAM532/a1AYo/tZ+GAGJQovUGyzQdfJ6huiQbgCf81O+3+991PET6Br
        J5Fnlk9TGsp0su3ygDaIlupF2MdEmtB2THaKjN38J6LqSFM=
X-Google-Smtp-Source: ABdhPJzdmjSYFNoVheSNfGQUtn9fdfMUZfPIZ0gRZZPSR/aP5fB6yRhOdI2L93pQkq3yw4LNwj2ZbJ+9XIXuuqKixcc=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr2040790oia.148.1610451988837;
 Tue, 12 Jan 2021 03:46:28 -0800 (PST)
MIME-Version: 1.0
References: <20201223172505.34736-1-wsa+renesas@sang-engineering.com> <20201223172505.34736-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20201223172505.34736-5-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Jan 2021 12:46:17 +0100
Message-ID: <CAMuHMdXq=k8Aic6Re3Gsyh7fdAmCz9eVtE5BrSUmoWAU0epevg@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: Add I2C support for falcon board
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Wed, Dec 23, 2020 at 6:25 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> [wsa: rebased]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  .../boot/dts/renesas/r8a779a0-falcon.dts      | 28 +++++++++++++++++++

Shouldn't all of this be added to r8a779a0-falcon-cpu.dtsi instead of
r8a779a0-falcon.dts?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
