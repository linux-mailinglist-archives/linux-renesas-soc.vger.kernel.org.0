Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCDD52DD074
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 12:35:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgLQLfm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 06:35:42 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:33341 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbgLQLfl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 06:35:41 -0500
Received: by mail-ot1-f51.google.com with SMTP id b24so9423291otj.0;
        Thu, 17 Dec 2020 03:35:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+HNG+75V5cA3JzgDn/KQMUNSxkMeSKfNAPAT6b2lFrg=;
        b=gUYRme7vszfE5udham7MqixEdMaxKzpluMZQqCu4jcd8ezcQXx1JDRJU4LREg5zj8/
         n8nys6QRVyV5wm/DcsZbDJZrna+6qribRm1AYr6RJFgCfOt5B+w87sN3Fj7+ZGVIgLaI
         pwVppnCzx8K2HNXah+bv4TLgm2NNF2Rk+IdffWIzfrzrxE5e9Ji2ZboVKTwCxGe65GZA
         QvJ07SjnUaJmiyxseJdICsFFh1oelFznfdtbLTPY8FHRRrjoUmWb3XC9m24alwkc0kN6
         UVNtrXoTxZBSiDEEsmquK5E4x+rk/etTVYxZ24WaAj31kZo8GxRW3JDShh/EmWSo1xeU
         n/Iw==
X-Gm-Message-State: AOAM532LCai5tj/8/ItHdbCW7YcWQX16va/BTx17TnN8EKzu3j3Mv6vm
        IvRqlDBHhdjLD66Ta5ZxoYyqzKAtfYsddpcPdNXs0GqGWd8=
X-Google-Smtp-Source: ABdhPJyTXAahYsFh818F+sB+G5umDgLpC/RGqQMPW1klvjMlhmiF/jn93hl+YbOkGyNdpR5hVyccDkzeIc/ArRkmbak=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr29039981otc.145.1608204901061;
 Thu, 17 Dec 2020 03:35:01 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-14-aford173@gmail.com>
In-Reply-To: <20201213183759.223246-14-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Dec 2020 12:34:49 +0100
Message-ID: <CAMuHMdW1iOkCYdM=1RqhW_BXquoSydgikBxrtK=Qas8HLZ0hvw@mail.gmail.com>
Subject: Re: [PATCH 13/18] arm64: dts: renesas: beacon: Enable SPI
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

On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> The baseboard routes the SPI to a header which can/will be configured at
> either the kit level or using device tree overlays.  Because the baseboard
> be supporting more than one kit, enable at the baseboard level rather
> than a bunch of duplicates later.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Thanks, I have to trust you on this one, i.e. will queue in
renesas-devel for v5.12.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
