Return-Path: <linux-renesas-soc+bounces-25220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F9DC8B6D5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 19:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B9E8C4E5A3E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 18:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A9C313286;
	Wed, 26 Nov 2025 18:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EwtoBXyI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FxtorLYm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D522312836
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 18:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764181390; cv=none; b=BkcfgMFNHIULd+6OwwJFQ6V1R2KxqgRO2WF1tVBqzO18sAKk/yBn2sQa+rNAgmAj3UknbP6ocYXCRBs+zkajp0aEqQlvLyXDeZupVGAmSPiHXkm9bv/ZLuqmcXrM00WBjP1I9F8xPwMtXFNYGKdzi37kMUK3Q3m8D0WJGNvRTC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764181390; c=relaxed/simple;
	bh=/22vU4YyhoreGSVE+8dNtnPv0bjJh/n7NQdBBkBHaLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PpXwwzUt5eLTInJ4AB54TGGgnFu8hLyF5BvTBxVVKDnKR5X9q8FljpVnaj2kODyXPKRga3mHU490bLB5T6CToHzYrLD8FNa861ulsLhf8uOjzTdB3jfTNMxtYuQegseKRkzICJRELv50Pr5d6mNTO4e9c6M5UIhueqguXe6wqk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EwtoBXyI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FxtorLYm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AQF7Y9H1457809
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 18:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=l0+YTwJt14x
	VeFRAF5aT3U1V79EVhXkU2OzoP/TDkpI=; b=EwtoBXyIL3bBO5AhGzHoP87LeF1
	AgTsfLEU4ja/LlNrZ0vEkz0wC1aRYjqnHliVP1hp2RdkRzs+oEabu5ryiSAMsKGc
	CnoEYC+squlLbOck6iOSv59abeIo//8FsXXeryl+10as/CMJnv68G0bJHyksXR2X
	lSpTuMyXL7I/wJTpJSeRhoDcVwjsLD6Dp+Ag2GiLUPVjV2bwIe4f6UHv5PqYFr0H
	eBdPj6jKQU18b4Y1ojzWbiTt/a7m5YeqWsO/Iw4/N86wB2OE7H23rNvyQYMgFcR6
	6DKpxSnw4x+2hHKjeow7/4eH4NqvuNcvJMX1PeDyBktmvl4PL4iNqj+8vZg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4anvqvhxka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 18:23:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b19a112b75so5387885a.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 10:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764181388; x=1764786188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0+YTwJt14xVeFRAF5aT3U1V79EVhXkU2OzoP/TDkpI=;
        b=FxtorLYmJeHJUZtk6sBAUw4C2kph4VE1s1FgJrlH9ogZWJHqVMlEllbHnyuFEETwqn
         7ZfS4U0Utsv2LUA01c0E5wCl0fUvDTBCFuFAkGClzfPGsGZB5yb7+z/R/ewgR3L4tMRR
         6u/Q4mXt8/k5MfHkG73yXxiZ3VwHsatGxfUSHWJalYJRlOasJzCsR249yuTPUWIVUhp8
         qFg9MNBXFMSVRI5g+ev/rJDpBJ30q4IMKufv1kgacqbKiI+wSbURMLVCP5IwgQwo/25V
         AztSLOVtyl228uls3Q1vOqDx616BJ1lAAah3gTUgd5YPpcH+nm7w6GhlDxOwevrUkXjv
         O99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764181388; x=1764786188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l0+YTwJt14xVeFRAF5aT3U1V79EVhXkU2OzoP/TDkpI=;
        b=AEBskj5QF4aSynIfoS4CjWEK0IaW6VFmgshhFu1KUdUcY2oAI3FwrPRJpHylIHmVIB
         gEvioVdfKuFi57R46daZmImxnCxdEUllBn2ceyn3UCmCppTLHx7tYhyYpNoyq2di1jrD
         i5u+f21+7DOKuN+e/pZPr2pNk9PBiiCviDYZRBDi7dGNwOHRMLvYE/UYi+UWhjPJRGOR
         GJuSDj7bY2g71v7SmTkmH3wY6BzsrSUb39wVIPYRiyY1SQbwmE3RfBWEMimdK7p10PM4
         ygv3Mc34ZdHPj8H/sbjwIepj8711jCzFXF/k4evhZ/FNPY2wNv6lweepJmwNdKjXtt9p
         Hdqw==
