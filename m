Return-Path: <linux-renesas-soc+bounces-29530-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBAtNnt9uGmVewEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29530-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 23:00:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 904FF2A1389
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 23:00:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8B24C302E7E0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 22:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA9929BD90;
	Mon, 16 Mar 2026 22:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GIRdWJXb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E7B15530C;
	Mon, 16 Mar 2026 22:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773698423; cv=none; b=Kwv4BguednFAiTnzKN9VkQCXNMY8fb3atSXCNywqNtnfm1NG8UfWokT7z29LnUs7WxRvUfYwiJLNgvOOv3lBpUHmht+4R4qDraWhc4mfyEYakm1utkRpqcCdl6n+4LuqWa2JV6HAbi88lw/haYrvyTFjN1WGYZCGPsRb2x7M+yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773698423; c=relaxed/simple;
	bh=xL6C4abJanh+hfi8o4mFZdvcfY8JVOwpGp3AtvrmmwU=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=J107GnwaPrCw5J0ji2oCfkGq6FlepLkIykyH3/loVrgTSTFPZEdfmGpItjgVEb/OqmXjOuOUgzCDSe3UHOW+y8bhLCpvb5F1URsgFBxKhquHKTTlXHCf7SWEe/yPhORgIXnTpeZ1TNH9qNb16rPu1VgZcIXGP0Vn2nMKXJtOCF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GIRdWJXb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44837C19421;
	Mon, 16 Mar 2026 22:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773698423;
	bh=xL6C4abJanh+hfi8o4mFZdvcfY8JVOwpGp3AtvrmmwU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=GIRdWJXbCPNC5aI/K8ATvHrqt/f9EBFULmJFXBLVPaJ06WIkzGYKy4zsT3C6Let7r
	 3OoRTnlFRWJ9QtjS97xaiyf1myGdVmVbpB2ylpHqp341yJO21yVCbSjEpg+Xrm4XsM
	 X7TguCXJd23WhZaWaWOPSTql6NwmjVUq3/qNN0asCYLiZqrQpwbYLdoEYnvVB4Ax5D
	 3wgrqWdZZzpxauJ/bgM3aVgN4BqUxtuzBLtlLIFYDDBtSnLUEALE18oefqVuUmxKFA
	 /QKTnOYSC00T7q3aox5ixr0IYO99/cmkFGw4tLV3uZqWgma0fA3+245s5J1TfVCE5u
	 Fm8SiaAiSuTJg==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Martin_Povi=C3=85=C2=A1er?= <povik+lin@cutebit.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andrei Simion <andrei.simion@microchip.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Cheng-Yi Chiang <cychiang@chromium.org>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Cyril Chao <Cyril.Chao@mediatek.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Daniel Baluta <daniel.baluta@nxp.com>, Daniel Mack <daniel@zonque.org>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Guenter Roeck <groeck@chromium.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Herve Codina <herve.codina@bootlin.com>, Jaroslav Kysela <perex@perex.cz>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, Oder Chiou <oder_chiou@realtek.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Ray Jui <rjui@broadcom.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Scott Branden <sbranden@broadcom.com>, Sheetal <sheetal@nvidia.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Tim Bird <tim.bird@sony.com>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, 
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, 
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Xiubo Li <Xiubo.Lee@gmail.com>, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-sound@vger.kernel.org, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
References: <87bjgoldf9.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 00/29] ASoC: soc-component: re-add
 pcm_new()/pcm_free()
