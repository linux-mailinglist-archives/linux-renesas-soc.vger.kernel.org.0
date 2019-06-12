Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 743AE41DF3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 09:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406494AbfFLHlp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 03:41:45 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41440 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405892AbfFLHlp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 03:41:45 -0400
Received: by mail-lf1-f65.google.com with SMTP id 136so11272197lfa.8;
        Wed, 12 Jun 2019 00:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JYIEM0By4Zml2APKo9kMoUOCpHgMMOI9vYqugrTzfJ4=;
        b=mu7vaMsr5ct6+NL0hjQLAIbSH4pSyYG0pXdPq2Ivg0Zmzijy6LJBoalc6GssgtGJW8
         5i63pmtQHj7dFcvQHJNkwJ8x5lxhPVlBymACAZ/9fxTEDBeAyH86geu3lAURxkPVYbGl
         klhK+DmKM2/lNVhj2eLUvWKgFBVOc/upL/efu4h3XoNheFWgQldF28cp5nqRvoRQQVi+
         0WGxpe+Yy2XLWSgIR8+fMFvyycnVOg7crXiXfyHCY6Gww0rffni0WrSVJQaBRlzDtgzI
         SwL4tKTGaJDM6jELg9VvXVg5xGWjJVRiw6kg3Ak6Ub1kKQYcJVedBt8sswK0E1EJQOGT
         GTfw==
X-Gm-Message-State: APjAAAWFTkCW+ETGWD+E93LkfRGfhnSW9ZEb6/7qcSxUEPWdJGnoJJYz
        iar5WqAkOENZyLjGofUlJPe20bMNJ/S8Qv6U9C8=
X-Google-Smtp-Source: APXvYqxNWO112XoEICin1Gc2AixC1ryiZ2+yQ/6LHGjJqk9DSDbjt602mUpBhRPDAAnQkXNG4MO8aCXhg9mFaxQk8j8=
X-Received: by 2002:a19:4a49:: with SMTP id x70mr2792205lfa.151.1560325303275;
 Wed, 12 Jun 2019 00:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org> <20190606142220.1392-6-jacopo+renesas@jmondi.org>
In-Reply-To: <20190606142220.1392-6-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Jun 2019 09:41:29 +0200
Message-ID: <CAMuHMdUGGq7bwb+hPRjxadZodB-PUOQudyJZrrnnPr+XvWk_tA@mail.gmail.com>
Subject: Re: [PATCH 05/20] clk: renesas: r8a7795: Add CMM clocks
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 6, 2019 at 4:22 PM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add clock definitions for CMM units on Renesas R-Car Gen3 H3.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
