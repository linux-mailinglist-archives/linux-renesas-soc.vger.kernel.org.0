Return-Path: <linux-renesas-soc+bounces-25680-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E00D4CB03B9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Dec 2025 15:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 89279300977B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Dec 2025 14:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CB02BEFE4;
	Tue,  9 Dec 2025 14:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJcDhqP6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9D9299929
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Dec 2025 14:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765289858; cv=none; b=FVuDx2WsKiXk182o43dXS5AaWojv2nLnRt9H+1UeyiCvzWf4rW7E7oU64uVViiuiWNCQoQlAlX3D3LJR13/nnu/vpOcbwjdhAD4snn+TmrDChMGkOSHeK3m/flxyznuru5vi3bHDiMqmZ98Wr7SeptWr6ne/F1v+NWNiUnASaaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765289858; c=relaxed/simple;
	bh=unuZ6P3b7Yxjaa+0itPHl4nXBL7mIF6rtwXPOxCWtX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFfgSJFv4UxVbQzyKzy25xBH9J4+eWRRVg5fwoAkCYKUEsaXElP3vkPcBMV471KgWaMKvbflGILOiODuOO0SgPZdDWxsap0zMgqDKFOVa7FeNLxDD6AYLAhZOYRfR5CjxMu6RwgmqtGCzrvwq3+bDPT464zGTC7HJH1Rd6TlQtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EJcDhqP6; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2a45877bd5eso8182705eec.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Dec 2025 06:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765289856; x=1765894656; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GqGl05z99jHp2ShgOvgQgByFBkkP2VElXGK/JMHVdj4=;
        b=EJcDhqP6gkSRYJwsSv2k0z0JKn9iv5hcbelmELr2P3lxWCRnlk0lbADGeEpal6NB4p
         wYuuoo9+s5zqMnCoWq40Dd4sWemsqp+oOEPWUbqAl3J/GbjdVKnH/2NbJbU7hong+gjQ
         sawD3lVJ6BJcqYA9eu75o9Gnka3/Z5vxcEXy8NS4ZouORDBysJdlvLwaNm208Z74YZBe
         +Tyl8ln2f+b5tVxwpZFY2dly7V0+LHt4ezeVsRejV5mAkwpMOJRd2rH97TzHkb/iBjcc
         amJ7UUeOBoZvlsLphZZunoALUwUDvoFN8NbYLerIHWjUqFLqCkBtu2i6Ww45VwuZtD5E
         h/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765289856; x=1765894656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GqGl05z99jHp2ShgOvgQgByFBkkP2VElXGK/JMHVdj4=;
        b=g5l3H7V6ovlMt0LZnk1DfynDaOjED5d2JL5F9jFCS1FPMUelFHtzz7NazlfkJsNxlK
         6SAnWHgZAq06KyHwRkn+l39bxsTVDfavnaITmdKFZ/LFt8ENM5sNvlkJPcKHYTAgUbaS
         pokMakIgbl0h5I0M70UScO2OaC6O9BxYIi/8aeDCsLRaAnPfgfSyYbTZBH+Y+WQaaJ86
         OHY/xYjMiTEsmYcBfvLccELk6nW+OvvhxpCf5BQzbAUaaTESYl18oezN5mBkprXrOx52
         X875jIAF2NsKBV7eVRW5XH857jyOkpucHvHyGirVbvOCaVfEqRYLH1Cm1yvgWiR1elZF
         RbkA==
X-Forwarded-Encrypted: i=1; AJvYcCWUaQppx1wQjJkQs0l43eJu9ziz89RR1qEMxrfmLTvb5wzeQL4dZn+vwwNBirKAVZcrAQqLI1i1A28QMESVOQkWlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YywzLSHpbZVeJu7fpscHb4psc+uww6vKa0PjsEA614gaV2ys1Tr
	DlZUkeMTxK2JJ203BAhgBtgF6Kgbl8BiE6H0tmP1T+WiPsSwdomH1ayXqrc/JA1kmssHmkC/PKL
	ss79V/QUIxtXm8LuPt67fr+HVQrXnfWM=
X-Gm-Gg: AY/fxX5b5/3hOKJxCHdc7GcLHj63sHDWugV3Q3rJ5t9Ftm6xGkJsQYO2Eyti9LUCqNV
	CK/TpM+A4Zrnm0rcPGFvh9ZMnp6hE0vt5K2CdKQAcASWgXLZysYZJqGHl0ouK4JbteNOqzciQs2
	tvnNvBYb96JYSKt/NgHh2bhzC0U3/xbnSeh1k/RVAMp1aE2LR7irPGORdvp+GMAvl3rB+14Rhjf
	OQtjALMqIQ20dtE98ed6IOJ1/94qEksyBF+TZe78BZ/GU/+8e6aE9WJkwHxhXuWBT6HFjrjKRk1
	2VCVVrREooFDrVqQ9bOuilWSmrkP8DVzv0P3vQ5HPfwpufa15KIydesSQCVzOmAnhA8vZacuFWr
	aXe6AzjETSg==
X-Google-Smtp-Source: AGHT+IHJSK7Qp1zb5om02W592OqiY5udTEsk9nBSftpZyGmqI0e9P/OjwE7rDiAyfrBX382yq5jBhBWzuWKkJmGaXh4=
X-Received: by 2002:a05:7301:f25:b0:2a4:50c2:a74c with SMTP id
 5a478bee46e88-2abf8dee655mr691583eec.8.1765289856143; Tue, 09 Dec 2025
 06:17:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251124182751.507624-1-robh@kernel.org> <CGME20251127142839eucas1p186846c6c1ea1d9e43369fbba9bb5d17c@eucas1p1.samsung.com>
 <20251124182751.507624-2-robh@kernel.org> <674efe8d-c299-4ce9-bf6b-c1920a5393eb@samsung.com>
 <CAL_JsqJTrGAJx-fv8OQGDhsLVKavQzzQotssEq_E5f_aJe8bOg@mail.gmail.com>
In-Reply-To: <CAL_JsqJTrGAJx-fv8OQGDhsLVKavQzzQotssEq_E5f_aJe8bOg@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 9 Dec 2025 16:20:03 +0200
X-Gm-Features: AQt7F2rjwQKc_bRBeYsxUFhD_YJR9U-Y3qN6s4VMgPax1Na8ykfHoapTIdM-w18
Message-ID: <CAEnQRZDBZ52FoNRBJa1qScbkcEYKwbyP_ephutdkYFaY5b1yLw@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] remoteproc: qcom: Use of_reserved_mem_region_*
 functions for "memory-region"
To: Rob Herring <robh@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Peng Fan <peng.fan@nxp.com>, 
	Beleswar Padhi <b-padhi@ti.com>, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Other platforms (non-QCom) were tested also use
> devm_ioremap_resource_wc(). So something else is claiming the same
> region? Can you dump out /proc/iomem?
>
> The region is dynamically allocated, so maybe that has something to do with it.

We noticed a related issue with imx_dsp_rproc.

Because:
imx_dsp_rproc_prepare:
 -> imx_dsp_rproc_add_carveout
     -> /*... */ and this calls devm_ioremap_resource_wc
-> pm_runtime_get_sync

imx_dsp_rproc_unprepare:
 ->pm_runtime_put_sync

There is no easy way to manually undo devm_ioremap_resource_wc so I have
sent a patch to use devm_ioremap_wc.

https://lore.kernel.org/imx/20251209140425.766742-1-daniel.baluta@nxp.com/T/#u

In your case Marek at least you need to understand which driver
reserves    8dc00000-8e7fffff : reserved and why.

thanks,
Daniel.