Message-Id: <177369837337.303905.11618232899340248621.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 21:59:33 +0000
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-f420f
X-Developer-Signature: v=1; a=openpgp-sha256; l=4727; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xL6C4abJanh+hfi8o4mFZdvcfY8JVOwpGp3AtvrmmwU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpuH1r9Kn8pWQBjJQ8Y5RpE+swsy6zuOjsx/msy
 y6SCK3/KtWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabh9awAKCRAk1otyXVSH
 0FIfB/0cRLGXje6cSJBA+IBPmVIwVkpFBMEk+YKZtf0XQjffrDz4g0tW0wTQXBOadYw6XK7KyTr
 NZdJrNVBhWILSRhBWLKZa4sRnksZOKBOZJAs7tIhqDjnZx0xh5+JTv+d8utKWKUxZYp6a5VaGlG
 XHQVEAwku0IFPaGMIg/CvpFG/qpqKjSExIiceM8gbZk1f8X+o24DupIHYfxr2BrMNJDDzz1OyWn
 HqyWxhj/ZWkPzi5qPfvDSvWKDlcT93pluJ4sBnqM8rzQEvo5/9M7c1aL60ge4meVfhB8dOfzc+F
 /OeClVJqWDCLdpKmdb+c/LYEwGmyuZKSJ759bbF4oYfrcsS4
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[cutebit.org,bootlin.com,foss.st.com,microchip.com,collabora.com,linux.alibaba.com,linux.intel.com,chromium.org,bp.renesas.com,intel.com,gmail.com,tuxon.dev,mediatek.com,linaro.org,nxp.com,zonque.org,glider.be,perex.cz,nvidia.com,socionext.com,metafoo.de,kernel.org,amd.com,realtek.com,linux.dev,broadcom.com,free.fr,pengutronix.de,samsung.com,suse.com,sony.com,arm.com,lists.linux.dev,lists.infradead.org,vger.kernel.org,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29530-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_GT_50(0.00)[67];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,lin,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 904FF2A1389
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 16 Mar 2026 02:24:02 +0000, Kuninori Morimoto wrote:
> ASoC: soc-component: re-add pcm_new()/pcm_free()
> 
> Hi Mark
> 
> Because old pcm_new()/pcm_free() didn't care about parameter component,
> to avoid name collisions, we have added pcm_construct()/pcm_destruct() by
> commit c64bfc9066007 ("ASoC: soc-core: add new pcm_construct/pcm_destruct")
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[01/29] ASoC: soc-component: re-add pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/68130eef1e0d
[02/29] ASoC: amd: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/fe33a69681e3
[03/29] ASoC: apple: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/d28e19350490
[04/29] ASoC: atmel: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/83cce46863b0
[05/29] ASoC: au1x: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/8ec624ef881c
[06/29] ASoC: bcm: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/3859e15cc9d8
[07/29] ASoC: codecs: cros_ec_codec: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/2a97dfda9e53
[08/29] ASoC: codecs: rt5xxx-spi: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/a1f956d85199
[09/29] ASoC: dwc: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/c42b65583773
[10/29] ASoC: fsl: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/fe8112d6d2a6
[11/29] ASoC: generic: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/2905b2266ac6
[12/29] ASoC: google: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/71a559061006
[13/29] ASoC: intel: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/6f2b7bd59882
[14/29] ASoC: kirkwood: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/31447bd2149e
[15/29] ASoC: loongson: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/7fce3691e131
[16/29] ASoC: mediatek: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/6f3658d6ee73
[17/29] ASoC: pxa: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/0828e050415f
[18/29] ASoC: qcom: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/df202b5e6d3e
[19/29] ASoC: renesas: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/2840266185be
[20/29] ASoC: samsung: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/7ef8b7a10c4b
[21/29] ASoC: soc-generic-dmaengine-pcm: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/7d803acf6181
[22/29] ASoC: sof: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/e56decec6bae
[23/29] ASoC: sprd: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/90a2dbecc20f
[24/29] ASoC: stm: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/4e2f7ecb5db3
[25/29] ASoC: tegra: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/1f7fc5f1f084
[26/29] ASoC: uniphier: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/88e277ef789a
[27/29] ASoC: xilinx: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/7649b2f1f8b2
[28/29] ASoC: xtensa: name back to pcm_new()/pcm_free()
        https://git.kernel.org/broonie/sound/c/667fb65f5164
[29/29] ASoC: soc-component: remove pcm_construct()/pcm_destruct()
        https://git.kernel.org/broonie/sound/c/175f733325ac

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


