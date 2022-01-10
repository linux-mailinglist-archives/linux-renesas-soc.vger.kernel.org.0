Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD04F489916
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jan 2022 14:02:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235189AbiAJNBg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jan 2022 08:01:36 -0500
Received: from mail-ua1-f54.google.com ([209.85.222.54]:43662 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235159AbiAJNAT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jan 2022 08:00:19 -0500
Received: by mail-ua1-f54.google.com with SMTP id i5so23160734uaq.10;
        Mon, 10 Jan 2022 05:00:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c+WSoOZSLfe+3ubRX3qKEV+/g4DwW+r0hvnbkW/lOq4=;
        b=MjbCcyXptLYiyK6nyGJwG/ojeCYIfTHGJbhIjQXnRPb4Q8AB7pylYPRTJzPoJKpPzH
         LyD3+jB8b/QI3/iEXrsQ51aql9u9+8CrpYaLtVj6RlFVN+yapkxTfgdUHwXSr3aHHjBw
         +i3ZyR8pj+rmzfPcDGIURTbz+KQ/ovY07uejgowN39ToXGc5OS333zeoKfnV9/AU/gMb
         KdgXEt9+x4p/BUTp7ZeRUeeIq5OOv09gyd0tPiV9/TEx7cfQHDqiYo/ADluS/TnkJqmD
         QTJYieiluyWSxw9lhjBuXDPO4EtIT+PTsLLvVw/VJqJt2I/kiyEWDlLu8jKF/kchtikZ
         L+Gw==
X-Gm-Message-State: AOAM532ng1oQKnlouW9N2flvbb7o/CJqvhQqpnGC2kM5clexIazBD5z1
        8h8azc2UnxTxe2W4auT43W70GNiYPZU28w==
X-Google-Smtp-Source: ABdhPJwMRpO4AvT3ss5Z7iKLN/I74/3T3Uh8TgebM7JiY5aWYJ+F7rp6ZgOcZKriZ/UQ47kUyrsgFQ==
X-Received: by 2002:ab0:2a48:: with SMTP id p8mr25477573uar.125.1641819617729;
        Mon, 10 Jan 2022 05:00:17 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id h26sm3928690vsl.21.2022.01.10.05.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 05:00:17 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id p37so23196990uae.8;
        Mon, 10 Jan 2022 05:00:17 -0800 (PST)
X-Received: by 2002:a67:c81c:: with SMTP id u28mr24673977vsk.38.1641819616956;
 Mon, 10 Jan 2022 05:00:16 -0800 (PST)
MIME-Version: 1.0
References: <20211115135032.129227-1-julien.massot@iot.bzh> <20211115135032.129227-3-julien.massot@iot.bzh>
In-Reply-To: <20211115135032.129227-3-julien.massot@iot.bzh>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 10 Jan 2022 14:00:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVR6EZa44GJCecWgN+6GNESCyNCsenaEPW7qa-W8-_evA@mail.gmail.com>
Message-ID: <CAMuHMdVR6EZa44GJCecWgN+6GNESCyNCsenaEPW7qa-W8-_evA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] arm64: dts: renesas: r8a77951: Add CR7 realtime processor
To:     Julien Massot <julien.massot@iot.bzh>
Cc:     =?UTF-8?Q?Bj=C3=B6rn_Andersson?= <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Julien,

On Mon, Nov 15, 2021 at 2:50 PM Julien Massot <julien.massot@iot.bzh> wrote:
> r8a77951 as some other members of rcar gen3 soc series
> has a Cortex R7 processor.
> This processor shares the same mapped devices and memory mapping.
>
> Choose 0x40040000 area to store the Cortex-R7 firmware.
>
> Signed-off-by: Julien Massot <julien.massot@iot.bzh>

Thanks for your patch!

> No change since RFC, Geert most likely it sounds better
> to drop this patch in v2 ?

Indeed, cfr. my comments below.

> --- a/arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts
> @@ -34,6 +34,16 @@ memory@700000000 {
>                 device_type = "memory";
>                 reg = <0x7 0x00000000 0x0 0x40000000>;
>         };
> +
> +       reserved-memory {
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +
> +               cr7_ram: cr7_ram@40040000 {
> +                       no-map;
> +                       reg = <0x0 0x40040000 0x0 0x1fc0000>;
> +               };
> +       };

Tgis depends on a specific configuration, and is thus not suitable for
upstream.


>  };
>
>  &du {
> @@ -48,3 +58,8 @@ &du {
>         clock-names = "du.0", "du.1", "du.2", "du.3",
>                       "dclkin.0", "dclkin.1", "dclkin.2", "dclkin.3";
>  };
> +
> +&cr7_rproc {
> +       memory-region = <&cr7_ram>;
> +       status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> index 1768a3e6bb8d..3ee247fc5aec 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
> @@ -366,6 +366,13 @@ soc: soc {
>                 #size-cells = <2>;
>                 ranges;
>
> +               cr7_rproc: cr7 {
> +                       compatible = "renesas,rcar-cr7";
> +                       power-domains = <&sysc R8A7795_PD_CR7>;
> +                       resets = <&cpg 222>;
> +                       status = "disabled";
> +               };
> +

This part is generic, but I think the cr7 node should be moved outside
the soc node (like the PMUs and the ARMv8 timer), as it does not have
a unit address.

>                 rwdt: watchdog@e6020000 {
>                         compatible = "renesas,r8a7795-wdt", "renesas,rcar-gen3-wdt";
>                         reg = <0 0xe6020000 0 0x0c>;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
