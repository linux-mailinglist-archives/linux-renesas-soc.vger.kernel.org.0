Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C4E3A66A4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 14:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232968AbhFNMfI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 08:35:08 -0400
Received: from mail-ua1-f52.google.com ([209.85.222.52]:34367 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232809AbhFNMfI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 08:35:08 -0400
Received: by mail-ua1-f52.google.com with SMTP id c17so5381382uao.1;
        Mon, 14 Jun 2021 05:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CEFwGKLbEgGfMJcaaL7Ls1kPKbVf05uz7xjyJakpttw=;
        b=G3EEkLVRaTYwX6IOjgDxiiNmo5eUBV12J/EpecFy1zYJrOpAz+bS3nP2YECW/nMHEV
         JmpO9pPgXVinxP1kyqysZJGC2PVdx17GQlleepRwRODFFyxF6CGXKCWQxCXA+qPYsmqW
         F2iubT50IHn7bttglVxwsgRHh/pqPNnUoIzNGO2a9iX9YyO7JwK8IrLZUgHf0qf+OKLm
         a5ocF55OdDlbf9+VzO/RcWBevQW8t4s5SHFAMJcc4Le5Wc5oY0MgP+FByzbzcu+W1i8P
         Y9J0nNkYwCJa7YTVZgEhjv0oQ3eMtmFRGlv7qWybI/OiTzWmrWuEbA4AUzL5e1A9kuur
         wM+w==
X-Gm-Message-State: AOAM530tdA7v1DNkyBcXwsT/6N2niDyL27FB5lY9XMq3dTGNz1lVGdVB
        y8Z8NEmvvjq5uwc/w/3l4ZwG+Cu9uNx1WZEHuOA=
X-Google-Smtp-Source: ABdhPJz8NHYZSrdHnQGG700V75mhrUJyxgoNq8eb1bPXuRPGJ3ZTMrbo+3HFqEbHtQGRH8i2pY5g5vrwNJq7+c78rCA=
X-Received: by 2002:ab0:71d9:: with SMTP id n25mr11398181uao.2.1623673975719;
 Mon, 14 Jun 2021 05:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210611165624.30749-1-biju.das.jz@bp.renesas.com> <20210611165624.30749-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210611165624.30749-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Jun 2021 14:32:44 +0200
Message-ID: <CAMuHMdUJcpPKYyE=Z+exc=0BVE7FXqJ=W+mrBvhqKVy56e0QUA@mail.gmail.com>
Subject: Re: [PATCH 2/5] drivers: clk: renesas: r9a07g044-cpg: Add I2C Clocks
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 11, 2021 at 6:56 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add I2C{0,1,2.3} clock entries.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
