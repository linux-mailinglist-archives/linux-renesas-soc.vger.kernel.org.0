Return-Path: <linux-renesas-soc+bounces-25218-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA17C8B6C0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 19:23:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C5EF4358867
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 18:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3D89312809;
	Wed, 26 Nov 2025 18:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O3gC4FKT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pc7GGetG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E152730ACF0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 18:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764181387; cv=none; b=puruJh4taBSRAtR4nzIFDQGUk+dRhakUwLSL2D+svjuEwKA2AGUzLXAIeEULh1LLc6Rj6x8dk7IAWFCcK2YbsIzW1Wl4VRlwC2ShlLdrNqEMhhg28UUx8w1dbWJBmpujx2qgRlDS0GEdc8RW506vlZ0C9ziKRUjCpY/9fPDNnJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764181387; c=relaxed/simple;
	bh=vwfiZ4bLwtpw5TOi9+RULxI2UWcZPIUJbyUFhsCi78M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fzl5exAZsRFPrPlkXfOFktuC+NhZKpyfyFa4HcZCQOZwFhhCaW/SvKs2TWVV6jMlCaJKFhQXjkIBUvsNbaowAuZkSzdgRnsUvoeKwiZk1Fqlww7LuEDaEOpJApiKLjQ54GtV4kCfppGiimvSxx+0qmmZHFokTrOPyy0a29iSBMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O3gC4FKT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pc7GGetG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQFQGiT1457989
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 18:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9hd5FYxJTxbtnBKqwZtN6LivU7b7Idi5ds8
	036RW3n8=; b=O3gC4FKT/6ghTBqt89NGwUogfyeq72C795ge7u7OIMuKySooCwo
	IvDc+FUzhEHHRO7I41JHttbHTHQ0u4git87zBc2sShc1O+WhSyo062JM6/PUvO4G
	Itdh+GgvMfbfNq5zl6iHeAFJB/KjCHHKE9svvzs/q5tNRlMNGhZE1IrHT7tz21Sg
	LnRekNma5Z4Uqtn7OUGIWQKVPlEAjN9oSWH34XvK+rsBUhAO+EZdhqvEyUJSP/lV
	qEWV1fNO63n3c+rpVAZLl8seXY3NRV6bhn5ZrvHFdUhKmAdVPt/oDMPZf8sY9L0w
	I0phSscHwpG74j7Kfj0h70WcZloYOu3UxBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anvqvhxk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 18:23:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2de6600c0so6601685a.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 10:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764181384; x=1764786184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9hd5FYxJTxbtnBKqwZtN6LivU7b7Idi5ds8036RW3n8=;
        b=Pc7GGetGGRKEQVaBBdSevguoSaX+LQAZD2Kwq5nJOOichXmt6dQ2qTC49FJfh0TC0u
         xWOCcSIcEpafoxePDDcsq9aAZsZoxR8edKsL4scNJOHWFm6CVZLtB/2XyWFyaZBLfvxk
         yPv6B++wWCWxjUBr8DP+dS7XnLrLux09zorN/eV3U5aHYaHaT+G/GEYrvVAeBGPtNiWi
         K2a9HAatF1niCeufE/mlH1gQxlMrSm8Mn4K91uxub0tzZIe91XiYDW7NGv3nlvMFq4mQ
         8HBwPIf4p+lqJKn/tuLXVx4AjrdLq8MWMWU8gn7poHIeD9c3IzOsA9Vv6GCeu2G66BGr
         bO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764181384; x=1764786184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hd5FYxJTxbtnBKqwZtN6LivU7b7Idi5ds8036RW3n8=;
        b=OQWRRobti/yN9/uUFtEEHZtMLVruMQVk19mn9RYJ19zUdnBXqZbNTQg1om73L0/bWO
         LYJFlmP0GSAlJrsWxxb2EXKFuNdE7gYZ2HnW3pr9Xqca2TIbq23Sf/2qr+toVr0hk/RO
         8ae17eAKCmrQSmhPGCmH9RtEmofiliiCW/YVIgzyCPaUoD+SBE0S2pbrjszrPgjzMpFg
         AyUeJ1JqofQbwCygr7FI1U8MgiOhhlSdG93CGVXuw1MUbpnoELMnBg3Lb5hIv14uuI6g
         JhX0xgdCh2jZCJfp+qCyWGbf1crlAB4V8pyrk8GUQQxqgLvEYJGDCvSzlRO8S41eK68y
         +x1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBU86ao/QNHWAu9ycbIjZowGTzb2YF6Mibb4ywakGSwAOL1cRO0iDtwt4wSoTJ5NHN8sx186r0EK4dkq0dyp+w1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv44C1ZKDIRzzdQIDIZoIYKnbSBVUk9az0wcM06tHn35NIZx2F
	uuznd/v4JBa+8acIzBJFsa36cVmZ6Cu9bzlMYsVn2xf8khXb3VM1IS20AX1kb+l65xzlrj3N+ly
	Dkn8wu4/rXbe3hZaJNxseQSI9s7ZmKPuO0uZwvBKfcnB1MbDSwce4GJdEOVN1NCnPpMiDPCb0Rw
	==
