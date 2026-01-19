Return-Path: <linux-renesas-soc+bounces-27028-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B96D3D3A561
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 11:41:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32B9E30336B8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 10:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 841853358B5;
	Mon, 19 Jan 2026 10:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iE7LBSpE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eT3SI5ce"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AB930F548
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 10:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819245; cv=none; b=Y7Bm1tnMm0yKBONMXYkXgKkmiKlX/kga7NkUNBUVcDd7rHTMpLQ9kd5FUOVoS6su1jmG+V2J9QzwHFcSflqH8XlUqQND2h1f6qglLyC2RfcDPBiVk+PwLmB+qD0nmVCCMRpDQeKYpStZJwXYmLyLxDD/NZ3eC4LiofY2uvP0WKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819245; c=relaxed/simple;
	bh=gSSXjbon2ZASCpjtfLFN1xl2k0rbvEgubK+ypiMfNAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qfvQIItSApzAst1zTali+Qlpm3KlCrjiH0kfEgK72JQ9fWz67uzBdC+98/v5kbG0S1K4L/6t0snLYAw2Iss/nvhOVXYp01WK7kTEgw+vlT7hDm3SobO1lC/4RxnKFEW4LmoSp7hPeBO++0dUDmNldLihcbrNoJWGQ1lG2tyn81I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iE7LBSpE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eT3SI5ce; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J910q91044261
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 10:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0sZbZAxKd7p0LzWuDrHVogsgeIRXUiPb6BcSR/KxOek=; b=iE7LBSpE6amQc8ar
	jiHLqt30gssaEF/bVw8IpwLRRv7qEAR91BTg9brjbk6dHDzjJfRtEF/D0AAiLtC2
	5hX2fPjPf5Q1ytEK5qTvKeVCfoMGt7SaXYBrqMdIH+ooQs1ChLVljYkQqG4VIGRO
	vH44x5S1QxdLtbHZ43SAnljrll0rrH7Y+xJMKpmh0+RHQnGqSL7SEoRsclvzBIxA
	k6jA9eBtwM95qqJoSh5hvRpBABZgqJTp9Fhvs/hRqGm/UB76LL0hBY87EDxe+K0z
	fYOD0onxyiouYRm5/hxXPAvH6zy89u4pse+n8AZo6QYWDdZ2JPm/bMC0N5ojxe03
	wCZcow==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bs79ehstq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 10:40:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bb9f029f31so1261073185a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 02:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819240; x=1769424040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0sZbZAxKd7p0LzWuDrHVogsgeIRXUiPb6BcSR/KxOek=;
        b=eT3SI5ceux3vovcPSQUjuWO4zv25/ugJ2Rxb55UiVCLSRAZSJVUrP818JhtvYmV/Oz
         wBUiPKn5JXRjRRo+24AiW/uUMdVsYCegvBcY+rOjztqYlEOaupqkat+SRR2hfz8ioyVF
         nhjLJFc3XN+uWwgj4BIWZoQKUB5i0iCUZqvBrNiimk98QHBhXd5NRdWYbv/baGwCt+lo
         GYradWl2CbYZrcuXOHm0ycj+sLXSJ7rYRasAloztLBaBc0BU9vRXV3txRzJ6kVq2wQ4N
         xQB8aZGzQXRo8XeKdjMqh7CUxuvhKz1hOhZQI2bA4w/V3myp6ClUWSNzxyafx/Vr5eqi
         3kMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819240; x=1769424040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0sZbZAxKd7p0LzWuDrHVogsgeIRXUiPb6BcSR/KxOek=;
        b=u5NbscoeFsgC6vxBbsVSkY0LjHrSiBfd1t5o8ADSaPAHcU/KVwx0k6EWvKftqtsByt
         sOZp5zpENOtICcWQZT5hTKKrX6D3XhxTsltjPtpn/2+TckQSN1niG2S6SVgt6UhGhvA/
         1F5zY/GRYYee7VTaZQDWj7OJZDg0GtBgLmSzk9HDnro+42gb4Nc/PKlsMf6VvnX5MHfv
         JtAEpz61YKQpJdNIZeVTBDw0hzRoQmn24fQ4jNh6LEWxyHLpZI8eUtZUDzSw+y4Zumsy
         YKPc2N6fUybh8e25TsiX1aSKwcPuTA4ZXmqLSNAa/HPFlxNr+MFywKcxyiPZ0tnQKUpt
         /W+g==
