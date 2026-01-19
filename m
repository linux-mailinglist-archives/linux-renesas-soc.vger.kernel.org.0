Return-Path: <linux-renesas-soc+bounces-27025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CECD3A563
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 11:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48DD9306AE5F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 10:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8CC30C60A;
	Mon, 19 Jan 2026 10:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmtXdM1L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Djc5pMA1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A022D30B51E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 10:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819240; cv=none; b=u+pQIGRLHqFh06fVgGhKCPKsWsqynbfC7OXu7oZW1L72/LRPVbUAa/VOShqIquNLdPIsbLdDmIY2gOgt6f5Qunprn+0gpDIf6WGiq/emtj4CiNUjlOReKoksFPnavm6NdtyNHW1t9jnOQ66RB9l6UIdh1fyHIV570uGxCmLVK2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819240; c=relaxed/simple;
	bh=PbFFIprfToa4la34wmCmAKivaJm7MBQFtk1XHPgSNcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CXkrYCGyjPmAAPJMpQE3OIAFSq2MPzuFmpmVZBHNNobl3kD9EoRAp5J2LkBKYiE32SqANHg3IONRxXsL88cn9OHngiq22acxTcmz68v0lKAdlqoHPFjKtfzA6xyiNATAHYgvMw2aymYEhPeiQXQ3TI205HoRUqL7nh+g5imfKU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmtXdM1L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Djc5pMA1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J9mx0V2965063
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 10:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POgrLMWtUfchu0UFOuGxBxCFcPtR77HVdsAYnI4PI1M=; b=nmtXdM1LuG33ut1P
	Lm7V2f7hk5I3fLWZx2Ma8lcDJ7ZCrv9FdZ2ITnRIwFZ69CBPrK8bR+9cjP4R9Bs7
	bufPn7Yp34AFajEbibFCHuZrxmHrVWMmetjBgVxqp5B4gzuTIbZBAmjc0PnLram/
	Ce6P2kmISeTh741nUsPDtiv8x5EAdONn7emQ5zwDvgzCCrDP7+HHN+lhx46JmOM+
	NLP2MQiy4QX7OB+ycHeaGn8hhKGe6AgKf9UydQ3PaM4zuyl5/kKOshVGJyMmTbxv
	fgKA/y5gjTZ5eV6RiYcjyiVvo8C4yICIccyZocLYI+R1c3XdWbUZ/LSiCoB1NOM5
	WFgkfA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjaa85nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 10:40:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a7fb4421so663299085a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 02:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819234; x=1769424034; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POgrLMWtUfchu0UFOuGxBxCFcPtR77HVdsAYnI4PI1M=;
        b=Djc5pMA1UDkmAxlbW4PDmE5ftsWZYnNS7S2QZ6Efg9YSW/Bh4F40pu3oidsrMiwIZS
         fvgWuZGHWoj9v0UCYJrcXvjete63CrDDnJZS7LNKkzqifxgRZoazfHDMfT1nTt4qEHxg
         GyD3eJPxbTJ7G+45i3+CR1FyVKB+KzCGXTtCPZobQtE4OLOYYnUJomjMwAKA4U30sC3d
         QjAdqwSeair+K3HVLXAGk2aQpNifHX5g62m67VYwSyDKkxZV2pYzYs74Z9gjfhallFmE
         MSeuK0vS1VcNyHe95EjJxD1Md4SLFSb0PXkRKDFwiqjZcXim73bM4KzXxtQ3Z/9xm+IR
         enUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819234; x=1769424034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=POgrLMWtUfchu0UFOuGxBxCFcPtR77HVdsAYnI4PI1M=;
        b=J6qX6HuF7rsz03qMUrqXZebmXNZP2+RtIMsTNqy6WkeCdLoZyaycN6RPwp9dy/POAe
         KqrKjryeikHHeR3k9bOi9ZBJYODv8Vup7Rn5PjpfdLxI3uv2QZfDKG4uiHwj1qyfrl3y
         Nw4sVJV5rS9lqFG74/GHfNokv2fYOH6VCzgm4Auk1eJu46GebfeSJR0WardUVkXPEuRE
         gzqJNlKvpShpVREGlNe0G92ODeR/ezR324/JFvtT1TKhoiOvZGWU+OsthO822Cx9vsm+
         j4jxfDlysyfXWzsrlxBvtvnqiPrVe11pM9s4xEfS6Y35UZNm++frTatjnR3I3gi6DVmU
         NJPg==
