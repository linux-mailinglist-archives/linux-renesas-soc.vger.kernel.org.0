Return-Path: <linux-renesas-soc+bounces-34923-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AjGENCNNT2p4dwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34923-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 09:26:27 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 487E972DA0E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 09:26:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=NuwCZfDv;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34923-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34923-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F1C8F3055309
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 07:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B543C8C52;
	Thu,  9 Jul 2026 07:24:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534143C342B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 07:24:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783581862; cv=none; b=NT1FyvcxOAeiw5zMDd6fbWRP2Ef0zW4NoBNzbKLNCJuMuh+cj72bf9WrV/9mjjXnGsuEdQe1H9Em7uvMBlMSRLICJM4ej5fTjB3rLJ+H6qvOdNCMsJOPBK9xmq+FyA2UzvpVhz2a5K3fFM19PDdUiDyB6Qq2/gfnsO4osetzVpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783581862; c=relaxed/simple;
	bh=gMx843/5S34JEAk8VaWDn/h5oOHvje0shPRIPDVNBUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FtApT//lBIJkgRDylIbOBd5IMif+HLW4/b031SOUBxb256cGkcVzYZOBUb0oTX7S5Y3a/cSeia4tqRwaucrYBNNFDAsIBQXNdxco0HS6GpIOnxGjJOkDbvYkSzoSks7Fv0FU4sZQIUlH5+M8ioCTCenB5f4lTMFTj3Q4Dg5qgIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NuwCZfDv; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=gMx8
	43/5S34JEAk8VaWDn/h5oOHvje0shPRIPDVNBUs=; b=NuwCZfDvc91ju+YTsx4n
	eZWwMQbPm+QI4f+FRcoOPL3cEQKcFifbAWJOWfe20PCky4AkARDVTO7jSTImK0ng
	KYaZgKYF5nnCwqAs4KsFUVF7HIlFDaBKbPhucbl1UAZlMoXIFD0+WwRPxFmexC6j
	QsXrtzYDtk9TUduI/3rlJBSGTwEpt3LfNbh5UZqHQWE4jYOdmr4/5fNvvwsBYRFJ
	Wpd9tnh7uHCLgkA4+zbfkLwLNiQZ6I6kO2HYGGya2nLPUYso+L5Kh/hv0inG7DpN
	XsLyWddSoLcbgvRTYh3Hvj0cMvMcMhwLJQEQLct9v1RTgUPKVR6ylOLxKRfuhrsY
	Rg==
Received: (qmail 1017861 invoked from network); 9 Jul 2026 09:24:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jul 2026 09:24:05 +0200
X-UD-Smtp-Session: l3s3148p1@XaNSgihWothQT+F6
Date: Thu, 9 Jul 2026 09:24:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pan Chuang <panchuang@vivo.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	zhanghongchen <zhanghongchen@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>, Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Laura Nao <laura.nao@collabora.com>,
	Mason Chang <mason-cw.chang@mediatek.com>,
	Fei Shao <fshao@chromium.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	"open list:THERMAL" <linux-pm@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>,
	"open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>,
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>,
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support:Keyword:mediatek" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 00/18] thermal/drivers: Remove redundant error messages
 on IRQ request failure
Message-ID: <ak9MldvSmaDyJn42@shikoro>
References: <20260709023048.599150-1-panchuang@vivo.com>
 <d31c4217-4733-4459-a9d7-265731d295fc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d31c4217-4733-4459-a9d7-265731d295fc@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-34923-lists,linux-renesas-soc=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:panchuang@vivo.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:miquel.raynal@bootlin.com,m:mmayer@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:florian.fainelli@broadcom.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:zhanghongchen@loongson.cn,m:zhuyinbo@loongson.cn,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:niklas.soderlund@ragnatech.se,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:john.madieu.xa@bp.renesas.com,m:heiko@sntech.de,m:bzolnier@gmail.com,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:srinivas.pandruvada@linux.intel.com,m:laura.nao@collabora.com,m:mason-cw.chang@mediatek.com,m:fshao@chromium.org,m:frank-w@public-files.de,m:jiapeng.
 chong@linux.alibaba.com,m:andriy.shevchenko@linux.intel.com,m:jirislaby@kernel.org,m:clamor95@gmail.com,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:imx@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-tegra@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:tharagopinath@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vivo.com,kernel.org,intel.com,arm.com,bootlin.com,broadcom.com,nxp.com,pengutronix.de,gmail.com,loongson.cn,ragnatech.se,glider.be,bp.renesas.com,sntech.de,linaro.org,samsung.com,foss.st.com,nvidia.com,collabora.com,linux.intel.com,mediatek.com,chromium.org,public-files.de,linux.alibaba.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,shikoro:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 487E972DA0E


> all of these 18 are just one commit, no?

I think so, too.


