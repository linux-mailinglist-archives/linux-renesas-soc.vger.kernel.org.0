Return-Path: <linux-renesas-soc+bounces-28046-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNAYMsCwiWndAgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28046-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 11:02:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F2F10DEB8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 11:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD9513059A92
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 09:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEFB133B6F8;
	Mon,  9 Feb 2026 09:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IHe4hmOl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2447B366054
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Feb 2026 09:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770631069; cv=pass; b=aCv60lx2B7SGE6Gwpw4DOfwXjYDZvTBxrN/kZwmRKwSOrSlBAka9SIU5fLDgB4GkgadL9fwtpjHZKUQNCDWT3p/DqUZdLEdTF+r9BuXHjdVArWu1eXZEN9ZZqVx9Ye11mnl3zm5vOgDOKjV6RJC1hlp6FqTMKUZbwbEZssVMOA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770631069; c=relaxed/simple;
	bh=bC10K83OlDdfvr2htwpjLlKwvpR995Jtaa8b2VaNWRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QjUke2LAvMPXZjEUzngqXNcMYZOlbM1hl/V7uP1czWy1fz5bKdO0ovQacjfUN9CEctxLAySjqDXhf2TzcKLqGrd8x1A+ias3v7mpwj4CU10oUbhvrqpfKOtqagRPr2TwwfAMmq9vGUiy2g3YFA0iDFp8EUIznuFQdfq6cORjSeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IHe4hmOl; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59deec3d8dcso3874594e87.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Feb 2026 01:57:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770631065; cv=none;
        d=google.com; s=arc-20240605;
        b=PII/ONgVMrjRSgBam5T4WbAdPXXZsDTI3GQw/IN1kP/rWOaLQ6QearVuUgkcA+Pftw
         wKBwUFChuJE1L0ZVOF7qTIN70r3YfsOtsyqmHJmesnpXG3Y54N6WHxJRZF/RGbpq6FfT
         ZGejYVafpkTHoIA3pu+20sfNuH8q17GKTy8CeW5V7bBf9Jov5IascUjIpyKLopApI5ee
         nTVIDsDvQNQK6x7srxSdtVHlcamWvliauxpoqvrDIWa1BWHRnzhN8TnxPqdlpXmexsZm
         KYXZQ/Evb1ROde7hDFVmWqeoO+Gopv4cySWeUxLURj8Avj5AbWkQB7rUnGHDsrH5GuB6
         OiCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fzG/baFh/xjTaP0Ii0cvwWmrEVxPL+eR3yu7Xbk6kuo=;
        fh=ME2Ezha2TK9eXHB6xf1rPgvqlU1uvuXn/kudABpwPes=;
        b=jqVRDXUt5tyxbMh51+cV1ZtRI4CjWnCnIrVIWWcGTsad1KlLAj2OaredImj+gxY/cQ
         +5cEH70qA3G22lMGwgBZ//RrBvQ8gpZaqgaLaDUTq29eh5SQEsxLMatRIbUMbeOOnzgH
         VV1UlBh2noQ98J8SmXCnHwIKtx0LzYV65KyWnlf+hYgprgbziMpirDSEDtDxD0sopOEa
         ze6rXA4pK6pNjGP4tbJYAG+JPyAMPIuxiuZjIKlLEQjqoeWKpjoUFS78+mCXtvoZap/Z
         ksF907xAXqBZEyhoPeH2GusIcYJ1wjKrIjIAtsWFqbvBUwJvICKNZ2d2lHLPTUJRHQGq
         WyGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770631065; x=1771235865; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fzG/baFh/xjTaP0Ii0cvwWmrEVxPL+eR3yu7Xbk6kuo=;
        b=IHe4hmOl9w7pUpUQyLkq/OgztYofxuV5/j5kZqVf8IuLW8jsfSkKju7oFLOuFmO+Ok
         OuFB7tI5XhFwXmudwca2G0nYRBQ7eEr59JH2p9nQqOTDdW7Y2gLLMsCnKuWV4LpK8sMg
         QEhJgWugZkGH8AlPG3KIjl+KmD0zJUnuheHF85f1h7T24sKIswi0tGubJyQrgfXVOHcH
         068szk1RA7QB0OCEWzd4kP3VEp4dtKPFLkidYA4mXBpOOysC+6s4HXG+8zne7P8+mUJC
         0JfCkcMfokYv8neInNUS7ZSf0KHQvK4NmCQEumO+4rTfN36qUquObsdAu9osKWCZSwzx
         gwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770631065; x=1771235865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzG/baFh/xjTaP0Ii0cvwWmrEVxPL+eR3yu7Xbk6kuo=;
        b=QPdHLex4HQ29OtUpoacyK4eOJpke8VMbCmqQzjEjSjylwbOXtAjHxvlasXoe+vLEHc
         rSXOLqO0xPIeowbS1gW3/GzbjuCcOtGCk93GaJUmL+bapYVLIUI6/HC/ue5RJeXFTman
         IqwXFOeCrd1557jJpQmCH0anV5vxt6BgtOpkfk6xdbWOYRLccYlZc1Gqhs6XEtbWDeCb
         TqsZCWAsdg+FjaIQ/CVlW+IdGU3oV5NdziyrEV78rsEBLk/sD+xJtvBLJ180P68n4yeP
         nOkyZsmatFzCdb5A+erYKWk8F3BoPftk9UW5RBu/QvJPM9VmeEsphkv7VOuG/1spckWt
         P9uQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5vxI8CCdRKUi0+fDt8ScDTp/xYbDH75HE37rbul4xviR89stF3CnGXi6NG2QvIVu2lczlpWJsvq+IJQux+38gJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDakbMq82ojmLmDZT1RSR4M8L44PJVHrS95qjPjZpgw+b1qA0N
	Zi23IMJsA/DxnLaUvyElobN2Tpml8PJZRoQqQooy2uXYcBfDdfYlq/1ByoDAOiKVFjkjWAQcMOu
	BhwAbeEXT6QFzqBQRUbRKO7O03492iQbmulLQzNELuQ==