X-Forwarded-Encrypted: i=1; AJvYcCWso70iQ2F0pAQsE+9fDVO7qPJnpLteg6raVpJI95q02JwOu/RSisoMZXz+KEbcwFCZoWn+Do52awjIGRd76Fs3hA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmKO9kfeYdcpuQFkzEZqFRc9pw8vysUvxHKfbnexLCPzqw6aNz
	Ep/W5L7D1Wbi5/9YSfBCYfr6/BtUKmO1eAo+z2UcIw/L95YASjUc0V0Ko7x6oVwhG+XoLDyMXam
	B5e7q3nrJMBbPtVWc9OnAi5e86yATbdf6c4z/yl/1c135+if5v/NDfLKZb8nFGLIgz6iIS1Bo8w
	==
X-Gm-Gg: AY/fxX6RuA15rDKPkhbOnckTYK7X65BhtDDj/wDaEhHgihqBaQjhMyLF7EUhP64fNty
	h//gcsLq7RxWOkHpfsd24zHYxJl+cqoVIp0sVF+sxLfLNlhzP5ePz+dfHXL9NWw1QuYXnI3ghtV
	tBeQHSe4Jv+TgYjMwWjtj7g3PNJ66l+tDvR9m/gkFY1oUiSAXJVPo1wQtwnbyQW3MHTGo4Q+VFJ
	3KoKJTNCC/nJKb6yRoUsJD8ifqZk2wNPdgPoQSvUx4+i6f4la6ItSQn7lpYrpa3AkOJtNjpUzSZ
	ohA0LJfK+fMFOkvSWJLXu6gDiOqbGAGMJuj4XCSKjsrBMS3GyenlG3RrsqX47T8fcI3MgGwFgsT
	GmKJsnT9An9AxjeALUPYnAT2wEncz5HUeu/A/Dypd
X-Received: by 2002:a05:620a:31a1:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8c6a66c8510mr1419194585a.2.1768819233620;
        Mon, 19 Jan 2026 02:40:33 -0800 (PST)
X-Received: by 2002:a05:620a:31a1:b0:8c0:d16b:b0a7 with SMTP id af79cd13be357-8c6a66c8510mr1419192085a.2.1768819233098;
        Mon, 19 Jan 2026 02:40:33 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:32 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:12 +0100
