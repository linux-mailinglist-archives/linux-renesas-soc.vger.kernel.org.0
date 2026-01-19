Return-Path: <linux-renesas-soc+bounces-27027-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DCAD3A56B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 11:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEAD3307E2F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 10:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283E830F808;
	Mon, 19 Jan 2026 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBPHvG+V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PL2t1GMr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A4030DEC4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 10:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819243; cv=none; b=ssCxbxltpEzE+ledKMQz+XOzAd9RjoudbFNP6sRbOZVkkWcSdBsqgZg6gtyBUg07SKl7NGZsjHRpNJ8OV/26UlNESZs/FhDNRV9qZisDheO5EL4OPBMiy5+hb1JP2EcQy1twFXfuo1my14N5OcKqGKmATRN2uYB4S07C6RjFWFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819243; c=relaxed/simple;
	bh=w0g7AInxJuR27u9srWJadHcDu30R8TLTmUaOMASFczk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FRVU22bsXok/+6WO2QjMfumD15XDiQbmtGPEiQ+1dPn6DxSJ4cfyNfnYt3/wdunMWxTbgOlopUAnXNNR/K10gpB2Ym9GSu+cLKyYgLUUhYDJQ92ZljmldgH0LDEg7w8RZ8S5lwkq2AGZ/9Qf4gvE3B3HgOHg8hB+foU5PyA11WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pBPHvG+V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PL2t1GMr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91IGT1562060
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 10:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GaQTe44hMaWFCObwIQnLwBlsgWnPwdcAGUke3wQLRtA=; b=pBPHvG+V+aldTdvm
	pilu6HfKXIj+geOWxbAR8Jg4hT2TC3v3SmvZh+4BnvnA+YlYsbTcXeoJMUC/xZtu
	FAlw8vIQHM6WbJQNSzV9TNb8LWZ1RMQ1bHkH3jeX/3GdI8Ssf3zwnzPnpP7LHef4
	k6Ov1j3Z5dqpiHT++AQKVR/o+L9m8fl4fjDIsaExLmsCAFVZh4/XgVejbSw4FCpG
	1p7xg1wWcDN3gOG4GrfRnttPczxBO/YEv/5kRF8dIyZr1UxuY5weLcDA8ZLsOVUl
	4BaiQhLjFwKMBThwM19nnTDOKwNd3zMpE23Sp701ZScL46/4kysNPjVQ3ODM8esL
	ev1iDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br36dcr0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 10:40:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a2ef071dso1250395485a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 02:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819238; x=1769424038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaQTe44hMaWFCObwIQnLwBlsgWnPwdcAGUke3wQLRtA=;
        b=PL2t1GMrDLSGoc600GLpMehKqpjhhxj3Fks3iYmZHUQ33jwkYT0SaerVnyK7aQiCdN
         hV4rDVio8VW6m8Ci9MZvk1dyUwLGsSeXdevANPL8VxMRTiqFc98MdkwcqIWZ9AbNsynT
         DV7o6F/uMgV+gocrpEPH2A8DslKaadTQBEohnEMlNbTQBanHcdWh/Xl8TA8JjBRgJvtL
         13YCo7bgg6Quy5Pg405TJ4gnfA3p3XhA7yItrSe/iYhCU17Y4b7kugE8kcrQESYmeUfd
         MLG7GcJW2dt6GYTak4hzF1NY5E+4HrcMLgT7qZ/CXfF8ya2rYpm+FzbSmvGD88SoMc+x
         vRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819238; x=1769424038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GaQTe44hMaWFCObwIQnLwBlsgWnPwdcAGUke3wQLRtA=;
        b=l0Oj0Tw9Zcu02U0xcAu7G/lDkdNdTh9CNyeioH0fWU2CroyGg/RnWbLNoC2a6uk6Gk
         qnZxAGubLL7H67F1IOyp2tMXzka21dbQmEZ9XSjLMjrgxmb75BL+ec6LnZbvFcC6j5x5
         dzD1f6tZxcqlwyrP+adzjnM+zfpR6KhdJmCOaQzmsDilP8K4T7u+Mik41fZrTfZl7bSz
         BLrH08lBgl1cAFTpvX7R6H/9nkj2Ssay7B+FGCyNE5WVTrzWPZTuFkok0qEaOXudXUfS
         vGZ+4Nkagm03TMxpqXa4utpFwm5Wc97lV9RbBSQFBQ70ocqbNdxr1NFNMA4ZhJR+nPpC
         /pdg==
