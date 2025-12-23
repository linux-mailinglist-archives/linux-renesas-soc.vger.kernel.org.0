Return-Path: <linux-renesas-soc+bounces-26032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C35E8CD8C28
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 11:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B255D3047AF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 10:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5355534D921;
	Tue, 23 Dec 2025 10:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlvL8scH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hwlOZs2U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9C834D38F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484306; cv=none; b=OyFUMsvfxRZoP3thvq4NO9t9snpMt+KNICGZqRKbI7rIwX4VLuO5gz18E0KHpWdY+AtkpueMgVPaNouSCLQ8pIK8hQ7TuL13w4AtZH1cWL4ABBKDogNk8qGmrnQ4QutS03/vN/5TmH5uHytjcvYgxIZbv4dv6QmqGSeaKSmNJBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484306; c=relaxed/simple;
	bh=pV4BB7VESvwwOGoINJ0yyIw3maBinxln5Jf5/nDWw4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CZRLv878hnrwDdVsJGeAm0F/M5oAs49u9VlTjBAIt9tYRLBLdDj2foCzYxKSSOH8YCQzeZ8dhZRdAuxXFL3wA2GguMb2kNHV5aAcLcGIQZVNzuot6wuXs4OiEj6alKRikJ1U92IbO+KOjDtoB9BEwjNt0tzZbJpw0jubKRCRfiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlvL8scH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hwlOZs2U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN8iReS2747219
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:05:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AV/DHL0paDpUXzhwtvc8PrdZr2Xx/XbyfZPyz0Y56tQ=; b=hlvL8scH029COHcp
	+MBV+1qog3pQXgXaGIMWNNAFXha2eZDWPkpmb0kt8+JA/oHqoDZHISR2sWq+praC
	HHxBiRQ06uUW7sy5zZFS01duUSrv97XuA2slOO0N0KaAfi8S3NfFphOFtzaO8MoP
	9hGzubKxtuH+Yj9v54rVzMPz2n92fo9xMvb/tIwZm9awgbshwoF4Ut8BRfggpk2K
	fqJWym2jYS4vHia/jtTLRQRA/SbNQ+btysGLs30mSRQ+8BxnK4l2PLpey/9YpRmU
	nDIkntfUtPWPkzK0+uiTJZ8BbmzDGeyzF4IDHlmVNeJVzVDlvQCEGL9o0xGSDTXj
	9ypubQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5csnf8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:05:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0995fa85so136742841cf.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 02:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484303; x=1767089103; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AV/DHL0paDpUXzhwtvc8PrdZr2Xx/XbyfZPyz0Y56tQ=;
        b=hwlOZs2UB1WEsHDGO06oHn73ItpH+oS1OsFGueS5BAB+f162dTuqPHgC/g4JtqFQzP
         MPQINU2YENwiEIT1THRxOuyiAba15W3KugE9ONC1k4iUDylJlXzqSeTwpM6Wa+A3Po8O
         3tDkpW/4eBvU0L2YSfj0ZUA3DnWVEjgnm0F/DeXgNze5t9agFnxqhwhuKZDUX5FzCatF
         gQnQo9qtDHRyZzXokWMRxaQz2c/OA2U8ib869NgmcyAFqHytat88c7eiShccH9TKTCOZ
         DT9aoupMGntvrVUMS3Ma+ggSH16ZJ/Ljmdwr1ey/8TH0ntRTOiqL0NC/0iSdPzNt/eHx
         sQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484303; x=1767089103;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AV/DHL0paDpUXzhwtvc8PrdZr2Xx/XbyfZPyz0Y56tQ=;
        b=sDksYOyvJW7iGXipJBQfpIgbA5gUI8uo1lkd3j4gLraBkiJfZTac/OYAaTmiPEyb9r
         xCEw1TaoOgsmr6yVaT+rEavXEdGHhcAA0uwWOHLLaMeF67O8VjbKIuUOzaPrilljc63O
         i2HHSAb8OLD/qyVFoJMXbAmH2IOCfW9zul8f0WU2WkRsoQBUNqnH2C23dkcRz2ZXPTP3
         qtbbKQjm7MTTAtEFw+P/MCc93ppABkt+PXgbpr0AMYrVmwoQDuSK1bmKB0TMBl2tHgQJ
         87zZNxfT1CyrrDGTYtmfMdi+WFroCc7LIA5vx3lZ+7ZXaRqXoxUiwCopc85aDk3oMdWm
         SOIw==
X-Forwarded-Encrypted: i=1; AJvYcCX516rOgadJCtXBeSwGgBJPvkgDBaF2Dlvc5i7zKUXcbj/qDzVlBPYlpRHEuw1Ghxl4NLyyZrO3W0lLKr7wm2tfBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvvYCmm/XduShJKMlyrk5uAsV7jRBCK9VfGaVpX37spIfnya/2
	FloOw4RL3SqUrCLotgwyKMhmXibVvV4JuIrFFIL/DSmPuDjM7+1JteiVPY4SithZZx50eokbnXE
	MIp0NSTKEmDAstSuhrbMalwG1sa9z3R7WJ+UCecgsvRw2lPw375j5BHf7gnzHqkjJvnEiUZEc4A
	==
