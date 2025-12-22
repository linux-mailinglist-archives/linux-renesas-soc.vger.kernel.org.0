Return-Path: <linux-renesas-soc+bounces-26008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E979CD6742
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 15:59:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD21730AD8EF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 14:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22701330646;
	Mon, 22 Dec 2025 14:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DAB/Amyf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE24032ED49
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 14:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766414865; cv=none; b=sO76BHsm+jfhtx4Bb82G9TcuJVzhFny3Sw7CXOS/dkFa9sHMqiOqROyoi/iAargPTqMItP+lQp9vK4xD473ff7IlxgVWS51+RSaFlwYhx7d0pd8TVi227XbkYoBS/YKE1540o42bR9G92fYvWim53L2chZtThCVY8P9+s8viWZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766414865; c=relaxed/simple;
	bh=IwLjLCoIOYSxZJTADglHFhXYcy2He7W4GE2tlYf0bXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pvum8dc3ZTTAJE2OBV9NbkaSmzyZOo4fjAARgzOz2j5GH56FcqNYmUDZiGNS/Gv0hMLKuG8xpVdopn0DCMhQLv/pImw2eDChAO8QIFNznZue3gZPDlTq1y/RynNdL43XUJXkQ4yVqQwGBA1coiqeAIraWRr7V+TfwsKJFbvBeDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DAB/Amyf; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5943b62c47dso4013250e87.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 06:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766414860; x=1767019660; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lNpWj6TBvVji/fHBEAyDcOFnMWFot5zrE/hRwsxnXVY=;
        b=DAB/Amyf1kdMghWpvNsR5yNnMf+GdDvgb0bA4+59mA0CrIcjf0meQgWipWa4qgI0+u
         QzmXsaKh4CDGdPAVFemA6mB0PY7nYeYTfFKf08TKNBK7/79eZ+/5axG1Oj+c5gAmAFfg
         T6+CWEWvYf5iQFoFrZGr06kU0xwOi/gsXNB3kQcCCxDDaqnVlheA/H95h4OGQdIrQD1T
         DuSAeDBryQG0Va3VNcLhpD2f+qW6b93O1bCz7Ls5M2R8ZzuC60dez2dFPM0QaMrYu6X1
         4TJcc1dZY6C1qQanrLgSyh2HkvSgJUb+rXBU+gv3hnl/FjGW4kxTqLG3nbaKx9Smpezy
         zmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766414860; x=1767019660;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNpWj6TBvVji/fHBEAyDcOFnMWFot5zrE/hRwsxnXVY=;
        b=SyW0NbY/ZSK5Woj8Hct4up6iHaHEtC+ubTWt+qZ/shIv762/qeU7YO5j5FaUPmPE6b
         KdECXCvOAdPctQK8rjdHNZDYa7V5lcO5wVPfac6U+tCXUlS2RApNEPhSF50/QLOIGYtc
         6EmY4u53xuCNJK9UsErdhbiHCo2KOLJ0Dh8nwD3liuIc7qPezTEtOK/06otLEbcz+jn8
         MCSH0Xrp+Jto8C4Bnt9U3/0K4m0iYYRKpmv2EWhUarIVblilwgknsuLIQo383BJHco+F
         h6OVTHWRyxnifXBEUBY72inr3Jy+aimxWvi6SdcUl9ReGv4O5+xKHliWQHW0KhNkHlQ0
         S8pA==
X-Forwarded-Encrypted: i=1; AJvYcCWeP8ApqxxZU0E/YWLUeG2REzMvIUhIaeBIUWmYPmJ/VcfHw603lTOSeNy3GCtvN9S7dafbYosvUmW6C7k1qcFBPw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyip+qDtrMtsaIC1M1/5bo4osLiTa/nOwx0LvUS/SvseNWaKVWZ
	yoyMkS0gcoGDd7u3QdXQOl74Hwbuf2gbyIWLdLcLUWtmrPJJEGlx4SAFvgHLBOOULMGuC3+peSy
	nrnBIMbPELYwUSyVeyVgKFoyY3ry6Qu22EXrb14/Xrg==
