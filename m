Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B37B2D760A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Dec 2020 13:53:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405991AbgLKMvR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Dec 2020 07:51:17 -0500
Received: from mail-oo1-f67.google.com ([209.85.161.67]:41275 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405987AbgLKMvG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Dec 2020 07:51:06 -0500
Received: by mail-oo1-f67.google.com with SMTP id q6so1309954ooo.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Dec 2020 04:50:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XODk7vx/kezVA+uqz3mqm8tv6+XzVcvTimopyR1Prng=;
        b=K6AeJpH8X5CDAucdZnxSv1wJZCB1AJWC37MU2gI3V5xWgGb9LlTASRBXejUwIZkoEY
         dg7RY1P5LDiW82MAfvBBveW2I5cg5c5N1aZeYcRNbbjJAmCWeQi1JeLfJJGBOAh9PoXj
         gDaeynKjPO+X/E3olEIBSUg6eAHbaI9iRwT63Rk60/7otd1Cnxd3czT+Gh41Y7mB1VqK
         F3Vy8zVrFoRgEJWvsDL7nA3IEw6490nZm2v9GWiZXS7B3NsHBQ5S4w68xGXHPmqVy9+J
         ASm1GDS6RICe2hMEIzcIPGOm1FLWBF+A/Tk/cySMnzylOBpDRvO2pbVqF5Coof0LigjO
         4XOg==
X-Gm-Message-State: AOAM530THgJythuzuh/81SatG0whchySEevhaBlukCgEJ53UQ7b2JgCJ
        tPh6+BlsmwEGTqlHqoJdkZw+i268DrxhOQQ34mk=
X-Google-Smtp-Source: ABdhPJxHOtYnG5UokysBhZPPFrGNgbSj1B122BEYVje9HRAqlp49iqiep7qqg1aO6vID11sLHDeof8hSsiMk4tUQ/4c=
X-Received: by 2002:a4a:dc1:: with SMTP id 184mr9890120oob.40.1607691026019;
 Fri, 11 Dec 2020 04:50:26 -0800 (PST)
MIME-Version: 1.0
References: <20201210142021.163182-1-julien.massot@iot.bzh> <20201210142021.163182-4-julien.massot@iot.bzh>
In-Reply-To: <20201210142021.163182-4-julien.massot@iot.bzh>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Dec 2020 13:50:15 +0100
Message-ID: <CAMuHMdUp5DJd1eQ9csBWEnG56HU4pV=AEmNKZWid1aT-d_=0Kg@mail.gmail.com>
Subject: Re: [PATCH 3/5] clk: renesas: r8a77965: Add MFIS clock
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 10, 2020 at 3:55 PM Julien Massot <julien.massot@iot.bzh> wrote:
> Signed-off-by: Julien Massot <julien.massot@iot.bzh>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
