Return-Path: <linux-renesas-soc+bounces-26046-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE9FCD8E46
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 11:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0506E3011F96
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 10:39:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78762358D3E;
	Tue, 23 Dec 2025 10:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIz0Cr4d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I/3rbNWx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4107C358D1A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484432; cv=none; b=P25i6RigHFrGlstZiiJ4mDmH/oblLkF0T3bm8vyPXHyLd0t9M3WBktF9M2sBjDsKRQwUF/qCgQToV2UTDe1VvmKqqKOZVR8WZKDN615Z6pk7Hz6dEnXO93LTb8MXCcVVajZgZIgt5ApfadADbOQCWbUvkyuwRqOQrjO9AtlEh3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484432; c=relaxed/simple;
	bh=0JbXOIpZEOrx1UfxFnWPcpRphP3LOMkZf57KPyKL5GY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NdBoIT2tGusPbbh6nztiUM1KvhJyGsnbUqCpfYoNAGV+a1D7mf4F72GCjm1W9dW47rgXhBW3ELZrAGGLXgkDeSTGqesCuYkvt2UGhRbUqvqBAxajjb+tumY+zrhut8oAC6gu+BSj98H4m4b954X7qswGiAy63wLlv8xjsbIYemk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIz0Cr4d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I/3rbNWx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7AZCH2115394
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Du5Z9snohAXc28WV77Uyy/odjuxydkFuysTzLarmtRo=; b=gIz0Cr4dSuuru6bo
	QedNKSjuGvpdShAtpksIJoYVRbGSuMBr55+P8UFJ4JYzZNfzWG5wEBESKon1jBRO
	CTpyoZXllma7cp5d5vtT8GgCO5YP6YPgVi4GWyJFg6Sp1ikWrM1dMp+EuSdnXYAL
	1ORaRyYRW/h+glmPgJ2BrCP974flOQxkQzXO8p9ZYq6i9mbZPT7SyGuDM0iT2ExC
	V2SoemtjI2ECJotB9tDsTs2x//N6gAZ8kf5ePRetdxvEsBNPSM0kOJ4t9IgYgdfw
	Oa5LwqUggiTl9rV+ej02/ORwjx3w+ma4pUEwDGOv1OLAI8j/2VRvV0+OExqpnf08
	B3Hk/g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cudj8n2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:07:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0193a239so50453931cf.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 02:07:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484428; x=1767089228; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Du5Z9snohAXc28WV77Uyy/odjuxydkFuysTzLarmtRo=;
        b=I/3rbNWxhjum+PF2f0ZNVotEl7fmFfkWSMMMY8jGDZItnKRe68hwBQF4TDatYmeH4M
         4+Es+0A/sCvNtaS+Y+QZZ/CXrSTgOPdh9LyaPVqfRzPyssdcKENauWGho7j0qq1fo7o7
         KEpDc94jeoRObUIf32wgVEr9O4xRyy6QqxzaUq6D39GQqzi+0JFz/8KNX/RQoyRGzf27
         u40NGxHM/x83TVUKq9ctrrSsnlDdpX8eGGzyPWUZq5+Jh4UqMwy4jqlqmvQYkjuLwx6H
         XdhWbXY/uGmnnAj7mvCZheQ2xGAAgiOpaSKVJYgdJpKck+Mu0hZwWpKbTUXFIzq4B+bP
         cLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484428; x=1767089228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Du5Z9snohAXc28WV77Uyy/odjuxydkFuysTzLarmtRo=;
        b=fMB7FrT7WCKmCWMpzj7CvFzzJAeky7NbRAePDKsChfn7qQjT1ouaymuzIdBDYPJcnX
         /7DHfn6ulnIW3aAtPUbb54EMFexzLmIcGdIUBY5nEhJS/RmE7Yvps9/gSt66VUztRoyC
         SRltgzxfpdW/kP3mRHDsu1GJbtx4PakqPFJuBnRTiMAHiCLOeu9+urNzjvkPJoCrA4lA
         QSWi+XC2iqeuyezdQq8rMshqSofzhkkS3yug+h5geIP3oAtFMzqeBUb9vEyGjEVDYJA5
         daKiPPZSNCRe2dCKZmEnjy3lf5hp+XUqH+62138bGAobPPrG4ZRSO1C/I1zl2Z2zsu4F
         eJtg==
