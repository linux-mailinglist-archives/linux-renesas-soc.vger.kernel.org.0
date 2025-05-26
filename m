Return-Path: <linux-renesas-soc+bounces-17487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 252D7AC3B52
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 10:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13EFD3B7490
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 08:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56EB81E8324;
	Mon, 26 May 2025 08:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="iCPb/AcH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E121E5B72;
	Mon, 26 May 2025 08:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748247228; cv=none; b=GsKkEF95uNRQI4vSSx48WL0w5aaThrxg79L2GT0ptxAA+Qrzs3na9jXbE7o/9uMba/5T+gKQ7DdndQ4n+rs8jkVpufrU6Gfx6g6knDGvWF1cwqaMPAT8aDOq/jPEbQMwBZ+xKnZHkLpLZXUBC2QPyIp57h+lA7IIfNJOU0nfN1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748247228; c=relaxed/simple;
	bh=+itlrWYzfhQ7YhSm6Rwr1H/9x36GVhI08lVyKj97jHk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ng9IbER/3EGYoS0yYpX4gy2rnEH+UOLO6IbrPGQwKj1DO5koSBNYGZEyi77vs+fymVvIbAbJP4G1rNwgkq0qATN4UcO8qf31Dz9TWZoa2wsEedh6pkuPa2mhDESuoL70olWlbk7PsOMn7e+taeehjV7yZLxdifev4hs112eL7QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=iCPb/AcH; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=+itlrWYzfhQ7YhSm6Rwr1H/9x36GVhI08lVyKj97jHk=;
	t=1748247226; x=1749456826; b=iCPb/AcHDU6xG2x4fpv6MMjLVYp219VtBpAxWy4oXe75HWE
	n3V4EhYUOqImhZx0CH9FVoqMBysskPOjz5H12PUByFqzmrd0mZQ7wI5mKG1uYL7MW5ylnHuoU16Q7
	o/n8foKno8h0UK6qJ1PLN/AyJb+wRmw9TyyFLl/MD5Qh9mRT8qrxrcju7sEcUD2NOM973DbrJtKgu
	AUUbYpVHxltjFXq+7RVjCj4HUxzOFA2A4pfDvML4Fjw2qvdu/u8l8XtoDvQ2qolb0xmt4lfGhwC1+
	aq2c3uGUz+XPZ1zQH/7CNJPSYBQxA3WyBDOZmVHLgUSH1QJ31arq88CmDTqYksXA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1uJSxj-0000000DOyV-1Dst;
	Mon, 26 May 2025 10:13:35 +0200
Message-ID: <23aadbd78d3585c900c579c26f360011cf1ca830.camel@sipsolutions.net>
Subject: Re: [PATCH v2 2/6] ASoC: aoa: Use helper function
 for_each_child_of_node_scoped()
From: Johannes Berg <johannes@sipsolutions.net>
To: Ai Chao <aichao@kylinos.cn>, perex <perex@perex.cz>, tiwai
 <tiwai@suse.com>,  "kuninori.morimoto.gx"
 <kuninori.morimoto.gx@renesas.com>, lgirdwood <lgirdwood@gmail.com>,
 broonie <broonie@kernel.org>, jbrunet	 <jbrunet@baylibre.com>,
 "neil.armstrong" <neil.armstrong@linaro.org>, khilman	
 <khilman@baylibre.com>, "martin.blumenstingl"	
 <martin.blumenstingl@googlemail.com>, "shengjiu.wang"
 <shengjiu.wang@gmail.com>,  "Xiubo.Lee" <Xiubo.Lee@gmail.com>, festevam
 <festevam@gmail.com>, nicoleotsuka <nicoleotsuka@gmail.com>,  shawnguo
 <shawnguo@kernel.org>, "s.hauer" <s.hauer@pengutronix.de>,
 "srinivas.kandagatla"	 <srinivas.kandagatla@linaro.org>
Cc: linux-sound <linux-sound@vger.kernel.org>, linux-kernel	
 <linux-kernel@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>,  linux-renesas-soc
 <linux-renesas-soc@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>, imx <imx@lists.linux.dev>, kernel
 <kernel@pengutronix.de>,  linux-arm-msm <linux-arm-msm@vger.kernel.org>
Date: Mon, 26 May 2025 10:13:33 +0200
In-Reply-To: <eb1ddeb3-06b6-4ac5-b20a-06b92c7f1363@kylinos.cn>
References: <2aq0nyvyf7t-2aq4hsc7kp6@nsmail7.0.0--kylin--1>
	 <7e708dcc98c6f0f615b1b87d190464cfe78be668.camel@sipsolutions.net>
	 <eb1ddeb3-06b6-4ac5-b20a-06b92c7f1363@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Mon, 2025-05-26 at 16:12 +0800, Ai Chao wrote:
> Hi Johannes:
>=20
> > > "simplifies the code" is no need to callof_node_put() .
> > Fair. Except that's not what you _actually_ changed here. Like I said,
> > either it's buggy before or after.
> >=20
> In the function i2sbus_probe, it not return a struct device_node, so , I=
=20
> think function for_each_child_of_node_scoped is better than=20
> for_each_child_of_node.

You still haven't explained why it's even correct.

johannes

