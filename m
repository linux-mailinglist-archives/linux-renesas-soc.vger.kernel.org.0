Return-Path: <linux-renesas-soc+bounces-26097-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56174CDC42F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 13:46:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B3213092C0F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 12:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D87532695C;
	Wed, 24 Dec 2025 12:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqxA+GV/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ToiJvU5D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6887331AAB8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 12:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766580261; cv=none; b=ZomU3jCMKVAAZ2dPUnZQ8NMalwy2LdZuAcaU8KuTuSmMHFP3aqeQE6JjLBamUA8E2n3IITdoARIOz11VmOG9D0qOV5Ob2OkCtFJCGChvTfo0BPpPQD6v2jkqb95sNbyQBRyUtE62e3q2GPORMllrcmB6I/c6l2zeseYlzkMir+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766580261; c=relaxed/simple;
	bh=ff6qdOZjoCBTn1TA60Yo0C5n/L273TXJ0BR/Wu/HAKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JBEvMVmaSMXwn4dfRdrVQcc+YyN5mEK3Mt2JO4rQ7z4Xv5q4PLWGMXSPD55biqckWDmlRVw4T6oCgzOxyxuFTQ02NKwu34ltREv1VVEGFxz8BizvpRsoe4MONPBSGsA8L4r4Oz9aUUk9AOUAH513GKydMhvP0I4hvIdtWfuOAcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqxA+GV/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ToiJvU5D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO8mZ921206461
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 12:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XwDMAVWQZPL
	sI1sS5NXBRncjTne3brdgriHnrD1ui2g=; b=dqxA+GV/rkc5VhB6myTFDMUB/GY
	uAbaUL8/N1kydDU7ffMX2BU+dlIlVyshSsNxnTAzICsyNJJmDboko6yxNsHzDOUc
	sAZDfvWrmMH7/2IikMAi9owFAuXndXWh4Xiwc20IvT3zIAzxNWGfEo8zUTsxV+8x
	VtZHsSsCeyeAN1TryMUx3Y/Ndxkweg4RFeltzhSPtYt69BZuwrLN87+wjy6HhAQ0
	Ue0gjkAXdcJ6Qka1VST2LIeFQSYGsM7WLxRC6uqzQGkCVabGg9/XcP37WvFYMRfX
	ldIbIlY6f1ztsO++OHUv9N0P1XL6v/jYsjuEfeSPBSuqpFOz7tUq1ck7WgQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b827r24c8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 12:44:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed74ab4172so138593361cf.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 04:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766580257; x=1767185057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XwDMAVWQZPLsI1sS5NXBRncjTne3brdgriHnrD1ui2g=;
        b=ToiJvU5DuqV5gySMgycJGN8a7bhZcMBVm7y32PVdpWds+NkApe4sddXfWKM1VAjuu9
         YNilgbd+jgNRu07SISMYL+kv46LWubvnRNitErQLMzkhoIiryD6S5IyMvcd1pFoVa/hE
         KmVYmubI13Kr9FHn5iXmWjqswz1/6v+yzOwvgFDrBHuqkZSUgDujXrncsCjDn8QkjE52
         euBJp9ZCglSgEoj9BNJYUILRG3bE5y3ZPxU3SURCMir2CzEOuo1RLs+ikUTFW2tlPq0G
         96oqhBlvubbJ4j59cKxlfl7knnuyjvFxAzdzS4rms6+sToCl79KHB4iixm5ghZADqFcY
         +lNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766580257; x=1767185057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XwDMAVWQZPLsI1sS5NXBRncjTne3brdgriHnrD1ui2g=;
        b=kuHcq5tj7y1MtbRsbwtEcOwyJe2tWuOj2Yz8yBgIB40ptg9x4+bedkfmGkAox0F/4u
         BXxd7uLYUtutyuqlQmGGQqNCgWFx3TakjU7pnzO6JnBFcGpI7Xdi6UZNZATlahhwu1IJ
         5WX39ZilJGsgomivyRxv/9GUIl9bYz5ZPPLMZK73qw8Oz5AiHj9I5cxTGgDN+R7+5MF3
         D23ohqKfLG63ebVC1p+sB6TbNhqd0ajWHc3KsK46xrrUqRE0qTKm24DN1RLJkHOp1aRE
         c7XQbhW7NCBo3BreHcA75S2gGtVT+TfDdW0GxX9uIOohl7CyQ5noC0+5HXbPiF873Dr5
         zfJA==
