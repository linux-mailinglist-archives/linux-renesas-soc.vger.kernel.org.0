Return-Path: <linux-renesas-soc+bounces-26433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F78AD04493
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 17:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D84DF311CE52
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 15:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7745A1A9F93;
	Thu,  8 Jan 2026 15:26:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038EF3B28D
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 15:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767885980; cv=none; b=OGCOUGivOgtZrzucWJrAMqSp0nDw4Nmd+28YFRLl7vekxfKFasd3/OS9IxTVHqMD1iZ8cxgbJaCy+Yt9/w/tvaGW9//qVPn89xdyRnjKIQEpzUp0z2aZ1tMQyhXKYUuCS9NO1jhUCrqfVv+fI2R7QHT9XpwEBBuWobKB8LHW0Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767885980; c=relaxed/simple;
	bh=e+OtGCe5Sk6t9FVB5mpfIVm/rpc9dmyJ4vUAETdRSQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LzVO3m0MitqKetBLOozzEvVK5S+d7xVwybLM2jEJO0xdWGWTQgDdGObyILwDQqPeHDIUuaJUxCyVqS5HhASwZYKGyZ5VeLLBxb5+ya63ysOEJ6US9jfqzSNXVxNgFqqqaias2abvllnOL16AUXJf9amQd7HbuILc3sHL1+V4Dow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-55b2a09ff61so1043187e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 07:26:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767885978; x=1768490778;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Myx/T2jiAzQj13PVTSJwAglhfaduo0kFw6dVkLRm/Kw=;
        b=wZAsSp87JjkqomontAj0wNfvL8ZW35wpGmeRxIo9bKfz+TXt0SR0dz4ddg8Hx68Kgz
         2Zr7UTxtfWwkgrf8YS/4moY6cCnZMRzVuecmUZoaPMQ+/xaxzKfP7ydUTSxQLqzxiL+C
         cXcjaEnu9x0IqYMS2g3jqZ7a9S2KFfsxuDX9TeMNqPJ1hFunuvdZDxXeNITL0ObmQo/R
         lz8CzVVjFYB3ILK9klIHRsxY0m6expWYZc0wLGfXZ6k2fgauoaOWA3ZXOy7NEVgwY7d4
         8Cm3i+iVpUjNijGsNbSVtwXHArll4lUtGQGwNXSBsiIaToVijdQs6NeYWe3pJSLOqqC/
         VmhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9x3w69bD06iunOBMijkiFM1jDEK1rOorK6B06HIFREN5C0kmMWXDyo7PGiLaIPYwNJKGDvch7mUpPxesDZFM4Kg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+JqTlfcSrhwC3jymXvvxhj+TSviPiHyEpj5MYo/19TfsdMwC+
	6gzy1bNbRTh4zTKwXmnIZTh3hnk4aWG1viTWtI9GmFhSuKpTWdyjpx1RnPCQ39ZY
X-Gm-Gg: AY/fxX4PUkQ6cnC6BzMURqZcq8JUemTs85wVv8YirhUL2wIrQdaYLi+QY04TLNHyQu3
	ICkNXnJFe7orHTyW3+lCqsaf82Wc+k5loCvLDxOyI0/SM3BQuxpG4hHOuOzf/jLc9ZvftCIJBne
	NQ873eTSNftKi0mBxErSfw+uc+a5go4cBrsY39FINSSPClFacxjIdNQgiYPlvAyGaeYZCRj6FFi
	y7XWjA/SU+2NgXLFsLJhIkFgo6yePK1Vogsw5G/k77+O1zd6hAVTCip2P0OW9ervF06Fklg4gDj
	7Beqe7ksTsE36kblAgh7INzZdnZhYcdYPrSiHhS2NKuC1AbuLgLWg4Dm2m3pdXuuMMJjV4zmdnq
	j6f0xTmvoaSRnFKIETcRP114/EZMjNJNMq6592cIO8uOaOByE8+bvMMLERsao4XKjlrsn5ztKbp
	I+Hxng/oak+WcBFsjpjRkZa/yvEvDG52rJKf/ExVCou3YR2JHk
