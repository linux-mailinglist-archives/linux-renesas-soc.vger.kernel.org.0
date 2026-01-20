Return-Path: <linux-renesas-soc+bounces-27147-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAT6KXDtb2m+UQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27147-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 22:02:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A594BEBB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 22:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B63E786EF78
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 19:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55284478E3A;
	Tue, 20 Jan 2026 19:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlIDWci6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C0D478876;
	Tue, 20 Jan 2026 19:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768936959; cv=none; b=a6+qCrlqUVUAn7YeBDK2lLmdbzGS/f2rU6h/xnCAPUxWzj0T7gcnWQHVO3Sjbe63wMimZpU7Lb/jN4WBenvGSVliUNKobIwHqxToBk/hB+obHLMkbS3AlFRrKqoW0sMJAFJcvXDOjMu2RhX4xoT6NCL7ehXV+3QvVReMTvb8iA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768936959; c=relaxed/simple;
	bh=OVmbkw3k7fJ26f3GTMylBqqrvRkFQLNjf2AcM9UevMU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=spci6KxDjVDn1GUZvW3mSJy/+UvS0QNjQlktC4mtcKMfkgiNPDovvhHKOOCAXr5LMLTrqvBu71hWhjFhYwZ9wH24CCXdim/Vfh9egJ3rPR+8UkBkjL0mYsIjIbSshK+qXbdsrxle0vpu04tfbyITPt6bFwQ/bcgqzmpajIXNabc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YlIDWci6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BB5C19422;
	Tue, 20 Jan 2026 19:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768936958;
	bh=OVmbkw3k7fJ26f3GTMylBqqrvRkFQLNjf2AcM9UevMU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YlIDWci6NaIrYvDjAq2yhQz8tWegT2Dg6owXkPTtWwCCNZy6TIGjxdkf0SjWMqrBS
	 HZ1OYluozzxuGUb+8XWZyPhjHzhZZBTdn+x4fAQviriIGxbMX1dqT/c1f/SDma9EII
	 glDqd9riC4rVx6B2QSNL57WNsH5WjpCsMft/TEmFUb+YsHy2dFuwVHN2w/p0QKAC/w
	 5Sj7i2icD1/pyQOPwPNE/B2LChkgA736lCjfJaMApcMxmC8AfGe77IDEawz4zO7gsp
	 7BnFoBJwZbhJtt0PHorTsf9ENVZR5l7hg6xF7YMzjdh3zo3J0vrT/Hr5cse6h9pQHI
	 VNOGdReIfciTA==
From: Mark Brown <broonie@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>, 
 Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sunny Luo <sunny.luo@amlogic.com>, Janne Grunau <j@jannau.net>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, CL Wang <cl634@andestech.com>, 
 Manikandan Muralidharan <manikandan.m@microchip.com>, 
 David Lechner <dlechner@baylibre.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Jonas Gorski <jonas.gorski@gmail.com>, Hang Zhou <929513338@qq.com>, 
 Jun Guo <jun.guo@cixtech.com>, Philipp Stanner <phasta@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Shiji Yang <yangshiji66@outlook.com>, James Clark <james.clark@linaro.org>, 
 Jonathan Marek <jonathan@marek.ca>, Carlos Song <carlos.song@nxp.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Huacai Chen <chenhuacai@kernel.org>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>, 
 Sergio Perez Gonzalez <sperezglz@gmail.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Qianfeng Rong <rongqianfeng@vivo.com>, Haibo Chen <haibo.chen@nxp.com>, 
 Gabor Juhos <j4g8y7@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Rosen Penev <rosenp@gmail.com>, Luis de Arquer <luis.dearquer@inertim.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Longbin Li <looong.bin@gmail.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 Alessandro Grassi <alessandro.grassi@mailbox.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Darshan R <rathod.darshan.0896@gmail.com>, 
 Aaron Kling <webgeek1234@gmail.com>, Vishwaroop A <va@nvidia.com>, 
 Haixu Cui <quic_haixcui@quicinc.com>, 
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, 
 Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Wanner <ryan.wanner@microchip.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 William Zhang <william.zhang@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, 
 Yang Shen <shenyang39@huawei.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Han Xu <han.xu@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Linus Walleij <linusw@kernel.org>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Andi Shyti <andi.shyti@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Li-hao Kuo <lhjeff911@gmail.com>, 
 Masahisa Kojima <masahisa.kojima@linaro.org>, 
 Jassi Brar <jaswinder.singh@linaro.org>, 
 Laxman Dewangan <ldewangan@nvidia.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Michal Simek <michal.simek@amd.com>, Max Filippov <jcmvbkbc@gmail.com>
In-Reply-To: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com>
References: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 0/4] spi: Make SPI core to take care of fwnode
 assignment
Message-Id: <176893693352.778248.9155805475563647239.b4-ty@kernel.org>
Date: Tue, 20 Jan 2026 19:22:13 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-47773
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[microchip.com,bootlin.com,tuxon.dev,kernel.org,airoha.com,gompa.dev,kaod.org,jms.id.au,codeconstruct.com.au,analog.com,broadcom.com,milecki.pl,cirrus.com,opensource.cirrus.com,gmail.com,nxp.com,hpe.com,huawei.com,pengutronix.de,intel.com,loongson.cn,linaro.org,baylibre.com,googlemail.com,google.com,zonque.org,free.fr,alliedtelesis.co.nz,sntech.de,renesas.com,samsung.com,sifive.com,linux.alibaba.com,foss.st.com,nvidia.com,socionext.com,gmx.net,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-27147-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[microchip.com,iopsys.eu,collabora.com,amlogic.com,jannau.net,aspeedtech.com,andestech.com,baylibre.com,broadcom.com,gmail.com,qq.com,cixtech.com,kernel.org,opensource.cirrus.com,bootlin.com,outlook.com,linaro.org,marek.ca,nxp.com,linux.intel.com,vivo.com,quicinc.com,inertim.com,glider.be,renesas.com,foss.st.com,mailbox.org,nvidia.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[148];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 55A594BEBB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 08 Jan 2026 21:23:37 +0100, Andy Shevchenko wrote:
> It seems all of the SPI drivers want to propagate fwnode (or of_node)
> of the physical device to the SPI device. Make sure we don't duplicate
> it over and over in each new driver (+2 in this cycle) by making core
> to take care of that. Note, similar is done already by IIO and
> I²C subsystems.
> 
> There is one noticeable and quite specific case that is taken care in
> the first patch and would be nice to have a confirmation from Cirrus
> that everything is okay. The rest is just a mechanical conversion.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/4] spi: Propagate default fwnode to the SPI controller device
      commit: f2d1a3318eb1ec860999db48cb8d13b43261624d
[2/4] spi: Drop duplicate of_node assignment
      commit: 3974a585be78a1dc90a19d5cf1846a99954e3842
[3/4] spi: Drop duplicate fwnode assignment
      commit: 103c510e1c6832720059756d155dd13a42baa7ab
[4/4] spi: Drop duplicate device_set_node() call
      commit: 37fbc1ab0f225d23f0839260a11375b4f1f7cf8c

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


