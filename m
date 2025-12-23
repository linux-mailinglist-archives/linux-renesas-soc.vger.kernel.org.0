Return-Path: <linux-renesas-soc+bounces-26039-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B665CD8DBD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 11:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED295306D6DB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 10:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7FA634EF1E;
	Tue, 23 Dec 2025 10:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8SyapOH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ar+DcfUC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65E9350297
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484323; cv=none; b=S98jexgM/6MSsqEfaFvsmeFPu7hENGM0i8jRN7ceFY64E4zNEQWuhcDqBp4po7q1PE/qtaMDGH9N9ccSuYnTa+tvcp3i182IP2LbDpyq/Abzfp+nuVouIF/OW3DWpy9QzyTa/Yw472s9L0DvH2QsYkw4Ecr4nIAhja0pqhbirRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484323; c=relaxed/simple;
	bh=a8UV6upSERzZiMxLa4pbl6Zm2TvGnZjx+Xqv9pXzXFc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uS5joqZyNfeMXvtmFwa+fv/pVX5nOC4lXGQxOEPDTOa9wQCYoBR58KFQFOrGTne+pisy1Yqb23HHlEAO2ZoG8CDtg8ztRm02XfZDeeS99MgbLRHxTbi9VmWtE+o2PBlbCp3CAqGjtHuK13zPgKbeet1H1TT5Z5q6y2ezudK17Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M8SyapOH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ar+DcfUC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN2tkKW1568831
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=; b=M8SyapOHuaKCmK6g
	DClYf9gv36ai/lBT6210yhTCG69DPzfV4PSPqoPtoAaH98/gPeppl/Els9g0sHu4
	dH3FiE7x3fAWRInzkFlJBSV461c2/rxqCsGSU329wslt4kBl970M/v5mPRadGxAw
	ZK5sWyqlaE8HNx9yFQKpQs+XAftrIBkQTy/sfm3jkwMePKoooxVtkMLdpw/wDB3j
	Tx/wKhUja8eC5Bb6/z/egevEOpgzblyWPRAcH1PVM2v/SlLeVRefgmPEwf1ifi62
	C+6no1YsDgwrvdY9aaF7Vt7ALSZFwNffg88Czh5lCnlgCqz40Nm/8svU8ItoGh2Z
	W1cJAw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b76yy37gp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:05:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f1d2aa793fso121789301cf.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 02:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484317; x=1767089117; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=;
        b=Ar+DcfUCLxt3u/xnhVUxyeys0fDT1UAEhe+qZvvo1xD3dR/u/g9tM1fuqFveeq2XIr
         9ftrPNxUYRVTs9E3JZ+s3CuDQnu7gvsWuC4TRIkD8OfA7t8HkU9gk52VxEsMe8yvKBfi
         vNcDMFhyixhY0d3niUIe5q+uqmIIe4UAmK5Od0XWWv5NHiaGgcxTy+5MAWBAW/3Jj5+p
         0kW2YaqXNS7hZzRcDJ7Owxad1GCBbSEsP3wq6g8qt2qPPug0/SBL20VB76oHr+alG/yx
         zoasDRhhDzWoZVQWLX4pT+5pK4QUw3Wtn59dmetOD0dS0NM1tbYa1khsDxbiVRUFZJDT
         jC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484317; x=1767089117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/FOPSFcqGMHY4FSkWDBAalpUhPARtyMNlPvPYteKJJA=;
        b=tFiuSYMVSng5joKMEWMFzT5Xn+uolLS2YpSkrHenbrle5mQiY59qxNaq40dTTXMM3m
         xJvKkaY5RsPopCFhl9bmD6wVgqVErS7IdQp8HEyMaEtLQPXpD0XVyQebmx026RTZivX4
         xBMnoWCXdw1jsV+wKycyREoNmfYIfAyADuyQeMiVHHsgFG5m/mjh0juGHtiXX7gACyZ0
         qyzHt1v93i0medCXIr27BsU04AfRUmiGaOMQEeC3v1JP0TPKe+WR2TEiWSB/31tEAehV
         VdMPdVwARz+rP+LcYQOQoBg/vjcEV0WnOwWIJhHPLaKFVXFJmvDLx61QK2J/uoSojYCz
         8y4w==
X-Forwarded-Encrypted: i=1; AJvYcCURUuHCUW9YtTWr0bU4pd7unr0EF4/e3xQuC0dwj5LVomdyqo0aNv8JuLQVbXkPDvIRTWADVbuzbFkrwRzO+Y4PFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUmRCwCOnsA+E+hVjV6ry23UBE8ygBZO3RrdZMhlw3X8BKsvaC
	UUHEeRXoXX0BQcLb65sMavhHiTWT2oMgybiS42WfTXY+4QcTuCrhmhmRdhmSslC3zePVLJc4OmL
	PnMu7Z+CxbXUVG9yxwNMbxPOLT1snfvRJNaGYfIPwTNx4onV03paOZ/rEzmQP3MZ2d4RbgcToqQ
	==