X-Forwarded-Encrypted: i=1; AJvYcCVAXf8Lt33s2uuoo+l4gO+5+LJDZYjkcdK7Et13uyRSkMI73Ox6FpoalfRPRFv1LRlN4UOV3I1BylkHznnFDHCUMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGKaH0lSTrMvmbVsJI1ZTTY0ixSVsrc/IKk4D3NuC6vnUn4PcS
	r8XmHdLwvVpkdsguU+UGjs3+FMI24usfc7GldIyF7LppBcGzrzA4+iucwgOjlO0jntUuSFwq04x
	yafktNPCV4eEIs+5YTU34CHUoA30Sv9d59IEw9HiM5W5ocfm44nfwVZ/PTinDTyr9PCtrSf1aSg
	==
X-Gm-Gg: AY/fxX5fpqbuXP7wx2HyiHYyq/P1SnsYTfI1ppn4R8aHPPpcD3ie/qHnNh9qZHQPyWn
	LqOLgpRaxa+6LulN/43A7YZx2XbzqJNYAS2yDpZpgdEQUJhqhOynGSAPnEwlr+vVHbjS20u2wmt
	gGlIpVhKyDlkaIBlaWL86pD06nmzH65T/PtPfHodDdyMJjDts1Wl9DAmf3yRiH7xPpH4cWq/ylK
	7jkhwfrMNZu+yNQck0ylt7Ci3XcvJ3LigCDCTGBAfSKTYMFFcvwP3G9oe5L6CRwrtMZh1CcM2ms
	7ymLO85ZVu9FXfjpjC+u/i1/pLjV4PjESN7mnsF550Poe4vbf41qTdw/hEb3lwaJH3uqhk4chUs
	bH+Yv654tNswrasRGvfcxLo/QkerzSBtZDtdk0+aSig99Pu6Xf1PfKf2M1/Sf/b8KqhQJhw==
X-Received: by 2002:a05:622a:578e:b0:4ee:278c:bde7 with SMTP id d75a77b69052e-4f4abd1c37cmr241696901cf.23.1766580257262;
        Wed, 24 Dec 2025 04:44:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQsrxYLgVYVborec/UqKUOFogNSAh9agcb0z7QoRP/7+Nr+7itTQ8LnBat5QNl7LHwl+pLjA==
X-Received: by 2002:a05:622a:578e:b0:4ee:278c:bde7 with SMTP id d75a77b69052e-4f4abd1c37cmr241696601cf.23.1766580256899;
        Wed, 24 Dec 2025 04:44:16 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b916b66e2sm17049203a12.34.2025.12.24.04.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 04:44:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] phy: core: Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 13:44:09 +0100