X-Forwarded-Encrypted: i=1; AJvYcCUe7lffryaUXhwkdxzQ6cOJ/CfQSe4NHy2UXoiWMe6Fe3RQsmfnmm88IrzdRkI2lGnk1R4RbqZ1dvwRAKDfa90w9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV3GhivhT3/+oI9pmwHrnPVyOaFhsdsvRDNMetz48inSKOR4YY
	L3fVyuKgmeenkMcrMIOQxGAXy356zoLEwzqjnXQs7y0Gqv8Zii2ugAlOOPTf4NrQv0Z2BZv14p9
	5yanuBcVoxMTASh4wKI0aZ/dtqFFs8bgNoBgxi5xWgD40szQdFTT9lnJCpHWVBNy3lfvh3tGUiw
	==
X-Gm-Gg: AY/fxX5mB4lX6c7xDCW1BSGpFZ0FWDfzpWeKyQvl/Gl2D2sB3/90w5vfT0Brh+j1WP9
	riCDBbwdTQ6ojRYsmxzWXEBTtygwRLsJAqo0zvOfmwNrJaeyYtpPfipUlVkX4ucIxF++/9JY/rM
	iDr3jFRU4t4fwTxMB4ZG1qnGR6c0ohUx94RJm3LVmlNiHv3wRIejkIEGuHEOF6teKjZrPwdFqi0
	lSCyyode8oQ6L3OHGHRr9iTxqSqbYuNJz0ylfUMbe6z3z0glU7gQD6B16Vtxy75Io8lrFCgo+/s
	U+Of+/apAWEVF4eqS2bkSz72WSdcqBw3FyZbBepOHJnReKnKiIYk4YBPX2YpBMhSPOJmKEZmMks
	85VK8D2wom4Lr9rads6BKhWNoWJMSt3xf/1gIAwc=
X-Received: by 2002:ac8:5f84:0:b0:4ee:bff:7fcb with SMTP id d75a77b69052e-4f4abca9abemr221858281cf.1.1766484428130;
        Tue, 23 Dec 2025 02:07:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTVHsBl7gHuLA4sPTGJC9mEObuSiIFs0tCZLdNa3Qm5vipCEr5kWx+2CkQRJei/cDzqN46Aw==
X-Received: by 2002:ac8:5f84:0:b0:4ee:bff:7fcb with SMTP id d75a77b69052e-4f4abca9abemr221858091cf.1.1766484427683;
        Tue, 23 Dec 2025 02:07:07 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2724fe8sm339882745e9.1.2025.12.23.02.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:07:07 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:06:51 +0100
