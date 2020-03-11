Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05D54181581
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2020 11:08:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbgCKKIZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Mar 2020 06:08:25 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44989 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgCKKIZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Mar 2020 06:08:25 -0400
Received: by mail-oi1-f193.google.com with SMTP id d62so1272582oia.11;
        Wed, 11 Mar 2020 03:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/N+yzapZ4CfcV7bsbXkQFj5z2ofXrJQJFHA0Ipv5B8o=;
        b=m1zJ/z7lnPk0ywDxPqrpzjGF/MBw4d0iiz+Ia4DByxMBLf69oJ3/6NVHcKXbg/h517
         +vyLrgnw3UVedEgzgtXmBEyjH1pJo+ojoNb6OBZcP2vx5ea7uoH7cQq6QDhVPW3t99vm
         IeF6eHiRD0s8BwebH3vyvg8+oH7L98RdkFRVpAFAzrW6xnKdFjhJtTZeDWecrEjLaJ8U
         KE0aKU9ODhNUfNxvlMHpiedjMVYcMkB5A/F5q+IFa1FcKqqyK6EH/rkdfXeS01KhTEQI
         wuFvWka161EinaP8IZlKyazo6Sy5pTR3N0MpbLVhc1hM6IpJqVODA3jwQ1QCp9eSO8jT
         fdXQ==
X-Gm-Message-State: ANhLgQ3oE0QoM3BgwtxA51mEycyg23O8NCMZDJy3ijRhzE1/UFOoS4ZC
        rxXtuFNY9nfJnSmMdR5URQSYeXxMy6uF90K3UM4=
X-Google-Smtp-Source: ADFU+vuJF5N7hcpWcUqis0h4qQPQ9BT3gGHT7sA30i5r95zDWMPwoXmGgIl1ccKJXdZJyPzfyRcoKuUqYhmzJwx2CTA=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr1304567oia.148.1583921304665;
 Wed, 11 Mar 2020 03:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <1583872919-7757-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1583872919-7757-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1583872919-7757-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 11 Mar 2020 11:08:13 +0100
Message-ID: <CAMuHMdVqwLEavjnPgZaevFqjTytAPMmT042yRrcDw9YpkjE3bg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: renesas: Add HiHope RZ/G2M board with
 idk-1110wr display
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Lad,

On Tue, Mar 10, 2020 at 9:42 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>
> The HiHope RZ/G2M is advertised as compatible with panel idk-1110wr
> from Advantech, however the panel isn't sold alongside the board.
> A new dts, adding everything that's required to get the panel to
> work the HiHope RZ/G2M, is the most convenient way to support the
> HiHope RZ/G2M when it's connected to the idk-1110wr.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for picking up this patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts
> @@ -0,0 +1,86 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for the HiHope RZ/G2M sub board connected to an
> + * Advantech IDK-1110WR 10.1" LVDS panel
> + *
> + * Copyright (C) 2020 Renesas Electronics Corp.
> + */
> +
> +#include "r8a774a1-hihope-rzg2m-ex.dts"
> +
> +/ {
> +       backlight {
> +               compatible = "pwm-backlight";
> +               pwms = <&pwm0 0 50000>;
> +
> +               brightness-levels = <0 2 8 16 32 64 128 255>;
> +               default-brightness-level = <6>;
> +       };
> +
> +       panel-lvds {
> +               compatible = "advantech,idk-1110wr", "panel-lvds";
> +
> +               width-mm = <223>;
> +               height-mm = <125>;
> +
> +               data-mapping = "jeida-24";
> +
> +               panel-timing {
> +                       /* 1024x600 @60Hz */
> +                       clock-frequency = <51200000>;
> +                       hactive = <1024>;
> +                       vactive = <600>;
> +                       hsync-len = <240>;
> +                       hfront-porch = <40>;
> +                       hback-porch = <40>;
> +                       vfront-porch = <15>;
> +                       vback-porch = <10>;
> +                       vsync-len = <10>;
> +               };
> +
> +               port {
> +                       panel_in: endpoint {
> +                               remote-endpoint = <&lvds0_out>;
> +                       };
> +               };
> +       };

I believe the plan was to include the existing
rzg2-advantech-idk-1110wr-panel.dtsi instead, to provide the
panel-lvds node...

> +};
> +
> +&gpio1 {
> +       /*
> +        * When GP1_20 is LOW LVDS0 is connected to the LVDS connector
> +        * When GP1_20 is HIGH LVDS0 is connected to the LT8918L
> +        */
> +       lvds-connector-en-gpio {
> +               gpio-hog;
> +               gpios = <20 GPIO_ACTIVE_HIGH>;
> +               output-low;
> +               line-name = "lvds-connector-en-gpio";
> +       };
> +};
> +
> +&lvds0 {
> +       status = "okay";
> +
> +       ports {
> +               port@1 {
> +                       lvds0_out: endpoint {
> +                               remote-endpoint = <&panel_in>;
> +                       };
> +               };
> +       };
> +};

... and the lvds_connector endpoint configuration.

The rest looks good to me.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
