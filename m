Return-Path: <linux-renesas-soc+bounces-33266-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFYMOo4IGGrGaQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33266-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 11:19:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD745EF751
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 11:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C17E83097EF6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2026 09:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8847339C019;
	Thu, 28 May 2026 09:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Tv3W1+un"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E337939EF11
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 09:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779959187; cv=none; b=a6HhAviVX6rdRIARCWfqKeyQumpNpEgnmHbaahByUn6i+3+TWYrjw6RpASfGETwAWo6hv27vi/LxuMQaQgAR331KaNBbVlBkCp15uRomxtVY4pCg+TGnx4hbXF7H1UhQijIjXZzt9VhAx557xBUVC+hSev2M5hoVMCQPwmc7n4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779959187; c=relaxed/simple;
	bh=pePpbntnwnsj7EYGTYln0S0Z1fUMMahUgMDQxO5w1uU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fR/4sKicYO5PMl6mXhwzq+Bpju8XyAV8lsXQY5sa7ekzzF7fnycYScZlAjTjc5fbzkZdCQx7ujdrk/rCDNtK9dYRylg4dqRGzDOaDOMgibFP10ClqvNffJqRJ0i/wWrOPGF/Tcs2u+vtmsaIFxYT7WxmKHGP1M6GOeYVcML4cvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Tv3W1+un; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45e6a4d0be0so5621022f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 28 May 2026 02:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779959182; x=1780563982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NCpVC/B+fK7iJncp3doDyeYOwNSb+lqrnGIijdp/R+8=;
        b=Tv3W1+unErPZI61reAybS1V/bYvqFOlMWOiABauoKx7v6A9wwt42V8f+FWjnpsmWSL
         31SOA0f14puPUwBpNrUN7FQ1Qz8NPp8O4cwZT2KBHFndrKUyna6LBthvJ8gZjoXLwOfE
         A0II/Sgt+8HRPnRwJl9noZZDXeYod8kPY3vk7YruzPmQWMHTgGk3XrKlkX6eBNbgI53Z
         IaHk9U/GXRuGaLZo7gdL1rZELjqDh4mm3ij3S/QCXWhqqyt9lIdeLJwr5lR0qzHwx7nU
         ycvcrPa4BzwLRAvhImwivIXDBWOW6VBV6GamBq1aTMWdwvR8l7Mm5QdikhjUzSXrWi/l
         DuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779959182; x=1780563982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCpVC/B+fK7iJncp3doDyeYOwNSb+lqrnGIijdp/R+8=;
        b=cOop006AcsHoCzQV5237b5IPDipBddedkwQZ0lbzO4bbqTCu+gjhrA4RZSjMm0AHw6
         Kll2mxPLoYmMZt2BVQ3Y4nZQs6k3fDx5PIyk+uEkZUVf6aVQrdvplismHEiI6c+X8ihB
         haIGwIqOBKvYitVzgS8dU6b0lC0ARaVPlcvXnjKwqWMYo3gSSPlAM9Mm2SrCvORW3zlA
         hZxf6EaBlEAq38qe7J82wSqjCBKUIJlkjpThnQjtPt4gvFQwQtsiICi//qt3xhu04GBs
         hFq+uO5yi7sZkn1CUWtae18WRBIHgTEnI1kyGWloe96BbPEh0G1UpvKlW/Hi/eVoLWyU
         t5bQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ADrhYYHUTVlZP0lghtSYM5F6g+etpof5UNxolSQnQMMsWGp01EMcWRiFCFjyBbkGdvGol0wZEZK0nWE2GZVJUMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjiEcEvyYOL4x7TNDnop/67ecDDuP+/ax6kyzRaQ5h3xU1Zvoe
	6RoyWm7pwXDz6ewS5GQ0ZWrvzFc2fWEs6IIQ4okowKXXQ+7JS0jem+dEktoq/pO3Z/Y=
X-Gm-Gg: Acq92OHkq6Lb57qCfLBi0yUYaQfrxESpDP3+xWjfiLcbFCFBxyVOzYkLNdUj3fINtuj
	QT+fVh9qcUbF7eLlDZgsBBGMs17iaAHkqFmO0KChK7XOTnOKOjKzHJVQfLTgj9uyrP2ugL8OFgK
	rfQ6U5i78vcGOEZnJy5pNWWD23yR/6xmPTf89hNLgrEam/5sye1l3PNzxI9ySjRqkPVaovF9dmr
	NeCdUt0Vdlc/k6HUWcm2+wxe9WFtiLvwlVBlnPzAxqmhi5dAH/hkfTV/3MMHok8QIqHV0mhUrjU
	NIbbbj+S8M8D0C6aqiP+3blOicJs+VK8RhGYieDrDDW1wG5h46L+/NQsodMyyApDFZRabxGG491
	YBqmg5eVSKYS5UXqZPml0kgQ06Ez93/iAiboihYZuZeS2nQnyJzvVzKOYzcXDJT6fL78G+krshZ
	yNB5GWk0baub6d2HggHe/b2Czjwd+elmIJHjyVVSZmqpUx56UEyhdTrGshafE0jEfbZ2QoIhlNc
	sWdi+iZQQExDwksWMrPiaf0bg==
