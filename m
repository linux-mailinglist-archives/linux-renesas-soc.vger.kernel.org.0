Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6F09300031
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jan 2021 11:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727187AbhAVKZ3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jan 2021 05:25:29 -0500
Received: from mail-qk1-f173.google.com ([209.85.222.173]:37384 "EHLO
        mail-qk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727973AbhAVKYk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 05:24:40 -0500
Received: by mail-qk1-f173.google.com with SMTP id h22so4606431qkk.4;
        Fri, 22 Jan 2021 02:24:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D4xyWvJd0WQhoba1JvK+CVM+ObhZqX1GLAzkWEi51KY=;
        b=ZzsPuZAj4hAKu4/zWg/6ti+jIDO7hGsh/5ST+AwExtpH7/KHruDIjDlpw3gae7h7P/
         OKKIdBE1iYZze75GOfPWOZjfQSn9vA4/8yuJcodKCA4tkZabYJOXRVH/T/Qp8nKnltG1
         jOZu51woZ9T30S7YtZcg0dK3O7Aw2OlzyYl8Byz6eP00tOVdrmn3O3dqCjA4Eu4JLwaN
         zibt3YQA6ZWL0NlNKaGnX4fJd+U6RgEBWnacQHc3fkfTcgAyF1C8IIn0VVrKTayi0E3p
         47QzD85nrU05CDUp6cFup14TtNcbWQBFlL3MN0fiuOCPk3G6H2pyLErttvoR3EGsd1I4
         6MpA==
X-Gm-Message-State: AOAM532J3MZBP1j6MGStqh5B777A8yL5E1aV8wL1G6MfDdziBcYHA5mS
        wScZPEBTtqJu5riQ02N8vc9PrZyGroHVPF8yqSI=
X-Google-Smtp-Source: ABdhPJxP8xuLCKDXPGjecsOw3R++y/Dp+lR7nxfBpnjyU1JcsmSF4+wwAvijTtYt9nn7d7OqTw7cQbLS+PXPW3H+bD8=
X-Received: by 2002:a37:4c88:: with SMTP id z130mr4041558qka.122.1611311038016;
 Fri, 22 Jan 2021 02:23:58 -0800 (PST)
MIME-Version: 1.0
References: <20210121100619.5653-1-wsa+renesas@sang-engineering.com> <20210121100619.5653-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210121100619.5653-5-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Jan 2021 11:23:46 +0100
Message-ID: <CAMuHMdWTi2_oCbpxewVBzr1fsva1voC9PNE5SU=Y80spgyMcDQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: renesas: falcon: Add Ethernet-AVB0 support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 21, 2021 at 11:06 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Change since v1:
>
> * removed avb1-5 which couldn't be tested
> * added alias for avb0 so firmware can add MAC address
> * added custom tx-internal-delay-ps
> * dropped '_tx' suffix from 'pins_mii' config
> * moved entries to Falcon CPU dtsi

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
