Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC7C3B19CE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 14:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbhFWMYo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 08:24:44 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:45842 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230019AbhFWMYo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 08:24:44 -0400
Received: by mail-vs1-f53.google.com with SMTP id u10so1295966vsu.12;
        Wed, 23 Jun 2021 05:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J92JJ9AxLYD6AuIc0R+ExvscUVC8iOEpXyazWOseHlw=;
        b=he+jLlrqSTwGqse/pcSy0t+WL+e3Vdsh1Zzpn8Vp9B92rZ0TfwDwwRqutksuIQFwI7
         PZfN5K5SwHx3039SyI0arVk+uT3ilaTkKQxQqm+NpS6WnM3vzcOAqZWDsL57O3CUwshF
         MLQAHBHUUkdpnVmb2g+1++F+TNtU5kEtD5W9dtponMuBQk78mUL5gCWf4knKiwg1AboW
         N0TeUYrUKbFu8JpiIdRiW5NUdEudLmFp7ZN4u4RQ3TuuZjBuaJOjtkKHGwRn1E6SB/3R
         juWvap5vCBoEUtG6bdgsraVVc6j6GKlRqp30ImP3ijPGj5TjiSF69x0W2HqNEl58YL3a
         pGgQ==
X-Gm-Message-State: AOAM530UhwDGsB0YxUpYEU/tCxhkntr+NDCM2bvuu90tfRwUIZbd6jU5
        8vvu3TWor4l1UG6dJXl6F1t9aSyyorkI9MoVZu9fgRUFz8174Q==
X-Google-Smtp-Source: ABdhPJz5D7ANzBG3ARnUXyB0HGg7R2bFlFTdnmV9tm5GBl1FUvfAL0+DEnwlR8FSwxqheFLVsI4SgodqNfHV10xhidY=
X-Received: by 2002:a67:7787:: with SMTP id s129mr23344134vsc.40.1624450946217;
 Wed, 23 Jun 2021 05:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210622232711.3219697-1-kieran.bingham@ideasonboard.com> <20210622232711.3219697-3-kieran.bingham@ideasonboard.com>
In-Reply-To: <20210622232711.3219697-3-kieran.bingham@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Jun 2021 14:22:14 +0200
Message-ID: <CAMuHMdVDo8TKg1E1NoM_TQdP7iFbZWzHjo9K2kFJDbeeRb_CfA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r8a779a0: Add the DSI clocks
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 23, 2021 at 1:27 AM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> The DSI clock is incorrectly defined as a fixed clock. This
> demonstrates itself as the dsi-encoders failing to correctly enable and
> start their PPI and HS clocks internally, and causes failures.
>
> Move the DSI parent clock to match the updates in the BSP, which
> resolves the initialisation procedures.
>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

Fixes: 17bcc8035d2d19fc ("clk: renesas: cpg-mssr: Add support for R-Car V3U")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.15.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
