Return-Path: <linux-renesas-soc+bounces-26096-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5296FCDC42C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 13:46:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 400B8305AECD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 12:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D960F325713;
	Wed, 24 Dec 2025 12:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0ZihYxa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ksTj1/4T"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD26326D63
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 12:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766580259; cv=none; b=szBnxsBDPJmV6BrMIFWfvG2wiJEtNsHbJ9ItsC/IOOuzjhrpDia49a0M8yF3reroPdizpc4mClIfkd6dujpQmmleX+qmaAIPenHjA+iPNbS6lrfjtuioSTjvL71jYHMRxkW41MYYBu1XF9izrkUhEq5VrRHEajvy82squBeFITs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766580259; c=relaxed/simple;
	bh=yA8n/3N51SU6FcQtGBZRLprm1g3J/2wXk4j1/Hxk46E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hdZO2zWOroNWBFXqtBQmEqszfAmfS7w82iKnlaM3nV250Geq/pjEcnzGHqgDvxGCmy5T5HpbltnsCQwwzNtulO7xE84Js119ZN2K8Roxn/IiznhQkeBYPQStkAtjORldA/b+y4kGM3/kK2z7urUHl5WQYig3cnR3S8HvC9NffHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0ZihYxa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ksTj1/4T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8t6xt1207156
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 12:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tCYzWdff7n1KF50nzF4ylfg2y+m/Sw+ZFz9
	Y923Lo20=; b=F0ZihYxaQcoZFAOjRn3WqsZ0HEPDYsp6xSBQIUn+gBUeRPBSLTj
	W3hckciIXGCzUWwP1vhewhbcwllb+M3TBpkJKfccULyzx42fgAmHbFzDvgXcDs3D
	Pjk/xFYoPlJ+LvmfE//EMDd7D1uRCZWLSs9bFK/m/bDFJVJKZxpZbo9IMLVN9+u6
	s8KZhLloSigZHynwuz5oHJ8q8LiJhIdPCvCCwh6Qm5MlSCl/Z4lhSqAViTWUzhL+
	55fSEEFwRx0OlCWtjDAHbHYNdYzvA1QchaqnPOWxzligtYOSmuEqcilLfbNr0uxT
	DZWxKXi9+VDyuzvcFw/EV1s4X0YVZ1zqcPw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r24c6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 12:44:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4f1d26abbd8so160823901cf.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 04:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766580254; x=1767185054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tCYzWdff7n1KF50nzF4ylfg2y+m/Sw+ZFz9Y923Lo20=;
        b=ksTj1/4TnXfWL1LXbV4wh6k4qXDX9d7flyCfGF0bA/7VXvAFxvdiZm23ZihyoTz8ii
         eN2Y5vS0Fs4xv2bBrUXC+tmIEFxx10pQi8jTThWAUbJ/iXSv9DSSrQGKgAElgTjHx50A
         GsZiOzI9qlkpHqheCddIIwoRKhM18EqE9OEMErpBGR7NmERBgF8sDcNaEZ8oZH3VJ7eN
         oYQXgIs/p/7Ozrg8JBXLbyZzNBJxGfRmWjwa0RQxSfVOJIj/ufwIgi8aM0WelgZA0NsP
         CR18vGhHSNi+gUDmH30rtXJ5P0HvqLibLJgeHo+p8/0bDjCney9oJcf6k0SLn41EeyWN
         CqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580254; x=1767185054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCYzWdff7n1KF50nzF4ylfg2y+m/Sw+ZFz9Y923Lo20=;
        b=T6XDae4McPt4Hfx+R/DqcXoFLXA4rZ2lzjGqy9V+Y8LwFqkPJ378DPbyQBWvZY6Om9
         N5RcnePBRB0vpn1zZ7zkPgNZ+iaNU2SuhgMO1TJaZjKSkIGSdZPT/coW3NIhmUvEpM9f
         Yexsis/egYteZOyxJFFJMKEnl4TQYensBU9ZP3NhKkUOdTL3Lpv+TnYs9CVTBkTWnClf
         DW25RVrcboHYE4fivPU+VgX7EUNy9yAp5Xcjkkyqv0bvGddY4EjcbCrLEMPar3ULRHUB
         8ktk1FyP5C1xgpFn2pRcF/Pan5G8FtwwG8jbfUWpqAWAK6NU4DUaLFuZ87mHQs5Lg2Q2
         inIg==
