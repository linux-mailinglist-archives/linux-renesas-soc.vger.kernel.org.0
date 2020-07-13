Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73E7421D27B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2020 11:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgGMJHJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jul 2020 05:07:09 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41833 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726360AbgGMJHJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jul 2020 05:07:09 -0400
Received: by mail-oi1-f194.google.com with SMTP id y22so10371520oie.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2020 02:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/74WBwfCJeg1JccG0gb8lRtFH3KFFcDKRq7G1gjOV0E=;
        b=fUeBP1issbJjAGOMn/jV9sp+EtmK02XJuRwnt+kkBQRaw3uWi/V/xTKdoY8xA78Gjk
         QkZ4/qgRfiQrk0o0uF/DKupl/HywhMVFdcUlomI20SBfqDKtRzzPA1cHsTMSB6uYpTEb
         Jjy7iKx+3uBi5YAMWHV3Ad7+XKREJDsuJbXwBLfwdpUfzLpmNNSt3gKc+2xmvLe5vO50
         ZXuxlbinC5Qj++xblwufCLuO3cQr6qjwOys1HHmjkJwDxynY9HveatPmCcz622sV6xjP
         qJebx7t1DfUmyrzZ0K04vh4MdmXeoC1lgfkF0t0i1uAquJ9IcNW5PB8xd29GRT9VeIZl
         4egg==
X-Gm-Message-State: AOAM532Pm+Aym9/g5YbVgI/UE8/w+plOjqV1rcN1R3yhaarTCDfWfCew
        /gd008vwOZMV1T0uu2nQqHlmsKBZJY/701ZKCgBwM3m3
X-Google-Smtp-Source: ABdhPJxNrUETYlNNoVLpiO0JJzHxEqDKqKMK65bdNKt1zRUxy/u/dThjqAt4HBaXPz5wI4uxCPUwMmnuSXamvbudOyM=
X-Received: by 2002:a05:6808:64a:: with SMTP id z10mr13177970oih.54.1594631228547;
 Mon, 13 Jul 2020 02:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200704155856.3037010-1-niklas.soderlund+renesas@ragnatech.se> <20200704155856.3037010-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20200704155856.3037010-3-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 13 Jul 2020 11:06:57 +0200
Message-ID: <CAMuHMdVnTkB6UwNpY-Rb-rMHZj6kZAh9x7xiUPSYvASiNTgr4A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: renesas: Remove unused remote property from
 adv7180 nodes
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

Thanks for your patch!

On Sat, Jul 4, 2020 at 5:59 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The remote property is never read by the driver, remove it.

More important: the DT bindings don't mention this property ;-)

Still, there are a few references left in examples:

    $ git grep "remote =" -- Documentation/devicetree/bindings/
    Documentation/devicetree/bindings/i2c/i2c-demux-pinctrl.txt:
             remote = <&vin1>;
    Documentation/devicetree/bindings/media/video-interfaces.txt:
                     remote = <&ov772x_1_1>; /* Remote phandle */
    Documentation/devicetree/bindings/media/video-interfaces.txt:
                     remote = <&csi2_2>;

> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