Message-ID: <20251224124407.208354-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224124407.208354-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224124407.208354-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=ff6qdOZjoCBTn1TA60Yo0C5n/L273TXJ0BR/Wu/HAKg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS+AYVn99ItkzmuljyaB3Qxn+eI/v55ZapOafq
 3uK823nW6uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvgGAAKCRDBN2bmhouD
 1xSrD/4gkWzI15LqAW0wgK8pcxMbLEJXRORMilaiM0UfCmlhOWKuoVcEheRCnAes4+TldZXysBd
 IrhuZKJTMIAhzG9yy6Ibw6Y7EAPvlo5VIszQOfC7vMqltZcUd0dgjGjFhuyE9BG7o0bbTRBVrE3
 ymz5E0QrpUx6gWTbBegzdX3BrIJ/8Xqzyofm4pflhVbM+9RDD5GBjVjTIVsoHWTKUYgFW+bptBM
 3Yt/4kciBY0PSMacU0TQumoTX95Bj1I9gkoRlhTIMywAM39IUXwMbjzjA+wuL9oLaAdqI0QnOKK
 a0/4l2oVbHI4PftnYKH1wLHLzOaHkmvs8O3A7xIUed9aj7L06jJ3J61sqkM26J2e6F0uW32x+pv
 vtVBRr/d7gTrYEKPq99Bz2PsUK1jEfPh7yutVZw5FjHoYiCBbvsg/9S6DklN4BJ3keqnasyxKTJ
 cfVGjgQMvaQo5CykKfu3HGPGGUXK/BiV38QD6J9/PxYs4wUKRTsmayZc2eDY2llVUOrIZ+QeaCu
 aPitAi4cSTuRlssceHNG/ogzJm23CR3oaS0VR5gxJ6LjOfsyfSiZOH5nO7yiJzPr5NQjUO0FQuG
 ZDy2CLgZaJyq6Fzzqu1u1r4Mj+fMC5T3zEUGwtey5a5+IKy6pK9dGPv0o9xGGp/7tpqLdJezVpg KzpkmvXcC+ehTRg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PtTULn5kFXRd0udRzUNchp7Ooq1vxREY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDExMCBTYWx0ZWRfX1bfHtiEg8iuC
 94ohYTzEtKioPslCIBuwEeMkwfBs8jpubOxRTEFD5HFGBMjQpGESGZl2wdfVsaUuj0OtPCA/Hrl
 JBLqIpIImEJe6g5pE5yGFdKSw5wVjwJGHq5lbqx58qTVKveUxuSqb4wdhwVsuej1NZtk8Sbe7zS
 vjz97lhr8pf+NC1zYNJU0TurBJeEyBBRuG1NPN98F82wnBAxX7QSoRxJk4n57/wXYWinXEaSBCX
 ZtP9Mcjrtw/Gkb1dd/77KLULd8MO1E/dT1Z7EzaxPIXj86lT63/SjUcI3Zerx/vXQ5oYyCvvLL+
 xZLNZ7Fk7WWyOaK4BbZGILhsQo3is2cWFON+Gi9e8DYfMjKezBPFAk24fw9iS65jcpGyNSfCqQK
 7dxeDatlj3Oyoq/4FGY+z6n/1D92DI7eSmoi/jKZ9riFikIeV7/yrkWEn831QKzylEEW1aNgBlH
 066hN60Ada5air20jlQ==
X-Proofpoint-GUID: PtTULn5kFXRd0udRzUNchp7Ooq1vxREY
X-Authority-Analysis: v=2.4 cv=RbSdyltv c=1 sm=1 tr=0 ts=694be021 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=8TZc5ORpoUYqJhTIvu4A:9 a=dawVfQjAaf238kedN5IG:22
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
 drivers/phy/phy-core.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 8d227890a345..d57c9525fa38 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -138,17 +138,14 @@ static struct phy *phy_find(struct device *dev, const char *con_id)
 static struct phy_provider *of_phy_provider_lookup(struct device_node *node)
 {
 	struct phy_provider *phy_provider;
-	struct device_node *child;
 
 	list_for_each_entry(phy_provider, &phy_provider_list, list) {
 		if (phy_provider->dev->of_node == node)
 			return phy_provider;
 
-		for_each_child_of_node(phy_provider->children, child)
-			if (child == node) {
-				of_node_put(child);
+		for_each_child_of_node_scoped(phy_provider->children, child)
+			if (child == node)
 				return phy_provider;
-			}
 	}
 
 	return ERR_PTR(-EPROBE_DEFER);
-- 
2.51.0


