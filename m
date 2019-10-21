Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 432B3DE746
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2019 10:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbfJUI6u (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Oct 2019 04:58:50 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41435 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfJUI6t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Oct 2019 04:58:49 -0400
Received: by mail-oi1-f195.google.com with SMTP id g81so10371292oib.8;
        Mon, 21 Oct 2019 01:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vHm5aiCWjBZcDp2Bwl98Azy6P0t6W/KZgM3mvJs8JD4=;
        b=ZV3Bud0mmUT1cxtK3ujeXQI9iGze9x0C+kulL2OlKjZCwBj1VaLusKcV/8rmZsNoGe
         R7/Jv8bxP1HluI4U4VhvmPq6Xt+fwtHjiMWt6Jbe28bTnyB45IGrDickAidEx0o2F+bk
         gFTCzmp8lv/3j2H/f9JQVydJjx7a4tCzum8ktQS8XfZfyUdp3y1hwAqqLrf6DZXOmlYx
         YBAct2Xy7r4Dd5aqZQUQqXoWg9X7P3IcOH6GJo3EOpz9/1TsTT0WgDjuzTgnNQhg0rVJ
         +JC7kYnk+XF92LouA6xeOqGTghCyjxnRIx6Xip0LcWLyHx8YUJ74LOXu7meEJKJBoKYd
         hm4A==
X-Gm-Message-State: APjAAAVk0BkgNdTeNmxtScGyLcxaKMa4p70vvY3wpx/q1qg2yZNSE1F9
        ME4YHapnPcQMC+L1GbM8x9wjWH7p6lnfWCXe+praTa1o
X-Google-Smtp-Source: APXvYqyXTokJWyBMaZ88VOmxihiwckill/n3woDR/VvkpjBpxZoQqjk2dhcSLUIPO7UaBfRoPXVw4wI5oluDYGAEBbM=
X-Received: by 2002:aca:4bd2:: with SMTP id y201mr18811305oia.102.1571648328675;
 Mon, 21 Oct 2019 01:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191016085548.105703-1-jacopo+renesas@jmondi.org> <20191016085548.105703-8-jacopo+renesas@jmondi.org>
In-Reply-To: <20191016085548.105703-8-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Oct 2019 10:58:37 +0200
Message-ID: <CAMuHMdW-JYTRAi86NF4sFq-qSqrYkK9HTteRbRC8QUKjeKs+9Q@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] arm64: dts: renesas: Add CMM units to Gen3 SoCs
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Oct 16, 2019 at 10:55 AM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add CMM units to Renesas R-Car Gen3 SoC that support it, and reference them
> from the Display Unit they are connected to.
>
> Sort the 'vsps', 'renesas,cmm' and 'status' properties in the DU unit
> consistently in all the involved DTS.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
