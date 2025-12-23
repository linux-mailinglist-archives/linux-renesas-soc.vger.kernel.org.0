Return-Path: <linux-renesas-soc+bounces-26048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBB6CD8D03
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 11:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4537C3030DAE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 10:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99DC3590D3;
	Tue, 23 Dec 2025 10:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EJH1bJxM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FymM1BRQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2E4357A3C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484434; cv=none; b=mHusWOr/J9rOUq7uuOql5gYzJCCdi1lPTnp5vVJg5csdwgkCj5annuSExybBmmDPgp+fDpyn/oANKjm44uw0NJgo/LQ/jpO6IkhMFM/PP7RFXP8auXUectRck2IIo9RIhnG2r3bibDXZYGiONPzzaR8tlOo2ZMGL37Z1Egpdnto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484434; c=relaxed/simple;
	bh=hGEYRcVyYQYKY/F7Vyt1mfXKZTROQ4LT8kOAEJ8GJIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FpviPh0YefUDSAVW8zDmniSbfUi0STvaeobWBEtfGANcANeOImcUjtHT+QKY9eGWW/xq+7sPy8kDnb7OvDsM6OTEha+orMNR8HAOv1wOE2ryKBsV1iGahxWnXkSMtnJmJisiowDvMEEHhugEcb35sXaYM3BqwrEw877CeNaJoXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EJH1bJxM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FymM1BRQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7Sgqq1630835
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tH0LfxtvFUfgqAN006eWum8rbC+E0ztuIiM0KqrSDxs=; b=EJH1bJxMDv13SNhK
	OtKNs1P0PiDaON47Lv54IlhDYEipaA7nDzF6scUp9KrcJ0WokcL+qgt1E3fkpTAV
	e0wyJAIyFflshgQ7uyJqDin0Acpmr5kfm6hqA7fot+NxxRGL3dDjpAnPuUVqGdiy
	+cLv7vYuueSKvBiHr6bYgpZY+91EaknWMypyOGDKymCD2Tg8vpBSMaU5Jfx1Nt9O
	jcfGKFde0VEGMUUmrAomXqxW598cnTfTxa+bFYcafPLqVcAJo8Pu+BDMFTMtrHxU
	wiUqPD19guno+HTBaXXy6B4RNe9P0IMxCDuawOhuI1H6+3dKpfoncmvA+ZukZBDi
	aFt4wA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7ck8ja88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:07:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso45801821cf.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 02:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484431; x=1767089231; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tH0LfxtvFUfgqAN006eWum8rbC+E0ztuIiM0KqrSDxs=;
        b=FymM1BRQftQFTLKf1WCG4ZbpiWmKZDfXnwkCZt7CmTMrF6IjtEyUyv1u6CCJhRa/gE
         GTceh48Rl0EZKPOQcHAaLPHrJkBTvJYtsijRQbFVn2skOiGU6yVZ/pmfJMA5hO/rQGZX
         Jl1cvxNLdFEzgv2wPvOQCvgKNeP+YMlzp5ZH7G/BA8zEPeH3KQTH5/gQl0QDdowtVRgg
         /M1zhOGINkuwTIriWc8YV7bCKGo9r/nRXF6BAeSrJL2rGr8lN2lLM22xOlEOAAJuPunO
         Rnz/U8OdTAUyz4FOp2nd+FI/B3PbVh4HbtqGNE6+NZicINJJ5ejjlyJ2WKwa+9TP+RP2
         IuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484431; x=1767089231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tH0LfxtvFUfgqAN006eWum8rbC+E0ztuIiM0KqrSDxs=;
        b=t35rv9rAgwMb5qE4G+f9/ntd4qgI3DjqTczobE+MEv488j9+cVfL5+5FxuCi27ZNRZ
         208f95vRDBkO4Z56FJ5eqxRjWQHQrilk2otjGJl04HM/6QfrsigrOw45rgnnPXZEo2rt
         bFZvmzI41u0ejmuW9zmz0N0u0CYho6pdzDT0cbs3b+JVAPFGIgLj8Gutl3YntcZE0z1b
         xLPzzbBnehWegvP4uH8NwPfvUH+c3kt7iUSH5xCdVNmidCnQI4U308yAIoboxeH2eWlB
         iS6HFl0OOO9NzUhiYCTB9IMSRrwYUXsKDSyG0O1LCUsZmXHdnLRTghNnD3vvkeC7Kb11
         hInw==
