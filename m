Return-Path: <linux-renesas-soc+bounces-26316-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA66CF77CF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 06 Jan 2026 10:22:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 523CF304C0CD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jan 2026 09:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FBDD30F958;
	Tue,  6 Jan 2026 09:22:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF50630E84D
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jan 2026 09:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767691341; cv=none; b=ciekCwcDcrZeID9WpHmaBl28cZL+tLnAEuA7hjb/Yfguz+pvWfn/AzOKhrdikuiLmKxXOrjn9Z+JTwGzqOe3fQyp1cl8x1mIvin8ElpVTVkFioFDdpsAYVFaWvRqR8v9ZpnX2NhQUZ1xVedHowInCqVDQHLh/CD/KXQbRWrzg1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767691341; c=relaxed/simple;
	bh=oGWEDzx0GCta1OvN+DPAb0Ri8GEUryM+YKckFtZpRpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQg/hjYxDwhkwL/ZjboOq+BoQ4po49OiTSaK2rVQcUTrG5A8IdTEap8wLKyTrSojgISZ7dRmZ04igGx+XTqRiJcxlvmvGZKGnKtWpUPaU13iT6bozkcxldATLrC0riH+XTeOonufz9/eudx99UeBiXrrWMwklJkzl43CW6KcUFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5597a426807so497815e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Jan 2026 01:22:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767691339; x=1768296139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWrr+aouVwIROBpBmJECMnG33Dep8i0hbCwAaVkq1R0=;
        b=MZUCkqVJksWvvp2zdrUhrHM5qEAQ53uaT4h7WxwrDkfeDhb8sZuvQao7mo19aJ7tPo
         LpUXZKLzhvC9PwcVPG6C+4YsNZ4p79TiRWR32sAyYJuRPA2vDzao5Vz8ONYBMyL1sKqk
         x09CEZY6VbXMSqjBnlq/7S1dnHNLIUKldRzMX3YbrH5Ly5c3aUHB69gl8UBVxCKWNipx
         YNup20MIapyfzV33HmlhxBpjEzyxsPCYq82p5o4+dexuKMRMOyBNZS6Pc5zoNO8iPrJm
         mu6YZL+RVME/WW9NFD/X9VFLT/ZkNsbtvdxJakPp2ehKiTJVrGe5a4uMrqmqDsqCfTyy
         eQfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB5yfeEvQ2+I68ZI3yragrb/Yq5pL9up+UPykLEMNTMv2LbAZnzk4Kb7S1+4dQ0MQ9/o9qaHHKjN1tTfN7c5pduw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxurVtatnCPMhxJ6lBbxK3rS/EG3tjikEXXsp8+QeILU5ef3ctZ
	EEguxA7XvgO88wLF0djae8euWmnc81wU8/YNpwEE9dZurTP4gTS4m0uJEaR1F6nW
X-Gm-Gg: AY/fxX4s/wbIkERYV/i0rbfxQ088mYnjBimsYHSqSwUJ/ceRMY6GjpXHdyFZRQnDjBY
	kBIJ4PwGwLk3wd2UW+Ea7Cxrq72TpNQyDZ7/UUfOYT9+hRYK7x4+lGoF5ZW4RvCnVaWJNFBgyl0
	IumOxjEDbRjHOo7ooDeYY2b+bI73coYquA+xBL6ll+Hn73X0NOYQ9vDwwtlA111lopK8jBZViye
	SyA1Qe+EBZ1MX28rrTcr5VLFmFWyzLFGM5XmfNXcT7zJKHDzfy+loWqb1wUanwBggz6flk8QefO
	UV37gZJ6Y63E2sDoH+zfAuz7bJz5Pe7wzRzjg7EALKelsS3aGqTF1nHZih18V6LtS9D/zYUqnWS
	mOvcdRsDfwohqVAHFdQaNTOxvMlFaJPD/rqJqHJlCujLZy9V/mSHvGljiYKqUbWnrDTC1T7auBu
	oXbXiq/lJZ2FasuhEHhTx9PPF+p+agcnFqTPRxYn6yLjA8UTqC
