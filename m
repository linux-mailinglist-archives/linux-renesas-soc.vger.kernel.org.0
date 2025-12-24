Return-Path: <linux-renesas-soc+bounces-26098-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F639CDC43B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 13:47:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAE77309EB20
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 12:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56380336EE0;
	Wed, 24 Dec 2025 12:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eFQ7FXKN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XRQMCDWx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EED327C17
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 12:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766580263; cv=none; b=Z6+jlIYH1Sov0lFzBOVpBa8Npw9LmdGmwEsN2ynivQzN1HArYgidS2QUFd9NnTS4teWIR1kKYaWgAL98AwK1hLoS/3yAR8YmVZuvYt32xD2sL0OQnZibYo+E7fq4xx4YG5n0lD27HneSzjUr09ppwGPb74x279TV18X1aDKZvIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766580263; c=relaxed/simple;
	bh=pDAiDD6QCU8V5xqDxrCJ7LAU7tCZMZYYdnGT2r07mRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hws4H9+cHpiX2lM+m41+lL3UPc9SafYj3zr7MfDAph6xwo0cd374+rrkODAy3sUSGWCFsohEA4OIEJq4ll9LUHiE8GSIa6S7MxFCJdVWfMeosMInpehkHqrVLMcNSo5x5PLvbO7TFTXJ9PktpDZdKXVQbpXL6LgLQXxwp8ke4/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eFQ7FXKN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XRQMCDWx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BOC9cNc913433
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 12:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=azY5C4oBdnP
	1B1v82RYPMBeCpPnrWdWx0XpbhbORP4E=; b=eFQ7FXKN8gOwxG+pKIgb4O/tVCS
	1B3QTti3COyknGSdoiPYrUEzTIetsdWH1yFaTavOnFELOTarbubR2+fNs0giEIKK
	zxI6yioyjC3wJ2GhaIIu50QTGtsfX6qPAFIR1kll7HMhFMujMWYMpzUBB790htEI
	6j/TBwOZmOoIFXGm1LbMZN9r2zTJKtY5unmmpbq/cgQalT7fOEzFKqqZxA0HRSVt
	eMGBq+m0AcYSByK6kYCdGyRyaMoTRt7UPwABk5rKR1d5K+cN+j24oLJLL8JXWzcT
	dh/aLhyekkGIrKtlBvd6wnxW6TG1T1o1irR3U4muor65SGsmPqRZNekctaA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2k79n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 12:44:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee1b7293e7so205222391cf.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 04:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766580260; x=1767185060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azY5C4oBdnP1B1v82RYPMBeCpPnrWdWx0XpbhbORP4E=;
        b=XRQMCDWxeMcAwCr23fQWEonv5Nl2mO7w7KxU5T4SHECAiqnF2HfMuEwElLCPPho0sE
         JothO4hSjvl70jtDK6R4BF8Iim5yR8F/Dpr5QE3K4Hsz4JEVXwI+uzbOxW/klxLdS/qn
         87/EtWrkqZY1RAYvi/U8pQF2WGN5knHcKkWj8ZAR6v5m8IZ54oFvHxE4/vQJIpKNqC8K
         /2272kW5g7oe9dnRFxG2tyAS0vbtaF8HwKcdaa/yNfpVjVA2lLA0vYX6U3/e1fOS8qbH
         qVyt7hvJBdCY32+HVfUIf1jk49Rhh7USibwqIiLHSNxJn6XMNsTJr98n9lVv+CGkR0/S
         InjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580260; x=1767185060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=azY5C4oBdnP1B1v82RYPMBeCpPnrWdWx0XpbhbORP4E=;
        b=GRaef9XZueefvtPihsxSLm/NaW1OvAQQsmdqcLg8xPH1jinu+47+pXP+Vc4pIH8N/G
         SSpcMV0Yp6mmw+2HyWjjLVP9cpcP2jTxUVQ0URRmaWsvFM6JA3z+1huILhrADXzH2Sjh
         4NwqKMPAHjtJoNzU08ZiL3sojkL83dMBHTXz+o/cGxYp4g8q915MKDP+C1rB/PoeK3bW
         Abf24Q1CbOn9YdprhQ+s4GWvEFaPH521nJXm5Su5Qrh8i1oVqSwTXOO0Q5zx0NNKoXcJ
         XnGLtmKsUMmKCvamGQMxbUQ3GBp9OW+S+BHmUEylDt1RZ1f+nDFHs0wGEA9ZAo4N3d/S
         ggsA==
