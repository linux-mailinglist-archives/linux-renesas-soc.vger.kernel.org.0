Return-Path: <linux-renesas-soc+bounces-27026-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC936D3A566
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 11:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60ED43072766
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 10:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FBC30C60A;
	Mon, 19 Jan 2026 10:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FAQzRxvE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X4cBdNcJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9827E30B510
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819242; cv=none; b=PIu0efvIc74IiHDJJFzfLE3T9Vh/Zf0wcRr1KZFdhdmx0g9765suF7o1GpSODkplTqbAPnrarRvwwl8C69n5LgwmoGrpitTsI0VgAk2mjQk6tsrzwayuep5rWuQr2lPbvOkxVVrhlzc4JkpuTr77r/Myv6WncBjzl/D7Y/NyCkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819242; c=relaxed/simple;
	bh=WqigZ1i/Zqs+7y6icbBSDn53U4awykhgsyQ1e8C6gJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f1jUek5YLPfzj9F3bm3phpRDtfCgj/aiRfZGycWVKPF6cUFSb+vr6f6+MknxB9BnCr5cJfg1P4WDcab5lb28P5ahPr7+7nBde9WuJ8A51f1VgFsxUXmWRww+Y4V0ARBFkJXVx4fNf1fcZnICpMTpVANVED4n77YdvhgxwUCKuwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FAQzRxvE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X4cBdNcJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J90mtr228047
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 10:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DLE6Jb+dvX1EC2ApUxzM/nSNMTlzJNRVZzB5JSyB6YY=; b=FAQzRxvEmOkq4nwe
	6X908BdsC1UZgvdO3/qB+bGuI5yR1xBBxEiEQExUjqEMaEM8Jlxl3e1ibPb6qsKd
	mXEjmF/F5psoWQgO5tZXQi2phTwz+VlyzIMh0oMO35YGv4JXiAaoZGEKusEAnPiC
	f5MBTEfoWvsLIe4Sg1vzdQlW+s23AuxICYj2AUMxtSd5PxmJN9Z/ExawqgoiHq0K
	E+ux4kdd7FLsmVB9quWalT/U7JX2KVrmnDiCdcXakwkTr+96+BKqKNGL9uJsef4M
	5z7jP5VgC3pJQISC9gM57gVMbvJFY/r+Hndr7SwpMPcYJmrN5rX4OAqyFTdKaTMT
	zu6WgA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsgfr8m6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 10:40:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52fd4cca2so1054105885a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 02:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819235; x=1769424035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLE6Jb+dvX1EC2ApUxzM/nSNMTlzJNRVZzB5JSyB6YY=;
        b=X4cBdNcJc3H7YtCbcC5yBy9heBE5M6WRhuCBTPjw2Gjfpm4y4nRNRMeXQOe6PxlP9D
         mF7PkFxQapH3kF6E9wSPM3JSq/oYTwmNktht9qLonmaGef6RMlcx0HKlzBBbXtFNU/Rl
         vKkQOl4CQBwMySeegcYZBa6hIkNw+XwPnVBYqs/kUqLpI/64JnsHPqlJSa7XTqf02SQK
         Y/MF7TzbmrSFkekJjAfzds1smgLL+82VYtgfuL9vZTEEbZS2Pchv0gPLrbPqL5dTRzz1
         +qBI8yD1MfLyWc9LzWIv9cqQL9NeTM70X7Uz/aVNFLt1eOALOwhRVCcBX7gVobbaT1By
         Hfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819235; x=1769424035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DLE6Jb+dvX1EC2ApUxzM/nSNMTlzJNRVZzB5JSyB6YY=;
        b=GI/cbfIe9EKtWDMdSw5axpT59zuoPlFhBp771t4ekNEp4KYVlfsYFFkOxdHWo5vUGU
         Wg46fySnd7ji+CZ9WuP4JyScmCfGxcjB4yxoMeNAzAD2BaFvk/Xnrrrl84092kt+jzA6
         FMWxXdw+cDEfvgificM5IMzyA3FX2SGyBRT8CuFYgtfieY/ItUnS+yCiCrL1UGtTSIfN
         UcAOTDcwoZBlWtrvksSvsH5JfUBXVu3nmvxDr3WBsSFhNSng6QmsNidc0zO4mqYzsTDb
         LEcSKl1bTZRgRhX5L3Js5JDl1PphHuj0FUO1gwCPdB3VIiqspbnb016aLSUdiBReT5a/
         +0Ow==
X-Forwarded-Encrypted: i=1; AJvYcCVEAUzUta1tf9bz8UcGxDO/WUMRf+sA3pQxYwVtA+dW7HSqbAHkS8WF0XrYavS8UTyuSiZkHrbhbE0/XKo2++eWFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFS3XRwJEoQ8nJcExOehRjzCYvsMwOmjKKgJ2zJIXpiEOH6FE0
	BiERBYhrNUHGPfzpBDLyCD7S5u2mIizXUBOToUVH0cFr1QSJF502qYr0r1FePMbpuADO+I7UEZ5
	CPpXcdYPgmV3B+OeLDW6/toLLEQzbjjGKZVyiAt8QqpSmx22dRyfaolb1gQ2ZFNZRIsDv19unPw
	==
