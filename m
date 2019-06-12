Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 721C341E11
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 09:43:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406674AbfFLHn2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 03:43:28 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:42971 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405755AbfFLHn2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 03:43:28 -0400
Received: by mail-lf1-f65.google.com with SMTP id y13so11258696lfh.9;
        Wed, 12 Jun 2019 00:43:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RGbRj2wYsEmztwHw3Pn5AYv2PzA45B/YLiXGtuotTKs=;
        b=nMlrH2MAcekySIjsSxz45bCq4IQW3AfDqrfHn5UVU4U3enko2EF8Fq49+8zEJn1vJM
         Vv9RtMPgUKyWWkjcpLq318MBu8qBdZMhtKotyJNU+WgPOCU0BNBehFUvTDn4v1uztutN
         4oZUJ5qaL3efqzVGING3oVF3eORFMk8g3aoURHaSOT8DIcM6vDH50Xvb1D0AZcsGEnRW
         ONG8sugIS1rxAlwVDMS7ALl0q+n7yh41+Ukj19M9lVNUh1GGh80/KYXq7FJCITkpxgBp
         3+2e7FQCGqgCYzkTa8yVA7/fYAMpwOBZm8ldDfLjVzEE9FS2MUarszCxrXuAIT1fklul
         /Zfw==
X-Gm-Message-State: APjAAAXhLmRo+Pbuad6wotWWNYZtw/toR95bW40wAiLp3StytQOr7CVT
        EHxor2vNARAy98BFMlf+8XTjxqEh+CKpoaxaftk=
X-Google-Smtp-Source: APXvYqxq5md2jQfgVOiyRA4y5E2ZNyXbmM8b5Y9O3ZBQ3tX8KoUwiYzSoIDJH1MeAjdTlMBIWRbEc4WtaVcO388mSNE=
X-Received: by 2002:ac2:5467:: with SMTP id e7mr16915356lfn.23.1560325405807;
 Wed, 12 Jun 2019 00:43:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org> <20190606142220.1392-7-jacopo+renesas@jmondi.org>
In-Reply-To: <20190606142220.1392-7-jacopo+renesas@jmondi.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Jun 2019 09:43:13 +0200
Message-ID: <CAMuHMdWUFDurgWmJgoKZYUxzJFwwK03F0Eca1SEDPk_o65iSwg@mail.gmail.com>
Subject: Re: [PATCH 06/20] clk: renesas: r8a77965: Add CMM clocks
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
> Add clock definitions for CMM units on Renesas R-Car Gen3 M3-N.
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