Subject: [PATCH 4/7] i2c: ljca: use i2c_adapter_set_node()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-ada-dev-set-node-v1-4-2e36e0e785b4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0JbXOIpZEOrx1UfxFnWPcpRphP3LOMkZf57KPyKL5GY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmm/8SGGLBzQGTGhTcja8llpPIPgzzq4eLmri
 TcVEP30kwiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppvwAKCRAFnS7L/zaE
 w3ceEACSx3WHgq5tFvfjhzXF5VbN14F+LXYUtYwqSQ0lTcNQlW55lMZZjPiDsmd3qdYhn2Hgpuh
 IY8+Zm0SoosQJrRjnatbGJjj+TugQtkpbGL8JBFrO0N9dqNnQWu0fI86lBoHrN6z35e0hDKZyGN
 x42xPk/vc9nTWcHIzT6Nf9puJgb/lq9TU5m5qUgDSAfzQxNoUAgpPmLJdKu7OcJ6DtvWGVGvMPF
 MVa0IbwZzNIVATt89iD+ujhrOkWziFNeOsyFQG2VYbVN/Z1QpVRkc5E0wRRaTXXoealAfiQe23C
 xdUDrR9skR/HJrmFBTRZ+T+6E6qV6QvLIb7ZfFl/xJkKL6pLGef8/RBIYB2SWnJcavSTlZQIAvw
 DDy0NkDP8Q091fR3nyRnWAhJSpSspUko3wmkAl74AlC+S9SmJ5zHQzinzGO81eQZMXzZb9Wbmrk
 2gKkS4KucOkuZC8ZQtEZ8FxdL5K2sky1eOWH45DG1Le1HMuzK9GtU+cEtW9ZOQfIaVbtnoB+STe
 es/ilbqCnfZm4+SJySqbbLa1O88mOYgYqf7c2Utl/jwg83885ayytGlDDKPJWjuMlFx00gj06of
 EojNfHX2JS1G/+pGH/nbehAnFnPdNldQWC/rNLMHYLGPO4MFdQ4NI0+pPtNgXkc1s0dNS6w5Qo5
 jno4DP5BtxpBZpA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ebkwvrEH c=1 sm=1 tr=0 ts=694a69cd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Qef5meMf4vxnS_XW8foA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: lSRrktdIc6DYkgDeh0xACNIUGlgmp7KU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXwdkRmXsBUwx6
 ZR7EuqllMxlkKD/VOeZBOo5w/NIX+oxpCW9aRreRbyPYYtrFpXxOh5r3lgFrMLBoIL204rKsvv8
 qsADk3xQ5HUNXUxQ4Iswib2tOUemFhLwKCZTjtkVXQf4C5bBHoRyOLldrq6xAA+i51VrSWH8DDK
 juBITPbIDDP2Yq/ZkH/vE79hdZPJJZzK/P/UXC1DNng4rhbsuj6RC1lUl+B3aAGJpYDwhcowfxb
 2XA4Oz3AIlGMgbZfBLkrOXyUeWwjVRqGnfaFoY1/dXVDrmUanlRyDKptqN8fq615aTvwq5V5tmK
 Nn7jqi5ym3eRYQOc7+mw/YivbrtaEzaBjgeTXs6+xJ7ld4mk3b+33EoQKXBMtOhhGc5X0aVSUqG
 ozbf+PdHRUp2N12ZFTrrgiR4llR97kbNgVh+S6Afb9fuYOja2svxXM1EM9C3zcvpiy2Ohi7m+79
 +4An+F2YPclTymA3RTg==
X-Proofpoint-ORIG-GUID: lSRrktdIc6DYkgDeh0xACNIUGlgmp7KU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Use the dedicated wrapper for setting the fwnode of the i2c_adapter.
This allows us to hide the dereferencing of the embedded struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-ljca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-ljca.c b/drivers/i2c/busses/i2c-ljca.c
index 93274f0c2d72166bf017f65af797f418743b6a57..fb45019b1a0c583f19bce3523983a79d632da3da 100644
--- a/drivers/i2c/busses/i2c-ljca.c
+++ b/drivers/i2c/busses/i2c-ljca.c
@@ -294,7 +294,7 @@ static int ljca_i2c_probe(struct auxiliary_device *auxdev,
 		 dev_name(&auxdev->dev), dev_name(auxdev->dev.parent),
 		 ljca_i2c->i2c_info->id);
 
-	device_set_node(&ljca_i2c->adap.dev, dev_fwnode(&auxdev->dev));
+	i2c_adapter_set_node(&ljca_i2c->adap, dev_fwnode(&auxdev->dev));
 
 	i2c_set_adapdata(&ljca_i2c->adap, ljca_i2c);
 	auxiliary_set_drvdata(auxdev, ljca_i2c);

-- 
2.47.3