X-Forwarded-Encrypted: i=1; AJvYcCU4v4JlCSkop3eGdNSJKlRH8+8gvxoa9zr81A4BPUEs1ldH/J1eZQKkjkZFHGP6DEmaQyaHsySxWxITPpVBob2k3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv3dC8R7ATZ2gk0QG/mBZJDtdlWd2NfPSPBlJUzefl9av1O+sm
	BnnI/ph9AthWlJEaKvxdZjiao+mJpYTO3w3BVFoh12+h5QMjRfHNoZJwbgHOHug5JBqdUTm+Akw
	/zKh2iQZsr0ua6AetqWO6sgNMvW7yWRLxPWd5z/6R983UAdcpmj1s+JAfz18F9ARANHHaSZycTA
	==
X-Gm-Gg: AY/fxX7e+K3AG1dC2Ngp6CD7E2e74IE8kB9rfpaIMA8uZMs4/9MNGMb/7OnbpNxjDio
	lHwyXcJH/z28IJq8iiAO36Ka97XbaG1VRsKYmGWCTGBhLQUw+i9vzRvORzB+Ca1Xy1FBApfEeWt
	j+uYJ41bxP5NV49B6EUFNoLk0jQpPh34VC9BAAuBNdds8bwHJQ1guvTIDZ/8YMHEAZ/s3tmbfiy
	Zsz6U0eCynAk4VC2avZJDP2rT5A48S2ebcw/LfdQVFA0wjq0g0srnELpoQPRpUrlWuBfOE53e0E
	W9PoMmPwzdIOM6iRKiL40EAC32xufulrpkqEwfEK1gUHd6ctnO7cQj53u5yRfNxgCs/wii1n+Ni
	k1gCNiH+ntqnh2OKgkC9Q+K1fQO7wTkacWUsn6V0=
X-Received: by 2002:a05:622a:1e92:b0:4f3:5827:c96d with SMTP id d75a77b69052e-4f4abd6e4a0mr244377131cf.46.1766484431129;
        Tue, 23 Dec 2025 02:07:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpwCEboa9pbFgXvFCizm2CmsBF7yQL4nyhOOrPRDwjigE8ZK8Kh1O+ad5TTuvyeoq1c9qCfQ==
X-Received: by 2002:a05:622a:1e92:b0:4f3:5827:c96d with SMTP id d75a77b69052e-4f4abd6e4a0mr244376841cf.46.1766484430750;
        Tue, 23 Dec 2025 02:07:10 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2724fe8sm339882745e9.1.2025.12.23.02.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:07:09 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:06:53 +0100
