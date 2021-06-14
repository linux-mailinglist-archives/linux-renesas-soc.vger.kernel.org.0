Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48D43A6638
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Jun 2021 14:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233276AbhFNMFH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Jun 2021 08:05:07 -0400
Received: from mail-ua1-f43.google.com ([209.85.222.43]:34538 "EHLO
        mail-ua1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232888AbhFNMFH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 08:05:07 -0400
Received: by mail-ua1-f43.google.com with SMTP id c17so5350574uao.1;
        Mon, 14 Jun 2021 05:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iVirgZbJ/3t8K0O8AeNgLDusl+GVDtjN0YLnmkaRFcM=;
        b=HMtwRUlg/NU2yNuGpJyLLkubG/56fdaSBKsfqPekP0YywhJG/ElzS2ogRE2eVTlpsv
         UOcNYvYOQGPv84Au5dJQu1gMriyrS3VvS85Aw1td7YZU4m1W5r1HxcPdhVDwnRCU3XfI
         /bG8iuVk34rmcT8Fxk9zN/tiucmwCSI1m0YcFo4i6jrNGz9IA6IYeDWW2vKFUaTvYNhM
         YcauEX1A69/WQz0md1rSqzDiABm8E0YLNfleSwioSY4hletQLNvDo0sAtZkWRzR/ma7W
         tVOD0hTuE2uVc0s6+a3NKmJ934omGiXOuwtpDM1CNlTQewWP1+z/IFYnJJJba6i+jRs8
         F8mQ==
X-Gm-Message-State: AOAM530w9Hlf7+W8woSnc3oM1gWtYS0lAh8z1PE9IwTmDpyTixG7Actm
        1KcDTakZXmGGF+DKPYG6rPLHFpboSz+83uUYlRHT0imSHXU=
X-Google-Smtp-Source: ABdhPJxijJ5sYCmY1CidCaqYJOzCGWDpOazF5nb5m0fXkf4CkYubuJuE/FlbKJ3rkgcG4pDedW6Q5VJiy8NH/BSPWfA=
X-Received: by 2002:ab0:484b:: with SMTP id c11mr11667853uad.100.1623672183693;
 Mon, 14 Jun 2021 05:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210611113642.18457-1-biju.das.jz@bp.renesas.com> <20210611113642.18457-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210611113642.18457-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Jun 2021 14:02:52 +0200
Message-ID: <CAMuHMdW3+FOpBkuft_yPca29JbnMG9SZdjUA0wV6-6MZt2qiVg@mail.gmail.com>
Subject: Re: [PATCH 2/5] drivers: clk: renesas: r9a07g044-cpg: Add DMAC clocks
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 11, 2021 at 1:36 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add DMAC clock entry in CPG driver.
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