X-Gm-Gg: AY/fxX5ZOkDTiWLae77TUdsgaUEInLFvkErc7M56gO9wHtc4+lFTWUAJBE8T6KikBeD
	uwJQPKF+SfEHHXZI0BNd95gSMrVCkQDkBdPkRp/hT10dVZTlhqFoy6sp57suvKwKxklnjsMENZU
	1e05epj16eUe/y70SN+vMCWFagDp53KplRaOMEbQwseA2/VjOh2kVKzrau0E+SNHMeKPh87nfeK
	5YO2rHaoaYi7oCRIsDcvYjDUaFvEA4QmwJuRQQ3EqsJftmtedfCbVeplEpMn+GGO7TY8YXrpi9r
	aexh3vMa39JsA9sSADTg7Ek+pF4MqFX9/wXT+glLjCxgismSPo8FdKGXSGq9Flx8vtZro3Q9FYn
	qqb12vv/dXEsnTDorUxkVc1i5dyoxof7dW74zngU=
X-Received: by 2002:a05:622a:4c0f:b0:4ee:2312:6059 with SMTP id d75a77b69052e-4f4abcd267cmr219666641cf.19.1766484302889;
        Tue, 23 Dec 2025 02:05:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHe5BKZC1HMpaoJ6m22Bw5JHQ2k3vKZ1lflXeYj8W+wWpZagHFrQE5aCx2Ca5x5xFVbk/k3Sg==
X-Received: by 2002:a05:622a:4c0f:b0:4ee:2312:6059 with SMTP id d75a77b69052e-4f4abcd267cmr219666011cf.19.1766484302373;
        Tue, 23 Dec 2025 02:05:02 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:01 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:41 +0100
Subject: [PATCH 03/12] i2c: bcm-kona: set device parent and of_node through
 the adapter struct
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-3-4829b1cf0834@oss.qualcomm.com>
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=995;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pV4BB7VESvwwOGoINJ0yyIw3maBinxln5Jf5/nDWw4w=;
 b=owEBbAKT/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmk9+7EXI/ovwZ/c+XYelh08kqOlDbOBxj2/k
 VttIDHL2WiJAjIEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppPQAKCRAFnS7L/zaE
 wy4UD/dSL57NbV3RzqtwqkJOlX6sp2CYEYArQJX8tFc9k9osPA7RTFFwDYR077EsO+x6swQWmec
 m3ebsw5P/vUS5BJqv5zs99rA6OREaF/bLsFJdXSEhoAX9RP1kg2FzLORu1zVGuyD5o0+yzDj9ZT
 QNLPrQpqDGLfersmjlqVWmrhVOjOe+Y/ZOjnQEGBcZd0A8JmdhWKnflhWiMHrG8lyri3ExaG+Gn
 c+TnA/WlWcN3vfN/aZOihX9QJW1TM6GBBr2g3GB8L4GMWheCavF6WtEGIW9TqAoOplupBi+/a/3
 SJaSI1L/C6Mg0Ab/d2lh87/sFaZHTyPmVzqRO668D9AysNGfdRCBaR/WAev2AriKdwet6miHmPl
 qytLMwT0ra/pC/P0t6N1C3aDCtPir+t/VakOsLnHOFmThFS+i93ESC8BVZNh5lOl2gHotAjP9Ot
 Bjh7w2/MXmjGWbrheu1uiYIZnr4X85hsQUpBrRM/RFMWm9S58QHIe8cjqbapaXGMmNOy2Ylp/LI
 eE2nwiiyC0wrSr4X/olOtXW7J+U3edWLDgbiEbzud1360InLPOGvicfsMUZ1fsKZy+BJkXS0JRW
 AWzg1yWqYZH3x3uOVCkZZZI4ty0Ks9K9B4qWzbGQbPP5u2fSIwfnsaQwl70eaWQ4LMEnn5PJ5qx
 p8LWm/LnMJHds
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX2B0DNO51t1RH
 w5+oJPtKEtHhCtivbotIZ85ahN4syi4YJ6bxZqgREhoye90I/3tWjP1pO9IV+MkjqBNHa/ZS/yg
 fukcsXCo8OZx6c7bJAYDw+a2WYoJ5cGAalf/DU8oFxT9nHw3Fcv0X/vj5NB7LCfqsJMZmZ51Igz
 Zj62fDyNgD7C+UExvj3jq4pCXO4HA1bFxUP53BrQ05gR0VlVcBDzCboyC9F/+OIGgNt/5Nt8h2/
 ASPf5zkbrjFnNkRfTZn20QQLPvv5aQnf7+yv+OawbdPW+En9pYRQNUDb4ByU7lC5uiXtwm4BMgS
 gKj25MXFzrjgTwY6aLJx0/aabPBJyuX5HlqEM+6x4gv20d0yH69bcQZtIdj4BEAw691kHf9x0Cl
 esdkUP7pGjklFmT/fxSVWaVrShzfjx2OPuT+quwK/JgZkrGmm03TT070xkNN+3ms10SHS2HVMme
 nAINqRIDFSSBzuY/2cg==
X-Proofpoint-ORIG-GUID: xcVsbk9KwsyA9XXMZktXXmOCayondnVt
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694a694f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xxYytfOIdaUIj31isgUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: xcVsbk9KwsyA9XXMZktXXmOCayondnVt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-bcm-kona.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-kona.c b/drivers/i2c/busses/i2c-bcm-kona.c
index 9d8838bbd938bf6c43d9553d9f54acac1282f7e8..edd79689f40f451fc216455c9da5704bdc73c62f 100644
--- a/drivers/i2c/busses/i2c-bcm-kona.c
+++ b/drivers/i2c/busses/i2c-bcm-kona.c
@@ -840,8 +840,8 @@ static int bcm_kona_i2c_probe(struct platform_device *pdev)
 	adap->owner = THIS_MODULE;
 	strscpy(adap->name, "Broadcom I2C adapter", sizeof(adap->name));
 	adap->algo = &bcm_algo;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 
 	rc = i2c_add_adapter(adap);
 	if (rc)

-- 
2.47.3


