Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA7463A2B7B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Jun 2021 14:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230238AbhFJM2g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Jun 2021 08:28:36 -0400
Received: from mail-ua1-f53.google.com ([209.85.222.53]:36417 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbhFJM2d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 08:28:33 -0400
Received: by mail-ua1-f53.google.com with SMTP id p9so1210263uar.3;
        Thu, 10 Jun 2021 05:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ppd1Jz5aBQsbrPJtjVVbRRcX70U5zYeai4zzqRqUEIM=;
        b=MsAyqJ2DyhrecQG31PSwWA8Fgy7etaErJqZNCzMLUru1ZJowHGBOhhyu2XWP/LS6dr
         zF4uNSfvcqie1/erJFPgiymNnzyQ5gHUqIksDeaBAL4UaNU+KhRNP9nkmIndks4Kkh+s
         p6+EeubfyFG0NaLzrEZ4BHC8XnckdsX2fNpE+7K1DR0QXEr7UnYWb1pWl4t2wSAmY1Kd
         uWPGW1ZkK57iluo5aGqgVAZiP0NbD1i9IKeXzEe2udThJGJ5BivZBM6fFOaa6Mgr1yhS
         EvEA6kliimZafsw/tPNmjpDN5spFdlpJ3zle8MGM4ZolLbo/IPD23AszaF53hhmhVjtL
         0tgA==
X-Gm-Message-State: AOAM530pB+xwNOUV5sBsGTpyhcMB+CaEDqhv2d6yaRbGmcnbQUOG73ks
        Fv3S1ujzSW/7TYuDt6zASbZGcwS9O2c0hYj7m/uMez3cFyk=
X-Google-Smtp-Source: ABdhPJwL2HfQFWxduhZTBOzYv1lmqfHraGJHjKlwBl+vYAp4R7ciWH6Rc65GOkfbE5uz/+F4ZwEeGsUdZDgTzSeYahg=
X-Received: by 2002:ab0:708c:: with SMTP id m12mr4164941ual.4.1623327989993;
 Thu, 10 Jun 2021 05:26:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210609163717.3083-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210609163717.3083-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210609163717.3083-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Jun 2021 14:26:19 +0200
Message-ID: <CAMuHMdV++2DxhUG+9huDpZAvJ+D9K66ythvJiNTozWE52ZW1Xw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] soc: renesas: Add support to read LSI DEVID
 register of RZ/G2{L,LC} SoC's
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 9, 2021 at 6:37 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Add support for reading the LSI DEVID register which is present in
> SYSC block of RZ/G2{L,LC} SoC's.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.14.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
