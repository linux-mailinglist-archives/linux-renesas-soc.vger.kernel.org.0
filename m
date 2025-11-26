Return-Path: <linux-renesas-soc+bounces-25219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F0077C8B6C9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 19:23:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D4FDC4E5103
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 18:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899D73128AE;
	Wed, 26 Nov 2025 18:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eK1YVoN3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BEjk2lV5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965593126D0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 18:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764181389; cv=none; b=aeqVA7nCY93evhL43pt4QF8ttXbon1vcQfmwvc1ASSDvZq1lXeKQWSGb4ma4VpJnvZbilctEdL4TApZz0st8DxgbgQ0/wkT2iIBIDuU/m5J9eq/jFIEIJdxKGqicRUNE0V3uBPhjEvSzCxWRXuNgVZZDPpohDyi8B910RGtRohI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764181389; c=relaxed/simple;
	bh=NFFsdkSV+yVrTmxojDPz5w6sZ+BskvrlquvOCjQNWZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ROuuQFH1lXLfVmsMWbIY+XPV1s036MvCJl8O1ILHgNe1YDaqyMaMldzygAEZDmHiurWYqJeAOkI2tQE8+/D93NpR5EqlNU2kS1urmqdINRHjXq0X/FfHY3BIRtsTUa015DzOlSDtE5ojPrkMQLgB9F1PA92r9LUWOLp0DDWTE88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eK1YVoN3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BEjk2lV5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQF9B4A3892580
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 18:23:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N+9vRJxvQ1t
	q3fa3LMBnkidsJgKSndmjrmtmrcBeFKk=; b=eK1YVoN37dVGXypQuoUFAnIJ8cn
	4ZN8jLi86Uf2O0eUEf64Ov0M+R78DEMFeVId2uhvSgKeBNZiE8LsVWuXVJIlX2+K
	d2a83n2oH19tsctUUwlWiV06dR/9Gp/oSMrYdpECEmRL0xQ2oDnIBvr82he8WfZO
	8Moo1U2fa/ANk0aQGZ6olHmgAsAnUafGRCQ/ViqiF/NOY1ZHIXcF2tlWFhFNiqeN
	Jq7R7xKmLVibbOkKwuUhSA4D8ogt7Egx6dn6290knSdOlPHWbExZ7Tu0orajxDSo
	NttKaNkSjKX5duXTplKyOCJ9jZ9XLHuZMxSGvi+avbs8YMfWQM8Iyba7pEQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4angmebsw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 18:23:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2f0be2cf0so10278485a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 10:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764181386; x=1764786186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+9vRJxvQ1tq3fa3LMBnkidsJgKSndmjrmtmrcBeFKk=;
        b=BEjk2lV5P+iREPE4PnWhHosl1vaIub3/9LJp7O0UOO8cdGZK0pv/qM9lmhiqsyauoa
         VS6orsxvnJqLm37oCLcHboT07i6zcgkSZip0i57ZxL09n2JZFjEOK8I4OA8YnsTPCm42
         SWH+4dSzAx6+X2txurP2JFeVJal8suEGSVX/FYkin9xP8xENv/hVA5liOJ/dEisM9jK3
         Nz3rw5fPWbt77AV/15F2g+zBVPX9J2BlhgQQcImgzXGcchylcVsjFkB/xa4HxETfjMdQ
         XWlWbQI7hAOUcHzOEQm19IhCEk3JKiijsPauY8CWNMntuMVqasRj1dNjTY6QshqEn9QZ
         HE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764181386; x=1764786186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N+9vRJxvQ1tq3fa3LMBnkidsJgKSndmjrmtmrcBeFKk=;
        b=NHP6S4zkgj7G8pMfsFW5r7pN57F3KUmbtML0hY+vwtHdiJ7wIMRP2jKw47a+nUqllH
         rCv43DJGAYQQbtCd1GIm01wAMz0dFUSNL1thEhMgmq1coWPV2n/VcqSx8kFgwEc/EDvd
         G/CL7OhTUNxX2WOsf+wV74o2tP98r5ccWB0ZTGT2BeF7MoDTk2vLkNnMgu9e53lyHfmT
         u3b6uhwdM2cUoqho+FUkVdNTvvOJ78AfiT5+dK+HpFv80SIwqMO9kRpkC1dnOQT0OC2q
         D+ZEmqBegXXQ8zrIWrvH7DlsqtBw71tAJ5AWUzfcy0EY+awooxzdlkK5BhwyEf7okT8c
         jokQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjB294vbmN2yIlgh6S8u2aDlXEff3S5DBTNPSuoi9ySyMDYVB3R0qkvVUARPUpt1IvUvp/iyHz5iWuI9CzaJDLGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxggbKtforDGe6gpE1lQlln3TTndAKLBp1v3Hnz8/U3Y0gNoF7Y
	2EHt65rm7LGnJ9QPOaQWEV5lNSuvOCLYywR779JKP80SRB1oHfGurRU5i9ebusAUfSOQgcIcsFg
	iWmHUrNVFKiEp06FUIO5F20H9DC0fYfCAEr4EYWqHPk7or9pyfIc7p3J+XA3iLPu7WwtXQoNTgA
	==
