Return-Path: <linux-renesas-soc+bounces-2723-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A48853D8E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 22:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A56361F22B18
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 21:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA9F161691;
	Tue, 13 Feb 2024 21:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s3eyQZx5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C440161677
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2024 21:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707860872; cv=none; b=chj+w950+w9Fy9RLLUidUFDSUIuNAezHNjeli2kMdxx0t+dlcg4hV2dbR+rxWaIl6lyqlDeFl1XtJrkETwfF9fpMKTfJvqUw4I5BG/yVpw2D8IMbe9yKgOiCJdLKKO8xFcBO67mxe5AkDSHQZderB8sYFY1s/2zwI0JQggiSjgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707860872; c=relaxed/simple;
	bh=4Xj7EazHfkvqhAcFDgWE71D7H9yEicOk1M857cHV2u0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PPQYR+03CgIrCcIraFJyc0MqMR2g1CWMPQJZZ2cFppHZlsm/W/O+DRrSvl/HOdl/vj0gvA7Egxo2mYX35hQW5NCxEbs0S7Y4WEcTYF59qk2wx4mqhZe0g5kJVrqIG2E6m69zhhU9mwCnxYDL9dxrlxHBqXmBelx1BWL05I6jVTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s3eyQZx5; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso5038571276.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Feb 2024 13:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707860870; x=1708465670; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Xj7EazHfkvqhAcFDgWE71D7H9yEicOk1M857cHV2u0=;
        b=s3eyQZx5jV7ThhYFnv4fc4t0MH2AG7GTPJ12W3fm4/0jqq75Acl8m3eyz94117VKwR
         u8Mn+eQjRgF+8m2pz6vkDhTs/waZxPZXRdnfYZalO/6e4ZVWqVekPqDJX8FDg7TWYrln
         6Gudg4YUHAwilqcfFdnkVOQA5oYITMJf1FzN0tN1Kb1yoHBgoKFpl+dfSjUsB4pf2AnC
         r4BtMo7TDw9Aj7Oqz6HPj4ZuWhecAhb6lrUsI4XwlYRt1N5cwLQCaLkCh/IRfFDoaFOE
         u8kPcUZcArTUVM3ooDwtoVDfTVqDVfX1dEvYr5UUcM85CZiXBjf14xt/ZRIli+hrhG2W
         +LZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707860870; x=1708465670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Xj7EazHfkvqhAcFDgWE71D7H9yEicOk1M857cHV2u0=;
        b=fDaz043uFnVBX2HLwI0URxx4AAB7zC+s7xn4vHUQgZN2F0rQfbJgxXLcdV5zPY9Gzh
         oW8DKhS5haoa/YyEkmDWHunQywksQjmkh/F9xlQ6fdvezmATgMH+QVCa0uP2yCfkbLrg
         26J95mB1PMUVicAlYKfROuDj4GUoU5dmQdr5bGm602gvBQn/pYhgY88cHGeexl5MwiIG
         pvrIN4CYvKPBVYfOKkRM3u7NCLkfIK7VS/lhWcIRpKxKA6KY/2SmIChkO6ZadZQIHqa+
         bzRkymn2AORLFXBcFFSPkKhMVaPnYRs9Qnyk8JCaGGyBf3v50kMiQu8KrA877C9uza2J
         9AHw==
X-Forwarded-Encrypted: i=1; AJvYcCVbRwBFLfduL/EZnYt1aqvuQ4CRAq2ou9I7tUedkBOES1dTSchDzCB3hBoccMDZxHbhVADEn5h/BoylBz8Z8leY52ctf7NoHJ2MgMvqxGkZitA=
X-Gm-Message-State: AOJu0YyZuMZO/eFqUlHv299tVhQwlIRPKbCf2zPCOaFBMT8Qcrsl1qga
	Si51RTOBn3JVw6oCKoiyRMN3cuCTY0ZaEujdN6X2fatDmWGFn+VjeACfIJpmAqoD4WWW/XfIRxV
	yS2+FzFwECROtVKsHjOiOzoy61VGYH/iqEht/kQ==
X-Google-Smtp-Source: AGHT+IFa7Zt8v9y973vv6MpdAwv7+Tn3+by0Zhu9bHJxIuhmjm9zf8ed0hjSWCanmVOGM7vq2XjFxfCkSYAs+ofuT1Q=
X-Received: by 2002:a25:ae47:0:b0:dcd:49d0:eece with SMTP id
 g7-20020a25ae47000000b00dcd49d0eecemr434149ybe.60.1707860869809; Tue, 13 Feb
 2024 13:47:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org> <20240213-arm-dt-cleanups-v1-4-f2dee1292525@kernel.org>
In-Reply-To: <20240213-arm-dt-cleanups-v1-4-f2dee1292525@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 Feb 2024 22:47:39 +0100
Message-ID: <CACRpkdbPANM0-h_g+6Zazgw9U5W8ZDc=EG4ZiTv64JVmZAPivg@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm: dts: Fix dtc interrupt_map warnings
To: Rob Herring <robh@kernel.org>
Cc: soc@kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Stefan Agner <stefan@agner.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
	Tony Lindgren <tony@atomide.com>, Chanho Min <chanho.min@lge.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 8:35=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:

> The dtc interrupt_map warning is off because its dependency,
> interrupt_provider, is off by default. Fix all the warnings so it can be
> enabled.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Thanks for doing this Rob! The schemas finds so many mistakes...
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

