Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B7B91DF27B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 May 2020 00:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731214AbgEVWxA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 May 2020 18:53:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:58084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731029AbgEVWxA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 May 2020 18:53:00 -0400
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC99B20738;
        Fri, 22 May 2020 22:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590187980;
        bh=s8VDJ5q/XWeba0JwJLGwDHvWdnM6xBSge8cHIo1DMdI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EDyNLY76iMkjGVhS32UCOKEErCkTNQH2O+HoFaWXBhjQQnP3AMKoGDk3T+8mJWQxq
         Gx9eZMg8Tds+AXe1soZ+kGnxGMy0naxSRCJWMUPBv+gVnIGoJ9M6evKgWREWikw4tW
         HU3H+2efHb7zGiW9rHMWMEQwdAJy7lti26/Fk91A=
Received: by mail-ot1-f42.google.com with SMTP id h7so9491236otr.3;
        Fri, 22 May 2020 15:52:59 -0700 (PDT)
X-Gm-Message-State: AOAM533EjZ7oLTAYrxu+4QstNR07uobgjDXloKtNYDZFRD9oZx4bfcwS
        W8/zdHmG+De1mkyNleKGeBznqt3nh42b1bHbSw==
X-Google-Smtp-Source: ABdhPJxU1+qD6w9ay3ewdggkUSX+5KRHsqDIDY8eLsvHjqoPE2I4T80lfE37U9QbanvESgeWms8o5QSqcw//Nx7f4Ew=
X-Received: by 2002:a05:6830:3104:: with SMTP id b4mr1685905ots.192.1590187979235;
 Fri, 22 May 2020 15:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200522220103.908307-1-anders.roxell@linaro.org>
In-Reply-To: <20200522220103.908307-1-anders.roxell@linaro.org>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 22 May 2020 16:52:40 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLrK=C01S3XAU2zXyrnzje5kX81sFnb24DSWSaptQN67g@mail.gmail.com>
Message-ID: <CAL_JsqLrK=C01S3XAU2zXyrnzje5kX81sFnb24DSWSaptQN67g@mail.gmail.com>
Subject: Re: [PATCH] power: reset: vexpress: fix build issue
To:     Anders Roxell <anders.roxell@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, May 22, 2020 at 4:01 PM Anders Roxell <anders.roxell@linaro.org> wrote:
>

It's soc@kernel.org that this needs to go to with an explicit request
for them to apply. Please resend so it gets in their Patchwork.

> An allmodconfig kernel makes CONFIG_VEXPRESS_CONFIG a module and
> CONFIG_POWER_RESET_VEXPRESS builtin. That makes us see this build
> error:
>
> aarch64-linux-gnu-ld: drivers/power/reset/vexpress-poweroff.o: in function `vexpress_reset_probe':
> ../drivers/power/reset/vexpress-poweroff.c:119: undefined reference to `devm_regmap_init_vexpress_config'
> ../drivers/power/reset/vexpress-poweroff.c:119:(.text+0x48c): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol
> `devm_regmap_init_vexpress_config'
> make[1]: *** [/srv/src/kernel/next/Makefile:1126: vmlinux] Error 1
>
> Rework so that POWER_RESET_VEXPRESS depends on 'VEXPRESS_CONFIG=y'.
>
> Fixes: d06cfe3f123c ("bus: vexpress-config: Merge vexpress-syscfg into vexpress-config")
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  drivers/power/reset/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index 4dfac618b942..f07b982c8dff 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -191,7 +191,7 @@ config POWER_RESET_VERSATILE
>  config POWER_RESET_VEXPRESS
>         bool "ARM Versatile Express power-off and reset driver"
>         depends on ARM || ARM64
> -       depends on VEXPRESS_CONFIG
> +       depends on VEXPRESS_CONFIG=y
>         help
>           Power off and reset support for the ARM Ltd. Versatile
>           Express boards.
> --
> 2.26.2
>
