Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC159257983
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Aug 2020 14:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbgHaMkI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Aug 2020 08:40:08 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:45998 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727852AbgHaMj6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Aug 2020 08:39:58 -0400
Received: by mail-oi1-f195.google.com with SMTP id d189so806849oig.12;
        Mon, 31 Aug 2020 05:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XHCYA5oJZVhGHAJRdQttbshGXKPap8SmMFNE084zhYE=;
        b=VYT6XBeNp9zRLQ50HIL0vTEmeNYppQdjye2UkR3aeF9g3yRTpTUtbqzJQevqcUu6vQ
         Mkzj0ZRvw11IHhjei9JRdt/dxMrBOZRiTLT/ClLnkdmYpHbBGZMJt/cSKzA1+T9Cz1vr
         bZPEypx+6/f+sH8GgdaXCrgGoHsedzf8eoEx6wfctKPmwZxn93Xe+AbSL4bwgCMfPs8B
         H6jkXOE+X+nQj6fUov9AOUbXrL8i5GosIpf+n9xxPYLUo9S7oZZqh5nlIGOQ9f7sYlVl
         2J0DEoeAee/8p0K/0tFWx1WKwFc9dGbUYGFMhkJi69EXrqsLhTKTcVUZCIsd8COkm606
         V5tw==
X-Gm-Message-State: AOAM532TaTZYs61YC4fq3vXoIz283xOYGDCO/Ow7fo7u7Yf+YoMoALc8
        Rz/FSpPvVMJBaDKp8zati3ti2jyo9oGwdWAiNtc=
X-Google-Smtp-Source: ABdhPJy6RwAQBpER2TYEns7lNicV9t7u6BkLfC4+fy0uiInktknQ2cXV1Q/3QV+Y6DhOR53T1Bl37kyVL1xOOF1r/Ug=
X-Received: by 2002:aca:b742:: with SMTP id h63mr596268oif.148.1598877597565;
 Mon, 31 Aug 2020 05:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200826093220.10266-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200826093220.10266-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200826093220.10266-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 31 Aug 2020 14:39:46 +0200
Message-ID: <CAMuHMdUgjvqL8Vb8MCVaZaoOP8ELk0QB0gfsc-7XAA+=9N0jJg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: multi_v7_defconfig: enable CONFIG_PCIE_RCAR_HOST
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 26, 2020 at 11:32 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> config option PCIE_RCAR internally selects PCIE_RCAR_HOST which builds the
> same driver. So this patch renames CONFIG_PCIE_RCAR to
> CONFIG_PCIE_RCAR_HOST so that PCIE_RCAR can be safely dropped from Kconfig
> file.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
