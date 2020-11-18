Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 481202B78CD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Nov 2020 09:34:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727105AbgKRIap (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Nov 2020 03:30:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:50390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727743AbgKRIao (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Nov 2020 03:30:44 -0500
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D17D0241A6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2020 08:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605688243;
        bh=Yrkqbbv6K2Tri/mVQfo/ZNBbDZyh45m07w5kYYrVFvc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CI2i1yBBvPa7MG+YkHqlfqNANGDsJh0Hp4Gm2z9RUMmG3DKIiE77v6jmnjm2QHQbD
         4jp9ja4CdHpXCwtsGxuZjqtxZ5nkH9RZQLupdp8kj1FvUWV0ZXHZPIib67c4isj0nL
         E7qrqVkMX+Ao89Y2X6cpPi6Ggso+FdjamYogZPg0=
Received: by mail-ot1-f50.google.com with SMTP id y22so965222oti.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Nov 2020 00:30:43 -0800 (PST)
X-Gm-Message-State: AOAM532zGaIOMeHCo0CD4EVhXU0iifko4vAhkAkUbIZbmW86qqLOPnsm
        97WChIzfj19NqxJOdZ/5GfzPC9oua8BK0gFxfXw=
X-Google-Smtp-Source: ABdhPJxJXpkIVHbBLG9MtRBgAFGdIgQL3qSYUp3BfVR6RpClHTpc9fmE24wdwKfsRbUPTIKf+QkgCAZ5teBX1YZWZ80=
X-Received: by 2002:a05:6830:22d2:: with SMTP id q18mr5302011otc.305.1605688243092;
 Wed, 18 Nov 2020 00:30:43 -0800 (PST)
MIME-Version: 1.0
References: <20201117103022.2136527-1-geert+renesas@glider.be>
 <20201117103022.2136527-3-geert+renesas@glider.be> <CAK8P3a1CAmC3=QFA1EryDsx0aR-OF+=mf=Xj9cPrObe+qRoJKQ@mail.gmail.com>
 <CAMuHMdWTuzxg-a0f5MfPN=66EXcEqLfHCQMhiSAWH04p1BQ2ng@mail.gmail.com>
 <CAK8P3a363pGBYAyGgV1r+evpNk9Cpcu-vE++s7Ma4YB25AW+yg@mail.gmail.com>
 <CAMuHMdVFRXMcOgv5Qa6QgEAKsU31sKDBsTPs6ONdSqLAQZShow@mail.gmail.com>
 <CAK8P3a3QZJjV99Oo=GytUc3q3RkSrtccTC12Vgd=E=UByFX7ZA@mail.gmail.com>
 <CAMuHMdW6aw2M=SiV_pr6oQWaQRDcb9O2P8GRg_WRTjcpL5i4mA@mail.gmail.com> <CAK8P3a3bgbm29z8L66kYo25yKP2EKKLhVZSjS-mcYTO4J2m70A@mail.gmail.com>
In-Reply-To: <CAK8P3a3bgbm29z8L66kYo25yKP2EKKLhVZSjS-mcYTO4J2m70A@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Wed, 18 Nov 2020 09:30:27 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1k27-V3=A5ABHd73HeHy8bi2XWzT+5n-2v+9cO0oUa1g@mail.gmail.com>
Message-ID: <CAK8P3a1k27-V3=A5ABHd73HeHy8bi2XWzT+5n-2v+9cO0oUa1g@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: shmobile: r8a7779: Use ioremap() to map INTC2 registers
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 17, 2020 at 5:37 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > R-Car M2-W boots until DHCP timeout.  Could be due to either sh_eth or
> > the micrel PHY driver, or MDIO (replacing io{read,write}32() by
> > {read,write}l() in sh_eth.c doesn't help).
>
> My guess would be that the sh_eth_soft_swap() logic is wrong
> there, it seems to have been written in the SuperH days.

Coincidentally, we both got an email from the zero-day bot
today about sparse warnings in that driver:

https://lore.kernel.org/lkml/202011181609.lmqkyQnN-lkp@intel.com/

Some of these relate to suspicious endianness conversion, though
the email itself was about missing __iomem annotations.

       Arnd
