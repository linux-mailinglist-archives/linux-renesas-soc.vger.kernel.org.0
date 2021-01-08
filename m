Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6A42EF34B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 14:43:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbhAHNma (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 08:42:30 -0500
Received: from mail-oo1-f52.google.com ([209.85.161.52]:36148 "EHLO
        mail-oo1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726784AbhAHNm3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 08:42:29 -0500
Received: by mail-oo1-f52.google.com with SMTP id j8so2387295oon.3;
        Fri, 08 Jan 2021 05:42:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6h/BKOiHPurVD5hwYjqO/VvpSRlHvldE/tYzKXOLQBA=;
        b=rrwdY4GTibvFxon8Bs1SSED9a0RhqgcPgsn8aHMsV1fugfpmEM4A4Fbj/hLviYzT43
         rqsyr2U9CEF+qdEeGQO4z1yS7ObqOQFZLgrBVEVPj9anaCCZUh4eGZeWFaExH4aJKt0X
         kzEotSfUkayIfKiOc2KnLLrsYhEJGaB30afMdCJ9e+bU8a6hE1mJTVR2q5H/LZ7GvQWH
         d062IOr73ZtMlH5eAfDvZuo+mFQyl4cqEKRiDm48yXIJzq+YtPek2WOq4yPy8VipYgtE
         vueeigdeLE0SXCZjsPRsE4caOEoEoIuaAJgsD6ufTIePRqQsDgnS4fZnE1eawiIMQjqi
         i7BQ==
X-Gm-Message-State: AOAM5307W3Qp9R9cw4h+ydMUkqV2buS8iftfVSOaSdDE1Kq5LKzVQ9eJ
        2eS8f4Jb+Pvv9CFqupf+uzfALNSSQE+/9kAtxhA=
X-Google-Smtp-Source: ABdhPJx96F03wjl3phES6/g4RPaXxOEV470i3y9BotU9TwwXWBofgYYYvCrUqUzTRUFOanQS7MCB74XSlHaKSNhAvQc=
X-Received: by 2002:a4a:c191:: with SMTP id w17mr4406231oop.1.1610113308459;
 Fri, 08 Jan 2021 05:41:48 -0800 (PST)
MIME-Version: 1.0
References: <20201224170502.2254683-1-aford173@gmail.com> <20201224170502.2254683-3-aford173@gmail.com>
In-Reply-To: <20201224170502.2254683-3-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Jan 2021 14:41:37 +0100
Message-ID: <CAMuHMdVq1rJ4ma1uVXQ94Xssy2Wr9XK5XVS6ENA6-rXXBPtr0w@mail.gmail.com>
Subject: Re: [PATCH V2 3/9] arm64: dts: renesas: beacon: Configure Audio CODEC clocks
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 24, 2020 at 6:05 PM Adam Ford <aford173@gmail.com> wrote:
> With the newly added configurable clock options, the audio CODEC can
> configure the mclk automatically.  Add the reference to the versaclock.
> Since the devices on I2C5 can communicate at 400KHz, let's also increase
> that too
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
