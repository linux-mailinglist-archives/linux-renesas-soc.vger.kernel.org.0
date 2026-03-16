Return-Path: <linux-renesas-soc+bounces-29513-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBl7OmAquGnhZgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29513-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 17:05:52 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4A929D06E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 17:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E6DD30A9ABE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 15:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059243B7B97;
	Mon, 16 Mar 2026 15:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="F+wuM52t"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF493B7B74
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 15:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676635; cv=none; b=JKnClp3UCoMRrYKhrNSCJ20r6exb7UBL1nB2MTKszbLa1k9J7/c46/TznlkNe8ECiWJsuX1hqN6ZUYUvpGjQ2wmpQT4AY3tFdzksX5I+d/+EfdX6hn/iCRfjWWS8av5BizSDcen/yg9/hrGQmRPal8eBFTu6CfIhpRhjhwL23jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676635; c=relaxed/simple;
	bh=PbKrBXthjNGfFtArOSneEVU2S5ohT/HxHPM5k6fcTws=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kA2DQdZ2spTHPwKg0bVBun4/diKfNEFA2IAxVXLwAL4YVRHXuD95cVmDb6p6dfWnV1hzodxjnObzOuvs4InzXrIQsXQ8VATvcerbA+wFn/phYEdJ0mFlikmWFsd4Y8GqKd6HVkF0C1hWcuJHnEIBx7ZjZ8fi5gD8GqKT4dJb4Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=F+wuM52t; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0DDFF4E424CB;
	Mon, 16 Mar 2026 15:57:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CEBD15FC9A;
	Mon, 16 Mar 2026 15:57:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D680103721F0;
	Mon, 16 Mar 2026 16:56:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773676624; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gPWg45628wXOGTSku2sZt3UN9TbvmDc1uinjnNPjXiQ=;
	b=F+wuM52tfsJOst/pUkIjwdenzlZY0QftTQ/4NOcFwfqocdMH+NJh258BZnrMoKeqLFNMEN
	bc/L1DGDGBOGFcp6+xGMrdsjDhxpeU3BPexd032tb2bOu45ca1ox4QhIawUCc6kJ+bA9VX
	oPm7oNiLCUTiYQCqCHB3fegsu43UgYV3WkEKQGcGp0ATgB7Uei6Cs5z4mzzsVUCjPaNFO9
	bKAx3EK1UM87DtIQX3KE3czU4JqXiKI0pEai0IcEfkeyeuv+wzPiiAq6ziT/0PdsYdWFbD
	JdtYjZRq09Tc1bq2iZhxGh7dMNzhhgNtvzkx6mw29MT90ATt/4M2/hLnjYz6eA==
Date: Mon, 16 Mar 2026 16:56:37 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: "Martin =?UTF-8?B?UG92acOFwqFlcg==?=" <povik+lin@cutebit.org>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrei Simion
 <andrei.simion@microchip.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Benson Leung <bleung@chromium.org>, Biju
 Das <biju.das.jz@bp.renesas.com>, Cezary Rojewski
 <cezary.rojewski@intel.com>, Cheng-Yi Chiang <cychiang@chromium.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Cyril Chao <Cyril.Chao@mediatek.com>, Dan
 Carpenter <dan.carpenter@linaro.org>, Daniel Baluta
 <daniel.baluta@nxp.com>, Daniel Mack <daniel@zonque.org>, Fabio Estevam
 <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Guenter Roeck <groeck@chromium.org>, Haojian
 Zhuang <haojian.zhuang@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Jonathan Hunter <jonathanh@nvidia.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Nicolin Chen
 <nicoleotsuka@gmail.com>, Oder Chiou <oder_chiou@realtek.com>, Olivier
 Moysan <olivier.moysan@foss.st.com>, Orson Zhai <orsonzhai@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Ray Jui <rjui@broadcom.com>, Robert
 Jarzmik <robert.jarzmik@free.fr>, Sascha Hauer <s.hauer@pengutronix.de>,
 Scott Branden <sbranden@broadcom.com>, Sheetal <sheetal@nvidia.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Srinivas Kandagatla
 <srini@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi
 Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, Tim Bird
 <tim.bird@sony.com>, Tzung-Bi Shih <tzungbi@kernel.org>, Venkata Prasad
 Potturu <venkataprasad.potturu@amd.com>, Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 01/29] ASoC: soc-component: re-add
 pcm_new()/pcm_free()
Message-ID: <20260316165637.7b09fa9b@bootlin.com>
In-Reply-To: <87a4w8lde4.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
	<87a4w8lde4.wl-kuninori.morimoto.gx@renesas.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[cutebit.org,bootlin.com,foss.st.com,microchip.com,collabora.com,linux.alibaba.com,linux.intel.com,chromium.org,bp.renesas.com,intel.com,gmail.com,tuxon.dev,mediatek.com,linaro.org,nxp.com,zonque.org,glider.be,perex.cz,nvidia.com,socionext.com,metafoo.de,kernel.org,amd.com,realtek.com,linux.dev,broadcom.com,free.fr,pengutronix.de,samsung.com,suse.com,sony.com,arm.com,lists.linux.dev,lists.infradead.org,vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29513-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_GT_50(0.00)[67];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,lin,renesas];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 5C4A929D06E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Kuninori,

On Mon, 16 Mar 2026 02:24:43 +0000
Kuninori Morimoto <kuninori.morimoto.gx@renesas.com> wrote:

> Because old pcm_new()/pcm_free() didn't care about parameter component,
> to avoid name collisions, we have added pcm_construct()/pcm_destruct() by
> commit c64bfc9066007 ("ASoC: soc-core: add new pcm_construct/pcm_destruct")
> 
> Because all driver switch to new pcm_construct()/pcm_destruct(), old
> pcm_new()/pcm_free() were remoted by commit e9067bb502787 ("ASoC:

s/remoted/removed

> soc-component: remove snd_pcm_ops from component driver")
> 
> But naming of pcm_construct()/pcm_destruct() are not goot. re-add
> pcm_new()/pcm_free(), and switch to use it, again.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc-component.h        |  4 ++++
>  sound/soc/generic/audio-graph-card.c |  1 +
>  sound/soc/soc-component.c            | 10 +++++++++-
>  3 files changed, 14 insertions(+), 1 deletion(-)

Nothing more than the typo,

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé

