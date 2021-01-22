Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08DE8300073
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jan 2021 11:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbhAVKff (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jan 2021 05:35:35 -0500
Received: from mail-qk1-f171.google.com ([209.85.222.171]:45329 "EHLO
        mail-qk1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727686AbhAVK1l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 05:27:41 -0500
Received: by mail-qk1-f171.google.com with SMTP id r77so4398951qka.12;
        Fri, 22 Jan 2021 02:27:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vIhaoWWM2NuvcKtHLoEI/L9Ww4a1tUHzU1E2WQMOo5w=;
        b=KDeilWXhLdJDNtixRhEP2hRLvuoXPXly9vb7deUsnUKL7K7kVZLHwf95U4lv8+uuBM
         /dI7BXuA95MxyGyn2pAUIKhApHn8O+dFmhezgLgWgDaMvXC8WXBii1NrkIiysUFDuaZM
         mT9dg9uMVdgKUUq9OEj1oF/sOyWu5eX/vOjYJQ3eYHca7i+sYkZ0ShRr/6pm6M1YWv3L
         46o1Z4uo03Lu5ibTPrTRLHuWd05Ro0/1MO1Ce5NnqNrDPxoBgMC7Wvc4Cpniw2/WYQ24
         knmqG91V9gvNQcuWmOe1nQzVz9eSJUc6t+bMIoqA0lxrOXB7zDoTOMwIlPDyjwdxJO/F
         ZWqg==
X-Gm-Message-State: AOAM532hKDS0PU0573mPqbwg4NaMtcL0wYfLw/uJsu9qCEP2bP5fdfa0
        pXMVtQQglZTx7cISPfyZCPfCNPYpnzFyTbCTyr+3eCN4678=
X-Google-Smtp-Source: ABdhPJz5gomdyAhwwTrS/cCraJKQYLV1Xstvybuakg5104eF8OEciWtScQ23mGx0NJemupv6WYheBYeYdD4Ct78hpeA=
X-Received: by 2002:a05:620a:b8c:: with SMTP id k12mr1169848qkh.114.1611311219427;
 Fri, 22 Jan 2021 02:26:59 -0800 (PST)
MIME-Version: 1.0
References: <20210121100619.5653-1-wsa+renesas@sang-engineering.com> <20210121100619.5653-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210121100619.5653-6-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Jan 2021 11:26:48 +0100
Message-ID: <CAMuHMdX1PoB-YNXvtr5dFMKu9OE8TdOB43fRfED_wVV6LhRU8g@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] WIP! arm64: dts: renesas: falcon: Add
 Ethernet-AVB1-5 support
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

Hi Wolfram,

On Thu, Jan 21, 2021 at 11:06 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> PHYs on the subboard could not be reached via remote access. But this is
> the latest DTS snipplet with some fixes suggested by Geert as a starting
> point. Not for upstream yet!
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Change since v1:
>
> * new patch
> * removed rxc-skew-ps property
> * renamed phy-addresses to 0 ('@0')
> * dropped '_tx' suffix from 'pins_mii' config
> * added 'okay' status
> * moved entries to Falcon CPU dtsi

Thanks for the update!

>  .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 160 ++++++++++++++++++

New file r8a779a0-falcon-ether.dtsi?

> +       avb5_pins: avb5 {
> +               mux {
> +                       groups = "avb5_link", "avb5_mdio", "avb5_rgmii", "avb5_txcrefclk";
> +                       function = "avb5";
> +               };
> +
> +               pins_mdio {
> +                       groups = "avb5_mdio";
> +                       drive-strength = <21>;
> +               };
> +
> +               ins_mii {

pins_mii

> +                       groups = "avb5_rgmii";
> +                       drive-strength = <21>;
> +               };
> +       };
> +

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