X-Gm-Gg: AZuq6aI4S6nEMGU688W+8Mqsfw2nvAfE5N/3Tk1NvWscy/0cnl/J9qfW6NaooXNSNFk
	JkFAKGNA7wcziC7YvWH5M0f9TQwfcfBwAR5J1jU+l/d9Aw50oA1oYmTDQp00poqAQDWV8JRiwlU
	AV4R5x8U9PA0cP4DSz5uEtRXYRxpgjnD2bbgh53qSmCON/TBiKvWC6QaNnSZFosZBynsMyXPEML
	tVeO5tBvfYiIwWB9cCpTsy3waqsSEjL0BJTDqhszzd+LK6c/3v9ts8j4KxOrzD391RBim4v
X-Received: by 2002:a05:6512:230e:b0:59e:25a7:e46e with SMTP id
 2adb3069b0e04-59e4517351bmr3165761e87.36.1770631065180; Mon, 09 Feb 2026
 01:57:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260208-rz-sdio-mux-v9-0-9a3be13c1280@solid-run.com>
In-Reply-To: <20260208-rz-sdio-mux-v9-0-9a3be13c1280@solid-run.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Feb 2026 10:57:09 +0100
X-Gm-Features: AZwV_QjtuvXehDumL81rfo3XecEhBGMIVZdeTW9qGb9n_Rk2fTCxSh0YYaQSYSY
Message-ID: <CAPDyKFpbpcg3ei51hEcG5FzJL7tK44PdBcMbxfOdON7ozxP2Xg@mail.gmail.com>
Subject: Re: [PATCH v9 0/7] mmc: host: renesas_sdhi_core: support configuring
 an optional sdio mux
To: Josua Mayer <josua@solid-run.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, linux-can@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28046-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,linaro.org,axentia.se,iki.fi,kemnade.info,baylibre.com,atomide.com,gmail.com,ti.com,glider.be,sang-engineering.com,solid-run.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,solid-run.com:email]
X-Rspamd-Queue-Id: 70F2F10DEB8
X-Rspamd-Action: no action

On Sun, 8 Feb 2026 at 16:39, Josua Mayer <josua@solid-run.com> wrote:
>
> Some Renesas SoC based boards mux SD and eMMC on a single sdio
> controller, exposing user control by dip switch and software control by
> gpio.
>
> Purpose is to simplify development and provisioning by selecting boot
> media at power-on, and again before starting linux.
>
> Add binding and driver support for linking a (gpio) mux to renesas sdio
> controller.
>
> Introduce generic helper functions for getting managed and selected
> mux-state objects, and switch i2c-omap and phy-can-transceiver drivers.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
> Changes in v9:
> - compile-tested on x86 with MULTIPLEXER=m/y/unset.
> - fixed Kconfig changes so that CONFIG_MULTIPLEXER can be selected.
>   through menuconfig / .config as intended.
> - updated trailers
> - document null return value for mux_control_get_optional.
> - fix build error for CONFIG_MULTIPLEXER=m, found with x86_64
>   allmodconfig: replaced ifdef ... with if IS_ENABLED(...).
>   (Reported-by: Mark Brown <broonie@kernel.org>)
> - Link to v8: https://lore.kernel.org/r/20260203-rz-sdio-mux-v8-0-024ea405863e@solid-run.com

[...]

I have already applied for v8 and it's going to be in my pull-request
for v7.0 in a few hours.

Please send incremental fixes on top instead of a new version of the
series, then I can pick them as fixes for v7.0.

Kind regards
Uffe