X-Received: by 2002:a05:600c:35c8:b0:490:44eb:c1e7 with SMTP id 5b1f17b1804b1-49044ebc2d5mr480016505e9.30.1779959181935;
        Thu, 28 May 2026 02:06:21 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49091d57c0dsm45855525e9.0.2026.05.28.02.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 02:06:21 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Hasun Park <hasunpark@gmail.com>,
	Li Qiang <liqiang01@kylinos.cn>,
	Kees Cook <kees@kernel.org>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Mac Chiang <mac.chiang@intel.com>,
	Maciej Strozek <mstrozek@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	=?utf-8?q?Amadeusz_S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	linux-arm-msm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev
Subject: [PATCH v1 0/4] ASoC: Use named initializers for platform_device_id arrays
Date: Thu, 28 May 2026 11:05:59 +0200
Message-ID: <cover.1779958164.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2760; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=pePpbntnwnsj7EYGTYln0S0Z1fUMMahUgMDQxO5w1uU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqGAV3A/XGhyTdPC2Sbsk19+exJrBTv8hN9EsT0 GAAjGOFfiyJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahgFdwAKCRCPgPtYfRL+ Tgg8B/9D5gNT6QFkJSSGOnZq876EyBKdLt05krj7I+eM9aYvKsGkdCLHcG7QZHsH64DDJCElr0r rkkvYPqCAgT0nB7gOzo9U0qtyp69Vifs5eRYtlUzz+MYNPrOw1HZyPhMUokS9DH1Pp+kkk1fj3S pf2IkbuFyVhLCrKlKWuXJYjCf8Go8i/nKubc2wg6igcHvdnyTzxT+83dJT/P31ERPelDR9wXr3g NwuRB3IaDbFvfetwIRZGEvJ38cIqOwdZWALeex3CzgiNZyJVzlnyX0/cb63x8sz08tUXTRpK9XZ iQM3C8HjSEsS1U3+EfHXzpVCPMgXHp9ra49eC3vLgqNt/Qh1
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33266-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,collabora.com,opensource.cirrus.com,renesas.com,vger.kernel.org,lists.infradead.org,amd.com,cirrus.com,intel.com,linux.intel.com,linux.dev,kernel.org,oss.qualcomm.com,squebb.ca,kylinos.cn,metafoo.de,analog.com,nxp.com,pengutronix.de,igalia.com,lists.ozlabs.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCPT_COUNT_GT_50(0.00)[53];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,baylibre.com:dkim]
X-Rspamd-Queue-Id: ECD745EF751
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello,

this series targets to use named initializers for platform_device_id
arrays. In general these are better readable for humans and more robust
to changes in the respective struct definition.

This robustness is needed as I want to do

	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
	--- a/include/linux/mod_devicetable.h
	+++ b/include/linux/mod_devicetable.h
	@@ -610,4 +610,7 @@ struct dmi_system_id {
	 struct platform_device_id {
		char name[PLATFORM_NAME_SIZE];
	-	kernel_ulong_t driver_data;
	+	union {
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };

which allows dropping several casts and eases porting CHERI to mainline
linux. When adapting e.g. sound/soc/amd/acp/acp-legacy-mach.c to that
and make use of driver_data_ptr, the added const makes it obvious that
acp_asoc_probe() modifies the structs linked in the id_table resulting
in issues if more than one device is probed using the same platform id.
sound/soc/amd/acp/acp-sof-mach.c has the same issue.

If you consider the last patch mostly churn, just drop it.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (4):
  ASoC: codecs: mt6357: Drop unused assignment of platform_device_id
    driver data
  ASoC: renesas: fsi: Simplify driver_data handling
  ASoC: Use named initializers for platform_device_id arrays
  ASOC: Unify code style for platform_device_id arrays

 sound/soc/amd/acp/acp-sdw-legacy-mach.c |  4 ++--
 sound/soc/amd/acp/acp-sdw-sof-mach.c    |  4 ++--
 sound/soc/amd/acp/acp-sof-mach.c        | 14 +++++++-------
 sound/soc/codecs/adau7118-hw.c          |  2 +-
 sound/soc/codecs/bt-sco.c               | 10 +++-------
 sound/soc/codecs/cs40l50-codec.c        |  4 ++--
 sound/soc/codecs/cs42l43.c              |  4 ++--
 sound/soc/codecs/mt6357.c               |  4 ++--
 sound/soc/codecs/wcd934x.c              |  6 ++----
 sound/soc/fsl/imx-pcm-rpmsg.c           |  6 +++---
 sound/soc/intel/avs/boards/da7219.c     |  6 ++----
 sound/soc/intel/avs/boards/dmic.c       |  6 ++----
 sound/soc/intel/avs/boards/es8336.c     |  6 ++----
 sound/soc/intel/avs/boards/hdaudio.c    |  6 ++----
 sound/soc/intel/avs/boards/i2s_test.c   |  6 ++----
 sound/soc/intel/avs/boards/max98357a.c  |  6 ++----
 sound/soc/intel/avs/boards/max98373.c   |  6 ++----
 sound/soc/intel/avs/boards/max98927.c   |  6 ++----
 sound/soc/intel/avs/boards/nau8825.c    |  6 ++----
 sound/soc/intel/avs/boards/pcm3168a.c   |  6 ++----
 sound/soc/intel/boards/sof_sdw.c        |  4 ++--
 sound/soc/renesas/fsi.c                 |  8 +++-----
 22 files changed, 51 insertions(+), 79 deletions(-)


base-commit: e7d700e14934e68f86338c5610cf2ae76798b663
-- 
2.47.3


