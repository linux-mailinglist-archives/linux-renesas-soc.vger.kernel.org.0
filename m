Return-Path: <linux-renesas-soc+bounces-26490-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8E5D08241
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 09 Jan 2026 10:16:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 78A2930060EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Jan 2026 09:16:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB69F3590C5;
	Fri,  9 Jan 2026 09:16:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91063590BF
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Jan 2026 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950195; cv=none; b=q4bJTHAIjwAMVU1AlkVBxUJLisIvqDmaTyAtlpiWGEIaNDPCMU+uEsK3HSVBCY4TGEEAnBNP561JU/fkYAYCEYIeLSr5a/EGMVBNLNDhyg/5I9Ibkm4/c0vUOnwzl6EgYxQwsxwGkl30Ww2zciGGtdOQ8hvsl2OtRLdHYH7Yeic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950195; c=relaxed/simple;
	bh=E0edNL5B3rP6w3+T0Ub2/VKHaC3rr+HLeEDX8RHsn8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qrAU4PxENbL5FM4PAk3Rj62fahXFzaa/um3qDZgjnZaqWtlyOCBPk55ZIT7x0bROkWytNGNrxBcIAq49BS/6MBk0McVHGW9NH+qklsLBt+b5BmxORFUferL3JfTFcjdUi6Nptg8e9IkCcH6eeHCpTZ70AD4/cvelZg+KBv4hPps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8b2d7c38352so291020385a.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 01:16:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950191; x=1768554991;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiQ5XxZuQA23XgqzTfwN/M3quzujtTsdQBOQmuJCqAs=;
        b=cRSaGR3R5JRL8mDbzrbFsvupNWgTF5JrxWULd/Tpxcev6afEAnHTCjb48fQCZECRC5
         hHqlXOE0x3lC5Oz0mBf1fyibDG/N97b82knt2oZ0Rkl7wvXuC9vSOHMKGi+ieQWLmiBY
         LAXFqwg/JQ12qan1i6K5q9ZBqAuA+8uuEEti77AK2GDnlAHE8M3FIcHrUVgALIHNuP+N
         oFm4SVy50vnhykePg8EPiiNcWqNA9OEQfz8n7Mz0CoqC1GLxFu38hF4pywk5voeZeeCP
         mhev9kqtJn25qKFNNP7cl8YW5d2TJXC+eiw6VR/AwKjPYBvwWyz75Us3XOcNwtH1XaEi
         OAqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMvXR6y5cGf46qmxjdFdyYVuy9krvcwWGM51BGv/SbPtHpNyTEUGRsiBKKScVRkJQw0DA1qv4l1VCCRRPBJXnY5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbiKoznkPv4whZxyvSmipPs938xn4zXcZiNnmY7H6eHc3EiLTS
	S7njhB20CCwLPqbugCizGvinZYJDz6BgeQYvMQ44EenEUtrYUPpYwoqQ4kxwfCh+89U=
X-Gm-Gg: AY/fxX4XjTkHAWsT5m+Ml2d5hrdSkWBOtD/ftftpyfyFSBgKXWieCISx+oLXreVm+9w
	0hoVbpHUO7tvRBomkqF4QpYgZjykswGcoo2D91TwSW2d9J7h9hFwfoZ7QZTJaQWb1RPs7O69C8f
	HOb9x9hrkjZYZ7Lxhn6KYhamqfeu6aqKK4wtFL8gcBs7r1/8XCcKO92j4upkogRwxpYTDJRis5Q
	E1F8GGjS9RM+4O9ViQqh//N76F6Fa0/8bmKxRCi91aX7U4mQ11f15tjI15GhP3Z9j4W/IKWugyG
	0dJqeF+H4zMprOrPdDdtBW2WxBgiOkK5Ytt4CcNkBj35OAsjhdV135bOksR+g3iWPl6/flbPekN
	GaTXpZST1iccF0x4VFjDsJVygItzjurml23bEXAvu1zFf2Uq4OmX9x6VKakGgXpAzychH8WgvPa
	Xowx3D8Q6OqSyqwWyjibmx1TeWFu3obZW6Cnoeji08aY6SzpPY