X-Gm-Gg: AY/fxX47zVzs6heiS2P7SnaoX0cd5aRMZHAcAMhyethL+TgXlK+OXWWnBCSaZwwjo4R
	LYvix5u3HkRmYoQ1+8nhR12EemneFAAoiGcvhNrtDHvdUisjBaFO0MFgWWsYrXSzWnVg/vbgq6U
	W+eqQEAh+HE9wK6c3WQkg8+zjEWjzmRpB4rrFwrvlAYTfOUmeZ38koj7rsy5QVV3tx5J16y6HKU
	MleioCxQOYNYQBjYD+sN3/JXP4O2z4+3IApk4wLwGvZhEHdEc4HloEHkXTLNG2RRF75smP1HZE7
	jutvZk3l7QsXrHqy69Ze0VF6r/6n7S4dxWXLzcSo0RwJgnS0nqDNnCE1R1aQgjUMiWj5hFkv3iE
	WSQYhiB3i1bwF9H0LLd8yG4jMfTS+xLLDYjksBDw=
X-Received: by 2002:ac8:6f06:0:b0:4f0:2b7e:c5c5 with SMTP id d75a77b69052e-4f4abbc7a72mr186179461cf.0.1766484317231;
        Tue, 23 Dec 2025 02:05:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyr+cM52EnsiY9X9JwqntnVrF5BgN6w1ESxc7f6rP9YwP41RmdhZKCpIzJx2dLAd8JqdWN6w==
X-Received: by 2002:ac8:6f06:0:b0:4f0:2b7e:c5c5 with SMTP id d75a77b69052e-4f4abbc7a72mr186179071cf.0.1766484316736;
        Tue, 23 Dec 2025 02:05:16 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:48 +0100
Subject: [PATCH 10/12] i2c: gpio: set device parent and of_node through the
 adapter struct
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-10-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=825;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=a8UV6upSERzZiMxLa4pbl6Zm2TvGnZjx+Xqv9pXzXFc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlEeUL/Q15FR1biYp9tcKOXI8bceDaDmm4nY
 pSDfzSVR1mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppRAAKCRAFnS7L/zaE
 w5H7D/9X5cvGLgf2JsLNSOAwLw9m6VU91GHNuXNctR1mCyxTnB1fkm7XnMj0pPmDNHVPUKlxZXy
 +y2zTwPZV/WGJitWyRS/ppkDKVJhOAhqmd8/266hcra08tpgC6E9U7V7nKET2Q2g7b8ZoLc8CpZ
 mPy0wVx57FkzZe1y5sVSfkGVMFxQ3wnALDH1JkHHgzAwfLt6HArLLSL8O5d0qbxXdAR1+JT57Eg
 Sn0RwrdFX39zMO6h4kCG0SoDeH1nXAOQ6TzzcUxvq6kk8ySWqHCnoFfdr4A6o9+ELVCAGDD7zb5
 DWkHQum7SRuPbiOQvEvp/cs4ym+eCOB9MhsWnJbvImHjaxR3v2eXwEVwpwTV8M3GxkP6tooqRT8
 7iEeJaAoY1NzmtTdGoaX+6w12Fs11xnwTsO078o2mL0o78A1kcmhZWJKO3O3zpZTfpHpfERG2Yq
 brr0oyrgv+7HmaEwzDYh1lOW1+6gPN2nubx3213yEXiDOwMLHFY9ESAUJLLBy5iBWfbgrmwiGLd
 aLiaZXAzAtbFj5x4jJ7I0/SewRlt9itvnAlHyKMFVw+IsofVej07D4ZVwAP3AZDuf7+DOL6Dbtm
 Dp6s2jvv0ty9RTnVGoeSbXXoT/L+yuOuoJmSs6lsjxNpSCOTHtP81AacY0NC59lU5KiRClUdsra
 i6GRY6JVgaFIeXQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX5dnW5lzjc1i8
 cUoPiMkUe7o43dJLGZuY3y0S6+k2ZZ0p3kKROTLRnDAqNu4bzG8ZLGUGJogut3D4QEKq2UzWvWo
 cxJC3lJctB5dzg+t1xxqqGuIlYI9a84vvGfHK8Q/FdOF3CZYNd3cD3qNdg60ZT4WkufbubIB55r
 ERFlQZaUJ05/ZukhZbyMqCCkse87qdzcQW5YF1ugzf+xHD2EvE5h+NBT9hZMVoaIlfwwmyFap33
 1YR1TCcSqnyYo6ividQrsUm/8pMC3c71t3k+onve+0Bi+CZpp8gOQe6e7fHbB2yjFstC+KfinoE
 +06A8FV5Bsvcb/i8W99AjukDBgJrjucRatVR6IxaHN6cUGZGmaiSWW2srlo2ilzfLJgG+3BbRjH
 6GlGuXYztMlBwXFQoetnybkiy76A0ksS0UVo2cbB0TVOk1pkr4nljwm8Ud9bDNvRZyBmoJn2bVI
 UcjnRTS6jXyqk8Gnxyg==
X-Authority-Analysis: v=2.4 cv=Zb0Q98VA c=1 sm=1 tr=0 ts=694a695e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hPzHJ5MbA3fyhucrTyIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: n7L8vpkSNo-8eXO6WG7WZ1DaRogRWerg
X-Proofpoint-GUID: n7L8vpkSNo-8eXO6WG7WZ1DaRogRWerg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080

Configure the parent device using the dedicated field in struct
i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index f4355b17bfbf15c402e71096ccbb99f5a35bb479..78f8bc2525be6d1fd9a7907df4c253f33bbec9f0 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -425,7 +425,7 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 
 	adap->algo_data = bit_data;
 	adap->class = I2C_CLASS_HWMON;
-	adap->dev.parent = dev;
+	adap->parent = dev;
 	device_set_node(&adap->dev, fwnode);
 
 	adap->nr = pdev->id;

-- 
2.47.3