X-Forwarded-Encrypted: i=1; AJvYcCWFaqGn8AfsOQTQmWrJD29mhW/QgGMzxwdRnDBdgteSWQEUqSMs4ucaLCDPHY2zZCdz5EdpeYUIbUa2st5biJCWJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6vZoTj2a+oUmlsvlDBJR96FfqwI8xdfm/WXEgg+iZr415XsZf
	qcEhkUKsExBGdaLnJqV49LO7tL5cugV4H16wy+tvIF0f39Nr8WpYRyr59nLcZyzDCnbBGAzU+cF
	mbjjWAUOb578Ymik4kM/M/4YNOfQoAXa2hvJNv+hCHKPZebmfkDiJuja5AuVNDLua+fYrlNGuzg
	==
X-Gm-Gg: ASbGnct8RKHibOHrXyu3N9E0fg+V4d+L/9tD76nJ4CPhHuXBLTsuB3o1gBM5o6ox6tQ
	Uwieu8Fg96DJdkW/TLbiKUocDtedIm2CEFYsbTxGf4uTQA4kWyg8YfUYRNS7agSENFab8Up5woe
	41DPjkXHLuXbk4ujv4pBwe3gCUYUhOfgk+wgs6VbXdoMjP+0US0VqEAJ53X7FnhIuSPxdcxW8qs
	LfS+2UEMHyl3URyrp/fP4joYFozbTy7mxEaAtEYfY8z9Noriy7vKiKHXfBMtVGNIq97gDFcEydr
	AuBiKISRmoJRhKpGYS2dyG4YVjj3EEWKH9D6e2lQLL+Tnm2QhFW5hbSoyoHvC9h2Y8qFYCBGyy+
	zX3YgG3vUJjsI7ee6qrmEON3FJztC
X-Received: by 2002:a05:620a:3184:b0:8b2:f892:9136 with SMTP id af79cd13be357-8b33d469055mr2792629385a.42.1764181387701;
        Wed, 26 Nov 2025 10:23:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF2mLxW/D2Z12EY0+agf2CZ+NW9zLRlloli4DWeMWWCw7bKngIVu3ZKUo7gwIs2SgNmvD00Wg==
X-Received: by 2002:a05:620a:3184:b0:8b2:f892:9136 with SMTP id af79cd13be357-8b33d469055mr2792623585a.42.1764181387148;
        Wed, 26 Nov 2025 10:23:07 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790add2648sm61078295e9.4.2025.11.26.10.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 10:23:06 -0800 (PST)
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
Subject: [PATCH 3/3] i2c: rcar: Fix Wvoid-pointer-to-enum-cast warning
Date: Wed, 26 Nov 2025 19:23:00 +0100
Message-ID: <20251126182257.157439-6-krzysztof.kozlowski@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDE1MCBTYWx0ZWRfX5SblEtz7q1Kr
 3LmCfMdFrxi8iKk0tSTy2VxuRfe9MAWRn5mdNWzZKJ+taZp2dY6cx5q5TEzCrTtc7BFiVetXSgp
 aHKNIQU/i1brU9VHDss79pEjs2bbV9ZDg1g5gmBCi7bIOk7sHWYvrTmEmYNg3DM/FfAVDLjcXOh
 2yqmfuhrkledAxqwOJ7/NJO0s8holbfEu/9IiaUIktDnzotkb9cT9nlx/TZuWoElHIR+8qEuYuo
 kDidhHMcIPHGyXVUD84DCHbscIyqKQbayOWFckom4N36U7x3GIVwZDp10I6HB2OfRuhv5O++r5O
 /Ca4n8M2fLcAdFSgrjGQzF7oy9nzt5o8g8KSvPRKAAg63Ns4MtxN0ySIPa9WhYqBu/yrvGV1LA0
 XwNt4SEHVFjuTbUNRZUpZmPLx9ccbw==
X-Proofpoint-GUID: DMvVaAQnt2hJt9uAkvl-t0IpW1Lt66TK
X-Proofpoint-ORIG-GUID: DMvVaAQnt2hJt9uAkvl-t0IpW1Lt66TK
X-Authority-Analysis: v=2.4 cv=feugCkQF c=1 sm=1 tr=0 ts=6927458c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Iax6wTeSMpqzYiZSKl48GQ==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=QbJ2VWT2XajEZlGPt78A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511260150

'i2c_types' is an enum, thus cast of pointer on 64-bit compile test with
clang and W=1 causes:

  i2c-rcar.c:1144:18: error: cast to smaller integer type 'enum rcar_i2c_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

One of the discussions in 2023 on LKML suggested warning is not suitable
for kernel.  Nothing changed in this regard since that time, so assume
the warning will stay and we want to have warnings-free builds.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-rcar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index d51884ab99f4..5ce8f8e4856f 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1141,7 +1141,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->io))
 		return PTR_ERR(priv->io);
 
-	priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
+	priv->devtype = (kernel_ulong_t)of_device_get_match_data(dev);
 	init_waitqueue_head(&priv->wait);
 
 	adap = &priv->adap;
-- 
2.48.1