X-Forwarded-Encrypted: i=1; AJvYcCXsPxEq3lKb1Gb2eDP7Kbikqwp7VzOO17VXpZlbPe+iYBpXIZwQu8c2r+//sxOGA+wMdFBH2UoO18yYos3nx6667w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzjxCR3/+aMMcs4mbgYzdc1Db5SDIBnI6FJ1y/oM+IGEW8Q78u
	V6jb3VqD6WyjKXWwpjDhCLYAFwm2jVowiAdA2B2bY4SMCWQ3ZaB8m2+XKrx8jagXqH+jFZQeRTC
	BSTDnxh2Gw0YYupl8FGljlSsh/MmT7wniK+KCEgMyzKae7GTYhPNB3xPqF9mMt6G/8Srvj0vkvw
	==
X-Gm-Gg: AY/fxX7NbT6lPu3yKzj9AaSAttzQ22o/3uBRejFKtEiFCW4DFDwxygJRujM2AOxYGlB
	5gG3+84fqc9xFuQ3XWPUvY2fheY2ZXaLcPpDW0eZ4rABHsL1hZgUEySz3XvuLdxMqcj6+zoEd37
	PMCdSzhnbukMdEELngd9XNpc9AbGAdmRiuPil3cZpxYinMTKkFz9O8AgP5nnQVFvMFd3Oqw3C+b
	SVHsSBnoek5o1hCquBxSuFZEbOfWQzpUgFneU0QP2wOeq4M7OKvCFzkw0XNTvApBS+FKIffRtGw
	3lIxyUHmyMjA0vwty30LAimASMmYUfZhpcnshPScRRaa2sAIKVYte/Mxu5+9cV4IB1Ynu7s8NXV
	rOLOLhykQkbrfOBbvhMaVuWiGhxI2m2XR5XkaEA5n
X-Received: by 2002:a05:620a:44cc:b0:8c5:3415:acef with SMTP id af79cd13be357-8c6a678e79emr1325090885a.55.1768819240583;
        Mon, 19 Jan 2026 02:40:40 -0800 (PST)
X-Received: by 2002:a05:620a:44cc:b0:8c5:3415:acef with SMTP id af79cd13be357-8c6a678e79emr1325084185a.55.1768819239288;
        Mon, 19 Jan 2026 02:40:39 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:38 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:16 +0100