X-Forwarded-Encrypted: i=1; AJvYcCVKSNQU4HbfAxCPjrvPM/MeYEJAQL6nvcdqwoi2jvh71Ct2y+xT9XlGCHPhhslejOk5DtConcUnqW+7mV6hVTz+bA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9K5ajbRxXRK4iurq7nlD1jQX7c05pTaZtQClNi64HXSCcgiDI
	yvqpddL0EZdqNWrV0Fly4tokegg/x6pTEBIJKx7sRuadn1q4GnNMDsIMwOg8lmmuhhhBiaRYB/h
	1mCjs3B+DOQQu/D+KeOprzg+3oZL5DEM7V3HlJ2yL3avw9M1gJk2d91l/t4YwmkkUf/Kek9UbVQ
	==
X-Gm-Gg: AY/fxX6/X3midE6OTUp9xtgkVeLn9csmDmE5Yh96nSd80SwAKwmqjUVzqmO7tqWjfG+
	c9ZnO5pS21MErCjl23U727NAajhXAmjFLsekmqjXW0cPWcX7CQcAzWdSNC7bdGZ80/R/Y+UuwuC
	r8cceId2ppw9tgv3QbkrxR3zFWY4qUIYTZ/jYciG+f7+1lsUVBGO4DqxdXO0D6dT0/z4/Wg96SD
	Fc/unE3GdZ4i9sVqAwTf/kJq02KMjRCFl3NYg/u36JyJj2hyK55i4FrY5FL9dKqe/SUmAlJbMNT
	h3rF6jgXPlVUM7dzkiWR+ed4VtKBnR+2zXanrlokxIV1Nve83zmn7TcJ8eRKbH5D7uYZEjo85I0
	385NPZM9mXrG4NsKD2cKfpmijQe1EOnroJjmwWBa+27KqAvEsdH1sfFKnKNi8GI2UHheHSQ==
X-Received: by 2002:a05:622a:410e:b0:4f1:be70:7a76 with SMTP id d75a77b69052e-4f4abd8c6afmr265450971cf.49.1766580253759;
        Wed, 24 Dec 2025 04:44:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYpVNHB2iL4mAksYmUA/+LVLmMSYzWNCSBH5TsAHz3DLPgXD1ip8b4uJpmz3NjqhBYB118hw==
X-Received: by 2002:a05:622a:410e:b0:4f1:be70:7a76 with SMTP id d75a77b69052e-4f4abd8c6afmr265450711cf.49.1766580253411;
        Wed, 24 Dec 2025 04:44:13 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b66e2sm17049203a12.34.2025.12.24.04.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:44:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] phy: rockchip: usb: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 13:44:08 +0100