X-Forwarded-Encrypted: i=1; AJvYcCXDZoJerBIIEi+Tijrffiixt/jX+eVXDfCy02zN0Jhl1A9G0nGfRnyRqfQ9SzlGCaWp0BEg5fy1iAvqjUXupEytVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzj6J2BfrrdNP15WDD5u5V6IAix4mL09jR2pVhSL8GgJQgmoLy
	fUNCg+jhjKm9AELqW0rcFid3zAY4IsVJz9cbBsTByZnycxeH+cgvtocGhtF/2om+GhTsKH1DZf+
	GneHl18iGnvtGG3zA7QhPIv+VnznvytTDAM9Ad+gFNzkGNJ8taaeP0ATuDgO3ueI4N4RTwvpbBQ
	==
X-Gm-Gg: AY/fxX7p49sWUJxvnM48BXDZhiefcOlzJy98kjYsP8tAOtQPMvP9B6VOS0W7APv9tcy
	j7RO+wk3cL54xfWdrL4H7nvXNZQIxfZfOEZnuTnCea4n6kPk80RhPQJluzZoCssWmhvfNbYavr1
	jJI82t/pqGLu62881BbpWumy4DgMHqd8k0v9KOklyz2rbfb7gamcRNJkBCTs/owycqfmMdGaxRM
	ZdEeKTfroP4XOJCleYXAyaUBpbfNccJUICkNet+o1Tcck1VbOPcQNbvhTwYbP7Vm5nEmSK0XB96
	pGyZjoX3+wUtIgpIhkh7C9pI4G9mGdnIHtUiIG3C+GRFB7g7L9kkeyPrYIGqXT9zgEmp6c4bDjx
	c0sGm/tFp3DWXcIjpXu2dAq0LX9SnVZjin767+8nHtmVsQLGwpaeZH7GrK6oB8wPOc9/kqg==
X-Received: by 2002:a05:622a:1b9f:b0:4ed:b441:d866 with SMTP id d75a77b69052e-4f4abd9e674mr262006441cf.65.1766580259956;
        Wed, 24 Dec 2025 04:44:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLezKdfVehEinuiLItKphYasBvJ0uhf05rwxwHyj1QbiVPaJ5DMuafVZF4czaet64zEyCUqQ==
X-Received: by 2002:a05:622a:1b9f:b0:4ed:b441:d866 with SMTP id d75a77b69052e-4f4abd9e674mr262005621cf.65.1766580258864;
        Wed, 24 Dec 2025 04:44:18 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b66e2sm17049203a12.34.2025.12.24.04.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:44:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] phy: renesas: rcar-gen2: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 13:44:10 +0100
