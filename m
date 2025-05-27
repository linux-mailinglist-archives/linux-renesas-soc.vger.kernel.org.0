Return-Path: <linux-renesas-soc+bounces-17531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FBFAC4A32
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 10:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43AC5171C7A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 08:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A03624EF90;
	Tue, 27 May 2025 08:25:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2393A24DD14;
	Tue, 27 May 2025 08:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748334327; cv=none; b=CCYhehu1h4p74lYYIpzPme3tOYJ3c8fMz/uXwQjK92AEiEbUsjSvDHBt9omrCM+sKoHtPWQHNX4cgdIYYs0u3Ka+KUR2nLfR3RBQER7dKC1qC+rEAfzsY48S9vs6UoO9LcdG7mcwsSsUU54188i3juSvhKMiYu8RaC0oRgBz0BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748334327; c=relaxed/simple;
	bh=UhjY7OeWc+el9dkWDXC9pAljGZHiRHDqsBqhts3pNvM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OtECAGKKUa4af21jV24n32YwaLWkcHQ0zDXvb0VApjaVNrhfzjXaEeGCoaXGuxQm9bh/ILSVnwQn+hUhmXI2g2egQNVsTC1BEypUwyiSP7HUOzQuYjqTBzfR6wApUZ+JaSlALNE2XP0KKB/chrV4DDBFeP6Rpi0DxJ8mBIG2QvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 201b0f503ad411f0b29709d653e92f7d-20250527
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:d318de97-d3aa-4989-ba67-d9ca33c7b027,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:82ea9aad143a8f52c9b55503f9bafb9c,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3,IP:
	nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 201b0f503ad411f0b29709d653e92f7d-20250527
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1785457094; Tue, 27 May 2025 16:25:19 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 1D62416001F52;
	Tue, 27 May 2025 16:25:19 +0800 (CST)
X-ns-mid: postfix-683576EE-9087972686
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id 9310616001F49;
	Tue, 27 May 2025 08:25:16 +0000 (UTC)
From: Ai Chao <aichao@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com,
	johannes@sipsolutions.net,
	kuninori.morimoto.gx@renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	srinivas.kandagatla@linaro.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	Ai Chao <aichao@kylinos.cn>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3 4/6] ASoC: meson: Use helper function for_each_child_of_node_scoped()
Date: Tue, 27 May 2025 16:24:44 +0800
Message-ID: <20250527082446.2265500-5-aichao@kylinos.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250527082446.2265500-1-aichao@kylinos.cn>
References: <20250527082446.2265500-1-aichao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The for_each_child_of_node_scoped() helper provides a scope-based
clean-up functionality to put the device_node automatically, and
as such, there is no need to call of_node_put() directly.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505210557.EpJig9BQ-lkp@i=
ntel.com/
Signed-off-by: Ai Chao <aichao@kylinos.cn>
---
 sound/soc/meson/axg-card.c         |  3 +--
 sound/soc/meson/meson-card-utils.c | 16 +++++-----------
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index a2dfccb7990f..b4dca80e15e4 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -222,7 +222,6 @@ static int axg_card_parse_codecs_masks(struct snd_soc=
_card *card,
 				       struct axg_dai_link_tdm_data *be)
 {
 	struct axg_dai_link_tdm_mask *codec_mask;
-	struct device_node *np;
=20
 	codec_mask =3D devm_kcalloc(card->dev, link->num_codecs,
 				  sizeof(*codec_mask), GFP_KERNEL);
@@ -231,7 +230,7 @@ static int axg_card_parse_codecs_masks(struct snd_soc=
_card *card,
=20
 	be->codec_masks =3D codec_mask;
=20
-	for_each_child_of_node(node, np) {
+	for_each_child_of_node_scoped(node, np) {
 		snd_soc_of_get_slot_mask(np, "dai-tdm-slot-rx-mask",
 					 &codec_mask->rx);
 		snd_soc_of_get_slot_mask(np, "dai-tdm-slot-tx-mask",
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-c=
ard-utils.c
index cfc7f6e41ab5..0750dece9e69 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -137,7 +137,6 @@ int meson_card_set_be_link(struct snd_soc_card *card,
 			   struct device_node *node)
 {
 	struct snd_soc_dai_link_component *codec;
-	struct device_node *np;
 	int ret, num_codecs;
=20
 	num_codecs =3D of_get_child_count(node);
@@ -154,19 +153,17 @@ int meson_card_set_be_link(struct snd_soc_card *car=
d,
 	link->codecs =3D codec;
 	link->num_codecs =3D num_codecs;
=20
-	for_each_child_of_node(node, np) {
+	for_each_child_of_node_scoped(node, np) {
 		ret =3D meson_card_parse_dai(card, np, codec);
-		if (ret) {
-			of_node_put(np);
+		if (ret)
 			return ret;
-		}
=20
 		codec++;
 	}
=20
 	ret =3D meson_card_set_link_name(card, link, node, "be");
 	if (ret)
-		dev_err(card->dev, "error setting %pOFn link name\n", np);
+		dev_err(card->dev, "error setting %pOFn link name\n", node);
=20
 	return ret;
 }
@@ -198,7 +195,6 @@ static int meson_card_add_links(struct snd_soc_card *=
card)
 {
 	struct meson_card *priv =3D snd_soc_card_get_drvdata(card);
 	struct device_node *node =3D card->dev->of_node;
-	struct device_node *np;
 	int num, i, ret;
=20
 	num =3D of_get_child_count(node);
@@ -212,12 +208,10 @@ static int meson_card_add_links(struct snd_soc_card=
 *card)
 		return ret;
=20
 	i =3D 0;
-	for_each_child_of_node(node, np) {
+	for_each_child_of_node_scoped(node, np) {
 		ret =3D priv->match_data->add_link(card, np, &i);
-		if (ret) {
-			of_node_put(np);
+		if (ret)
 			return ret;
-		}
=20
 		i++;
 	}
--=20
2.47.1