X-Google-Smtp-Source: AGHT+IH41XUaf1Q6N1Z9c4ALOtGPYefQX+OfDfNCY9Pw2hkatdEeiHTi2e1O4Cejuy2D0ckxn5f7ww==
X-Received: by 2002:a05:620a:25d1:b0:8a2:595f:657 with SMTP id af79cd13be357-8c37f51e7d5mr1705426685a.21.1767950191418;
        Fri, 09 Jan 2026 01:16:31 -0800 (PST)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51b787sm765705785a.29.2026.01.09.01.16.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 01:16:31 -0800 (PST)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-888bd3bd639so33172526d6.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Jan 2026 01:16:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVrJxAxUYaPnjW654RiaxxnlaAnE35stlyK/Jjvp3/jhyolVK7HI6eh2knDIpcUp9xfgWaLjXEQ8mWZwXKg/rSlRA==@vger.kernel.org
X-Received: by 2002:a05:6102:2b92:b0:5dd:a0bf:8c89 with SMTP id
 ada2fe7eead31-5ec755c2d49mr4919224137.7.1767949880413; Fri, 09 Jan 2026
 01:11:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com> <20260108203004.3538449-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260108203004.3538449-3-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 10:11:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV2B9sRmy-k5ucmo6WukvNFq3QqxM0BkB-qS=+-AP4M3Q@mail.gmail.com>
X-Gm-Features: AZwV_QjXHpmtcr0h8pnp_-HCv95C85A8pbrG70DRu5Hp0BWpB8DvCNd7K_eVFa4
Message-ID: <CAMuHMdV2B9sRmy-k5ucmo6WukvNFq3QqxM0BkB-qS=+-AP4M3Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] spi: Drop duplicate of_node assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, 
	Varshini Rajendran <varshini.rajendran@microchip.com>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sunny Luo <sunny.luo@amlogic.com>, 
	Janne Grunau <j@jannau.net>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
	CL Wang <cl634@andestech.com>, Manikandan Muralidharan <manikandan.m@microchip.com>, 
	David Lechner <dlechner@baylibre.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Jonas Gorski <jonas.gorski@gmail.com>, Hang Zhou <929513338@qq.com>, Jun Guo <jun.guo@cixtech.com>, 
	Philipp Stanner <phasta@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Shiji Yang <yangshiji66@outlook.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Marek <jonathan@marek.ca>, Carlos Song <carlos.song@nxp.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, 
	Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>, 
	Sergio Perez Gonzalez <sperezglz@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Gabor Juhos <j4g8y7@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>, 
	Rosen Penev <rosenp@gmail.com>, Luis de Arquer <luis.dearquer@inertim.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Longbin Li <looong.bin@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Alessandro Grassi <alessandro.grassi@mailbox.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Darshan R <rathod.darshan.0896@gmail.com>, Aaron Kling <webgeek1234@gmail.com>, 
	Vishwaroop A <va@nvidia.com>, Haixu Cui <quic_haixcui@quicinc.com>, 
	Darshan Rathod <darshanrathod475@gmail.com>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, Sven Peter <sven@kernel.org>, 
	Neal Gompa <neal@gompa.dev>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ryan Wanner <ryan.wanner@microchip.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, William Zhang <william.zhang@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jean-Marie Verdun <verdun@hpe.com>, 
	Nick Hawkins <nick.hawkins@hpe.com>, Yang Shen <shenyang39@huawei.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Lixu Zhang <lixu.zhang@intel.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Han Xu <han.xu@nxp.com>, 
	Yogesh Gaur <yogeshgaur.83@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Li-hao Kuo <lhjeff911@gmail.com>, 
	Masahisa Kojima <masahisa.kojima@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Michal Simek <michal.simek@amd.com>, Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Jan 2026 at 21:30, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> The SPI core provides the default of_node for the controller,
> inherited from the actual (parent) device. No need to repeat it
> in the driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

>  drivers/spi/spi-rspi.c               | 1 -
>  drivers/spi/spi-sh-hspi.c            | 1 -
>  drivers/spi/spi-sh-msiof.c           | 1 -

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

