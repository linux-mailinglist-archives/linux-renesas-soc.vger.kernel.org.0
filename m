Return-Path: <linux-renesas-soc+bounces-26459-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC1AD05295
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 18:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4D9593019E0D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 17:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56AEA2F9DA1;
	Thu,  8 Jan 2026 17:43:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BBD2DFA31
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 17:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767894187; cv=none; b=GE7MDCmgRmoCwZX2HM8/cfo+MFqNG3RfEZwZSEXua68IYNhIKWwkE222lB42UQ2z5HiLWL3KwKu7iPFUzcTgDhfnr8AfXOyepcr43H1PP6kSWK5I/0Y/vpK2TSP21kpwuV7EHc5AxXviUUuq51O70LsdECoO91DzzzyM7pBMoW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767894187; c=relaxed/simple;
	bh=GAMmRH8WG4SuwJpSk40B1/V0uVXYQJKFg56MoYwmk70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kcHaX+gICMaoZ7+ic911lJVJ8xEyBwjeyXcGD9rhg1Voi9tTLuM0koVBBHHmZ21eyus3H51BzZ8d0VIGNSn2YuBkaUSX+wAmIgFS0ZcFW9X0sVe4kHyLfHwg6V4P7tY0RDI/HaPyB15wFpg7iPENWyCXRonMfyGNyhuzYMZPwvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5636227a6e6so154433e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 09:43:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767894179; x=1768498979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pfe9XNi/Cjru8cNLH+ivGd+Nm2hyK8hmMgtx6v7K+ro=;
        b=e2yRhWt2szDBBoiMBM1a04MTEjC0UG52koeropwr4I1HQe6hs6c6k/hujsa4/e3r+c
         IMiK2qmp+DrrgoFKCbI1mA3BmUB9IUI9IQDZ+gHrQ5bwk6t3uowiuHl18+lKZV9Bk6XA
         Y3y3RMkl6GEYMAY3MbwpLzmB2VByuZuqaX8r9HYQRQIvMtwx5Kuj1u+kB8LJ05Xoobe0
         5BzNeKuF8dixH23QCZMYYgPzVcmWt9hzQwZSDJIABxJD3Tt35zLpYteUzWh4flu69lYY
         kwtSlDXxCPbqrj7wM7Jmg7/7adPVuIlwCRdsHDSn5GRGqrZ0lQcVbvMJNQUQUEVkXV4L
         yPKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXY71MeOJ0UimjHpjvcSSiNOCrcy933SjQPFT+ocA4/5ac24fCyVWkPcXESdVX6mAS8VRyeHaYjE4/1yH9FUzzi1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhs5/MKoVCIO1T9crO8kWwL9iqDrMSuVxncqsgMN1CVqKgjn+N
	KArRUqi6uKAv2+lDdVelvIX+LKlzePYi7n7ZIpHMNxg47HafeiacKSJwo105k5xA
X-Gm-Gg: AY/fxX7r595naDOjgODARUrNao4PtF5hTHBlI41d3jcn4i4sTnYrcE/1jbtiNIyerX6
	Pf+mUltnt4JhAJ8BRo2Xs5/7zgQ1zvUofaJojwKGDc0vbnuQewZ1Db/9RWNJcyvtT7kttTZ/ea4
	G3UhMz4ifqNHmLvudQzOKWoPv8BqHWdeVJPZzQjX7AFBbYprQB8vfyrmjO7UaKu6IVA+hTIaLEn
	xlhjn5VmjTxDYqkcE1ZuwyBix44gybHJ2Dv3p1fcvlMc2xxQ6fqmI4bDP2GZJskb/QD5RHGXrRj
	EGNZ5gR0khMju4uvBAxBwg4ECaxtlG31pig43o+0V2YOLMGIJzUQvDrVIPvDqQW1ms5/QAikzKM
	D91K7qszM+8ATeGJl4a0rsfIq1Oh/1oPZ/7K9+P64gmwbY0HJLmoBX9PyTYrh9mDQr6rPWGftm7
	0b3XApiay0hJn38CPQdIeUj7YfZp8wFw034i5fswQbnpH3djtk
