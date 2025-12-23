Return-Path: <linux-renesas-soc+bounces-26033-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83441CD8C5B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 11:21:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23654303B183
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 10:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA99134E250;
	Tue, 23 Dec 2025 10:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RW8AkFYE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h9QHzCn5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971B534D4F9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484308; cv=none; b=Ma6dwSOsnhr0REfWg2sQBpYtkpxYMwxW2el0hXRZR2Ud7CFM4JcCRUHh8mLBGkxrf2aZgLyWNl7CyDxIS5XeKEkygrBp3go3SwBszwFZ3lvvSxMIwFK2dvxQY0ggPzb+8UD0xNpGgJ/vlIUExEJ4fjUIVejfZjawe+GsWgEVIcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484308; c=relaxed/simple;
	bh=bo4ZGFeMtG75ouEjaDX91gsDwyQD1Njwy7cFmjSQfKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qs2QNT07o9COjTsJfcfM//Ruqi/c75LGzZly0Q6kf31u4f0ugtDwenIhgJxDMqZsPBlfDQVa/A6fsZ+efN2Nf6+rLG4sSRvGF+48uU68RSNBp1ei7MzQv7XhbK51QQv3xQaoMLbYNFGCxjAJczZZRHh12V3dRzq/eWaPEyk12f4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RW8AkFYE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h9QHzCn5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN5N7lt1901938
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:05:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fvkc9n0P50/n/5hQkbKBw3GiCDGmeSmMMtzN5wuOhlQ=; b=RW8AkFYEduRKBW/W
	O/rrnXcsPJG48/Yk9RsQyHLAQsSQUJg4rMSIiR9BHf9N5/CvrbDheomOJXd7jp68
	9gc54c2UfYVouzEgysCs6fWpAN1rsjbVapbx3qF0FXHJlZFN+hfvwz+rbLh+/r/y
	FBtrBAw8V8DM9V92jjsj/P/BIi9tCB8/Yh5qR8wI7X6KJumhfsnNntU4TVyik0dN
	spzrEZemSU4Bs+CWduXtmTrPoR2f9fGJfCk4D7oa69yfjP9aUhNp8jHMjdqSJnp+
	/Q5oGDp2EEf3amNcU/MxI8kdNrVEmgPoYlRXLt49krvetD2mHlU0jUB+To7IgRsQ
	Towseg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8jkkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:05:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88888397482so147928556d6.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 02:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484304; x=1767089104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvkc9n0P50/n/5hQkbKBw3GiCDGmeSmMMtzN5wuOhlQ=;
        b=h9QHzCn57iy2LaaPRYAZG5lWkJ8AtCMDmi3aiaPcOkhRc75+P5V6vScRBrEDqlIp6H
         s9JLoZwvcXm96irqBj/dvpQuNG60/0HFDx5I0Fec1ukXQUPvwg86T2AlNLi9WXr8dBHt
         rdVklhrDWJyp6Nhtutv7PpdIM2CENRoY36HQN2nesnwaVUvew/rGo0tI+dm3S4xPYZ0G
         ynaXDQpf2ujiFz/ZZj6Xk6t4cdDVTKvC5DDhrJ/oPMjMzzJc0e0IsDk3qAOKLwHhI8Jr
         qeNeVhiHVivibye9S7/TVjUVgY9iAShqF8Z3R5DH4hy7aXlRQaDM00gvaMNGREgQp2ks
         lzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484304; x=1767089104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fvkc9n0P50/n/5hQkbKBw3GiCDGmeSmMMtzN5wuOhlQ=;
        b=WRg35IV+OA8hywTUUbttTnbEGaFTHyDAZgLSl7iEFNXRtbfx1KsXTWWvRI1y1qA1xa
         3oeG4qaD3dt4KKFxBRfys/NETEoSlCQshgt5ljImJIAJIX5M+ad+2UFELKL5Vxtc38r2
         ZqpBFrdSu1xAeHA5AD3mwbZkZxScpAdXvTltGhvOhzTpzxgWq38i0HqGTA2MBvA37QDB
         a9o/mLNufO1XE/KOGUM8Ab/jONgZNHLueXznM0skRRCosw0fiAZAGNL2JMhlxFssQ2Mh
         1o7Js4GAKzvl+zAM1hLZhTYD4PpaW7PbbP8A7VVaOKA92enixWvdOg21KiI7/TdUGVim
         rV+g==
X-Forwarded-Encrypted: i=1; AJvYcCVjHseZbNQkDpVxViDo6Sa85XPiBjqR6l6NPBsZlsjau3NdCAuABbx5pm5VADfti2nGNpCw5sWeuYzJ4SbyGWdfFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzF4wvJ1JTjp9lpB7E9kbWrI85rKYrH+/kJE+XnMHnabTVWQNt
	H+cssw3RuwCfbhJiMGkABL6plbJvSa1tY769+rj+SZdDXJh92z2SRxalb8+L70yExZe6PKwuIHF
	eUMkOHpyA+w/Y6NA1FieR05aSYUM2tAEgEF6FHbZ+tRL843jK+/MRlPntuSkEvJkXY20sx2NJvA
	==
