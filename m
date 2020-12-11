Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8582D75E6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Dec 2020 13:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392611AbgLKMox convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Dec 2020 07:44:53 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41392 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395257AbgLKMo0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Dec 2020 07:44:26 -0500
Received: by mail-oi1-f194.google.com with SMTP id 15so9652881oix.8;
        Fri, 11 Dec 2020 04:44:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yZreOTwg6dsmLfVxAEOXqo1YmvQP5rW8eCkNMKbZir0=;
        b=Skob6VntJsYS+KtnHGUiouzopQrnAdvtbWrWRmOi/+oeYTxSS68axVNP/xZ9OHpxmg
         RAF55SNL/ddYGKY7OQYZPDh+9/HQrYpFLfCA2+zsTsKGglbaDyawyugYv21vUbwjaZk1
         WLlBOnHs7bkCc0SgAOc5fjZZ7Aq5YKFq3z58dF1+S94E+XqNqq2RmduiZSGfVama6MBX
         iwxdCTfUEckZSoBZDI2PMDum8fyuHGjCwQS8Dnu3n4nHUlA/QF7zp8LlEykbqSYaTinX
         PyW/md4QHORRa3xWzkl7lXogxz+wjo8VHiHp9nAHGJS5D+AnksMgW2Qx9o26pS9D0ggw
         g7xQ==
X-Gm-Message-State: AOAM530QV3xWWnh1Y/L6/kYEZS2EMPbpLUFZtsApIYA4yz/4XEYQXcYz
        Oq1hM62oU3sq98NAat01X/uZU9u0KYACtlCJ7KU=
X-Google-Smtp-Source: ABdhPJyu2A0+qWYVZDkaAE819PxEmiP2rZaP8bOwmMyyGGemORdPLEYfdZwxwP/TiMznQFTgi+hTuMqZxYTX5OsIvik=
X-Received: by 2002:aca:5c08:: with SMTP id q8mr9201854oib.54.1607690625460;
 Fri, 11 Dec 2020 04:43:45 -0800 (PST)
MIME-Version: 1.0
References: <20201210152705.1535156-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20201210152705.1535156-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 11 Dec 2020 13:43:34 +0100
Message-ID: <CAMuHMdWPFDLKh_10_D+yfPAoDgLTgR5nKCxy2Qnh23UDbSFKbg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] [PATCH 0/6] arm64: dts: renesas: Add TMU nodes
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Thu, Dec 10, 2020 at 4:27 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add TMU nodes to Renesas R-Car H3, M3-W, M3-W+, D3, M3-N and E3. I have
> tested this on all but D3 and E3 SoCs which I do not have access to. I
> tested by enabling all TMU nodes in DT and then used the kernel timer
> selftests located in tools/testing/selftests/timers/
>
>     - clocksource-switch.c
>     - inconsistency-check.c
>     - nanosleep.c
>
> The test passes for all SoCs I have access to and I no reason to believe
> it would not also work on D3 and E3.
>
> Niklas Söderlund (6):
>   arm64: dts: renesas: r8a77951: Add TMU nodes
>   arm64: dts: renesas: r8a77960: Add TMU nodes
>   arm64: dts: renesas: r8a77961: Add TMU nodes
>   arm64: dts: renesas: r8a77965: Add TMU nodes
>   arm64: dts: renesas: r8a77990: Add TMU nodes
>   arm64: dts: renesas: r8a77995: Add TMU nodes
>
>  arch/arm64/boot/dts/renesas/r8a77951.dtsi | 65 +++++++++++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a77960.dtsi | 65 +++++++++++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 65 +++++++++++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 65 +++++++++++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 65 +++++++++++++++++++++++
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 65 +++++++++++++++++++++++
>  6 files changed, 390 insertions(+)

Would you mind if I would squash these into a single commit while applying?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