Subject: [PATCH 5/8] soc: imx8m: don't access of_root directly
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-soc-of-root-v1-5-32a0fa9a78b4@oss.qualcomm.com>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gSSXjbon2ZASCpjtfLFN1xl2k0rbvEgubK+ypiMfNAM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgoZ6/tFfNkSY0GLr/XdLYcw2kMLXLPjKjRzP
 XZ+QTLLN2SJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KGQAKCRAFnS7L/zaE
 w21vEACSpoI0dRf9LOVGg6WzmVElZik9pD0oSo8OINntnyjEajlS4xcMHsKFLGnOaJVjwTvCE0D
 WE7jKkM+kIJE9SAahNxJJW0sfe5PHeeJ8b8Y7t+h2+Ep6U8dWNQygw6zkqGZsZrTurg6e83TK/O
 Qdw/eB0T9g5Y9QHmAN0yY/SUG20XCb6qlZ07150Aj4ZisW/KeQEWVaxzkSoQ9OCferh0bcyLLLo
 SdUsxsAFRynk1/tuxNkSs6xc5Kr6zZCDauKYeqRdXAbZliKDlm3CQEar1q270fYfOnh/UZsz1kX
 K0atU01JTCgQgZpviyvgySSqyp2djHwmiFFlzBtVDoH0H89xw86RO7MfYTcJKdlIFxWpvo7AK8G
 lWrzbrNeZPZLR+Si5albdiXZtop4+OCuEEO/GcIP/8eihf2EUwTwk1/cS664OooHL2VXAbute6N
 nksZwcxs6FlW5e0l1Wy4KlSZMR9qB3QMnxpXrdvIiNOYSo00O9RHaZYDMAYb9I4f9tKZDGSEyBF
 QUeXR+BInkIvNqw5FagKBy4Mc+tktceDeHtC6aHPnjVgmLRzMDpqvaqBdPoUiWHyZWx+HJ+DF5A
 zb5Yx4jFe9IgxU7KA+l+14Ox5Q8OtuPJJCz3n9QBCpLQWHWqW6ZWfSpJbMN5Y6VgIhQC1mEgyzF
 /jfgYN6e4M/P2gA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfX6tzSqZpLRsRJ
 Bo7cDsr4nFaPZZl1GDzAshFmNe+p/dVz6jhKQ5Lke7sxnTNZys5qQWra+hKv5jXXh+1si2umcdp
 p0Mwx5nQ04HbBeWfVu/J0Wd784tnpuVjrnJ8RGbCnFDYQ1TG6spFyVPhBy0SFgAyAEOOb+gyAc/
 QBc4U0Synbr5VNbplz+dpzJyDw9j7k6QqypgAO6BioJOwsNBWTDYZA6aAfWds1N85cOEM+xfrAQ
 3gEdCtMd3/v0kyAlKScUqCgVgUODVdhjJK2k+aAOpGrESDmK3yDnAZmZEtuxnatWJXJSfxrllH3
 T5IVe0UXDcBx4bjZu9N31Tz3VcjrMaQ0xZ+sFe2rXrfccYXJbpQSM6Q50jQa3Jsf7h2Gnn3d13J
 QhJkGdoE/dGTVFVuCLolz2AJOoK+GbYh4J4AlungXhdAczIVhGDDGG3BmCQRKv1XrBfYuyUlkjf
 kxRdtmQKfbTFSST0gGQ==
X-Authority-Analysis: v=2.4 cv=NY3rFmD4 c=1 sm=1 tr=0 ts=696e0a29 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=q31YqNcWydnNWZc8Rm4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 7rHkj1ye0ow5pJw1DlqBSI95BQlpFIWM
X-Proofpoint-GUID: 7rHkj1ye0ow5pJw1DlqBSI95BQlpFIWM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190088

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/imx/soc-imx8m.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
index 04a1b60f2f2b52cc374714f9a1205496c1762f39..925a9aed756103a5a74d5d840b54a2179cd78061 100644
--- a/drivers/soc/imx/soc-imx8m.c
+++ b/drivers/soc/imx/soc-imx8m.c
@@ -222,7 +222,6 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 	const struct imx8_soc_data *data;
 	struct imx8_soc_drvdata *drvdata;
 	struct device *dev = &pdev->dev;
-	const struct of_device_id *id;
 	struct soc_device *soc_dev;
 	u32 soc_rev = 0;
 	u64 soc_uid[2] = {0, 0};
@@ -240,15 +239,11 @@ static int imx8m_soc_probe(struct platform_device *pdev)
 
 	soc_dev_attr->family = "Freescale i.MX";
 
-	ret = of_property_read_string(of_root, "model", &soc_dev_attr->machine);
+	ret = soc_device_get_machine(soc_dev_attr);
 	if (ret)
 		return ret;
 
-	id = of_match_node(imx8_soc_match, of_root);
-	if (!id)
-		return -ENODEV;
-
-	data = id->data;
+	data = device_get_match_data(dev);
 	if (data) {
 		soc_dev_attr->soc_id = data->name;
 		ret = imx8m_soc_prepare(pdev, data->ocotp_compatible);
@@ -322,7 +317,7 @@ static int __init imx8_soc_init(void)
 	int ret;
 
 	/* No match means this is non-i.MX8M hardware, do nothing. */
-	if (!of_match_node(imx8_soc_match, of_root))
+	if (!of_machine_device_match(imx8_soc_match))
 		return 0;
 
 	ret = platform_driver_register(&imx8m_soc_driver);

-- 
2.47.3


