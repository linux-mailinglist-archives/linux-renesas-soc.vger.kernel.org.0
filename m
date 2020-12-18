Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22CFB2DE350
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Dec 2020 14:30:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbgLRNao (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Dec 2020 08:30:44 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:37908 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbgLRNao (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Dec 2020 08:30:44 -0500
Received: by mail-ot1-f41.google.com with SMTP id j20so1875658otq.5;
        Fri, 18 Dec 2020 05:30:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V0B6SpAp400jy0Nr1f4hpRzCMLBpRIAKKSVGziUoQRU=;
        b=Sr4gkXQQ5hjkCPnidBXFgF1Efu4plxWEA59I1DRKy4FXl6PDApn7+yCnQV2eFr8TNx
         vO2/mrc+vRb4/sxq93lh3n7nITI9JNivLoFWmkX0ROBzLiy+7OG64Hf03Pw3gjWZcQgq
         7Ek0btfpeS4apqoQfx9MGwf1BEhFhwUehzQVpdh+aZ55MYSSu15aAev6n2AsIdlT6a8H
         XGZPVEyiydSykO3+uQqEFysdtdqcZcU229BZUhAVuQ31gZg8qIQtRk3AQEhvElDL4GcM
         EFYsDyT94leed3hJ/3NFLWPDW7UsTqOqwZUNoACL0tb5LQPNzFWT5qDQlo9Qv0D/B3UF
         gRJg==
X-Gm-Message-State: AOAM530iHfpnVs3G5PqGnwz8+2Sc9FwB5xG+0WfNj5yvpXMZwr5HOcUR
        34Ow7cviHy+L74BUPkjbodgBbNAz+iysYk7XZL0=
X-Google-Smtp-Source: ABdhPJw8GsWQsuvQUI/YVpjBSgEoFcMekPJFzPxjFcVirzJKXEQ4aKMTs11jPN2JFsVN7d7kt2GgY+i0/pfqnIMecnQ=
X-Received: by 2002:a9d:2203:: with SMTP id o3mr2774435ota.107.1608298203675;
 Fri, 18 Dec 2020 05:30:03 -0800 (PST)
MIME-Version: 1.0
References: <20201216151931.851547-1-kieran.bingham+renesas@ideasonboard.com> <20201216151931.851547-3-kieran.bingham+renesas@ideasonboard.com>
In-Reply-To: <20201216151931.851547-3-kieran.bingham+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Dec 2020 14:29:51 +0100
Message-ID: <CAMuHMdUW7SGSVA9OvKaCnLVWfY4y_gGLqKg9tLhnpUhF2rBO=Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: r8a779a0: Add VSPD clock support
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
> Add clocks for the VSPD modules on the V3U.
>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

In BSP we trust (for the parent clocks)...

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