X-Gm-Gg: AY/fxX73JkLBhHFNtTkx49HGGO+vj+bQyY0bHJ5qJI+5Wqt34MLfgXXkU1Y3ZVq5nHl
	z9cI11aMa46BoP2zasvUnCqqBn25Dx2L2FPoAPYZFvOQjuP5bBcBszQAmFIRzX+7KHeimoA+zfp
	1sOEsMemE3SqMi6tUIF2/9vlYTBWT4lEijgRBu7Lbh/7wfq3Gdx0+1Qn9hdf4CTsfnQDXgZtiRt
	NKgkOXDdTNyHCRjpVW5Ygv/peGNGDT0gWcjlg5RbyBJXAHvtPL24Ii2i3wu6pA3w7PFOrJ+
X-Google-Smtp-Source: AGHT+IEmZoekCpdFdxCX6++mG8wezcWmjXxPG5ogJ3p4YsZ2il+JIIqimrrt74JmCImmja/XHDzRdip0knGEk5MWYgo=
X-Received: by 2002:a05:6512:e9c:b0:598:faba:c8fa with SMTP id
 2adb3069b0e04-59a17d006e1mr4286628e87.10.1766414859977; Mon, 22 Dec 2025
 06:47:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com>
 <20251210-rz-sdio-mux-v3-2-ca628db56d60@solid-run.com> <CAPDyKFoYd3WKGrjD3DEzZH8EfgZPmRkrqL=rdoKNuAADrvz3Eg@mail.gmail.com>
 <20f2128c-c6cb-4b13-aa08-b93e540f5bd9@solid-run.com>
In-Reply-To: <20f2128c-c6cb-4b13-aa08-b93e540f5bd9@solid-run.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 22 Dec 2025 15:47:03 +0100
X-Gm-Features: AQt7F2pGUIPrw4OqWueh78ppZDBGwQc_mhY3RygUrq6e1L74fXopGZ4K0V_QvZo
Message-ID: <CAPDyKFo2jsV02qSDBSZTewJjV09AMO8iETU5Uxqz+GBnd0JY6g@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] mux: Add helper functions for getting optional and
 selected mux-state
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Peter Rosin <peda@axentia.se>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	Jon Nettleton <jon@solid-run.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 21 Dec 2025 at 11:38, Josua Mayer <josua@solid-run.com> wrote:
>
> Hi Ulf,
>
> Am 17.12.25 um 14:38 schrieb Ulf Hansson:
> > On Wed, 10 Dec 2025 at 18:39, Josua Mayer <josua@solid-run.com> wrote:
>
> cut
>
> >>  /*
> >>   * Using subsys_initcall instead of module_init here to try to ensure - for
> >>   * the non-modular case - that the subsystem is initialized when mux consumers
> >> diff --git a/include/linux/mux/consumer.h b/include/linux/mux/consumer.h
> >> index 2e25c838f8312..a5da2e33a45c0 100644
> >> --- a/include/linux/mux/consumer.h
> >> +++ b/include/linux/mux/consumer.h
> >> @@ -60,5 +60,9 @@ struct mux_control *devm_mux_control_get(struct device *dev,
> >>                                          const char *mux_name);
> >>  struct mux_state *devm_mux_state_get(struct device *dev,
> >>                                      const char *mux_name);
> >> +struct mux_state *devm_mux_state_get_optional(struct device *dev,
> >> +                                             const char *mux_name);
> >> +struct mux_state *devm_mux_state_get_optional_selected(struct device *dev,
> >> +                                                      const char *mux_name);
> > Seems like we need stub-functions of these too. Otherwise
> > subsystems/drivers need to have a "depends on MULTIPLEXER" in their
> > Kconfigs.
>
> Currently the drivers that can use a mux select MULTIPLEXER in Kconfig.

Yes, but that's not generally how we do this. The driver may not need
MULTIPLEXER for all platforms that driver is being used on.

>
> There already exist a few mux helpers both for mux-state and for mux-control,
> and they might all need stubs.

Correct. I think we should add subs for all of them.

>
> I'd prefer the restructuring of kconfig dependencies being independent from
> adding mux-state functionality to renesas sdhi driver.

I understand your point, but adding the stubs isn't really a big thing
- unless someone has some good arguments not to!?

Moreover, since the series changes the mux-core anyways - and
subsequent changes depend on it, I don't see an issue to fold in yet
another patch to add the stubs.

Kind regards
Uffe