Subject: [PATCH 6/7] i2c: rzv2m: use i2c_adapter_set_node()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-ada-dev-set-node-v1-6-2e36e0e785b4@oss.qualcomm.com>
References: <20251223-i2c-ada-dev-set-node-v1-0-2e36e0e785b4@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-ada-dev-set-node-v1-0-2e36e0e785b4@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
        Lixu Zhang <lixu.zhang@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
        Hans de Goede <hansg@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=980;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hGEYRcVyYQYKY/F7Vyt1mfXKZTROQ4LT8kOAEJ8GJIc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmnCViJzk4QP9sdJqbi0g1cVCg1gllisAZwge
 qWWHuWBePyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppwgAKCRAFnS7L/zaE
 wx12EAClxWoWNxQyesOQuy+EEcVR/vfGAKUA/l2WfKaJX6Im1qGDZjEU/gr4+iMQpHguY8GuqmG
 vGwKfaPBQeVaeGr1MuKmS6qfskuXkJqV91nUY0LDl09QgTuSe1HIcZvjLN503xnNjoM5Vi1kR6J
 X1ppA7DTmwjZ7A9tuEA87Gfu/4POu1P7UPU1/C32t8IlCSinnzaaskyA7TRGMmMeP6MyMgCGE++
 P5WMs9gmW2elWvLNq3X43kZaQDNeC0m1ksEHAitfYg8IhTnspyF3oL/SM7nV9k8tXWgX6pdGJ7a
 F9tfJ4eVxTIcI1kWF53gU7XsMZzVNh5oPg3ufcu9TE/6MCOe26vnYt/rCL6ewPwtsXd1hohtJ1Q
 ANHOFUFXXF3gcWMdRHQUFVTU6qetSJKmhhdm8BHLDrqgLySAEvOQeNKay3QB2skYDp1CkIZwzip
 GOB3gDtA/vS/qFQXaE+U9nqa84e3+hMGrkZWo9s8BRaG0L7+i06b0xCoTPyu/rBmd+j7t8nEiCb
 DBByClKiZgfAi9vECTeh1HyyZa1MbOmQ/AgTc2O7l2eFbPK0Rd5Dzg0M3yj3GtcOBF5eEsCbKOq
 L9e9CH8RAPtMrvCJRa01NmtsMxBrhQlUTFoPgYsIVYpFwfL5INVjxV+FxE2wNYIBOUdYUmFgKYg
 xqQLyDrk70xzcSA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 9qZoFF0JtNh0VsW1CMpmWvtSqDILeI9F
X-Proofpoint-GUID: 9qZoFF0JtNh0VsW1CMpmWvtSqDILeI9F
X-Authority-Analysis: v=2.4 cv=asi/yCZV c=1 sm=1 tr=0 ts=694a69d0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=84Df8qURJmcINpNV-cAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXzpayFZi4Yrg4
 QJV3xH6h33fzSBEPI4THal5KlH8q2SgQswr4YGSt7ev42ZbpcgRKMRBYmTuRc7Hxxnbl9ig7FKp
 G5jsnXphW2SepSEZxfe4JhsFEvL7EDJVShtLfG4Pk/F9gPlxXxq6dFtZXZhukm9y88RlGMt4eYT
 ZjOkDADQL9wUSK5Oa3BNhpisSB1/Jba1EhUqji4FfbeTFCNy7ASqWp50jlYVe6s1vV8HyUh2vY9
 HIWlIhTKwNQT13xkfDOQafrqn3ASVxsNHSqqI3Au73twcx4aDH3pA9TY4Kg+/O2f9GFK9sqQ2yW
 BFZQ4YmiMbUyayfDUo1AzAQ5Sm57YQIFJUFYveYDq89d2ISQjhF8FSDPlWUP3gTYn5xnoaqe+v9
 h0FMIbVDZkB3fv1VxcWhj6YBS9b5kCW9H5ljB6Itlu3aLHB/N+dRyLBbTmjz6AxdWEsh1HUltnR
 LrXBT8ka4SboK9rQZKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Use the dedicated wrapper for setting the fwnode of the i2c_adapter.
This allows us to hide the dereferencing of the embedded struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-rzv2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rzv2m.c b/drivers/i2c/busses/i2c-rzv2m.c
index 2387148506736a65378809971bfbddfb436b6c4d..f31d5b90802477a3d27557a4a92ca2b26023e343 100644
--- a/drivers/i2c/busses/i2c-rzv2m.c
+++ b/drivers/i2c/busses/i2c-rzv2m.c
@@ -451,7 +451,7 @@ static int rzv2m_i2c_probe(struct platform_device *pdev)
 	adap->quirks = &rzv2m_i2c_quirks;
 	adap->dev.parent = dev;
 	adap->owner = THIS_MODULE;
-	device_set_node(&adap->dev, dev_fwnode(dev));
+	i2c_adapter_set_node(adap, dev_fwnode(dev));
 	i2c_set_adapdata(adap, priv);
 	strscpy(adap->name, pdev->name, sizeof(adap->name));
 	init_completion(&priv->msg_tia_done);

-- 
2.47.3


