Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3324C3F755A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Aug 2021 14:48:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240908AbhHYMsU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Aug 2021 08:48:20 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:40506 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240915AbhHYMsT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Aug 2021 08:48:19 -0400
Received: by mail-ua1-f50.google.com with SMTP id y36so14388084uad.7;
        Wed, 25 Aug 2021 05:47:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DZzUFmdq2anom2dMHyGc4RtISAvMnamc9GsCNK0ln/Y=;
        b=QE8P7Zq9EOMdLpphnzr5x27UfASjdHb3KgKTSSBZAkHmjPUx80laA0IwggxSpWM3zd
         PaBR82lvczg4xrwFEG3rLYkG5e9/IXB8MXCRvm8kI0PvlzU5Z5n8V/Zl7BPeA2qj8ef5
         ZBbAG2C06dWSi9MCJO0wTXI0uePXIPVz+uPnnbwxH5VAZZM/FWecxNZsQSVkkYLP0CKg
         yPIcCwl3QG0nt09HrbxM2u3msaYoCquoncdcqApDuTDVostH4LkQ/BNAO+U0Ka2YEhTw
         njHUNYWqcJRoN+dWirWZPWqn7N2vlPQ9vQ/TyyMQs3b+mEZDqDHgqt7HZNSreNwS8UDu
         NJJg==
X-Gm-Message-State: AOAM531jWRdE9fYC2grQ3mgTVvEd0NysLaM/2zbj8s9TE0T0f7LXb4wr
        Iovrsm55LAQzr47EQPYkSEhijNeeiYwjqLqDJOI=
X-Google-Smtp-Source: ABdhPJy4tXEuS2V3Pan5F+TEJ1Im3XNO/x5SUh9FCa7fmIrqUxSPuHrsUlaQYpnxK7Rcc4uvFnBIJfYTXr+DwyNzgZ8=
X-Received: by 2002:ab0:209a:: with SMTP id r26mr1743786uak.14.1629895653806;
 Wed, 25 Aug 2021 05:47:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210825122757.91133-1-aford173@gmail.com>
In-Reply-To: <20210825122757.91133-1-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 25 Aug 2021 14:47:21 +0200
Message-ID: <CAMuHMdV1Cd23aaVKq1PyXHrc6W9FyikKOCpD0-PZqkgbVFbA5Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: beacon: Fix i2c2 speed calcuation
To:     Adam Ford <aford173@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

CC Wolfram

On Wed, Aug 25, 2021 at 2:28 PM Adam Ford <aford173@gmail.com> wrote:
> The desired i2c2 speed is 400KHz, but when measured on a scope, it
> is incorrect.  The driver can use the i2c-scl-rising-time-ns to help
> calculate the proper setting to get exactly 400KHz.
>
> Fixes: 900d9fc3bece ("arm64: dts: renesas: beacon: Correct I2C bus speeds")
> Signed-off-by: Adam Ford <aford173@gmail.com>
>
> diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> index 2692cc64bff6..987357c58390 100644
> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> @@ -328,6 +328,7 @@ &hsusb {
>  &i2c2 {
>         status = "okay";
>         clock-frequency = <400000>;
> +       i2c-scl-rising-time-ns = <50>;
>         pinctrl-0 = <&i2c2_pins>;
>         pinctrl-names = "default";
>
> --
> 2.25.1