X-Gm-Gg: ASbGnctQyZW6OoqwrCsg6FldCJwcdF6hTgQFv8GtLNZbSaeTTq60NGR3aJJn2IgwyOQ
	B2KV+oH6Iy8YiQkAuYGCrc4oFHqRHJpo6O4MA9ud+cVOF+Ja4Cs5pT9qn7LR+XGAUorI30IOQzR
	9tb+Luf0+9gNd2Crd59c3Ml3rWCDZEODWIWcXnw3Aq/MwSgiY084/gdZUFHx8rIpA/6o775C5RG
	u3ZgwFaaItr62d7+QaNUL6oc5eIwh0quRdwuKiU5CBb5hO4JMSvttgCy6LbCMMWxime0snQr23i
	A53InNt+pAaUCTcFKQuB1LjAUgztiYvRO8VKO6hiSkzr/YLVCUvY95OZBw0PsNfbHIH9nwEUAWV
	HCjAZ4Z85vw3dSJm6c7txTNsEbhFT
X-Received: by 2002:a05:620a:4102:b0:8a3:1b83:1036 with SMTP id af79cd13be357-8b33d1fd666mr2654389285a.29.1764181385941;
        Wed, 26 Nov 2025 10:23:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAA+ANOolUOJpeYZQNlTAvuu6BHx4jvUZDLcOS+/JSPaaolDrtSLNNu1EpO7HNNR3BrnQAOw==
X-Received: by 2002:a05:620a:4102:b0:8a3:1b83:1036 with SMTP id af79cd13be357-8b33d1fd666mr2654384885a.29.1764181385500;
        Wed, 26 Nov 2025 10:23:05 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add2648sm61078295e9.4.2025.11.26.10.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:23:04 -0800 (PST)
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
Subject: [PATCH 2/3] i2c: pxa: Fix Wvoid-pointer-to-enum-cast warning
Date: Wed, 26 Nov 2025 19:22:59 +0100
Message-ID: <20251126182257.157439-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251126182257.157439-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PJgCOPqC c=1 sm=1 tr=0 ts=6927458a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QbJ2VWT2XajEZlGPt78A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE1MCBTYWx0ZWRfX1g41moRgF4SG
 qJ/j30gx0/bMpGmN0kp4fK2t57WTn/QehAA/UMAmMQtOUG1Cj/ogVEWrMtSuXvvw45BwpP2l2zy
 3kdHfiKQV9T7Tbi4ZToaf+DzavJnzrzp3o/mFOzeUoJj1eZRpsBb05/O6fmrFDRj40iEXHuMQYM
 RKXX3H1WG8G0RiRZME6bh+AFZYCB4u2vGkg0TJXjwUkmoLJoXoi3TX/P4CxY7SOF8MtsnjLZ6+j
 hf+bugxhqOD54446VNcaVCNXitT+SRltN3KHpDdS9fGRae4Nn5gXYl4cqEbsh9sHuSoeOw/BTEa
 3jjDFK4UY02lAONBZfAzSFE0VMR728GbFhsQFryBScJkz7yEwifeoXqelWZqeDO0wZQw1gfFtGn
 8SY6V3DdXWdi/Na7rtSibWAv7TaLKw==
X-Proofpoint-GUID: 3U2SZy7BN4VhF-lsPdub0uTapqFl5gGz
X-Proofpoint-ORIG-GUID: 3U2SZy7BN4VhF-lsPdub0uTapqFl5gGz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1011 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260150

'i2c_types' is an enum, thus cast of pointer on 64-bit compile test with
clang and W=1 causes:

  i2c-pxa.c:1269:15: error: cast to smaller integer type 'enum pxa_i2c_types' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

One of the discussions in 2023 on LKML suggested warning is not suitable
for kernel.  Nothing changed in this regard since that time, so assume
the warning will stay and we want to have warnings-free builds.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-pxa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 968a8b8794da..09af3b3625f1 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1266,7 +1266,7 @@ static int i2c_pxa_probe_dt(struct platform_device *pdev, struct pxa_i2c *i2c,
 	i2c->use_pio = of_property_read_bool(np, "mrvl,i2c-polling");
 	i2c->fast_mode = of_property_read_bool(np, "mrvl,i2c-fast-mode");
 
-	*i2c_types = (enum pxa_i2c_types)device_get_match_data(&pdev->dev);
+	*i2c_types = (kernel_ulong_t)device_get_match_data(&pdev->dev);
 
 	return 0;
 }
-- 
2.48.1


