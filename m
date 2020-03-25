Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 447AE192516
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2020 11:06:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727346AbgCYKGi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Mar 2020 06:06:38 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37606 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726239AbgCYKGi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Mar 2020 06:06:38 -0400
Received: by mail-oi1-f195.google.com with SMTP id w13so1564414oih.4;
        Wed, 25 Mar 2020 03:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XXCY0F7DAXSqojLJLjTu88ZZhdvD+lFAXQtmKEoxEz4=;
        b=Kl3DkjHYzaOS5cCzuIjpvvIpmtDM5Odetpxm7W3f5H/BlfIjfLHpopsdh1oJkHMmYk
         Wx7GEMvTeJjZCgsMjC1kbyHpwwvl4BlFO3OrTBIRcyCKwUcqKWofFmbfV67qXNCDea0z
         To358X9utcaAmBFZBmwbZzl65G0vtMg3ldrcptVbqIyQZO9+Jkg3jRff16o7xZFrK0jI
         1iUzQ/uOzpGsZR9JPHBLDcDW7b9PtMNUbQSpZsYBW2Rw+bh759GAZzW5ZBHiPfeYUN0n
         p0M8VoQq+Z5tIEMFmGQXjdVQYk1xOrbohN7sGZKJxt1CCRNub1KmwC/rbP/0pVvVs7nk
         Ryjw==
X-Gm-Message-State: ANhLgQ32tLYGKcdQTvtCoBiLglUa2p5vIjc9cWfovr69hfOA6ivOFc3J
        tV+4jEGt59jgFEMKtCYfRUqXYJNHOMnGOQB0g03pQg==
X-Google-Smtp-Source: ADFU+vuW1xwLkjmwJ9CC5/w1Y6qQ6FOnIt8Ocx+5lhRCcSaVeMvsDb+qtChtKhI31/obOmSKKa4gSe/IlInpyiczGT8=
X-Received: by 2002:aca:4e57:: with SMTP id c84mr1834888oib.148.1585130797906;
 Wed, 25 Mar 2020 03:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200325100357.13705-1-geert+renesas@glider.be>
In-Reply-To: <20200325100357.13705-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Mar 2020 11:06:26 +0100
Message-ID: <CAMuHMdXfEeNzcgYYxLv-3HKxu+FnHAuGpCWtBFdLVgGB8U==hw@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpiolib: gpio_set_config() cleanups
To:     Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Chris Brandt <chris.brandt@renesas.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Mar 25, 2020 at 11:04 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>         Hi Linus, Bartosz,

Please ignore, obviously I made a mistake with a scripted sent.

Sorry for the mess.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