Subject: [PATCH 1/8] of: provide of_machine_get_compatible()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-soc-of-root-v1-1-32a0fa9a78b4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PbFFIprfToa4la34wmCmAKivaJm7MBQFtk1XHPgSNcg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgoV9sfuT2VvhKGZTGz6p/Fpn/MdjF0ME6wrx
 zPiggHM5viJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KFQAKCRAFnS7L/zaE
 w7fqD/9JerKCgcU3vWvfo1Hz4H9oZ1Phw/+RcPbdyt6LAUfl+9qyGpxqNKxeCeC13AqyqLCFTU9
 vtgZoPGxKFtxYTTB303D8vGvNtcm15aQQnQZ5qQsCTwshMpaxqWTaW0MIBH7rF4bFIuU/hu2k3H
 km9rXyr2ze7sMGjL2ZdAZbWdq7h4a7rKUOUhB42EBoY/g5t+2Nf0cGItt36Y9VKxVsUrEW1gcTb
 2q74U3LKt5IiGzLIdSosJxMYiLQL/5RPBdgkpB4CgpAhTeeCsJ6MzEz6o+3+svQCIxmIf37+OP4
 eItXkBJF/sBodLXDhni8ooEdyhdEmn2TXQaSKwq8udjKlU02e4DJa6veW6Lh3rgLkksL1E/D1au
 Eb8kDWbD13muh/brJ7zVB8uJD25VlpKrIAFoth/coR3lWabcgaICEXy1M+mPho6+NFfieRKNSkm
 QDLzesgb9UYAXcIDXJ3CaqzVZwimwNqDf/lHjrY9oBr68CdUz9p9Tgeb4O5GWheVuJ1mWY69iIp
 sdeRdFuVq+TjtnzDhJpHq+lFX5Zyi7nQwcJV3R/Ee0FmJA0BIn5iFt5DzBRvHmXjUMG3DJTVlbl
 zPo4PHcd/kCpPn5NV81nI1LKkb0ewtXTDhTXxVyOwZQe6VDeANWOXTxYLGU09Vcap5BSadE2NZv
 UBogRnzIuUXIxSA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfX8Y5S8TIQN1vF
 fDHZhJIEnn7lh07Tm6sZaVIr0pD753dGvHEwywuume82iOaoCTiWefqk18dTNs9Jjzx6mU4z5y3
 +c/LeFBX+5JEF8TF/aJNZy9ry6f6nvC7NPjgo0B+sLTWYRnvzxEjOnQyjWsuN2LbuP6pQb2MIp4
 6mPj9Ekdm2VV2Vz2fpv/E7DRFOrnHbjDSbEa9nJQITI5mt5ZTrjEO3oAOBTXo5tZbTmd4NXFWiv
 CeIP5eVTdkjoHwVJDSj+tMstaYsb2hrCsaMYSMTbjx4a1ZPqvFU/j2mJxgc/0ljBGQ6JYSoQl2E
 QDi+wp8ZVy6G+BTgI+gUPqVQjtDhErhBcsNF6mAyBZocqhVUVra5DkT31LE6jwo7XeydCcF4Kh+
 hbtaY/eykCi6w8M6ImxOG5XYD+65p0re8CaV6lepiJ8zkNjytvS+5k0JsKDvqXgezU36+xcnT5+
 Ey2e+P1rA4M/+wOYiNQ==
X-Proofpoint-ORIG-GUID: j6So7_461uZcubSUHPSanKdoFsarT09o
X-Proofpoint-GUID: j6So7_461uZcubSUHPSanKdoFsarT09o
X-Authority-Analysis: v=2.4 cv=L8gQguT8 c=1 sm=1 tr=0 ts=696e0a22 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=PolkbJsynZ_iw5VFs6kA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190088

Provide a helper function allowing users to read the compatible string
of the machine, hiding the access to the root node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/base.c  | 13 +++++++++++++
 include/linux/of.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 0b65039ece53aa90f30da2420a893a02ab4c6dd8..a7e27d5355929abd6d156b80c52f8f8b08fe6da1 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -434,6 +434,19 @@ bool of_machine_compatible_match(const char *const *compats)
 }
 EXPORT_SYMBOL(of_machine_compatible_match);
 
+/**
+ * of_machine_get_compatible - Get the compatible string of this machine
+ * @compatible: address at which the compatible string will be stored
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int of_machine_get_compatible(const char **compatible)
+{
+	return of_property_read_string(of_root, "compatible", compatible);
+}
+EXPORT_SYMBOL_GPL(of_machine_get_compatible);
+
 /**
  * of_machine_device_match - Test root of device tree against a of_device_id array
  * @matches:	NULL terminated array of of_device_id match structures to search in
diff --git a/include/linux/of.h b/include/linux/of.h
index 9bbdcf25a2b448ba4ec5ddee8b35a105ca4aab8b..75423fb556ee4c108ce25144a0bdc252a89f7d1d 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -426,6 +426,8 @@ static inline bool of_machine_is_compatible(const char *compat)
 	return of_machine_compatible_match(compats);
 }
 
+int of_machine_get_compatible(const char **compatible);
+
 extern int of_add_property(struct device_node *np, struct property *prop);
 extern int of_remove_property(struct device_node *np, struct property *prop);
 extern int of_update_property(struct device_node *np, struct property *newprop);

-- 
2.47.3