X-Google-Smtp-Source: AGHT+IEqPPTOEN0fm3L4yP7eNn3Ib73ey4saQ2k88AQ8MzT93mKVEa7iLtilna/4Yhfl/qEVXZI1kA==
X-Received: by 2002:a05:6122:1dab:b0:55b:305b:4e29 with SMTP id 71dfb90a1353d-5633959bd9amr723174e0c.21.1767691338724;
        Tue, 06 Jan 2026 01:22:18 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a2076bbsm504891e0c.6.2026.01.06.01.22.18
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 01:22:18 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-93f5729f159so395822241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Jan 2026 01:22:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVsg+Bt0nvnKyRRfgaq1j+1FLs/6DZEVfQNq+GEEjK3ZOoG/WBgV8bfFIrrBheQ+8Gi/EQQ/u+8MUHyXUjNcnslLw==@vger.kernel.org
X-Received: by 2002:a05:6102:6a92:b0:5df:b31d:d5ce with SMTP id
 ada2fe7eead31-5ec74524009mr734718137.28.1767690842994; Tue, 06 Jan 2026
 01:14:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com> <20251223-i2c-adap-dev-config-v1-6-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-6-4829b1cf0834@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Jan 2026 10:13:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5ffiW_vEuDjV5bnmTeduhoqph7t8rsaFEVO7RXOM8jg@mail.gmail.com>
X-Gm-Features: AQt7F2rMrz4VfFE8hOXFGnfaW6TUCM_pC_Fx6Bfylmm0kWFPuXvkE1g4WrvoTA4
Message-ID: <CAMuHMdW5ffiW_vEuDjV5bnmTeduhoqph7t8rsaFEVO7RXOM8jg@mail.gmail.com>
Subject: Re: [PATCH 06/12] i2c: rcar: set device parent and of_node through
 the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Bartosz,

On Tue, 23 Dec 2025 at 11:05, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Configure the parent device and the OF-node using dedicated fields in
> struct i2c_adapter and avoid dereferencing the internal struct device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/i2c/busses/i2c-rcar.c
> +++ b/drivers/i2c/busses/i2c-rcar.c
> @@ -1149,8 +1149,8 @@ static int rcar_i2c_probe(struct platform_device *pdev)
>         adap->algo = &rcar_i2c_algo;
>         adap->class = I2C_CLASS_DEPRECATED;
>         adap->retries = 3;
> -       adap->dev.parent = dev;
> -       adap->dev.of_node = dev->of_node;
> +       adap->parent = dev;
> +       adap->of_node = dev->of_node;
>         adap->bus_recovery_info = &rcar_i2c_bri;
>         adap->quirks = &rcar_i2c_quirks;
>         i2c_set_adapdata(adap, priv);

    [....]
    ret = rcar_i2c_clock_calculate(priv);
    [...]
    ret = i2c_add_numbered_adapter(adap);

As rcar_i2c_clock_calculate() uses rcar_i2c_priv_to_dev(priv):

    #define rcar_i2c_priv_to_dev(p)         ((p)->adap.dev.parent)

I believe this will deference dev.parent before it is initialized by
the newly added code in i2c_register_adapter().

Let's check...

    Unable to handle kernel NULL pointer dereference at virtual
address 0000024c when read
    [0000024c] *pgd=80000040004003, *pmd=00000000
    Internal error: Oops: 206 [#1] SMP ARM
    Modules linked in:
    CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted
6.19.0-rc3-koelsch-04401-g9e22366a23cd #2288 NONE
    Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
    PC is at device_property_read_u32_array+0x0/0x14
    LR is at i2c_parse_timing+0x14/0x30
    [...]
    Call trace:
     device_property_read_u32_array from i2c_parse_timing+0x14/0x30
     i2c_parse_timing from i2c_parse_fw_timings+0x28/0x12c
     i2c_parse_fw_timings from rcar_i2c_probe+0x1cc/0x534
     rcar_i2c_probe from platform_probe+0x58/0x90

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

