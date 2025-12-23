Return-Path: <linux-renesas-soc+bounces-26035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB31CD9140
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 12:21:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E74E308DC13
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 11:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93B9E34F479;
	Tue, 23 Dec 2025 10:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l8Tfbjr+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TizzNoso"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA5834EEF3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484314; cv=none; b=egPG/iHw1xwkeFh/+VFsIDgxnpci3iWpyiZoepf+lEBi91yLS90jXDWVGP6OGwgTRHhmz6Mw8ktGtOeP5RODazpBty0wFjAP4YxpJnqvp3V04HqpMbRy4dgsMC1ayEttQyr36+dfDWoMD/6MB1rvrTGhbx88e0C2MjNL7SF3j2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484314; c=relaxed/simple;
	bh=/F0evc1zIjFfr2ewDDdTKZJybhly+0fCX6IEry5KDtc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mJriDHqyPY4rSzHQTJ2/Do8Kj7K3GwK2kw/d/47UUwBo4e5hkZxemz52YrNlNs+wyc6M7paAgZwKcmwSPJHMBKkEAS15RJin5Jl/u0PEeR0FEAlkwfC2fxpasZdyBWrnfQJAZnqZKLugzqUw9AwRmDiewTlj4p+rw2YWmy7Qlkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l8Tfbjr+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TizzNoso; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2hM832041074
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ifSEl9Ir2RHMg9IgGUu7yq06oWZeXaWDeQV3FGoUTww=; b=l8Tfbjr+W7psjUUU
	7h9yFHu7TmiM0takP87iaaE4CwcQ0s/SSGiTZhIhaaprOvWzM20VYMwRdXYiGF4+
	xBuP/Fn5TtlOpvbhyoLsLgWPnTRINvQ/uJRhXouFgr0EYaOp42WaceQ2q6r3iBtw
	fV15a+xCoFwQzKYwGZKC0hdGBEs8lp8ArmeJozlhIJDpjAHT5jbX3OW9FCgtKck4
	cF15vzcv8Mu9KdQuUzp/hiePRG7yGi1LoJvlsv6/s42UEQTCofB/yejb/1O1XLK5
	gRHW0L7K/+t61bX3KMGaq7CWYxNng00dx9uinSHuISWMjAEwSAHL3rcosBLWt0IG
	HpJN1Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b763pkb6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:05:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed69f9ce96so157567451cf.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 02:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484310; x=1767089110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ifSEl9Ir2RHMg9IgGUu7yq06oWZeXaWDeQV3FGoUTww=;
        b=TizzNosoj2Wr/rZw6Vqy/Lb2yZzUoGljXqBwTd7vKfVIEVIuUaGw8If1vIRISzpVFc
         2T0kQsGxWh34X4UfW7Vxm2RlgINjAZtx3sZ7xwMtt03mdDYnPK7L1t8BuNHDxG+CYKTc
         QkZ/cyBcKmqDOXBmLRqCnPsdiDCWHHVs/BLJ8Tv5h1HDQbOKL06pPPazlpVsoMNoX9cQ
         B4c4Z2DgGjYPMBCs6IXQnPMo9yXZaq3XqxFUCchtiezkCizmVvx0b0d1BBVU6E3pHyLk
         UtLil6MrCfc/9q+aqFyuV+1swafOZVJjPSc6DhfCHZvg0ngBcENY79f4D0mxvRgYvZmr
         W9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484310; x=1767089110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ifSEl9Ir2RHMg9IgGUu7yq06oWZeXaWDeQV3FGoUTww=;
        b=JTbxtA8HO6VNCB98eLs57N+3xD9h67sfRJBCWu21amgYQnp7z1cRGBZruP8bvWWjMS
         xMUlEO4m0+jtveuNsPrFmAUldU04T+pz2ofZCceZ3cZVTQ+K7peGJ+NXbyRfFkWNfNBm
         Cv0k5RX+s2V7Cx+f2BZQN5BgpvuVqYeJ78cJrTbHE/g9RzyEcz45xOhG+C17Wzx29L4t
         6fiFP5YPMiVFuxxczd9Apa2bhj/8Y42Bz2nQ/j5d7NMctmzamerIjoSKXnzon52523NL
         XLbe5/jLS3hUujFLv4rD9nwhErreeRcWSeUpzSeb51u0yzBS2gnQlRYyDJeQ6DxoUoPQ
         9NZA==
X-Forwarded-Encrypted: i=1; AJvYcCU1soWOQ0CX1PyLwNT6h/gSbmmqcjATKdSaUyscVniYM9D/kEHWVjCF+391fNXlopXZdZoyWGe2JNNQFl7hE7g8pA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwhgaxcmF21MYKTLj6IXPP/mV5yXDnj3QK1rcgcYYVM6oLWEUmp
	HU1J3NhK7balSlOqdmV5HNx4CpXxSRyCUkn4CtjLLT5uNGn/lbzOK63BKk2RJregGbEYqqWovHJ
	XAEi5G8bSWkTduShyAr1C158NPdPXzQN12KNKQ7peX+F3Oh9iSVYJ0ZfDV5n5SVPE40ZlE5JYcg
	==
