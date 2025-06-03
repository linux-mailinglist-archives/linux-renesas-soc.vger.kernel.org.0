Return-Path: <linux-renesas-soc+bounces-17823-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 446D3ACBFED
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Jun 2025 07:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22F0C3A0855
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Jun 2025 05:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E4F1FAC37;
	Tue,  3 Jun 2025 05:51:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7E0214A74;
	Tue,  3 Jun 2025 05:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748929898; cv=none; b=OxDb5nXSVlkj9t5cXPDqJZhU4u+XBHSQw7f/Q9/jJakciZVzUCh4A8yQeSn2nE/uu5ey2tt5zP8XIpwO2KgsqZRLPssqDjAEhHyyqTu9JeYPgoZsEBmdDW0c1V/IiQoJ5lfBXpIWltAqCsyWJfu/VgcWykvSWxXA4Af4wTjt9xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748929898; c=relaxed/simple;
	bh=49TcfAQOEeJv/qCSz4O3cG+DCVUoRxfZZc4KzERXSmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C9UtgWS1NA16w6eIlFv5EpALIR0jq3j9TfCD50VNzsjy+4/vwxw35y7d6UhTN2namV8ECC+BGrjQ/wSBBEqZKw1ElSIb+6p9f1B04DwbXBddPUdtuf3pCYZ7xVqdfQE6BOuFhAuQ9l5VzeQByRXGarYuqo+C1nY1H0ODQWfGFTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: cd018a2c403e11f0b29709d653e92f7d-20250603
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:d00fb2fc-8931-4d82-af9f-370910dd06d0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:82159c751699e0b2a3d463d53031854c,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cd018a2c403e11f0b29709d653e92f7d-20250603
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 918867262; Tue, 03 Jun 2025 13:51:32 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id B8ECC16001A00;
	Tue,  3 Jun 2025 13:51:31 +0800 (CST)
X-ns-mid: postfix-683E8D63-59658677
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id B945916001CC7;
	Tue,  3 Jun 2025 05:51:29 +0000 (UTC)
From: Ai Chao <aichao@kylinos.cn>
To: perex@perex.cz,
	tiwai@suse.com,
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
	kernel@pengutronix.de
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Ai Chao <aichao@kylinos.cn>
Subject: [PATCH v4 4/4] ASoC: imx-card: Use helper function for_each_child_of_node_scoped()
Date: Tue,  3 Jun 2025 13:51:09 +0800
Message-ID: <20250603055109.3154061-5-aichao@kylinos.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250603055109.3154061-1-aichao@kylinos.cn>
References: <20250603055109.3154061-1-aichao@kylinos.cn>
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

Signed-off-by: Ai Chao <aichao@kylinos.cn>
---
 sound/soc/fsl/imx-card.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 9e668ae68039..ea5dbb54b584 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -513,7 +513,6 @@ static int imx_card_parse_of(struct imx_card_data *da=
ta)
 	struct device_node *platform =3D NULL;
 	struct device_node *codec =3D NULL;
 	struct device_node *cpu =3D NULL;
-	struct device_node *np;
 	struct device *dev =3D card->dev;
 	struct snd_soc_dai_link *link;
 	struct dai_link_data *link_data;
@@ -552,11 +551,10 @@ static int imx_card_parse_of(struct imx_card_data *=
data)
 	link =3D card->dai_link;
 	link_data =3D data->link_data;
=20
-	for_each_child_of_node(dev->of_node, np) {
+	for_each_child_of_node_scoped(dev->of_node, np) {
 		dlc =3D devm_kzalloc(dev, 2 * sizeof(*dlc), GFP_KERNEL);
 		if (!dlc) {
-			ret =3D -ENOMEM;
-			goto err_put_np;
+			return -ENOMEM;
 		}
=20
 		link->cpus	=3D &dlc[0];
@@ -567,8 +565,8 @@ static int imx_card_parse_of(struct imx_card_data *da=
ta)
=20
 		ret =3D of_property_read_string(np, "link-name", &link->name);
 		if (ret) {
-			dev_err(card->dev, "error getting codec dai_link name\n");
-			goto err_put_np;
+			return dev_err_probe(card->dev, ret,
+					     "error getting codec dai_link name\n");
 		}
=20
 		cpu =3D of_get_child_by_name(np, "cpu");
@@ -725,8 +723,7 @@ static int imx_card_parse_of(struct imx_card_data *da=
ta)
 	of_node_put(cpu);
 	of_node_put(codec);
 	of_node_put(platform);
-err_put_np:
-	of_node_put(np);
+
 	return ret;
 }
=20
--=20
2.47.1