X-Gm-Gg: AY/fxX4NqtuK67bN6yk50WuR2BBSmlL15viSKHNPkobRuycgqNH63BHXe+R2Sqhtdx2
	9SNwSWnMWcsCFgXEYYQn1BklXK730LTj9ucTSAu1Gp+d/D50LsSEz9Qsko0AvIaUB3ROZT/69S5
	n7sinYuZija/fCDbxBZGAFByPIqEou0fVjZCsC0WHKwhSL62qwFsJwmqcyYVx0xAo42KUPWP3Mq
	W5TwzJ+l4va1Xi3cC4OrHLtYwEZTH9EFXNq/bi7jiXASgr3w7fQs48O0MeP89Nx0x4uHDS48K6p
	RUbz48xHfxO+35joxivJ8EUox9HYof39xx7ZN5Dp31gz9dtKlOIn/MV+ExzlyNQgvt3GF9rRVHP
	Dd6qXOOXBpBTTeISLpIECTbC+Q2tCAsPj9LFNBxqd
X-Received: by 2002:a05:620a:2893:b0:8c3:650d:5785 with SMTP id af79cd13be357-8c6a66e90a2mr1549987885a.16.1768819235420;
        Mon, 19 Jan 2026 02:40:35 -0800 (PST)
X-Received: by 2002:a05:620a:2893:b0:8c3:650d:5785 with SMTP id af79cd13be357-8c6a66e90a2mr1549984985a.16.1768819234996;
        Mon, 19 Jan 2026 02:40:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:13 +0100
Subject: [PATCH 2/8] base: soc: order includes alphabetically
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-soc-of-root-v1-2-32a0fa9a78b4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=994;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WqigZ1i/Zqs+7y6icbBSDn53U4awykhgsyQ1e8C6gJ8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgoW6Dw6clE1IffARf8COVJxpRB8cEAp2x9pG
 TvHKRUu6z6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KFgAKCRAFnS7L/zaE
 w6xoD/4rWvH3uol8I2IuxI/o8//O6VGtI2Wbz5D5ZYLXz0QFVJIXy2WIu6Ah7+ZEr0Efsod56Kc
 n2bdeCvg0FKZ4aLOs0Z0MwUwBiM9dd4taI3YhDwKv9mYioJwJKuwQe/XO/b7XuA9ao0/7tBOaCn
 IuV6Scj50Yg21Nzr6GRDYnNwJ+uyE+tuwUd/M40ldOm2s5EwYhEp7FsDBBP/E+omcFWjPS6Nov+
 kX2I2V2/yIUGQQWeG29kziuKfleRHlV1bU5cUE9pA1HNciTqA+mnvyxzxVWIkDQrharJUgQRtMY
 DlviBwLuIHWnF2ovA1my1PVrtpVBHBnamhoCKE1b+Juw7Y9sAYgMn9XHTfUliEBSAMWkrz1dlqo
 +zuMqU8zOf3a/BuE522FyiFZzLic3mZQgMWObGa6fVltN2UmTUFtssDi/u5JGQ1frFckvuQfRmX
 vfdP9mV6kZWAM8JRdKRr6Z5JyxG6XfRwQGGSMCsIBWJPIhZ3zRERqGaccJJmDFmb+u5F4+Y5T9M
 Y92DHCIjyI+KaAozrJzVRFGDtOwa4JGy649HKu5mRvgXI5D0G8lz3pTIYj/cmQPBPZa8uajAHFH
 ggYVJLo6V4JR3841jPEdpWhak9LAKC8Zmznb9a7qT7A0Ch1sKfQ5iKSJVloQbXmUPWuZyO8A1+y
 A1GAbxKMfKxOKAA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 7jWjpHXPGNPI4gtLGU42q-jmElZQJ74a
X-Proofpoint-GUID: 7jWjpHXPGNPI4gtLGU42q-jmElZQJ74a
X-Authority-Analysis: v=2.4 cv=c4OmgB9l c=1 sm=1 tr=0 ts=696e0a24 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ZFCmbahrWokcDKAChN0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4NiBTYWx0ZWRfX9s+StpUvdH05
 mX1DuYOrDY92Qyza7tmgIvVBgMCpuUnLXqO+9p9ezq/6JHQQV7MLlrfVou3uQkdGhhKsWBpwOlo
 jnLRuMlE5/R8BYSLLFx+8sSe5Lkdu+GOGtnottlvid2VQD439XyCQcC43IgTWUhAChFJmAAsjYT
 IbJY5eeX8n5UMDNMg8tlRdcU5SUnfQBoh17kXLDG77O0ne885SuIQLjV1koDzai3CuPU7FSF5UH
 I/C/49MLy3iiEFVTveOERV5ca2Ctx1mzNQ8TZjXrVRMY2TZa8QK6BAbB4yeWZv15cf7mQSLr4Pk
 9X08tLCc5tiM7I4eb8dkWwq3UOxrQdPlL7MroWS8HB2vPZUcpRe4584jmqSRiOwOp+BekI3FChB
 bzCl5bvCUpqcoF24XUj7GyIsrro97rxCAbKoi4ZRmcXq0gvGH2yFYRTXTgpDY8qs7Y2a7oLu1hU
 GQVqf8WQVt0Pkl4AqdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190086

For easier readability and maintenance, order the included headers
alphabetically.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/soc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 282c38aece0de88049dc1e6e9bea00df52bed1ea..6f42632d2b0fcc8a729484e6ad270f9bcabe4a0b 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -5,16 +5,16 @@
  * Author: Lee Jones <lee.jones@linaro.org> for ST-Ericsson.
  */
 
-#include <linux/sysfs.h>
+#include <linux/err.h>
+#include <linux/glob.h>
+#include <linux/idr.h>
 #include <linux/init.h>
 #include <linux/of.h>
-#include <linux/stat.h>
 #include <linux/slab.h>
-#include <linux/idr.h>
 #include <linux/spinlock.h>
+#include <linux/stat.h>
+#include <linux/sysfs.h>
 #include <linux/sys_soc.h>
-#include <linux/err.h>
-#include <linux/glob.h>
 
 static DEFINE_IDA(soc_ida);
 

-- 
2.47.3