X-Forwarded-Encrypted: i=1; AJvYcCVz9RYlsO/ACy1wgacZuOWGkF1I1dD01Enz2kmXdOoLptkB+WfAlOh4YZGib0N7qkdiI7D4XPtTOdHVkSApKTbXcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9ejiemMKv5lscv5Tb8s3vvCkOlaU7iuJrJVxOzQd/V9JPMXt0
	mcnlRGzvHO+7z/5a0S7sFc8te7HT+cg7cFIHzDQEL3x9+yvkuAIUe80Xm9kJFBJaosuqUQEfD5X
	tH1KyoW5abr62+DOCIhPOTKLX83uZZ+AxJf/09QpRIk3NWoMo+SiTxgOjg8dHKujeyf5J05yEDw
	==
X-Gm-Gg: AY/fxX7aAFF8xSqjqU/1hAwK6YS4Ecm9GfOy3WushirdBwghBFXu3Wilr9CBKFKeZmL
	CjAhq0KDciFbJS3JTvusqyoOR2iYreUBQzwtOFkBcWeutfWFOA1+unz3WVo85/jiij3fUHgnLwk
	+BWVVniSxB3pPKr2WpO1aBEjwOsSygywGY4kYd9166tmkmocBgria0HR5XTKxB+Ek+21JBNCgEf
	PP8U1dF3FIJOCltA8IAxAVTPAfYg3Cheduj7FzFturxHg/OLNaNZ6FrqNXFD8tGI96IeHi8cPOv
	HgWYRXhvG6nDefcprQlOBqvXS0sdg/I+/lSxs7jwwQek0M/vV/DDAEI2GxPPJtfxerkCsMNx4D2
	zen/GxB0CvyL067+BMduaaZhIABTFlMJiSHo4nXgx
X-Received: by 2002:a05:620a:d89:b0:8c6:a034:9231 with SMTP id af79cd13be357-8c6a6909cc2mr1477512385a.32.1768819238242;
        Mon, 19 Jan 2026 02:40:38 -0800 (PST)
X-Received: by 2002:a05:620a:d89:b0:8c6:a034:9231 with SMTP id af79cd13be357-8c6a6909cc2mr1477509285a.32.1768819237805;
        Mon, 19 Jan 2026 02:40:37 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:37 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:15 +0100
