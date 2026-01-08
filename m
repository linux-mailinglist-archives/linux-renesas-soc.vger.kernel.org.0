Return-Path: <linux-renesas-soc+bounces-26436-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E25AD04910
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 17:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF58E35CB341
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 15:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55726244661;
	Thu,  8 Jan 2026 15:40:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E78F231832
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 15:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767886828; cv=none; b=Bt0mp/5jOP1PsBZhL5UXMD3cnHm6hj2AKNeCfQzcZK7UjfrUTgio9tdxHR9KKjT9I+isDF5DddzCpR9F0rC22J5zigWRiZIe/fw96CdFffrky7yt8gP97gWjBKaF6twmrmfXX+VVluzQ3thjuOW/snN6+ysQK4sIj1kJ3UR05Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767886828; c=relaxed/simple;
	bh=G7JSDJeyfhq10WIyx1yxqUoIHN0VScyPB72n/Phi9m0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXWJOgnPS+viSpWuBuaogwjBME2QwWKKxor0vo9lT3IBkaMJhtKG+10DRox+dpXpCpeb/XPZMaOMC+meIhDnnB9c+qlZ5bLo0UPOQfi+UV8g6t3DjbE2BApmIoIL8SRNM2g50koZZZPg7olPUlXw4bH/yLnUN7k2UN9TMV1qfHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-560227999d2so1205510e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 07:40:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767886825; x=1768491625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LPCEMds3NUNJIzMjaHhQoyBDppqgLalAn8n+Qce6geo=;
        b=S5bnzB9RoGOAWDKNVR59LPO7ap0GY3GEDb2b6+MX+H/goFN9URlMvQmEVcdXbk26Ye
         pWv8Tf+cnlVaEM7pisH0qBomZsjZ73bjzhTddzUqGG9bGgQCx4cRPr7KWD/KTBaTrS1A
         Jb/yC9TcAS5/Yl66mFozFl7hG1hOiV/GVNHU8CoOQgJnt9Vxzji8ne5zADLXv84xw9e3
         IyXWeTXmQYKx4qzfNm12S+qqpNtMu219i7LilxpPZ615RwwE5SdNxEcIgpjnVWtSeuxC
         pXYL0jh/JUPDEk2DXiih+eiu8CDt84XtqyiC9MClHm1I9pMSaBMirhac2tuRFgUq1tjF
         F8Ng==
X-Forwarded-Encrypted: i=1; AJvYcCXuTA0LhCxeFqMmLDXf0leuoNG4vyT7Cf+Ey1KB8jCOtx1Fdl7ou543KPKX9X9l+N0Z0PJ+it6kAW/yofR3368MXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMfqNOAWMBlOmPHB+1Ax+o73iXPulqiWb4Asm1d5ubHVP3s4Ci
	6xeuDU3+oROwDzOTMFVQoVY61Go8RpmG0coqywsMBczQRjU5MZGVyzgG1055HNqs
X-Gm-Gg: AY/fxX4/6X8O0lSnQYV0UXVyT0dN7V1+I5UAp/5PinwGHXL1e5ls7YvQtVRJ+h8Q5nc
	YUxqbwtKCtSOxDxdyyw1/1ZqRn41k42+3SbC7J6ZybnmQFTIUHbI+O8AHXy3yT6C6LI6H73jFh0
	zG9PA2uYqQ8uCgfP8g0mLHo+6NrzG7cLlSP7FtrT78snMGpZmWDwP9LbDvVSgMF3pBSDL7vPorP
	lZ4+MRuVYhc3GB5ymGvePlDiRCYeHaRCefKmQXigDcPDB6y2KKWA3t7D3XMq1FdG3BIiX9PSsWi
	tIqTzf/TRlZEwZs+YbcQGqvjnmp45EHzOnSztzOgzhtiaH0KM+wJ7e5EKN9a0gNZ+X0Oq3qBi3K
	tZTMfuA1chHFXKzXAj89YZtlEiJcjU4kOGqjTVViVeNySrc8rFnoCcBCACdizEqXmMyfJ3WG8D9
	i/iD+3sh9yjcyS/x+lvasHvpLWF73iijVtSkqRMR+z7H6cbZQ/Kyase1gfAZHP4W8=
X-Google-Smtp-Source: AGHT+IE6+uEpzgvq/KkvFZPjEi7wMC1PHEfmP4Ui49K/zD2vdkV3eCkKnUX6+iJ58GG6JtOHLwjIRw==
X-Received: by 2002:a05:6122:3c95:b0:55e:6668:2e22 with SMTP id 71dfb90a1353d-5634801a5bfmr2109802e0c.21.1767886823579;
        Thu, 08 Jan 2026 07:40:23 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a443e32sm6525071e0c.22.2026.01.08.07.40.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 07:40:22 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-560227999d2so1205484e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 07:40:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSmZnwefwhOFfGVeelupG3DnkLt8c1Fw0zFzlIjgjq+3NePEMsFvmEFtqH8038dtHUnR9pT60gDBKVjj4zhHXx6A==@vger.kernel.org
X-Received: by 2002:a05:6122:8c8a:b0:539:2a2c:6efe with SMTP id
 71dfb90a1353d-56347d53d51mr1984301e0c.4.1767886821868; Thu, 08 Jan 2026
 07:40:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126130356.2768625-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251126130356.2768625-6-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251126130356.2768625-6-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 16:40:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWY1+xo0sLs_OxLNf0ES0pZy+Q-u309gRXuTsZ3cf2ACQ@mail.gmail.com>
X-Gm-Features: AQt7F2q4mnTwj4mP8-vYCbbynRSDudO3B41aJiCWB2w7nQNsSq50R88G--5ck-E
Message-ID: <CAMuHMdWY1+xo0sLs_OxLNf0ES0pZy+Q-u309gRXuTsZ3cf2ACQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] thermal: renesas: rzg3e: add support for RZ/T2H
 and RZ/N2H
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Wed, 26 Nov 2025 at 14:05, Cosmin Tanislav
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
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

> --- a/drivers/thermal/renesas/rzg3e_thermal.c
> +++ b/drivers/thermal/renesas/rzg3e_thermal.c

> @@ -381,6 +385,21 @@ static int rzg3e_thermal_get_syscon_trim(struct rzg3e_thermal_priv *priv)
>         return 0;
>  }
>
> +static int rzg3e_thermal_get_smc_trim(struct rzg3e_thermal_priv *priv)
> +{
> +       struct arm_smccc_res local_res;

Missing #include <linux/arm-smccc.h>.

> +
> +       arm_smccc_smc(RZ_SIP_SVC_GET_SYSTSU, OTP_TSU_REG_ADR_TEMPLO,
> +                     0, 0, 0, 0, 0, 0, &local_res);

Can this crash? E.g. if this SMC call is not supported by the firmware?

> +       priv->trmval0 = local_res.a0 & TSU_TEMP_MASK;
> +
> +       arm_smccc_smc(RZ_SIP_SVC_GET_SYSTSU, OTP_TSU_REG_ADR_TEMPHI,
> +                     0, 0, 0, 0, 0, 0, &local_res);
> +       priv->trmval1 = local_res.a0 & TSU_TEMP_MASK;
> +
> +       return 0;
> +}
> +
>  static int rzg3e_thermal_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

