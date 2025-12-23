Return-Path: <linux-renesas-soc+bounces-26036-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 27378CD8D6E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 11:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EFFA430011B0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 10:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE1434FF79;
	Tue, 23 Dec 2025 10:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QAS4G2Q7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MycQdT+6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B465034CFB3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484316; cv=none; b=XbmvSvM1iLqwm8+l0ExaOIIG0gcFUYHArR7VqMwtLOFBaQrtNqQhxYVPPOaYqRFiM3urtrHgu6f21wWXBlQqyJGR2diXCgcRa7b3RX1aC5VqF4GPhuRXD1qvkI5DdCcWAnUO8bF4YLXxOPSIlNy5M7zGRh+a9IcuiXh4gtJCLVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484316; c=relaxed/simple;
	bh=4VTHCgrPHZIkSmUOibk7Y1K7i7wyCTns8fIiAuDUmjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kwwBLpr9Kdufz7TBow7VPI5Q8BOAtx/V54ycQD2k/+AzLjQMyQFY8LB0sBE8us5AfcrQwaFkxyuPjzl4tlXjelDJ4Z+OuFxhR5l9a2FsKV8RrnGMkihi7bSvDlD/ZPq2MryZl0QsOXIN6lxY6dUuqu+g1APnrE27EPabN0CrUng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QAS4G2Q7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MycQdT+6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN9kDKH1889180
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VESHsWfPvaoi4+tiqe+hxrug8kTFVaKspteSAbY4EtE=; b=QAS4G2Q7io445Ezh
	nAZ9Psw1yyqhWxNa/qHtPQXie7kitVAgyT+CqzSeeZd0iOkz1aOxuiT8VbTsFBHI
	CQUPFX5anQIUR9+ZSGpxbhRBiKCgBsM9fOBLFCJiBdJ6u3vMjSHCPlpJuqnTu9Y0
	8F+M7oUx/otBmTR14/BeueEo1srl2syW+BYtooSexJ7gYvdKlZ8ZEYMOJjsvk4w/
	t4+lvmcV6zcYiH4hvBANGvjrNxCmzEV+Mo/MQYQFwxetHvOZBkNbDd9hcRYsH8SE
	0p5xIzc1vueS+ubQwjsLfGbCQTsKjbnfc3CsWqGTQlWtWXDI0NUHhfa5a7HOrm+2
	LMWJQA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b770ak52t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:05:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee416413a8so52853021cf.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 02:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484311; x=1767089111; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VESHsWfPvaoi4+tiqe+hxrug8kTFVaKspteSAbY4EtE=;
        b=MycQdT+6ni3GuqlLgSpTQIB2wv1KkM7IDFoxxxpwgCAI2DgwU2X05cuMyKFmGvX57w
         LOixs/CIjwX6mK8VVH29py5JRTya0JUnJZc7PJo5Lc35Cdcxqd9cw+LG5Teb3RpuqlED
         Mh3p3QP4U9SQb/y0AJz04ALvaBje4y1nxzmJveVFKAq2BkHWZ/LTyUGN/ofwDAD2+Jac
         L9qyi7HLPCsBJDUztSVYwZT3WOu15gOIUVsuZvVHVruRoTa0msLz5ZJV9JzGrvBeRcvk
         7PD1kzUhCoLYCn7byycsH6HBf5a/ohf/1OPX1oHtnIZqtSPyoIvPUcDLF5E7e/1vMlnF
         fDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484311; x=1767089111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VESHsWfPvaoi4+tiqe+hxrug8kTFVaKspteSAbY4EtE=;
        b=w0pQpKnJU7wWO7jlsPL6xcYZH5f5+y+dOVAmOGJURmGubusCLQutpYqR8qZaQX89Vl
         IiLFlXcuKS9nIn1JwZ9waFgA4xg/OAmYkkd4WjOryq+04hGq0NBJjmXo86FdevyALLDT
         U1ww/bgylq0gr7TuFb8F2pv8fgocy1XoQVK2eyXOcpZSVvR/om7F/3E7yyPxnL//Xlgj
         STHcbSLHEoxGa99E4StiNqeDKj5BCBQt0DfR5FI4n+IxuKbbC/g9EhfdmoiOsvKBsQWH
         P3B3K+lixMpq67dQ6EX8KlcLqe2gqrgz+pBJeYmOinZR9Cy4MkrCYmW3b8eOWg8xl8G3
         wtGg==
X-Forwarded-Encrypted: i=1; AJvYcCUMkB8EFxuApiRXWKQZz+s6rtUYZh8xg46XRat0+vqPp/nZrRh7a5gp8RVngEJU+1crkmoN7nPjiOKTAfdxQfEdbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH4xEwqy8xf+uRNsEhF/f+/y+Sk3Ej2eEyDZthioJlDJR6o55Q
	qF7N67+EFn0EoWwnyQ3Lp9obCLdHd4CTjQqtGLrbUcvvM3YrKTqkYoOhpqy+N0Y0V3ljMkPkwpa
	HyfV9xYpRH/oVQ1MiljdqgtEvPt9W1APP/pZ++y1ekcA3bICKmfNfCbmelGA39eyNKLgwbL9KCA
	==