X-Google-Smtp-Source: AGHT+IFllL8Xv5iosYbgtBKT6kNE0P2FUVRXZjfCNsa0JbfOS2eYeFLq7I98wyrPSXPbo08A15MSZQ==
X-Received: by 2002:a05:6122:616e:b0:55b:10d7:51a5 with SMTP id 71dfb90a1353d-56347fd4826mr1734907e0c.10.1767885977250;
        Thu, 08 Jan 2026 07:26:17 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a3f78cbsm6311039e0c.11.2026.01.08.07.26.17
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 07:26:17 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-93f56a97064so993891241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 07:26:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV//NtilY0fRKQ6rPVWQR17+disvzYwamUHIBEpNnc9bpfkz8pBrO2iB9+hOHM2NPp1kx8Lc6Skof2TOuv32ng0nA==@vger.kernel.org
X-Received: by 2002:a05:6102:4a83:b0:5ee:a81a:dea4 with SMTP id
 ada2fe7eead31-5eea81ae785mr282830137.27.1767885976851; Thu, 08 Jan 2026
 07:26:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126130356.2768625-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251126130356.2768625-4-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251126130356.2768625-4-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 16:26:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWEj=3dLMPtFLtvoQ2aW_qRBLes_viCKmiWzK3bUe7uxA@mail.gmail.com>
X-Gm-Features: AQt7F2qzrssQHw0k6aAqGzzh2oKOX1eJ3p9c7BCb14ihkvvK0IAUBKGlnhMTeis
Message-ID: <CAMuHMdWEj=3dLMPtFLtvoQ2aW_qRBLes_viCKmiWzK3bUe7uxA@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] thermal: renesas: rzg3e: make calibration value
 retrieval per-chip
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Wed, 26 Nov 2025 at 14:05, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs expose the
> temperature calibration data via SMC SIP calls.
>
> Prepare for them by moving the syscon usage into a single function, and
> placing it in the chip-specific struct.
>
> Rename the functions to match their functionality, and remove single-use
> variables from the private state.
>
> Also, move the calibration value mask into a macro.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

> --- a/drivers/thermal/renesas/rzg3e_thermal.c
> +++ b/drivers/thermal/renesas/rzg3e_thermal.c
> @@ -70,7 +70,12 @@
>  #define TSU_POLL_DELAY_US      10      /* Polling interval */
>  #define TSU_MIN_CLOCK_RATE     24000000  /* TSU_PCLK minimum 24MHz */
>
> +#define TSU_TEMP_MASK          GENMASK(11, 0)

This is the value same as the existing TSU_CODE_MAX definition.

> +
> +struct rzg3e_thermal_priv;
> +
>  struct rzg3e_thermal_info {
> +       int (*get_trim)(struct rzg3e_thermal_priv *priv);
>         int temp_d_mc;
>         int temp_e_mc;
>  };

> @@ -334,22 +337,8 @@ static const struct thermal_zone_device_ops rzg3e_tz_ops = {
>         .set_trips = rzg3e_thermal_set_trips,
>  };
>
> -static int rzg3e_thermal_get_calibration(struct rzg3e_thermal_priv *priv)
> +static int rzg3e_validate_calibration(struct rzg3e_thermal_priv *priv)
>  {
> -       u32 val;
> -       int ret;
> -
> -       /* Read calibration values from syscon */
> -       ret = regmap_read(priv->syscon, priv->trim_offset, &val);
> -       if (ret)
> -               return ret;
> -       priv->trmval0 = val & GENMASK(11, 0);
> -
> -       ret = regmap_read(priv->syscon, priv->trim_offset + 4, &val);
> -       if (ret)
> -               return ret;
> -       priv->trmval1 = val & GENMASK(11, 0);
> -
>         /* Validate calibration data */

I think this comment can be dropped, as this is clear from the
function name.

>         if (!priv->trmval0 || !priv->trmval1 ||
>             priv->trmval0 == priv->trmval1 ||

> @@ -402,11 +404,16 @@ static int rzg3e_thermal_probe(struct platform_device *pdev)
>         if (IS_ERR(priv->base))
>                 return PTR_ERR(priv->base);
>
> -       /* Parse device tree for trim register info */
> -       ret = rzg3e_thermal_parse_dt(priv);
> +       ret = priv->info->get_trim(priv);
>         if (ret)
>                 return ret;
>
> +       /* Validate calibration data */

Obvious, so please drop this comment.

> +       ret = rzg3e_validate_calibration(priv);
> +       if (ret)
> +               return dev_err_probe(dev, ret,
> +                                    "Failed to get valid calibration data\n");

rzg3e_validate_calibration() already prints its own error message.
As this function became small, perhaps inline it here, and use a single
dev_err_probe() in case of failure?

> +
>         /* Get clock to verify frequency - clock is managed by power domain */
>         clk = devm_clk_get(dev, NULL);
>         if (IS_ERR(clk))

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

