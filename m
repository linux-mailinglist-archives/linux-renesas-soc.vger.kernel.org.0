Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D80A27591A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Sep 2020 15:48:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgIWNs4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Sep 2020 09:48:56 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46472 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726606AbgIWNs4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Sep 2020 09:48:56 -0400
Received: by mail-oi1-f193.google.com with SMTP id u126so25045118oif.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Sep 2020 06:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yMSUjjemLY2pmap8SX7Xf0ueSTJnlfLlFEm5h11huts=;
        b=YR8ejQaTUmSS+NLn1QzO1FJrqMrJuSevSUzSb0MfaAv+pgX53NT0PGsaROtf5s4ZZM
         7o9O7kIK40BqseF97xvlNASZlMRsRegadmrs6u/eQ5kl1he/H80Ibr9VoMF6VVXa7gab
         wwgHIQ0JTbZ2nqGkKb/iXaKds+t5k3hvf9GazCbZdSPx992vmq0Gy9VWDLjxaEy8rcoa
         +Up3TY0RjLMSAlaPwwBxoKMY9tK4/8EBAk5q/h9pSGHAAVeOl0B/bslmkLDqQFlndCSQ
         RI6iEw4hv3ZIu+uvekXX/aY7mHWE9GJYosjrUhqIACR/ThXOH6ETLuli0Ec5ivMAazs4
         O3bA==
X-Gm-Message-State: AOAM5312JBcel90Bg57z2JwNPFNOxi9kw3BYdlUSmiNPFuEIFfTo5nqY
        2TUFhcXSef6ACUkx5G1735IInc8NKgP05ifpzBl8wRnZ7X8=
X-Google-Smtp-Source: ABdhPJygAFX6RkdeUVCBRYkaczwuTd5McIi643D1JUTOg8dd9ywesQMb3TyA/Mq6bVvrfwUw0+Gx02Ig7b8pmqFmWgg=
X-Received: by 2002:aca:52d6:: with SMTP id g205mr5764582oib.54.1600868935782;
 Wed, 23 Sep 2020 06:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <160056199852.9912.5581183514421117508.sendpatchset@octo> <160056201373.9912.14240039764408484073.sendpatchset@octo>
In-Reply-To: <160056201373.9912.14240039764408484073.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 23 Sep 2020 15:48:44 +0200
Message-ID: <CAMuHMdXrH6=rgDdWhVJ-W9vtwYadU=BYA7kzJ_=HknZKWxAj2g@mail.gmail.com>
Subject: Re: [PATCH 1/2] r8a77961 CMT0 device exposed via UIO
To:     Magnus Damm <damm@opensource.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Magnus,

On Sun, Sep 20, 2020 at 3:04 AM Magnus Damm <damm@opensource.se> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
>
> Device Tree modifications to expose CMT0 via UIO, code to add UIO driver
> debug code and also adjust the compat string matching in MODULE_DEVICE_TABLE()
>
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Thanks for your patch!

>  arch/arm64/boot/dts/renesas/r8a77961.dtsi |   10 ++++++++++
>  drivers/uio/uio.c                         |    3 ++-
>  drivers/uio/uio_pdrv_genirq.c             |   10 ++++++++--
>  3 files changed, 20 insertions(+), 3 deletions(-)

Please don't mix DTS and driver changes in a single patch.

> --- 0001/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ work/arch/arm64/boot/dts/renesas/r8a77961.dtsi      2020-09-20 06:37:14.578864063 +0900
> @@ -453,6 +453,16 @@
>                         reg = <0 0xe6060000 0 0x50c>;
>                 };
>
> +               cmt0: timer@e60f0000 {
> +                       compatible = "uio_pdrv_genirq";

Please use an appropriate compatible value, describing the device.
DT describes hardware, not software policy.

> +                       reg = <0 0xe60f0000 0 0x1004>;
> +                       interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 303>;
> +                       clock-names = "fck";
> +                       power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
> +                       resets = <&cpg 303>;

status = "disabled"; ?

> +               };

While at it, please add the other CMT instances, too.

> +
>                 cpg: clock-controller@e6150000 {
>                         compatible = "renesas,r8a77961-cpg-mssr";
>                         reg = <0 0xe6150000 0 0x1000>;
> --- 0001/drivers/uio/uio.c
> +++ work/drivers/uio/uio.c      2020-09-20 07:58:51.295172430 +0900
> @@ -11,7 +11,7 @@
>   *
>   * Base Functions
>   */
> -
> +#define DEBUG

I don't think this is appropriate for upstream inclusion.

> --- 0001/drivers/uio/uio_pdrv_genirq.c
> +++ work/drivers/uio/uio_pdrv_genirq.c  2020-09-20 07:58:07.417169667 +0900
> @@ -10,7 +10,7 @@
>   * Copyright (C) 2008 by Digi International Inc.
>   * All rights reserved.
>   */
> -
> +#define DEBUG

Likewise.

>  #include <linux/platform_device.h>
>  #include <linux/uio_driver.h>
>  #include <linux/spinlock.h>

> @@ -276,7 +282,7 @@ static const struct dev_pm_ops uio_pdrv_
>
>  #ifdef CONFIG_OF
>  static struct of_device_id uio_of_genirq_match[] = {
> -       { /* This is filled with module_parm */ },
> +       { .compatible = "uio_pdrv_genirq", },

This does not look like a proper compatible value.

>         { /* Sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, uio_of_genirq_match);

Note that you can bind this driver to your device without modifying this
driver, by using one of:
  1. modprobe uio_pdrv_genirq of_id=my-compatible-value
  2. echo uio_pdrv_genirq >
/sys/bus/platform/devices/e60f0000.timer/driver_override
     echo e60f0000.timer > sys/bus/platform/drivers/uio_pdrv_genirq/bind

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