X-Google-Smtp-Source: AGHT+IGitEkJWpLfsKMfrH2+GcphEvJV7Z6ipiQXz2SbCYkowEKWmVedJJ20/B5naTOvO+JhDbhCuA==
X-Received: by 2002:a05:6122:8292:b0:559:ed61:46d8 with SMTP id 71dfb90a1353d-56347fb4492mr2100959e0c.10.1767894179371;
        Thu, 08 Jan 2026 09:42:59 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5634d9162a4sm4992658e0c.15.2026.01.08.09.42.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 09:42:58 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5ec84929ddcso584948137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 09:42:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWZrvcPsh2i40Lavw1F1gMaZXUOIhTDSoeYMTTh94O7LEMSROcZTQV24R/07ree1B5ODG9M9jqmBf4n6/cGwg8sLA==@vger.kernel.org
X-Received: by 2002:a05:6102:5cc7:b0:5dd:89ad:1100 with SMTP id
 ada2fe7eead31-5ecb5cbb74bmr2376260137.6.1767894178396; Thu, 08 Jan 2026
 09:42:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108165324.11376-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260108165324.11376-6-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260108165324.11376-6-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 18:42:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX0G92JmwneZp1h+AOF-Cit2scVGGWXCBZGwBVmJjUAVg@mail.gmail.com>
X-Gm-Features: AQt7F2oaRcSSM-TJ2lzWvwve1kr4JhP9eX1Et_7XoG_piUmKankXGgTr0tEIJaU
Message-ID: <CAMuHMdX0G92JmwneZp1h+AOF-Cit2scVGGWXCBZGwBVmJjUAVg@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] thermal: renesas: rzg3e: add support for RZ/T2H
 and RZ/N2H
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Thu, 8 Jan 2026 at 17:55, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs expose the
> temperature calibration via SMC SIP and do not have a reset for the
> TSU peripheral, and use different minimum and maximum temperature values
> compared to the already supported RZ/G3E.
>
> Although the calibration data is stored in an OTP memory, the OTP itself
> is not memory-mapped, access to it is done through an OTP controller.
>
> The OTP controller is only accessible from the secure world,
> but the temperature calibration data stored in the OTP is exposed via
> SMC.
>
> Add support for retrieving the calibration data using arm_smcc_smc().
>
> Add a compatible for RZ/T2H, RZ/N2H can use it as a fallback.
>
> Reviewed-by: John Madieu <john.madieu.xa@bp.renesas.com>
> Tested-by: John Madieu <john.madieu.xa@bp.renesas.com>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>
> V4:
>  * pick up John's Reviewed-by and Tested-by
>  * replace new macro TSU_TEMP_MASK usage with existing macro
>    TSU_CODE_MAX

Thanks for the update!

Looks like Gmail blocked my review comments on v4 :-(

> index c1b586128fa6..ba13ca8cbb8c 100644
> --- a/drivers/thermal/renesas/rzg3e_thermal.c
> +++ b/drivers/thermal/renesas/rzg3e_thermal.c

> @@ -362,6 +366,21 @@ static int rzg3e_thermal_get_syscon_trim(struct rzg3e_thermal_priv *priv)
>         return 0;
>  }
>
> +static int rzg3e_thermal_get_smc_trim(struct rzg3e_thermal_priv *priv)
> +{
> +       struct arm_smccc_res local_res;

Missing #include <linux/arm-smccc.h> (on e.g. arm and riscv).

> +
> +       arm_smccc_smc(RZ_SIP_SVC_GET_SYSTSU, OTP_TSU_REG_ADR_TEMPLO,
> +                     0, 0, 0, 0, 0, 0, &local_res);

Can this crash? E.g. if this SMC call is not supported by the firmware?

> +       priv->trmval0 = local_res.a0 & TSU_CODE_MAX;
> +
> +       arm_smccc_smc(RZ_SIP_SVC_GET_SYSTSU, OTP_TSU_REG_ADR_TEMPHI,
> +                     0, 0, 0, 0, 0, 0, &local_res);
> +       priv->trmval1 = local_res.a0 & TSU_CODE_MAX;
> +
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