X-Gm-Gg: AY/fxX5nbWpcqYzPvGS/1/UcvFKMBBXWQL/KeJ1gl8WsFMViMcgbwo3vAXEmsEfqmHB
	C1ViQvfetEeJwuAYXSxuKrQ0xR51jfYO4EHE+x1rUFfsjdx+vgAnEzY55PQa1CTImxSUHUTrrio
	MkXx3z0dyBEKO134aDzT72BpYQPfWnsvNcu3nplxDP7f4e3Fj92IYpDHwcLvJKjYM39dsonWmRq
	3u2k702ff8nuBNOAX4EGoLcUzTomtiNA6rT7aO3YdCIOkY6OQ9n9G3ZIh0Ys3I2CR2j/+gf5xUK
	uLnn+ELjQZny67O/ti7LOgjqhUEMztRy1Lx/7+fhAOdpbG4Q2cyeQuT0vczB1iTKTilwoyF6yWq
	OPXY1iOubs7AtKvqovOLqOII8jy0LrGH/9IFd+/4=
X-Received: by 2002:a05:622a:19a5:b0:4ed:aece:b331 with SMTP id d75a77b69052e-4f4abcef65bmr213879521cf.27.1766484309802;
        Tue, 23 Dec 2025 02:05:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUDMHH9B67S701dxFG87AKQUqiqvJUUAv/hUAmqhTfe5BbC71sFiGcdmPZCv/zu5rHbZ2Mhg==
X-Received: by 2002:a05:622a:19a5:b0:4ed:aece:b331 with SMTP id d75a77b69052e-4f4abcef65bmr213879131cf.27.1766484309345;
        Tue, 23 Dec 2025 02:05:09 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:08 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:44 +0100
Subject: [PATCH 06/12] i2c: rcar: set device parent and of_node through the
 adapter struct
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-6-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=985;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/F0evc1zIjFfr2ewDDdTKZJybhly+0fCX6IEry5KDtc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlB3xveTvcVkYCQoJDpJL6WY2ws5IAOmbPUh
 KbMW9O6TNKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppQQAKCRAFnS7L/zaE
 wxPKEAC7gN9dvo8EvWFoZuSf9r+OwOYHj8Kqi1P8Azur1g7NL+9EQQMBH2uh3jlmWx2zTGD0e4+
 lOxS4r2oHWPcRpWFry9Dk1v9YaK1P0vjXrqc5n5BjKCcYc9rKygPkteQqw3MygXHbRtNJefh1Qo
 2CLIi44w4onmzo0+7L37c2WjI7b2RwJaQWttAXetrYL/GEGAMrqugaTjEKu6snoZaYTLWG7VzFo
 HCx/rLWe5YrKJw8P7A7ug7P9z4WyIdYQaHcY8Lkxg9ZIDEJxzjoE98PTUIiQ7NqZz3e/ZUvQMVr
 4V/uCWv6hbzONzIUGJqNFePRcCrTseT/EOEQk+SRrnnihURotNCi8LSG1Kk7uvjZgqJFnwX71U5
 PharzUnoKUpBdkFT2z6f0ys8dMt+zEtmaS/DHqszxXKgVdnG+BSI2zvd6Es+/sskGGwOcgRVce3
 J/WVYPTzHgVhn0+rE1bSonNBS4YfmkZBNimrCB6oknQtEsMYP8xrNUM5CFgTeve/xDmhrXRJnSt
 mtek6CoVmzHtbrrfNc4XobOkIFUVBD7JDbFmPMkNBbMed93IN8gYEdPCSkcUJelQ/lepFlUJj3h
 SVv3gkGlra1bRI+/lIOzIN6LC/w6uwgC/PLMSW5fAxODqlytmoS6hYZYXxa+9Iibn2niXh8GhO/
 B4QbR0eAn2bIKPg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX4iZyuzUXDjzQ
 pOg6k2AMbysilIvfkumgMFbBSOyVJHqjSEHvu1kv6q/yAvEpzxElCobzwy9PxZkv7CVeTGy4Ajc
 kLU0xmmF6SGCYkrV+/8kzKsoXOsYAP2pOM65OikK/Kf9JNdadvwjjU9BNgChIERzfkp3ILXsSTI
 2rhmICm/T/Fy2tJ0cQ0xMpQK0KnR0yKKNI63CW96amhSjcBhfUJVAvJUskyRZ0RHzghp0Vm5LWt
 /wQmTov+GzbcvZmCrpB8vNKa6poQhgdi8MBvcUR5h/7GPwwLtN7Y85r11pAjcMoYzmXdf14TZ1h
 9MawWWp3Pdzioho9xF5YbTSfDHbIQGslbArATVWo8IbLZ2C5HRDiUXg7uNRhD959txN1u54GbuI
 sq2Ul2Ls1EDz6BbcwPmX1n/wGmPVBdeuiEvLQO8YRSx1RDARtgdgpLW0THGBtWuf3P3M/59Zm6p
 4x9qEs1bziryt/0EVqw==
X-Proofpoint-ORIG-GUID: lrAj3GWV4b7qPBOJ5HP8EwBNyQv4TVv0
X-Proofpoint-GUID: lrAj3GWV4b7qPBOJ5HP8EwBNyQv4TVv0
X-Authority-Analysis: v=2.4 cv=H6TWAuYi c=1 sm=1 tr=0 ts=694a6956 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=E7P0tHU5vGGU1I44B8QA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-rcar.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 5ce8f8e4856fb2bb21c9cd731ddbbd8f3622ca26..86826502533bf866ca81cb86ddd10b2a2be3c798 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1149,8 +1149,8 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	adap->algo = &rcar_i2c_algo;
 	adap->class = I2C_CLASS_DEPRECATED;
 	adap->retries = 3;
-	adap->dev.parent = dev;
-	adap->dev.of_node = dev->of_node;
+	adap->parent = dev;
+	adap->of_node = dev->of_node;
 	adap->bus_recovery_info = &rcar_i2c_bri;
 	adap->quirks = &rcar_i2c_quirks;
 	i2c_set_adapdata(adap, priv);

-- 
2.47.3