X-Gm-Gg: ASbGncsZPv2YZ26jxq5KEU4ZGnyP3gk57SW2fNAU0mZcnX9ecXHqE96t2ucP2IfZSif
	w6xsTQOoxxsA7PuK9qJ+Gz/TUqBAsUvJm9WxER2qR3NCg7gFMGeIF7e90KH1bJa3iSbQqNubRex
	g+6UWYGR3Zib9HgT/CBJfGxIuZ5Btpesi9Pmedr6wPuiN516djDWudn767K2VApHOy7sTaAti9g
	WKvnAEwYQqoxm+vuhowfSblHS5W6sCWLkmCZuONDkYXzRMGbljvdFflmS9nZqlIOPcwhNn4oJbF
	y4vRjhXDuAL5T+xLo7sfCG40vc19oHt4UX7UYiZFTMOpbzmXH7ZPvVKqSMCb0kCeEVvf4pTSp/B
	EFZ/cFNF1tdY40xbmfTv/UCNOSTZi
X-Received: by 2002:a05:620a:3711:b0:891:3606:7f3a with SMTP id af79cd13be357-8b33d268179mr2555117185a.45.1764181384149;
        Wed, 26 Nov 2025 10:23:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDOHb+nGWB7edLXVL3nT2Zi3o2R10JG4cWMbkYw+mo3CYHYakTXwoxRZ4cxy/DzgqTRgGE5g==
X-Received: by 2002:a05:620a:3711:b0:891:3606:7f3a with SMTP id af79cd13be357-8b33d268179mr2555114485a.45.1764181383764;
        Wed, 26 Nov 2025 10:23:03 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add2648sm61078295e9.4.2025.11.26.10.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:23:03 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] i2c: bcm-iproc: Fix Wvoid-pointer-to-enum-cast warning
Date: Wed, 26 Nov 2025 19:22:58 +0100
Message-ID: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE1MCBTYWx0ZWRfX+aiDLGttkuD+
 c1FUAcmWyUR/jv0EWHs1WtVlV+i6znVxzv2lDeZDQCA68Af+6ErRLChZFC5lbhWRT/pnemXpjg8
 0MjnY9P8H/TPkPMsc3AKyrQIMWm6eQy79wOAbU7ghZfoNf5s/aQx+fPuhp4uXHuzxct5uKh9Ufp
 rMoZHPI/pAFnfkxMZ9AxqI7WRJ2WF/kDZmMzjnZkC/Y+/B1E6GFnwJynmB4TgpFg20EVi2x/PrS
 JIsxff+Bqde77W56KUiMCU5zAZdV4Pvm6/bhVQv9nF42G9TxBbVH+pzke2MicR97x3NW8uXKgDX
 wHYM/3LQIHKwZ9PXdDlOHuxSgAplAbqORZASUnACLidSvY4Ts7IaFlkfWfTn+GD5YI/N602sEpy
 TrJiBYXGwmNt+RM8qXHyg9fhjot+7Q==
X-Proofpoint-GUID: WvNYMx9Jcew-XvSoNADXlmOvr3QjEMay
X-Proofpoint-ORIG-GUID: WvNYMx9Jcew-XvSoNADXlmOvr3QjEMay
X-Authority-Analysis: v=2.4 cv=feugCkQF c=1 sm=1 tr=0 ts=69274588 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QbJ2VWT2XajEZlGPt78A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260150

'type' is an enum, thus cast of pointer on 64-bit compile test with
clang and W=1 causes:

  i2c-bcm-iproc.c:1102:3: error: cast to smaller integer type 'enum bcm_iproc_i2c_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

One of the discussions in 2023 on LKML suggested warning is not suitable
for kernel.  Nothing changed in this regard since that time, so assume
the warning will stay and we want to have warnings-free builds.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

kernel_ulong_t is the preferred cast for such cases.
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index e418a4f23f15..b5629cffe99b 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -1098,8 +1098,7 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, iproc_i2c);
 	iproc_i2c->device = &pdev->dev;
-	iproc_i2c->type =
-		(enum bcm_iproc_i2c_type)of_device_get_match_data(&pdev->dev);
+	iproc_i2c->type = (kernel_ulong_t)of_device_get_match_data(&pdev->dev);
 	init_completion(&iproc_i2c->done);
 
 	iproc_i2c->base = devm_platform_ioremap_resource(pdev, 0);
-- 
2.48.1


