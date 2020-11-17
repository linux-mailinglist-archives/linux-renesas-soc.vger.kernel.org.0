Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44C7A2B5F0C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Nov 2020 13:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727214AbgKQMZn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Nov 2020 07:25:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:42196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726360AbgKQMZm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Nov 2020 07:25:42 -0500
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 478CD2222B
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 12:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605615942;
        bh=0liBQZ3fyaYcn+0GPjn/h0KxA3ULKq+6ZLeklbw0L1g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iOQIABZznf3kaMsQJ089m9BqM4KPijSv3J7iBMCVbWvakub7xOTb1khwpZoWKgFY8
         f3LO/orX/gLtgtlID5U35KrUXyJqbTr6DU342or3IBCkFgsdfouwfXg8AYpWbGjOYR
         QgVNt2bK+HkU5q3ZskOYAs1k0ZC9WkVsrgtGyWGA=
Received: by mail-oi1-f175.google.com with SMTP id t16so22297170oie.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Nov 2020 04:25:42 -0800 (PST)
X-Gm-Message-State: AOAM533U3p1bm90FocWzNskoD3Nivx7zAT7ozlZefH4aNGExb7rT0NKb
        fLK0tkBCO+SsRT70thYx+2yREk2oExos6ho7YCE=
X-Google-Smtp-Source: ABdhPJyB14jzO4SxZk3o3iPe7sJec+sG/wh8GN0Zo81loUdykqrfx6uWzsswg0o3BrVSIFKZljZNKQ56OGWSZSZKBoM=
X-Received: by 2002:aca:4e42:: with SMTP id c63mr2281127oib.67.1605615941449;
 Tue, 17 Nov 2020 04:25:41 -0800 (PST)
MIME-Version: 1.0
References: <20201117103022.2136527-1-geert+renesas@glider.be> <20201117103022.2136527-3-geert+renesas@glider.be>
In-Reply-To: <20201117103022.2136527-3-geert+renesas@glider.be>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 17 Nov 2020 13:25:26 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1CAmC3=QFA1EryDsx0aR-OF+=mf=Xj9cPrObe+qRoJKQ@mail.gmail.com>
Message-ID: <CAK8P3a1CAmC3=QFA1EryDsx0aR-OF+=mf=Xj9cPrObe+qRoJKQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] ARM: shmobile: r8a7779: Use ioremap() to map INTC2 registers
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 17, 2020 at 11:30 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Replace using the legacy IOMEM() macro to map various registers related
> to INTC2 configuration by ioremap().
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

The patch looks good, but since you are already touching these __raw_writel(),
could you turn them into normal writel() to have a chance that this works
on big-endian? It could be either a follow-up or merged into the same patch.

       Arnd