Message-ID: <20251224124407.208354-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224124407.208354-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224124407.208354-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1466; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=pDAiDD6QCU8V5xqDxrCJ7LAU7tCZMZYYdnGT2r07mRs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS+AZ297uPNgzd6jPPGJtD+Lw2vcBh/MOmOaju
 7pE0l3/1z6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvgGQAKCRDBN2bmhouD
 11QXD/4pnYhtNHZrR2mRmfMCm8dcj2ocX7T6hAPvs/C+2xZXRl/JiUg/R72awTn+Ifoz0YNZs6F
 Ocu4CUaW3DDrOUGCoWdkgZupfrDNTogTOeo6/2B9kpNGNTPtDW12pgblPJIDPYrxoGv9liUw+Y7
 5hYM6el4dyotsKdgDmGfMRx2L5bRwfVaSCEfb+pLyQbaVGf7Sf8uJtK9MUcJbB8InKFAQ/cjiWb
 bZFhDPW9Uj6N3cQUIKk9gpEitmh/d4DW9+6uxVzg04SzmBYoYb0BI+6nwRP2APOwu83SkSPql5M
 Ms5kpg8aw/E6/WSYi2tmBsTBrH+Xuhy3xOhmO5shHPJiwLEXLW5cQ629+oq5xGWXFCtjlyKZhdO
 Xg3K+1NQrNjrsXCQ3K+0HW+x+wiT3D4g9q6HRZIfWzhnqrP5pruhuBiV6EB9k7rW7lhqeb/Be+X
 l1cfY9RBstT9AZyMIkeuS77NBC4ZM6NBeS0ByMrUf3CYO1Z662jFP4YWOdaim/AXcwgkjqw7Tj9
 CVtjapZH6qTMDRKJDtiAxujkSH/TiPn5wHcjRqV0oUuG0BoPKzqHL6Z9/zsoEBxEj06xxWo26CH
 z9cR9GorgCCKygQc4ffhtNvDwSEfB9/b2WIAe+Y+ppXU1E4/uZL5wWsnBQqnho0GrlTv3rKvHwD E3VFXoXwdE47UHg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfX3O5mjlpEbjqP
 RnXZlGylzBtgA8kogTKdFfe0PA2GFhGdpAn2jTT/x6w/LUf2oovObcNSzd0Rf2MkyMliKnC1cAR
 PbDUEvVRknRcZCDrAVDX/nj6GuZ6oOpTbM8uQ9PFZB3jDLHzRpWTeOQ12tGjEje5Vyr3tqJq26s
 0eiHzJWP5UhaZ02irg7WNtnKCW7CXQT5EtEcxMo2c1MWMcnVj4ChxT9jA3t2mLpa6VHUNMKIRgq
 apmSE0sxz943H+TgZXWOwJK09bDR7yRM6kXKqA/R7rba1cC02uJMvQOk2BedlgWHStKy4N+1/dw
 5PVUYuk0QaCDZHLTpABpP3xu6NtFIXEOKcqiK3ZUvgsD36mTvT/V1MCgVWpLUZkR8MbqZWR3QHK
 glg3UdHE90mbtIBhvi8quiH0LWCmETUr5p+K/WIjmwS4eUlOlrrXj3RIyWSytvm46wMigOubqXj
 4XkqZqrClbNZWNIoZQg==
X-Proofpoint-GUID: 5w3wQktV5ch7cNGfqobnKsXk0pOUM1uX
X-Proofpoint-ORIG-GUID: 5w3wQktV5ch7cNGfqobnKsXk0pOUM1uX
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694be024 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IfAgvU64P-rbEeZQN3QA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240110

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/phy/renesas/phy-rcar-gen2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen2.c b/drivers/phy/renesas/phy-rcar-gen2.c
index c0221e7258c0..89454ea270d3 100644
--- a/drivers/phy/renesas/phy-rcar-gen2.c
+++ b/drivers/phy/renesas/phy-rcar-gen2.c
@@ -337,7 +337,6 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rcar_gen2_phy_driver *drv;
 	struct phy_provider *provider;
-	struct device_node *np;
 	void __iomem *base;
 	struct clk *clk;
 	const struct rcar_gen2_phy_data *data;
@@ -379,7 +378,7 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 	if (!drv->channels)
 		return -ENOMEM;
 
-	for_each_child_of_node(dev->of_node, np) {
+	for_each_child_of_node_scoped(dev->of_node, np) {
 		struct rcar_gen2_channel *channel = drv->channels + i;
 		u32 channel_num;
 		int error, n;
@@ -391,7 +390,6 @@ static int rcar_gen2_phy_probe(struct platform_device *pdev)
 		error = of_property_read_u32(np, "reg", &channel_num);
 		if (error || channel_num >= data->num_channels) {
 			dev_err(dev, "Invalid \"reg\" property\n");
-			of_node_put(np);
 			return error;
 		}
 		channel->select_mask = select_mask[channel_num];
-- 
2.51.0