X-Gm-Gg: AY/fxX66rimr1PkUIJ3N4FaHBXhVH+PfOVq2aalfRWUdjTmWpAH+jWvkBdNkFGS3bjG
	2w0y9TU39QHrA3RgHI+qOPaLM86GcHV31KVQViZxx+q4+C9lpFYwBvq/bz2pBS5fMqQh1y2YFwI
	eWqtuaE2gekUKtdU+p7q00A4xQumnOpRk4z4k+9SNG0n+YoHB4MYRBALlKlqMnhg5+ksrpVt/f3
	gZmtVl67TEuh+lTo+j+cJcx+gZjSwmdKWeyl9xMKzkO7H+R/c1ph3rg53DfIcl+yeCu38Ljg9Oy
	Ijqo1O8wTCPvI5UI4Xh6IuuEgYwL+xaK019Yxj3EZGiAIHlusEDCYM/Ep+WKWAqcwx1nZ+F1fmW
	WZdPvQ1LpVmM7dEMUwaCUil+WT76v+0ZWMVDHseg=
X-Received: by 2002:ac8:5f84:0:b0:4ee:bff:7fcb with SMTP id d75a77b69052e-4f4abca9abemr221784591cf.1.1766484311446;
        Tue, 23 Dec 2025 02:05:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1Q9GcA/8ICDBh3b32h+BDN0dPrIAIb45m474a1bZscaPBYkROzgBv0H89r6pe1f5PLFubmA==
X-Received: by 2002:ac8:5f84:0:b0:4ee:bff:7fcb with SMTP id d75a77b69052e-4f4abca9abemr221783931cf.1.1766484310894;
        Tue, 23 Dec 2025 02:05:10 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:45 +0100
Subject: [PATCH 07/12] i2c: st: set device parent and of_node through the
 adapter struct
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-7-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4VTHCgrPHZIkSmUOibk7Y1K7i7wyCTns8fIiAuDUmjA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlCfBDo9ayd5xJjNDefHMY+MeprfqWaGSes7
 X/ntmYV6uWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppQgAKCRAFnS7L/zaE
 wyySD/91tRc6qmcix1iUN41NkqvYaKWNZg7twzSemJ9R2CAbmtrAUoDnzD1pUdkhNQsAGQjwWFH
 7KmtVJYSWxgYWGsbmV/SCfiIUJRRjJoE0n7r3qa3R4HQBgZxAs3MPaVfs9aRMv4Bl26cnJe7Hh5
 BntwjvHXdv9BwUYUD76Fg4QDnT8OSycLzHHH9IHBSM2x5UUQpfTSy/yEvhUkU/SrdLisOk05l1j
 pyAuS4c10z/zMyo/Auo3Q2ovGAIXnSKI6YNh3helH7rDqCxVzTw/UX7j50/g//wpUcBu0gc606c
 LVaZgCpeTQQhRFD+i/haihsQWmCrIODQ3ashDc9sGKyKPWD49M6AsEEtsuasqO1Rx0SVKM1WwEz
 WYHanibvULvtfiGMUIQLziMHX0YFWvBAJlzcb4xpNuKHgAepDUzpimIicEhTJ9/EdFG3EDrpj3m
 MZ4jeedoXkvHYeM47k0xKoblIU9VoT9bdaENYwTDEfm+2tQz91bdN1HtmzAHTIjLmt/NaoBCyVH
 s0XXPQiJIewHbvOSWHPsc3EzJdUeTsDyPVQvzuAzADKipCiTgUxT2k7Mxzq7PNgIIQYwKXukpDG
 Ji7S4tEPwKd82IgVyMgNEg6g4ekYQlegH+ITIJxMIrqOfBl3UV7CpFZQL1AHCGCKQO1TOR08/eC
 q7hOFISKYAicpzg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXyG1JDDAXb4M2
 JTfRld/lB5hP325Dncb3WoTuhBUbQUFkoe6+aEspwsQF9Y19Eobiqt6wZuUmu3XHmkgrqopqXAt
 Kb7q0XTeOO6qKC477iLjsPwPw+lZ4VtoBIehpeC8LiI/U9deUu7IjOTP40/NiZIhL+H5GZQCibE
 UX5S5liWWRVAjFE5yzsNy0LKiILkOyUDg8VvBe0jAmDeptnwcdK8Mel+dANDGMLnkFnS9XGugoh
 s5m+OrLBkPhynU2jq3lmXcs4dvpUBSfv3piHtPeWJ2dY6/muU/Se3tV9w/283vUKK1ljI9P8WXy
 H0gqawK7iZ6HrLDdHpZNsMKomEAXBETVD7dd/h7yHyPtGkhZ/r5Vo57LK7qkjEjsWM6q8r8eQxc
 vNum50IlmieoYbyESxC/D4wwTT7IgKipH4287W1hfFMfsU1jgZyatKRu6YvaalTIMQtvAC6/YMO
 OF/WEF2d7ST51R7CRog==
X-Authority-Analysis: v=2.4 cv=VqAuwu2n c=1 sm=1 tr=0 ts=694a6958 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5jvZOilLG3lo3iFWl1UA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: B93wk1js4ejPWEeYb6Xr3AznRiEGTbME
X-Proofpoint-ORIG-GUID: B93wk1js4ejPWEeYb6Xr3AznRiEGTbME
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-st.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 97d70e66722706f242cd97153387c3a865abc12d..b50be2c39eaa4b9b95a71b038a4d63f3c5fd7c4b 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -849,8 +849,8 @@ static int st_i2c_probe(struct platform_device *pdev)
 	adap->retries = 0;
 	adap->algo = &st_i2c_algo;
 	adap->bus_recovery_info = &st_i2c_recovery_info;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 
 	init_completion(&i2c_dev->complete);
 

-- 
2.47.3


