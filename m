Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51FDB49B28D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Jan 2022 12:06:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbiAYLGJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jan 2022 06:06:09 -0500
Received: from mail-vk1-f182.google.com ([209.85.221.182]:42686 "EHLO
        mail-vk1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379725AbiAYLEM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 06:04:12 -0500
Received: by mail-vk1-f182.google.com with SMTP id w17so8005504vko.9
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jan 2022 03:04:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tap8uKm8Mgi/5dQ3zaQ8k2fweiRJtSp20OGPCmqaEiM=;
        b=6qNXzCIW/nzZ3fAZK2M8g0DsbWx+Nuhpu/cbFVEF9qtQHYl1jIw/aX+oX6Ush9nU9Q
         bYMOxfg1SKNjm0NFUiNRz+dJelIx5DY7fxuT+k6Ro5wkXRO3Yf0ZFBy8C8dAtIxnRTTF
         tHCkfxUoDjdAXmecsPbpjDDGbm1LH8LC8ZhfYj7lEzGAY1on5e3ShhBxcOm4CFB50CLl
         U6G7yDjApfY6WmST80u0PuocEe+JaTDzCagxdcSEW6Z2Bbrz8Vl3fWM0NtJ2O012uzXE
         8ou0pEU2i+N1e5cVyu8yGRtHpgbqBwbBW1a/r9FXdUeXAQ+IuZj4jd7n5WkmuXMPG4mH
         wQoQ==
X-Gm-Message-State: AOAM530qcgEhHqeq1B6akFcplfrVEGd+Dzenxbf5a67Ds+vJUIYQ14db
        bVK7ded+by7Hj6McbGK5PJ1RhVqT//HciUfJ
X-Google-Smtp-Source: ABdhPJweaF8FNnTMAbQuqBEudIw+UEEL6gNoopwepaXYsDSa8Bwm7+zqJTxyNtHVNFC8S3FcrWOhrw==
X-Received: by 2002:a1f:5c4d:: with SMTP id q74mr7308031vkb.9.1643108650680;
        Tue, 25 Jan 2022 03:04:10 -0800 (PST)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id s134sm3307246vkb.16.2022.01.25.03.04.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jan 2022 03:04:10 -0800 (PST)
Received: by mail-ua1-f50.google.com with SMTP id c36so36611976uae.13
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Jan 2022 03:04:10 -0800 (PST)
X-Received: by 2002:a05:6102:a04:: with SMTP id t4mr2006797vsa.77.1643108650121;
 Tue, 25 Jan 2022 03:04:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1642599415.git.geert+renesas@glider.be> <a692f62b349ee6ae67510aaf5c9242cc1ae7cc64.1642599415.git.geert+renesas@glider.be>
In-Reply-To: <a692f62b349ee6ae67510aaf5c9242cc1ae7cc64.1642599415.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 Jan 2022 12:03:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW1yMCTUAudgcbQ8ApVkJrM6apzL9vP=+xOUra25PLJwQ@mail.gmail.com>
Message-ID: <CAMuHMdW1yMCTUAudgcbQ8ApVkJrM6apzL9vP=+xOUra25PLJwQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 04/15] pinctrl: renesas: Initial R8A779F0 PFC support
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Cc:     LUU HOAI <hoai.luu.ub@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 19, 2022 at 3:02 PM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Add initial Pin Function Controller (PFC) support for the Renesas R-Car
> S4-8 (R8A779F0) SoC.
>
> Based on a larger patch in the BSP by LUU HOAI.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I accidentally sent out an old version, lacking changes to I2C[45]:

  - Replace "PINMUX_IPSR_PHYS_NOFN(y, z)" by "PINMUX_IPSR_NOFN(GP1_x, y,
    z)", as I2C requires GPSR1[x] to be configured for peripheral mode,

> --- /dev/null
> +++ b/drivers/pinctrl/renesas/pfc-r8a779f0.c

> +       /* GP1_08 = SCL4 */
> +       PINMUX_IPSR_NOGM(0, GP1_08,     SEL_I2C4_0),
> +       PINMUX_IPSR_PHYS_NOFN(SCL4,     SEL_I2C4_3),

      PINMUX_IPSR_NOGM(0,             GP1_08,         SEL_I2C4_0),
      PINMUX_IPSR_NOFN(GP1_08,        SCL4,           SEL_I2C4_3),

> +
> +       /* GP1_09 = SDA4 */
> +       PINMUX_IPSR_NOGM(0, GP1_09,     SEL_I2C4_0),
> +       PINMUX_IPSR_PHYS_NOFN(SDA4,     SEL_I2C4_3),

      PINMUX_IPSR_NOGM(0,             GP1_09,         SEL_I2C4_0),
      PINMUX_IPSR_NOFN(GP1_09,        SDA4,           SEL_I2C4_3),

> +
> +       /* GP1_10 = SCL5 */
> +       PINMUX_IPSR_NOGM(0, GP1_10,     SEL_I2C5_0),
> +       PINMUX_IPSR_PHYS_NOFN(SCL5,     SEL_I2C5_3),

      PINMUX_IPSR_NOGM(0,             GP1_10,         SEL_I2C5_0),
      PINMUX_IPSR_NOFN(GP1_10,        SCL5,           SEL_I2C5_3),

> +
> +       /* GP1_11 = SDA5 */
> +       PINMUX_IPSR_NOGM(0, GP1_11,     SEL_I2C5_0),
> +       PINMUX_IPSR_PHYS_NOFN(SDA5,     SEL_I2C5_3),

      PINMUX_IPSR_NOGM(0,             GP1_11,         SEL_I2C5_0),
      PINMUX_IPSR_NOFN(GP1_11,        SDA5,           SEL_I2C5_3),

> --- a/drivers/pinctrl/renesas/sh_pfc.h
> +++ b/drivers/pinctrl/renesas/sh_pfc.h

> @@ -436,6 +437,16 @@ extern const struct sh_pfc_soc_info shx3_pinmux_info;
>  #define PINMUX_IPSR_PHYS(ipsr, fn, psel) \
>         PINMUX_DATA(fn##_MARK, FN_##psel, FN_##ipsr)
>
> +/*
> + * Describe a pinmux configuration in which a pin is physically multiplexed
> + * with other pins and has no representation in a Peripheral Function Select
> + * Register (IPSR)
> + *   - fn: Function name
> + *   - psel: Physical multiplexing selector
> + */
> +#define PINMUX_IPSR_PHYS_NOFN(fn, psel) \
> +       PINMUX_DATA(fn##_MARK, FN_##psel)

This should be dropped.

> +
>  /*
>   * Describe a pinmux configuration for a single-function pin with GPIO
>   * capability.

I will update my topic/r8a779f0-pfc-v1 branch accordingly, and make
sure the correct version will be included in today's renesas-drivers
release.

My apologies for the trouble.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
