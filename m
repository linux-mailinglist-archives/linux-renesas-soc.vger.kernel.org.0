Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 023AE2DE353
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Dec 2020 14:31:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbgLRNbq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Dec 2020 08:31:46 -0500
Received: from mail-oi1-f172.google.com ([209.85.167.172]:44597 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbgLRNbq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Dec 2020 08:31:46 -0500
Received: by mail-oi1-f172.google.com with SMTP id d189so2752149oig.11;
        Fri, 18 Dec 2020 05:31:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u/uHiSY1jzlikzMCWiqhEl6T7j9N3BvKiPHKYoaFlHE=;
        b=SmQ6wwwxWH3e/vPVfcGCy3YYjLltvhH3FEO55CQYL++ZXv7vgoPFzamiEl2lI6LfEz
         Q3BbfdmFtqXDxrLnAKFel2cpGB/W5rzwh7HqXVLCKuJawF9tWYDZvGXaJsqvQiPRHleY
         vgM41X7o8c870JUEaoBX7EnAeG/cGbk+jYxGfY/xxayw3qnWgf70ks0VRPn/a4ZBlSST
         5h8kHi5/6ERJddcY3of2BstgDGKsJ2cwKTP8vh9Z0SH9dx5QeYykmPncskgWKZXDNgIG
         JPAGWrTWwKSFiXianMDlrnTjkim+dejcH9ChkJ6baTGNQsxnuHGx9TJ7x73yRFdFChjd
         FepA==
X-Gm-Message-State: AOAM531A8m8fpnLLXzP8GuKC13w6qNL2qPmDk2infXITE39KsFMZpXQt
        yNuc5JpnUraU3EGN6gcCHeQgbAiebEY4gB/mKa31A+gOm6A=
X-Google-Smtp-Source: ABdhPJwOatxzDMCcXfAY4GeVr8cxkf4K6NnALS+ss2ITlU60+UnJC15g9HdwZuUPOED5tNdy9jlTK+AKxoGpJyB3sf4=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr1421999oia.54.1608298265381;
 Fri, 18 Dec 2020 05:31:05 -0800 (PST)
MIME-Version: 1.0
References: <20201216151931.851547-1-kieran.bingham+renesas@ideasonboard.com> <20201216151931.851547-4-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20201216151931.851547-4-kieran.bingham+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Dec 2020 14:30:54 +0100
Message-ID: <CAMuHMdXcER3j9z2Uf8-XJjCw7N1Pg-VcVv9gFNNCiUQn_gpDnw@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: r8a779a0: Add VSPX clock support
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 16, 2020 at 4:19 PM Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
> Add clocks for the VSPX.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Let's trust the BSP on the parent clocks...

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
