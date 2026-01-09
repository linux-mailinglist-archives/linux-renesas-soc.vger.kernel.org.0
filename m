Return-Path: <linux-renesas-soc+bounces-26517-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D01D0A822
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 14:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B40F53060A72
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 13:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539C135B137;
	Fri,  9 Jan 2026 13:49:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E0D3596F1
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 13:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767966567; cv=none; b=fAlqteTpOpTqhjCZOkEggSp9v+h6DAucYvLNeDn4W621+0kAQ1OYHDBT2daRPtMfcE+uaSFoRQe+f7iu5P5bP1OlG38RWgIALLReuuvIxhLBY/G8XbGRVgQP4UYgSmR7pYILMmfRP6DCMuS6b3rir/1dzMePE9TraqEoK0Xc544=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767966567; c=relaxed/simple;
	bh=WLFUrhNxJ/XDPIZxprmACvVsb1Pyo7q0wLa37Xprya8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LgCxwGMNk10Bwjcfr9nsiZR0Lhyzj9PSXJSw400emwcIEBrEv13gdHawZ8au2jtvDtdF727wlITRK3YrKDH2NkVlqeCGH/poH9fN94jMMEcF+ylkoyfupFNaUveLUcM4rV6lxr9D1d2W4OmNw8JVenBODm/Y9SOJ80gf/k0y0DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-55b24eedd37so3195182e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 05:49:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767966565; x=1768571365;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1K7NOffoek8SfFkqFSd9+BgcJllduHoywKqDwRr4NrA=;
        b=hiyJXlELxSY9YL8mP/1HXE4fcQl/ItM0frUfCp24EY1I/iIfJVJgXoma8b3M+Tv1VZ
         Er6LiW5Cd8YoDYejp5aoq5HjtP/0RgQAF2ZYr6bgmikn2UgfV6Q0HsHrxqGVZtNxqfLM
         MSHME/lcUzpnMU8+Jctgl/HCJldFipBGw6RMtLCIX8AlFf+CGdAgkugCZ/SkwSrtD3Kw
         HRFPSOm9KziEDkbCIl283wm4MvfrkkIhH7tO5kY1e3HGd6lhnbQN7OjNwHnncGNgL6cF
         Pf8ssdYrOjdpYBJo4idhj2wfsRYgDl9IzTECBsYw7YXfOxf+Br2ilmEujyhKXi6RjPuj
         SqNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj214WP+s3Ad9rANPFNIOB9FO0dyEknkEvIiLQsFL3IuwX21VudIOrgYudAakrqZnCgdNdzWlBHuka8NtngRwRcA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq5PSmPoo+AmWzSwSKJI3DhtfpyzolH1QI+Fsj+yFl0e15/l6j
	ofE2l+SoLM6ndYGOasuRNn+nafWJTJLRb/h1l/kcYLlY3QHRUp6Bq0pybfcxt0j0
X-Gm-Gg: AY/fxX4p8uN+h33/nJSEyCzFMehMFKvYToMSl2Y1Li0JBJ/ExzIhlnD1tIy/Qx1p8F5
	VkQbp1h9LVLXzRYbn6SD/PMBJCCcwelwqt/bedVGWjYS1igzii4QIX9zRvqf5Oh0+7sCNEz12Dt
	tpIRbBjSQ0mjzuCD5SgdABstvW3jndBHIfm8GWbBd3q9ZYJDo/KJOPrGAoP+cxJGi/IXxJ5lPHc
	qmCeCV0vOPt6Agpl/VBdxQUEGFod3AlyVBpTOZGY0h/8UYeVQV48D1IjHRs4fvrcYAjfai9IaYX
	mmjW9OTsjaLMSE8oeTGjJsKBoZ4kMNr17rM+Pwd4NlEzurHmYS5siupmuGVYYn0COTipq/ZwnNF
	ErAYeq2k9NMS74zYaIc7+Z1snsWx0a3jyWe/TmDWupiuyoUmliswiISnzbIQ8D52LKC1S3/U9i+
	WKYGpADnoi5a9XiXrsP25kC+jM2Btr+OTmP8++bUYCR/rpjU1z
X-Google-Smtp-Source: AGHT+IFoap2eyzesbql+mTtsef7kqBcJzzfyO3ZBdicLyzoJ0z1tmsZsELWEJ3PnhSMFfHmwH0BhmA==
X-Received: by 2002:a05:6122:31a5:b0:55b:7494:177b with SMTP id 71dfb90a1353d-56347fcaa6cmr3263804e0c.10.1767966564798;
        Fri, 09 Jan 2026 05:49:24 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a43fe52sm9381981e0c.20.2026.01.09.05.49.23
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 05:49:23 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-93f69720a7cso2790039241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 05:49:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXZLACY5KQ78MEmZ//OynB7v1y6V5dsRHECFENNdBXUmQS9jnzJFUfG6mTb2Aawev0czLGtE2vi53tMgDBLNgB30g==@vger.kernel.org
X-Received: by 2002:a05:6102:800e:b0:5ee:d0ff:7254 with SMTP id
 ada2fe7eead31-5eed0ff7574mr1607434137.34.1767966563511; Fri, 09 Jan 2026
 05:49:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108195223.193531-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260108195223.193531-4-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260108195223.193531-4-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 14:49:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX39Bdg_LBry8QmGTR9Z=CNs6xGksFbzJw-8oDt4CcOqQ@mail.gmail.com>
X-Gm-Features: AZwV_QgbNm6q3mt1zlj7hyuAc6e9Eu-odKmqzHG0qAir3pZOPVNUb1tURDFNGtE
Message-ID: <CAMuHMdX39Bdg_LBry8QmGTR9Z=CNs6xGksFbzJw-8oDt4CcOqQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] thermal: renesas: rzg3e: make calibration value
 retrieval per-chip
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Jan 2026 at 20:53, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs expose the
> temperature calibration data via SMC SIP calls.
>
> To prepare for supporting these SoCs, do the following changes.
>
> Rename rzg3e_thermal_parse_dt() to rzg3e_thermal_get_syscon_trim().
>
> Move the syscon usage out of rzg3e_thermal_get_calibration() and into
> rzg3e_thermal_get_syscon_trim() and remove single-use variables from the
> private state.
>
> Place a pointer to rzg3e_thermal_get_syscon_trim() into the
> chip-specific struct, and use it in the probe function to retrieve the
> calibration values.
>
> Now that syscon usage has been moved out of
> rzg3e_thermal_get_calibration(), remove it and inline the calibration
> validation into the probe function.
>
> Also, reuse the TSU_CODE_MAX macro to mask the calibration values, as
> GEMASK(11, 0) and 0xFFF are equivalent, and replace the hardcoded 0xFFF
> with TSU_CODE_MAX in the calibration validation.
>
> Reviewed-by: John Madieu <john.madieu.xa@bp.renesas.com>
> Tested-by: John Madieu <john.madieu.xa@bp.renesas.com>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>
> V5:
>  * replace hardcoded 0xFFF values with TSU_CODE_MAX
>
> V4:
>  * pick up John's Reviewed-by and Tested-by
>  * replace new macro TSU_TEMP_MASK usage with existing macro
>    TSU_CODE_MAX
>  * remove "Validate calibration data" comments
>  * inline rzg3e_validate_calibration() into rzg3e_thermal_probe()

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

