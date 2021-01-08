Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B442E2EF30F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 14:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726060AbhAHNdJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 08:33:09 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:46402 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726215AbhAHNdI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 08:33:08 -0500
Received: by mail-oi1-f181.google.com with SMTP id q205so11274168oig.13;
        Fri, 08 Jan 2021 05:32:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jIc5HQYZP0D1yiv2pxYG9auu4IigSo+Oa/oIpIOuZyQ=;
        b=WasDwmSXdFqpEaKkZM63Y857N1955dvmSqt3UbuLCbN7PHLzSXDlzRtXnsL4wmILyw
         JP8ArKcsLtjfsu7Md7/x2bd+h2QXtCNPUHM97ht7ZUim+hbUFPOoL4Qf9CzPe3PBrKDF
         LbHDQ/N7cnKyBR6SxCk+S4f8oQ9Dp0yIsMpRX8bNd73uKK/ZZ6F39EiBcEQnVd+spj4K
         ZNCvLNpsnrJdUa1It1p2BLyOgsU1Wp78WiENkwhpyvdpfuJJi6v/qFU5IQvVQ+tGCmEF
         7ElrlujY8GryDuOp/EyLvP4lqNBym8VRtdGXgO+DBwxR3gCoMBQZboGsRZ3UtugqRpMI
         31lw==
X-Gm-Message-State: AOAM530tmwO3/8QK25/QcNxalDnIy2NJ2Djv6uhFhlARCJX6x46Mxwcc
        cjLppu+SBrxyYcic2uYPq8fw2yoSxhw8nvE3Gu0=
X-Google-Smtp-Source: ABdhPJyaLxa54Jkbz99WXb6rd12UOsCflopAn20JykdbzdzlkRwm1cDPKUpL41nIIpomZMXmmMhWrp78aqfv/O/zZWg=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr2290800oia.148.1610112747824;
 Fri, 08 Jan 2021 05:32:27 -0800 (PST)
MIME-Version: 1.0
References: <20201224170502.2254683-1-aford173@gmail.com>
In-Reply-To: <20201224170502.2254683-1-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Jan 2021 14:32:16 +0100
Message-ID: <CAMuHMdV7zA+dWm+AY6VdOzUPd=7c=M0iDE2gXJsKuBoZCPK_bQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/9] arm64: dts: renesas: beacon kit: Configure
 programmable clocks
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 24, 2020 at 6:05 PM Adam Ford <aford173@gmail.com> wrote:
> When the board was added, clock drivers were being updated done at
> the same time to allow the versaclock driver to properly configure
> the modes.  Unfortunately, the updates were not applied to the board
> files at the time they should have been, so do it now.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