Message-ID: <20251224124407.208354-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1300; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=yA8n/3N51SU6FcQtGBZRLprm1g3J/2wXk4j1/Hxk46E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS+AXzi0JHlvHuya8HdxoNphQ+7PXvo/kd4CRb
 fU5Vi8dLGaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvgFwAKCRDBN2bmhouD
 1zt5D/4mIT+5DGh4QTJOJAtVc8flCOPHdTRs1c3WZysL+yszgrie3PwcIok1qWMW7cJMMPWNT3V
 4TCNmg6Cg+HpzkIo14nqPev/wEPOHya+7XA8DGo9MTIBDPu9UKAxtOiMG0948W64Yn74882Wqc6
 0zUpQbeAQSEI/5+AI9HFVs1qDlm1b9TBWTrhJhQTvoj3ApozFNu6gMumjUIXojKzfR6aDa6hiUD
 zWLB9uGJpTd9LtmNR3AoTwZwbIeZIHFDOHz2tODmjbU2ZsQInsfrnK3pa7sm7ekfWu6vezxntgR
 i04R0OIwMPWPsM9b+nvl+J/c4Sux45DHA776oExUgl5umVDAdhJbT6kKSeM8260UZvKV20/nDmw
 UvLiMu/OKLAjEkyXVrLzrQ5V61IK9yCobE54QPxbGrc8DsioaGdcyf5pAbCNU9WYV1XaYbZKUnM
 +nLxLdW7Q9gIwVngBVtocIfpknpbhAI/aX+Xm4PWKe1I3AsGOCq5ZyRAa4kemP1cldI1hkBIxST
 hlpOZ2QGSSSlpy4ZGWqIh9qd8VsjZE4wfF4jMhh7AHAVLPDWOMwBI+50BhrN1OTF6GhGYlDEFtR
 MgBoPJLp4xfNLJVOaqz8o0Zi6RAwWL1HwKzRSZ25ObBzWGCPGEdC6M63yIn9n86x0wAepAmtJh4 x7pWx8msxf4muoQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6SF2j4a_QCxW8iunZsmqDLa1gF176eEo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfX/u2zYFwjPAfY
 6jtTJQtm9KLflqP1Xu4x3rf6UkKwGCMoMN/jutB8o0dyLWIq8AMOh6m+2lyFofHzOsc7KpzYFZc
 bPWknbZjnB6tFZEBdmL23R78QvBdI2wR5E9btFEHMvagGezW58wFFfEyhM35Wpm72zlDxmcT1ei
 CpMSYO31fQSXFX05sqc3bk+HKbsBLeCnoUwSzdc6w7iMQWg7hJHZtFtggoj+aWGTCZ1GxFK+UD6
 x04np92Soiio/7nGHHzs297SD6OUGsIcLilZBcXNuTXedUhsYdU+9oCXLpzI5seEuXlwsJ5wiLR
 dNCXAzgXCnyf1J1RpGUgB09CcamoIFAdb7BwMX0iWjncuB2wE6GxyQy8wynQ52bsXqNCmuxY1bC
 nZA4VBMpurgdmu43u4gIq9BarWEwPctkGF53HRFP9BbsgCV9La1JO1W8/HnuB409fZjPPxk11Da
 NNy2yPOKzyrvc/KbT2g==
X-Proofpoint-GUID: 6SF2j4a_QCxW8iunZsmqDLa1gF176eEo
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694be01e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ed3ano5rc7BESD-daDoA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240110

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/phy/rockchip/phy-rockchip-usb.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usb.c b/drivers/phy/rockchip/phy-rockchip-usb.c
index c3c30df29c3e..cef96739cf3f 100644
--- a/drivers/phy/rockchip/phy-rockchip-usb.c
+++ b/drivers/phy/rockchip/phy-rockchip-usb.c
@@ -446,7 +446,6 @@ static int rockchip_usb_phy_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rockchip_usb_phy_base *phy_base;
 	struct phy_provider *phy_provider;
-	struct device_node *child;
 	int err;
 
 	phy_base = devm_kzalloc(dev, sizeof(*phy_base), GFP_KERNEL);
@@ -472,12 +471,10 @@ static int rockchip_usb_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(phy_base->reg_base);
 	}
 
-	for_each_available_child_of_node(dev->of_node, child) {
+	for_each_available_child_of_node_scoped(dev->of_node, child) {
 		err = rockchip_usb_phy_init(phy_base, child);
-		if (err) {
-			of_node_put(child);
+		if (err)
 			return err;
-		}
 	}
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
-- 
2.51.0


