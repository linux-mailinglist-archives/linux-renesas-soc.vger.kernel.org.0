Return-Path: <linux-renesas-soc+bounces-3247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE28868AC4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 09:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A097F1F23287
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 08:29:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD6256442;
	Tue, 27 Feb 2024 08:29:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CAD1BC27
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 08:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709022588; cv=none; b=a09RWEZiZh/kNAAtr39DbR1L7N6A3bBuGydyZu9oSFkYgLxvSgu11YWI2lfIgcg4EGHwaKdHCRtK0ATHhVmvK92wTT3s2I/wSOyTTMtco5zf4vr6wh+p55+sOP0r97EIWK6NJs6/0zTUaf4ypMqFwLEH16mDs8/hdGn0aeC9xvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709022588; c=relaxed/simple;
	bh=Yf9i1hG9XaXY8uNygfg4Pqi3vw/ZTv6QS/nlJgIFmII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GTatic4oYMQAgO0ZUBI/wFMdOoP2oeEKRdd+UvgHsZxiIZ4chuPnpn//W4jFnR8TP7rJoYK2YF4d88XxiOu2jpl97JDl+xMpMjIwl6HwDhy3p8zT+vYExGDfiEipAfErBU+GFhP8aVy+zZw0hkaVckdl8D1lu/NIS4X2cGUH4MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-607dec82853so42149007b3.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 00:29:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709022585; x=1709627385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0Z1li2tl/tycjK4L+UhVD/6Qc4pTyRQhk0hF0NZ+po=;
        b=WhCcUSXieFGCnVKiQFQd9yJQgYljyLSG4Yu4FLmaODTYy1slw1FoyafqrQqqdilkdf
         Sb+owSSynUngJfh/HsTDeaoChR8sm5tJmXDtxfBDft/Y3ZL6R+LcbdoL1jgGwoeN552H
         F2w3SP6UaGEu2taOu3Gw64uA8VPDT53TDapay1eYTPTbgtXxdxLGvhN4joWHY/Ndn4cM
         ynrKypczozHwPFr0yT4NCchMQSkh4qzcrhgWgOa5N0LrRmtc1/bdEW26w93EYmpkL0Rd
         v9tpL6OSQU/WvyYohlKwBkLMDeDlD2G5TVTspE5mpzAcnVKPkFH1HqkU60ccYkUcMK04
         H4+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJjCqqetnCdIPe5mCDf2sAznereQ1ljcUVU4QohJqjZZvp3Sk18MV/JgMFm2VCM1Kc5/YD0VRpmaBBVNFvhaVeUpm/HZ3Nbx5lRqWcfvelZVA=
X-Gm-Message-State: AOJu0YyqfyfvPQ+WNf2ThXSY8GCZBI9eX/R0bEjsaOYR3ptWc7ygr26R
	frL0Z+nI/COf2NfeDUgnKJkPY6Wc/CLYvZrBYfQUq2J+PXHKyeKic3lGphCprvs=
X-Google-Smtp-Source: AGHT+IGGKnoKugE+WYXkMHeP4uDb+eAhlfsvpb4nQh55J+SXo690lt4AZSHyCDWhNPvBhDeKtKl1Kw==
X-Received: by 2002:a81:ae24:0:b0:608:1b7a:4984 with SMTP id m36-20020a81ae24000000b006081b7a4984mr1527219ywh.17.1709022585670;
        Tue, 27 Feb 2024 00:29:45 -0800 (PST)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id t141-20020a0dea93000000b006091d284e67sm541694ywe.54.2024.02.27.00.29.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 00:29:44 -0800 (PST)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc6d8bd618eso4033993276.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 00:29:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVfa2MVerMgurZeuUWRj1eD+ihwnhRKcDE9i1qY7Q/vJGz0MxFnwfFxkD25JylK8DGC693cfy6vGK8w8t5myMQXiViSQS7GXFpHZq6z4omMK+8=
X-Received: by 2002:a25:ac25:0:b0:dcb:f7b0:4788 with SMTP id
 w37-20020a25ac25000000b00dcbf7b04788mr1407065ybi.60.1709022584399; Tue, 27
 Feb 2024 00:29:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226200157.428896-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240226200157.428896-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 09:29:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXyJP=dor0nujf1p2gsr+b9ZRMns9YTfV5-MZwf_L5z3A@mail.gmail.com>
Message-ID: <CAMuHMdXyJP=dor0nujf1p2gsr+b9ZRMns9YTfV5-MZwf_L5z3A@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: defconfig: Enable Renesas DA9062 PMIC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

Thanks for your patch!

On Mon, Feb 26, 2024 at 9:02=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Enable the config for the Renesas DA9062 PMIC and built-in RTC,
> GPIO and ONKEY drivers as it is populated on RZ/{G2UL,Five}
> SMARC EVK development boards.

RZ/Five is (in reality: should be) handled by a different defconfig.

>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Enabled CONFIG_INPUT_DA9063_ONKEY and CONFIG_PINCTRL_DA9062

> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -442,6 +442,7 @@ CONFIG_INPUT_TPS65219_PWRBUTTON=3Dm
>  CONFIG_INPUT_PWM_BEEPER=3Dm
>  CONFIG_INPUT_PWM_VIBRA=3Dm
>  CONFIG_INPUT_RK805_PWRKEY=3Dm
> +CONFIG_INPUT_DA9063_ONKEY=3Dm
>  CONFIG_INPUT_HISI_POWERKEY=3Dy
>  # CONFIG_SERIO_SERPORT is not set
>  CONFIG_SERIO_AMBAKMI=3Dy
> @@ -559,6 +560,7 @@ CONFIG_SPI_TEGRA114=3Dm
>  CONFIG_SPI_SPIDEV=3Dm
>  CONFIG_SPMI=3Dy
>  CONFIG_SPMI_MTK_PMIF=3Dm
> +CONFIG_PINCTRL_DA9062=3Dm
>  CONFIG_PINCTRL_MAX77620=3Dy
>  CONFIG_PINCTRL_RK805=3Dm
>  CONFIG_PINCTRL_SINGLE=3Dy
> @@ -724,6 +726,7 @@ CONFIG_MFD_ALTERA_SYSMGR=3Dy
>  CONFIG_MFD_BD9571MWV=3Dy
>  CONFIG_MFD_AXP20X_I2C=3Dy
>  CONFIG_MFD_AXP20X_RSB=3Dy
> +CONFIG_MFD_DA9062=3Dy

Given all other DA9062-related options are modular, shouldn't this be
modular, too?

>  CONFIG_MFD_EXYNOS_LPASS=3Dm
>  CONFIG_MFD_HI6421_PMIC=3Dy
>  CONFIG_MFD_HI655X_PMIC=3Dy
> @@ -1166,6 +1169,7 @@ CONFIG_RTC_DRV_RV8803=3Dm
>  CONFIG_RTC_DRV_S5M=3Dy
>  CONFIG_RTC_DRV_DS3232=3Dy
>  CONFIG_RTC_DRV_PCF2127=3Dm
> +CONFIG_RTC_DRV_DA9063=3Dm
>  CONFIG_RTC_DRV_EFI=3Dy
>  CONFIG_RTC_DRV_CROS_EC=3Dy
>  CONFIG_RTC_DRV_FSL_FTM_ALARM=3Dm

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

