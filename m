Return-Path: <linux-renesas-soc+bounces-4206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E06895312
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Apr 2024 14:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 443241F26743
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Apr 2024 12:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6B07A15C;
	Tue,  2 Apr 2024 12:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uqLL0PKI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F69B7A151
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Apr 2024 12:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712061332; cv=none; b=Pzyne2rOBLGfeC0jvg40pr/6rHYywd7D59rsFumN6l1Xz9p8gGRsEdMiXj44W9sDZS3N3mwWzomM4s7QWiR7pRrcvR7NLZTmWTIBK1ZIRtgVw2h6mJtN9aGqqf6R4rroTWU2HC+v25JgL3supI2gHHrSRTMNiSmpkeMKe7QRIn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712061332; c=relaxed/simple;
	bh=ZhodAsfbqQph/6Oss9KdocUA4jNT8v1VGBe4Vmslbbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KJtwfRmV2XPwxHIz50QbIN5lK/896VNjQH8aJWCEpYRYcfYG1Ca9ArJEGNYhTJXJmDf4UiykOaaZXh3cQhpzHVOPOwjVSFoIoLLECqR4NIxFqtCwzxFHaY/LNhaxIZxUrssU1gyKAbjnruWu2Cb4XqeayeWHQc5vJ8swhThkHFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uqLL0PKI; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-61495e769bdso19226037b3.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Apr 2024 05:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712061329; x=1712666129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhodAsfbqQph/6Oss9KdocUA4jNT8v1VGBe4Vmslbbg=;
        b=uqLL0PKItSDctSUqxZsS/uT7vhnfgQzNItY7LTWQwGtERIAfDHkmi9vTKM/KWSOnZG
         5cWY4VnZ/zB0EU9JaX8HcKrzWY6Bfiyn9ZjC8emWdaKirfIk5c6cfhLRmfgpLLUReKr9
         yRjumjg65uKbF7b/xAwkcwPx7RQ3tjsiJ3eg7KVDrDx5qEpqbRUaH0ee2bQTWeK8yRDw
         IZeIcTsL4ZN8lmj5lCAuHZlu//3WUHVTZLeAUR178ssgzwE8qeahHVjiEj3sK9F9hh1f
         udU2TW8C/q7xEaGt7K/yviWJwTmaKvKoOb960rlGVp9GAq3tJB90z8axILGKqiHa0Kpd
         L6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712061329; x=1712666129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZhodAsfbqQph/6Oss9KdocUA4jNT8v1VGBe4Vmslbbg=;
        b=UYQWnyPNugoeFlsElHVL4ljyE3LqdjA7OfVd3KFfVQdQAm+nlQZcayQ3sFlTa5vqlS
         mgt7WLovrpBvmHr+YAohZ3QzVn5fm/qIaNAVpd97HkoT+bj+NAlQq9VuUzB/SXbslHtw
         /WGUTu4ZqvehbayMVPHBEpvagVy9Pyvw0fjiu2mpzW/T0t89nhsi4B5mcfORB0wpJ7Ju
         eoIyn+WtIL6b6DUL8RfNtHqNty316tulNp/mnyNuMmaA2jlRKVWBxq1QHfDh2tTiUmuB
         pdO9rWe6hQYVvQHLqKW9UwRztQKELKV+E5+l39RrWrIt4XXt6znCgEHDT2TJXD8/hq9I
         1nsw==
X-Forwarded-Encrypted: i=1; AJvYcCUd8AkYg2WM65SZpSnI8TmbLPe3rJzsajQ+7hPwql2motggYuUHEbF8jhDm29mToTaCWqVCto7ORZiilIsuL2IbzBjMx3Pi6VY2ClRSaj5AOl4=
X-Gm-Message-State: AOJu0YxYoLPo3nAkv4wCRNqP5NLJ2DTQ2iNRJ70RSC2hBEqlREyw1aOD
	7yWKxvsO22JebodyIYxYynfWCHpiHi4Bf9Zmf1h43us+q04K6Gof0RWeBOloJpCWNPVKQy4/rDE
	Z4KOM+xDSb6CXHQbcc81iabrg8aVL/pLS1f6YxQ==
X-Google-Smtp-Source: AGHT+IG5hxT/EMYnHoU6u7S6MkbvLw5l9U/Ss0P2rks8Fb0m+zQTGqjqkjSlSz0lY1KsLwpjx1moujtIXAN3uBffPV8=
X-Received: by 2002:a25:6d86:0:b0:dc2:2d75:5fde with SMTP id
 i128-20020a256d86000000b00dc22d755fdemr10687728ybc.29.1712061328813; Tue, 02
 Apr 2024 05:35:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com> <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Apr 2024 14:35:17 +0200
Message-ID: <CACRpkdbtRoDtWN4mnyZY_yEfWQFPCQaVudjBki8N1sOXxXWupQ@mail.gmail.com>
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Elie Morisse <syniurge@gmail.com>, 
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Krzysztof Adamski <krzysztof.adamski@nokia.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Khalil Blaiech <kblaiech@nvidia.com>, 
	Asmaa Mnebhi <asmaa@nvidia.com>, Qii Wang <qii.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Ajay Gupta <ajayg@nvidia.com>, Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>, 
	Robert Richter <rric@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Vladimir Zapolskiy <vz@mleia.com>, Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Conghui Chen <conghui.chen@intel.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 2:27=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> Match the wording in i2c_algorithm in I2C drivers wrt. the newest I2C
> v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
> appropriate terms. For some drivers, this means no more conversions are
> needed. For the others more work needs to be done but this will be
> performed incrementally along with API changes/improvements. All these
> changes here are simple search/replace results.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