Subject: [PATCH 4/8] soc: fsl: guts: don't access of_root directly
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-soc-of-root-v1-4-32a0fa9a78b4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=w0g7AInxJuR27u9srWJadHcDu30R8TLTmUaOMASFczk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgoYwGcebs7TnQeHLScelsB33SEhUygDvo2R1
 Rz0CVrKa/OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KGAAKCRAFnS7L/zaE
 w5J5D/9l3gjjfHn8oabJffDpUYkOaslm5iWFwsy3WllRD3GzaFol/CREVg/2njHPc8W6eROxsJT
 wxXIe8OowaGf9BENgeEaEfA8NUIlmtIFwmbtAqn1sxEgK9RG62GMxZGUDYZqiwiAQ1IhUCRBxIj
 YT88QAz10YAkhKSrY8oYfeZ9IU2FUWXWbZMGy6GURV2i4h8GRc5YDqiM+6STIp1RD4S4pRQGuMk
 LHP/fRSDznxefUp41kh61X5wU43AQ8FM1leLsCKG8y7WmQg8bhtr2DW+p4PtZjazDWXVf5GsAwb
 1n+fE/v5NLvuGKRZuLkw3nDyesXIDKy6Kiy3iUaqz5dcnOYnfFFRNFvgbLzpIPI9aDgokuOOg4w
 AXXSky8r+SmkmL6is7QCrmrDXnUhHaMdn7/V4oudwwiVN0xvAENYX5tWKikeT/HNJ7f6Y5EsHEe
 9KOKMdbzylzqjsas2M11HREQNgxrJXfnNDgqrKm0fUVmTgmYmlpC84SnHLwAFBzIZ9ZbA63CZTP
 GeMs85X3Gqv6T6o/VMovWvCYazRePcP9Hh6O+NEalOLNppUV68kCUS1lW6U6iC9uGII++8njXvo
 smph8uKv5reLDLaVa97fvnplAnD45eUsvXk1KmzUFINRupBTUl4tKJJRsz4mgQOE6nPFufkfwA2
 yUh05MLZIZsj/bA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfX7+/St/tz1f/6
 zw/+TWpniFYkJx0xDJYhc3ViRS4pj8Ol2A3WkMvGJ0PdfD3vgjny+xd7caWTWQHZLyzVaQ9Ibgg
 WgRHExHNHN8dgLiS1k1Nb5D4UkVFcu66RPDCKYc15rTL8yNbn8JBRrjwy9IXL7rhg/qtCS2lWls
 rIuCjcSUpjzdrRWyqXHUbWXAuZ3o/EW3emkK31aYVO7852Kgs575K0bsOMeJD9LUsV5vAN2xUtK
 p98t7pGBhsurGiO+jDOfjmo8aQkmOVhdj6RoDh4eWHm8zznJf1u427GPknd9lrzF8yDEZEbKzOA
 yvDkUZpG9KbIno7XadEbDQ+ktmXSlZkMmP4ACHZfbMkrUFW08XcoR5nLtImidjoXYcJfAqOTqgl
 yYWHlRbiLgVUtzTUXTC2iotbmS4t1BEXdmONw7HrGFVuIke7/+ZmDeF0L/g5AKYE7iIBqEJcRxw
 1uC91sWDqhahZoY+Pkw==
X-Proofpoint-GUID: BWjpR5xFjnjWtT6RbG4tINaG4gPOLMQi
X-Authority-Analysis: v=2.4 cv=GJ0F0+NK c=1 sm=1 tr=0 ts=696e0a27 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oxzWnGEk1v-FRkq7efsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: BWjpR5xFjnjWtT6RbG4tINaG4gPOLMQi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190088

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/fsl/guts.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 6bf3e6a980ffc67c21ed7b62b5b638e37f27454e..88ba32a40f6a27f8ffd13624e940aa0edf48586f 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -186,7 +186,6 @@ static int __init fsl_guts_init(void)
 	const struct fsl_soc_data *soc_data;
 	const struct of_device_id *match;
 	struct ccsr_guts __iomem *regs;
-	const char *machine = NULL;
 	struct device_node *np;
 	bool little_endian;
 	u64 soc_uid = 0;
@@ -217,13 +216,9 @@ static int __init fsl_guts_init(void)
 	if (!soc_dev_attr)
 		return -ENOMEM;
 
-	if (of_property_read_string(of_root, "model", &machine))
-		of_property_read_string_index(of_root, "compatible", 0, &machine);
-	if (machine) {
-		soc_dev_attr->machine = kstrdup(machine, GFP_KERNEL);
-		if (!soc_dev_attr->machine)
-			goto err_nomem;
-	}
+	ret = soc_device_get_machine(soc_dev_attr);
+	if (ret)
+		of_machine_get_compatible(&soc_dev_attr->machine);
 
 	soc_die = fsl_soc_die_match(svr, fsl_soc_die);
 	if (soc_die) {
@@ -267,7 +262,6 @@ static int __init fsl_guts_init(void)
 err_nomem:
 	ret = -ENOMEM;
 err:
-	kfree(soc_dev_attr->machine);
 	kfree(soc_dev_attr->family);
 	kfree(soc_dev_attr->soc_id);
 	kfree(soc_dev_attr->revision);

-- 
2.47.3