X-Gm-Gg: AY/fxX45Ndpg41pZcKpz0FlGGnKdj2+FnnxsZAI6nhUv9mMr8hUQIxKK/a9nCfVwqDI
	zvqr+D+Hu3NI8buT5dBgSRyYE4bfgy66EZ8pKHiW5Km54+3yjYtLnxCuleXWnPTPP5uz4lqohWK
	FZXN/Rq8Lco2UHTzCJ7O3YpQJWX3cZichPXvzVOCtYlU3O0OGzc0PNjUBkHd4pDau+6YaJzFxg4
	bmhA2RR/4OSpBCDHIZMWir0kyjQYFY8lnBvwGpLl7LySr8sVpXPsOB8ZlxRvxxW1mqyTw0A3zyc
	91to3m2Jx/n58o4oPx4Sd6lg+MIw/xcWZALnphbUZ0ESmsSvVIFtJLRXJx6HaY9CwP94oYg7YLC
	N80YigSxoP6qpageMn9uRkXvx9mYbVw/x4PljuQY=
X-Received: by 2002:a05:622a:1aaa:b0:4dd:ca89:8d7d with SMTP id d75a77b69052e-4f4abda9b1cmr208230621cf.56.1766484304535;
        Tue, 23 Dec 2025 02:05:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIjj9e+R9isgdw4TyIq3Hu1LbklgM+U32cHNPR6qnouGXpVQcoFz0NR6/hmM+Q9uZlUedF3w==
X-Received: by 2002:a05:622a:1aaa:b0:4dd:ca89:8d7d with SMTP id d75a77b69052e-4f4abda9b1cmr208230141cf.56.1766484304075;
        Tue, 23 Dec 2025 02:05:04 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:03 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:42 +0100
Subject: [PATCH 04/12] i2c: keba: set device parent and of_node through the
 adapter struct
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-4-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=820;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bo4ZGFeMtG75ouEjaDX91gsDwyQD1Njwy7cFmjSQfKY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmk+kwvyegNI/zPQvrSmXauolivDt5IGKfzgw
 GoGwiPiQAuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppPgAKCRAFnS7L/zaE
 w7mcD/9bHC2rhBydNMtDo4LhxwjiUk1fcyXFZjeF/im9i5gyNKJ8bBrqQI2Kdt3dy0KPpziQOg0
 BSV0lAJO1bIqOsPwuc3KKYk3/hn0L+KYBp/b+lvF04I3enMZWRGN2S0/ffsbchxO1MeJ0V5b3cK
 hfZJu4EVftckpM0O9Yv8c60e5Nb2JR341WvhfCxS7D0AWLJQ7Rk7IPrwEI7YJEtHU2uOl+zA9Ld
 uPRMsZkDy+deZ7ByBQfd90O786cGcKAet5D0odFsO5H+ddDmmUTe3YAktpsbfuxMqXqhPoXaBEc
 i+Axp3by5tydT59O2lHrMDs/Kzwee5Ue1tcVNindG1cTlvgNekh52Q00KAe/rF6+70Vl73gf75/
 kBgWrGM7J5xycVb6ED7++BH7uqHlIFWJaWkWICSUKDy/Yfkg0hzCazcr7zLUZnu9CVkGX5dJcJM
 Qt4eQ6z6aMewRrdtwTarz/laWMPOVtvUcKNA7UIMw3BpzRzbDtPYmsXkQUfTjcVOCRrs0DD51JH
 M5IFzjAlpNlW+Ld5vdixHFgqRdl4rBK2wnGFXGfrzhXQnWlDLa1XbP5ZbHgyJ52ujLIX7IGrLRh
 45zcCCphst3DcutxyE6J+BLDoSOV/yQOlS/iZEGTJmOGPOYwogfJO+0o8ogUXhVpHOOjC76fo7z
 NMVpq68KkxBip5g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX6g8jT9YZddkv
 jsTa626IoEKS3LaCuWaOIpWlcqsdu03cBcRUO4wb+Mn9zkiVQigs0U+I4TI+efzvxGNngabFIrs
 OcVQPbRxDYr4mH0j8MwjgY7B0JIKNfT9QoNdRd3FPeiHNLTmyvSrYQG+xOrVaVd1w2octXpb3LB
 J/soK9ok1Fvk8pvEhMJXjwnvr7A30Qp/AFNk4hScgBUeDMnj3cHHY5vgKxKEWkZ0y3OQiqGwHAg
 jaPM2EcAa/+qtmTRwNpDYWd1ure+9c7hUhyrQRQj5bZtKmjXgPIJvv3jLLhjifCM5ckNnsNArHQ
 q40A3VPdQBslnMPKzmGyE2lnwDlQUBhE0ADuPyNofmem9t8XMR2pYVGYPG9Qqc7uv65Tlqr1uMX
 VsKzziCMQsABG3x3jk8GwVs6QPyO5hUzrU/Qqu3AxXn8zB84d7e8ie4ulsTwiDY92G8dYLl3N27
 7mrD6DcsTKTECHrAzcQ==
X-Proofpoint-GUID: qb83bbvQQhhzKUEUl1QNH-kJjRTOd1Ny
X-Proofpoint-ORIG-GUID: qb83bbvQQhhzKUEUl1QNH-kJjRTOd1Ny
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694a6951 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=op3mqaDViYxnCTu1ZhYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080

Configure the parent device using the dedicated field in struct
i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-keba.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-keba.c b/drivers/i2c/busses/i2c-keba.c
index 9420c8b342b573da435eeef5a05efde35d61434d..01aa5dd9638dac38dd92500cc8890feb8020754c 100644
--- a/drivers/i2c/busses/i2c-keba.c
+++ b/drivers/i2c/busses/i2c-keba.c
@@ -532,7 +532,7 @@ static int ki2c_probe(struct auxiliary_device *auxdev,
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_HWMON;
 	adap->algo = &ki2c_algo;
-	adap->dev.parent = dev;
+	adap->parent = dev;
 
 	i2c_set_adapdata(adap, ki2c);
 

-- 
2.47.3


