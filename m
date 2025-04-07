Return-Path: <linux-renesas-soc+bounces-15499-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 251ACA7E6AE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 18:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E7503B1362
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 16:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFAAA20C00F;
	Mon,  7 Apr 2025 16:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FeW7eUP1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4532D208993
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Apr 2025 16:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744043269; cv=none; b=LLYOoHf4RomWCMTxkgMgaPfMzZS5IfvvVU1XUCvlyqOd5DByY97d39BT6ZL9RZ3Ps72nNDgQm1YTl7GJH8ZYAsB4ITdIYQPuBsDyq0e/CnJPM8BrM23k8NqAUvaJdP5AERD8utBhcfQMNzqDTzUSr6Lrmy9UFqqztWjboy1anLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744043269; c=relaxed/simple;
	bh=2E83vRDeGBi2KQKmMy4PdlP5hsTnpBPGTayVZg7p9Bg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e3NgSGzR3BgsG54y8SK/nAT8zK1kLxp7R42BEdpzYPcTxTWkO9WGYwME2Py2J3+ANBGuSAaAFPl9wqkeYbmKHW+1DdrErxkVrxPaaCDp1AeZbhRNTSAmVP7X39ruWO5PL+MhQim9fXVfsr10euYN7+w6Nty0QJt8Py9J+yuUkDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FeW7eUP1; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6f666c94285so49312037b3.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Apr 2025 09:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744043266; x=1744648066; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2E83vRDeGBi2KQKmMy4PdlP5hsTnpBPGTayVZg7p9Bg=;
        b=FeW7eUP1i/jYIUpdt3/leYbgv4gpUcdvDfUNZK64WiG6COQYdVySysz4YiKEtbIh0/
         S8aLXCvuTjbS2AY9yE0ZdKx4U/uovegIxr/GIUcNp4RzZT+s6zLezo8rAXK5IqA5z/v/
         Dsh3qe1CZiy5UCntu0FIGhxcshsgilkgJdQNLZm0aP+qreMirmDbbw4SRUhRTP7am75L
         ZAtEe5ugzMYw1WPYaWi+m9su1IF9pu72hXB34UEX5SyXi1EoKDus5TFMTB5xNYq8ZhF5
         DBnMuB9zK2myHZECWdNpALEAqsWaC9pc+EbblWL3TEv27NLSYFk0e/09zBFYVkeg6L+o
         I2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744043266; x=1744648066;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2E83vRDeGBi2KQKmMy4PdlP5hsTnpBPGTayVZg7p9Bg=;
        b=UNtVH2bai2wgNCbJ23nIYnXF3GlSpwy01OqDYtewQF+miXHFGl2ws0620XekkIdqcX
         zmjZ2y6yijpiV2obIkuPLbhQkN/c8xN/t6/1NVK8sNYpDHvwEC3swGfsK4nXft9H5EU+
         caAZ4Ps7ppKt73/ubaPFjq/b2mLnXRvbfl4GZE1Y9ngzTLE1b2+qSEx3foWwyc9Ab7tG
         Yoq9U3Vf6baZbVCXH5A3VY6qgcuKziCIIcSGaR0i2GtSOgEvmL+xI7ikpZJUmHsPIaJp
         2Buq1dEbBj/n9z7GEgAAntxVO7zQE2Ruu7V5YL1vEdiLnTrKpbe/pngV7nXexMquTe5C
         pWYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCqtQA+RodrszTfbD7PAG6aizJ6d1qHjtHqU4+rVjr7L6gayMrOpgYurBD1rKVUDiY+u6F4xhKXrt4dvI1IV1VDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmKcRnnPMusXoeJ/HMLeMQzj9r1NIRChx+4t6BFKsd/lEXp7Sn
	37fyYMnHrzwPfFaIrejD9E+oz+TdNinCAJ/yjtrNJRVtZcT81cxoE87vY71RsjVDQRCftnw1fub
	CIDxAYJq4OvBcbe/SFliXn6EXBWH68YIKMfdsrQ==
X-Gm-Gg: ASbGncuAwVHXlOZN8rctcVzQ/ch3nEz7A00rUfSN6vTK9JnXrcBN6LWd76LbhmT3WKv
	iXNKep7f5InzbqJXZwkecVbLpoo6M3t+Ezt9Kr/h8R29DIRTJY47xKWssXLYzqipydjPtq8NB4g
	7bBt51jiV/r/UeZstStvmYVsJmKn0=
X-Google-Smtp-Source: AGHT+IGtNp2BrAkn3PRcCBrP5vhlJ1looux4OpDWyP6ljq92N0vWykgYWHtVBu01P5IBh7MS/lbuITHOgr8FD7w/MVE=
X-Received: by 2002:a05:690c:a84:b0:6f9:9d40:35cb with SMTP id
 00721157ae682-703f41267b0mr168266747b3.6.1744043266227; Mon, 07 Apr 2025
 09:27:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-9-076be7171a85@kernel.org> <03011a33-174b-4027-bdd2-043aa685380b@oss.qualcomm.com>
In-Reply-To: <03011a33-174b-4027-bdd2-043aa685380b@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Apr 2025 18:27:10 +0200
X-Gm-Features: ATxdqUE6-dDNiPO2iJ2zywPixm7KYg2Lx2vGxVH4s4tPgli0QW4REXdhqc3rxfE
Message-ID: <CAPDyKFoZ7NfN+pkCPnusvTOEaxbQhr=1FJqzdDGrLcKAzBpGyQ@mail.gmail.com>
Subject: Re: [PATCH 09/19] arm: dts: qcom: sdx55/sdx65: Fix CPU power-domain-names
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
	Conor Dooley <conor@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Apr 2025 at 22:41, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 4/4/25 4:59 AM, Rob Herring (Arm) wrote:
> > "rpmhpd" is not documented nor used anywhere. As the enable-method is
> > "psci" use "psci" for the power-domain name.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
>
> "psci" is what we want here, but these platforms require some more
> massaging..

So this isn't for CPU performance scaling?

>
> These SoCs don't seem to have any PSCI idle states (deeper than WFI)
> described, which is no bueno, as they support some..

If PSCI PC mode is the only supported CPU suspend mode, we don't need
the power-domain topology to be described in DT as it's optional to
use.

Is this a PC or OSI based platform?

>
> I'll try to improve this.
>
> Konrad
>

Kind regards
Uffe

