Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CEE22DD049
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 12:25:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgLQLZj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 06:25:39 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:44233 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725930AbgLQLZi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 06:25:38 -0500
Received: by mail-oi1-f176.google.com with SMTP id d189so31772896oig.11;
        Thu, 17 Dec 2020 03:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CH4KoqxRsgraw3GD+qjjgNC8h8ZHHCh0rHY2dORvgVE=;
        b=kyL+EXWY0atxIub+6okHfUV839m/VYqN2YCoPNKWN8ZGICNSmBVPp64uBXl3nzoeW6
         KNnW8X1ddnsYG+ozVeFj9sUlprcvgQAAcb5bs1w705NchXXSGCzuvTBtb53W3NM9B4b7
         SLH6PeTfh4qVWr1D+ZX2+mg5L2puEziCkrjmoWnPCwaiDoa1hrhTwBYs1BOMg5HuEMt+
         YIRmx3vAnBgwraCxTu90t0MXbvaTLSb8rbegN1jXB5YwGhiBbDKlPV1QKHPIUIfjMQyF
         DQr7t3x3OuyEXzYZA0qxwZbvAS1W7pYq87Xip4vEeagsEZvwOpD7T/F9ynZhYHejpdCx
         auAg==
X-Gm-Message-State: AOAM532XTO8xvYAms5yyg+Xf0i3CO8S1VSZWGnhSjKxmju3Vxfk6hduZ
        foLbkSJ1aHRn09F/GQwXcCVAgzpDeLMspTg9P+HRw8iU
X-Google-Smtp-Source: ABdhPJwvb2isWSCHbGaLy5xA85ukO4Mnju+l4F8u/T64MqBluzT4og9hnca8qu/uO806tgaiN6zVupuJkT+KFSn6Ckc=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr4472522oia.148.1608204297458;
 Thu, 17 Dec 2020 03:24:57 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-10-aford173@gmail.com>
In-Reply-To: <20201213183759.223246-10-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Dec 2020 12:24:45 +0100
Message-ID: <CAMuHMdVZyLVRrrRKeE2nDqAEyQtrQSBwmVRGb_ORD0R6C3UNhg@mail.gmail.com>
Subject: Re: [PATCH 09/18] arm64: dts: renesas: beacon: Fix RGB Display PWM Backlight
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
> The backlight didn't really work correctly due to some updates that were
> made in hardware.  It should be safe to apply these, because the older
> hardware was never shipped to anyone, so it shouldn't break anything.
> Because the display driver refers to the display as DPI, this also
> renames the backlight to use DPI for consistency.
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
