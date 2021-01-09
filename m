Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 683542F0245
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Jan 2021 18:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbhAIR3Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 9 Jan 2021 12:29:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726507AbhAIR3X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Jan 2021 12:29:23 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B4DAC0617BD;
        Sat,  9 Jan 2021 09:27:57 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id v67so2511131lfa.0;
        Sat, 09 Jan 2021 09:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QTIicvmPPddk2PAdOzD5pKzbNtlq1Pdrc7mdXo8LQ9Q=;
        b=Uv1y5h5MALwpNcP9jIqd8d73lF7eRhLkj1ZnkKdrPuQrakmBp+GCn/SZ9ZsJDZrY7D
         88PhCKe3p7Zww0XwLPnbJ9pDnGTbNG7gC06/ulXYuSb3vDi2x+kOwZmWvpkh1lAGUbY2
         KCuHHOxvb3QOuSvk+Z6le16Pk7+XM+iYsMHgdkqrhLyHGUtXfwGjKkHz2SLbrRSjDVZH
         Q6pfQq0ZBlbj5DG3R4RUEHWh74qZ8xeDpXBpZXRY/fZeEtmEBtWRIoq7Vhg2BkMlpvYX
         UafBUJ7qO+Wg9eYixLGyYWL0bzwI3J01KSborfilpavgOTk9podWFuWDxB4i2M52eUMZ
         v1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QTIicvmPPddk2PAdOzD5pKzbNtlq1Pdrc7mdXo8LQ9Q=;
        b=fYLeQ7CCsNKXbv0bPratpD0m8e+zac4ZMeY6ZiU+DDaLsiBsW3pRKPjJhlPkJfFbJS
         ykLuMOkS1izkgiMZzDRka0K+Ft59TyiK2hE8SzEyApdEAPUOmjc5rwktfu6pnyCmYW7O
         +li22GhoDaUDwRtIwOaHgChgKV1pZdQ/2L7Fd0u+0faoeAlUMX8KuuV3MV1X+9D6z4aA
         kIf+qAgIsAV8U0YyFJ3ne43bnb8+w49B6YoZrGBzB0yNpMzM0cRirowRbmkLYfY2IA/N
         omFyin78vJO+5FjsLxzeU1Aj4JqAfI8y1WVB4t04bn/Wd5F+LETaywHQUdhx1BP+z24c
         Rl6g==
X-Gm-Message-State: AOAM531lvxht92I6TYq+wyo3VX7C792zciTHTA7XJG3lgIaIQ6lxbrIh
        HRMrkSaHuM6NUDvevvCWqIu30cknTA0=
X-Google-Smtp-Source: ABdhPJyuYRpnBjCFbxkqJITK444Ml1UXvaBjbxw2SBMSyflkmUAqHuZ9avGkKRgfDOmC1UTTEIXnHA==
X-Received: by 2002:a2e:8250:: with SMTP id j16mr4145528ljh.354.1610213275842;
        Sat, 09 Jan 2021 09:27:55 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id s25sm2595293ljo.106.2021.01.09.09.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Jan 2021 09:27:55 -0800 (PST)
Subject: Re: [PATCH v12] ARM: uncompress: Validate start of physical memory
 against passed DTB
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Russell King <linux@armlinux.org.uk>,
        Ard Biesheuvel <ardb@kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Eric Miao <eric.miao@nvidia.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Lukasz Stelmach <l.stelmach@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210104130111.1269694-1-geert+renesas@glider.be>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5f23561e-4099-8578-2c28-4ba39bbaa071@gmail.com>
Date:   Sat, 9 Jan 2021 20:27:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210104130111.1269694-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

04.01.2021 16:01, Geert Uytterhoeven пишет:
> Currently, the start address of physical memory is obtained by masking
> the program counter with a fixed mask of 0xf8000000.  This mask value
> was chosen as a balance between the requirements of different platforms.
> However, this does require that the start address of physical memory is
> a multiple of 128 MiB, precluding booting Linux on platforms where this
> requirement is not fulfilled.
> 
> Fix this limitation by validating the masked address against the memory
> information in the passed DTB.  Only use the start address
> from DTB when masking would yield an out-of-range address, prefer the
> traditional method in all other cases.  Note that this applies only to the
> explicitly passed DTB on modern systems, and not to a DTB appended to
> the kernel, or to ATAGS.  The appended DTB may need to be augmented by
> information from ATAGS, which may need to rely on knowledge of the start
> address of physical memory itself.
> 
> This allows to boot Linux on r7s9210/rza2mevb using the 64 MiB of SDRAM
> on the RZA2MEVB sub board, which is located at 0x0C000000 (CS3 space),
> i.e. not at a multiple of 128 MiB.
> 
> Suggested-by: Nicolas Pitre <nico@fluxnic.net>
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
> Acked-by: Nicolas Pitre <nico@fluxnic.net>
> ---
> Submitted to RMK's patch tracker.
> 
> v12:
>   - Drop unneeded initialization of r in get_val(),

I tested this patch on NVIDIA Tegra and haven't spotted any problems.

Tested-by: Dmitry Osipenko <digetx@gmail.com>
