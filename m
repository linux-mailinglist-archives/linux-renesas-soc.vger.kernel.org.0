Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 173AA3AC98E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 13:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232720AbhFRLQl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 07:16:41 -0400
Received: from mail-vs1-f47.google.com ([209.85.217.47]:45584 "EHLO
        mail-vs1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232038AbhFRLQi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 07:16:38 -0400
Received: by mail-vs1-f47.google.com with SMTP id k8so2294008vsg.12;
        Fri, 18 Jun 2021 04:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W5XIrf7pnbukFMGFVcj5Vb5Y79Tlhp3OdXuqaVb4DAY=;
        b=S8eEXxO5xvt0j8K9c7VrslyTu/SeFIROnkSC731xKP8ZHm3TUlEMwdIswjLRDhri69
         Isj4aStfnT8Ll4PJHMTLAtYx8qamtmncslwuYLxc1ThJlMJBJY5HcCWDhsoe928kCv5M
         sAafukhFQYyAtZdYJfy8UEoKYSVMPghvLYEG28JSjAgahzpd64hCBClzGyDV39EDKnlU
         A069GEycR/Vq9tW3UhOUno2lawjFLlPMbg1zQvAQhFmxIO8noDnblL20ZVtQqqGfhztg
         sQi8kX7mwZEBV5buHu5OFEzQyoBvZKvd2FbTVX985vT8OC1uvkDDywwEGbqYO6kD4QgC
         Rr8w==
X-Gm-Message-State: AOAM5316WY7+ttXpsX+uSZgtAL9M1YxbLOIcj9skrSV3TdDlhxjjAhPT
        LYLWC6I4nyaTcOYrYp8sXwvVmus/WPGRQsJ092k=
X-Google-Smtp-Source: ABdhPJxx8kjmjW0H/ydGcKDMpYjg+2lDADGtqdiNhyXw4klaqlqxPEMeA4icWAF9vAAZLgCSY36Qv5TtdKFx9fIiFGI=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr6164750vsd.42.1624014869139;
 Fri, 18 Jun 2021 04:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210617155432.18827-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210617155432.18827-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Jun 2021 13:14:18 +0200
Message-ID: <CAMuHMdXY67CbE7zZu4BB=OvJnxDcND+SWWi+U8WxKK0D9tNEBg@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: renesas-rzg2l-cpg: Fix off-by-one check in rzg2l_cpg_clk_src_twocell_get()
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 17, 2021 at 5:54 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Fix clock index out of range check for module clocks in
> rzg2l_cpg_clk_src_twocell_get().
>
> Fixes: ef3c613ccd68 ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
