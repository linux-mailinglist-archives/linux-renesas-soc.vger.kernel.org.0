Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB35341E1E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 09:44:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408314AbfFLHoj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 03:44:39 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:34618 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405755AbfFLHoj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 03:44:39 -0400
Received: by mail-lj1-f195.google.com with SMTP id p17so6928079ljg.1;
        Wed, 12 Jun 2019 00:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X8qI+K1xZjRK+NdOOz86FF5j+ZtlRB7/6DTVTXKF734=;
        b=HLcuWpu78qmBn5KUTu8DqHqEL2aX91D2bHIakU+ReiOYXYs9go2l2tLuiJepktr6Us
         zep2hHTKGcwuH6RpO+4fx207McZN/RULsYDDrLjDmasS5cY70CuXE2uoeY3l4WqEdm8+
         uuWhkZEzWepTQTxHaCQnpUtpqt9IxOGsxFyH9Ya+XU1LoL3/Eq2DcKfGhDUGyjE8+1GE
         J0MOdjyfgntfH0m+JXaMm2T2BAVKbOwjyfbkybSKW//gvJc5c+BnB1cmChGMtNAtOWa6
         2165CHraqSpzvsopMrfqyDFGubvJXp9ISh7TDIKG81YBvyo5sZ+8R3obWw7b3vvsRSV/
         AyfQ==
X-Gm-Message-State: APjAAAWzoBGMYDMzKsgsLphAh8Vps58JyvFYWVraondHwU1LJJBlfjWO
        YUIPRdEyWVXGW3TTz26xI3VuQBel0OHu4nhMH6U=
X-Google-Smtp-Source: APXvYqwqjvmsWovfy3c/DnJKFE/85y6DDp5DqVaHiqxmI7nQIoKcXFnH2pWr0W3phGJ5tzE4bmOKa0Deili3rUO1d5Q=
X-Received: by 2002:a2e:91c5:: with SMTP id u5mr3517346ljg.65.1560325477287;
 Wed, 12 Jun 2019 00:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org> <20190606142220.1392-9-jacopo+renesas@jmondi.org>
In-Reply-To: <20190606142220.1392-9-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Jun 2019 09:44:24 +0200
Message-ID: <CAMuHMdX1c81RMbURNnCRW7OtZbDfSWsKSY+rMc_1GADuLom=ew@mail.gmail.com>
Subject: Re: [PATCH 08/20] clk: renesas: r8a77995: Add CMM clocks
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
> Add clock definitions for CMM units on Renesas R-Car Gen3 D3.
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
