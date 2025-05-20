Return-Path: <linux-renesas-soc+bounces-17245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 435C8ABD2E5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 11:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13D921B60C12
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 09:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4918A26A090;
	Tue, 20 May 2025 09:12:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5AD2673B9;
	Tue, 20 May 2025 09:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747732332; cv=none; b=a+D0sXJOdGRz18uFfCEaQswNthzk4O7BBGrjONhyUVUBd7QEkDVKQBacMqMl1m9Fgthdfx/OMhCEK64RBqXjTIthE+CsyEkW6vPiaP3g4+dUlrWQ9Wvn0haoe84J7fRHnjVGqzu6azkBWOLvwhTZwXLbMRf9NO+bjmig4T8lca0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747732332; c=relaxed/simple;
	bh=QkIwbA+4b/t4KG3wul4jsM2v+1uGv7WMaXB/U42Cuxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KYmWh5H542qsmm6QhjR4HDmkIGKxGOGxJtoQsVgeIjkgG+szmoNdxPB6vtrUjjmbS9cgemEb7o2xG+nMqdSTcGsfmBMXcqPb/J/pRbcgaQYJFskf7ykoxKYNfCTEov9nHW5oi8GyEt9GFWKw4QcIFuoA0rmTEP6EKD1t5wDewwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7eb6c0ec355a11f0b29709d653e92f7d-20250520
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:13616bc0-98fb-453e-810b-0199eb5b8d18,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:980ae2365df82707056bbe9350351444,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 7eb6c0ec355a11f0b29709d653e92f7d-20250520
Received: from node4.com.cn [(10.44.16.170)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 650892054; Tue, 20 May 2025 17:12:03 +0800
Received: from node4.com.cn (localhost [127.0.0.1])
	by node4.com.cn (NSMail) with SMTP id 6877816003840;
	Tue, 20 May 2025 17:12:03 +0800 (CST)
X-ns-mid: postfix-682C4763-2333681690
Received: from kylin-pc.. (unknown [172.25.130.133])
	by node4.com.cn (NSMail) with ESMTPA id 762BC16001CC7;
	Tue, 20 May 2025 09:12:00 +0000 (UTC)
From: Ai Chao <aichao@kylinos.cn>
To: johannes@sipsolutions.net,
	perex@perex.cz,
	tiwai@suse.com,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	srinivas.kandagatla@linaro.org,
	kuninori.morimoto.gx@renesas.com,
	zhangzekun11@huawei.com,
	krzysztof.kozlowski@linaro.org,
	ckeepax@opensource.cirrus.com,
	drhodes@opensource.cirrus.com,
	alexey.klimov@linaro.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Ai Chao <aichao@kylinos.cn>
Subject: [PATCH 5/6] ASoC: imx-card: Use helper function for_each_child_of_node_scoped()
Date: Tue, 20 May 2025 17:11:30 +0800
Message-ID: <20250520091131.4150248-6-aichao@kylinos.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250520091131.4150248-1-aichao@kylinos.cn>
References: <20250520091131.4150248-1-aichao@kylinos.cn>
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

Thus, use this helper to simplify the code.

Signed-off-by: Ai Chao <aichao@kylinos.cn>
---
 sound/soc/fsl/imx-card.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 3686d468506b..bffdba4292b6 100644
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
@@ -722,8 +720,7 @@ static int imx_card_parse_of(struct imx_card_data *da=
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


