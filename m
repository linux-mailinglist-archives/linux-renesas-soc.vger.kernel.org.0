Return-Path: <linux-renesas-soc+bounces-26049-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54151CD8C4F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 11:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64169303198B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 10:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D489F3596F1;
	Tue, 23 Dec 2025 10:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="anL7mcLs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g/B8ty73"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486813590C0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484435; cv=none; b=R5x/bI/Tzksrb8+M04AGXafv7ESHMCVzX0ytlAaF59kaVDBPjA9K6YANdXUKif3bqHzwfN/sU1HpFyKITCPnrO5mhp8dY8tLEcCICZfioa1rQiUNKY2lqL1Eui46GVfUAwsIJIWRneGPAn3u9wq0tA5hfofb1CRM7krYDoak8x8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484435; c=relaxed/simple;
	bh=QEe6rXC9Y6iF/RxxCQTbWYeF3ive9OROeR31RAjXXqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V0D3rU1Im3W0R/7LatUBmrNl29YpHVkN/BPSHRzxCMg8WzX66w4mFLno5oQH4ZqvbU2+o3TTEnzgLtOg1GUbBkqEyvolwhKMrOF4QZrDM6TreG+CJqzaX8Yns3vl5aBR2cbDrUIpNE5UFavl8VVFIOJIYi74nijP7y4v4uOinsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=anL7mcLs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g/B8ty73; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN95AFf2747598
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kmPmKSLytOEhMc+IL/CBtJ07Zj3xuuST9qrx8z0DRLo=; b=anL7mcLsuHQyLsJu
	LLX70Q27ewhMvgKtalBEJOxxQn4AdNCfFx4M/95tgDj1+hjGzvF028M92usIsrCN
	+lq35oChPF2HtxLw8ZN9q2/U3cneRGz2ub7/e2tSQXxwt3PGfs5bFacod57yPRlz
	Y0qvePHfJ1xg8bCOV7QUPuLx7jlL6Gz5zVr/0WMmTKKD+Y4WFyHePoSBdpeEgm4q
	T1qCihrd5PPSmv1xvKXK41SGusQXNcecvNDhLqW0cg/LLAcKDV5dPwRCu1ei/9eq
	wKq92HZDnGec+uhSTxnVQe/G0p8AIUjN06vZtz+FkaS6g5c5CYFoX+bu3N/Fw0Y0
	Uu4KrA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5csnqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:07:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f4ab58098eso105509201cf.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 02:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484433; x=1767089233; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmPmKSLytOEhMc+IL/CBtJ07Zj3xuuST9qrx8z0DRLo=;
        b=g/B8ty73CKKu4PvyHo84y8f7uaz3yViVHOnfL7BKfaKCULS3GVMKfPldplHhD0dW2S
         RLjn4Yp5NeFs5XxDWuj28WqLG54zmcBak1Xne4vOjf10otucA+jWr9tF0+drJ6Kj33+e
         m4tZRlNas9roeKXNGrE8U2SEPXX4B4d374jF4HhW+IpCth3JZgBtyv08dYt18Wla3Ncl
         ZJ5whEh1yPT0YsISrzfemdVUm0ZtQKkSk9YlFHuTLpGQEkoA1N3srd51rnv9U/iG9jlX
         nRZsut597zBcNmLM2ONrA1nDi+KJ5imeWhmOus64uumxWxtdeM6uCs+W37+/+1kEakXM
         MpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484433; x=1767089233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kmPmKSLytOEhMc+IL/CBtJ07Zj3xuuST9qrx8z0DRLo=;
        b=L2FXe+nzCB2Rvi5kHJqUD+TU+HKpTCjmaGPc2WIVOiNw6JcrX8yZGkiTHs6yvJ3mKe
         Uh49FRpfe+XEI5sFJwnDOAqy1Dp5rAY3ySC+rSA88b5ZOC7Ltibf/czqV8OGhkYcH7oF
         eyY9zqV4RzZvm/Lqz8YbIyXhYLcU7MH7jkj3vxyXrz6885muSTSbladacAVwwQVc3va/
         YKVG+/+LLm6sCHPI8sSAjnasJ6n6ZqzZ7bsE8eh6u7cnQejmzQqahPYEWF/k2aX+EX4H
         5isetGzgotmHj6f8tRXYfXp7IDBn2rC/ukpgGBNX2TuKXxTj2DQoiggwc6dBu8M7td0E
         X8zA==
X-Forwarded-Encrypted: i=1; AJvYcCX+4yq5JrQqQwlkK3/TU/9Qwo2t3tLTF6I5Xvt5+XnVYYaylYTsDUCAi710H+JVzwIg2kxVyIFAFh7KYLCrMvdeWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm5pl1LEld8xITh0wHDjYDc9Wkb6ksL6xTzeUGB4196/93oWvr
	mgJ4fDbC3ef/W1mH4DsMC4YUCX7mZaLto3Zd2TFW4Zg25JMhXd95lipLMHrjOmJ4EPrC9CjF3Og
	KC5YqvTYblQXnUO/Eqbyv8m+v2Bv4X6On7e1BY2gl8JQ1nYh18iA2+3b24jPBZE9rXdxBmITNgg
	==
X-Gm-Gg: AY/fxX4mSR6NOtd6AqoCIdpGw6mWG3hpKHZMfgQriKOXkHvUtFQkYNKx6pqAGZzGu1D
	o9MyrpkTSqHkHIJneLMfuOwC04iNHWzrOBRAJJ96T6wJlgDuKtapQyAcYKIgddau0W4y8bbCRz6
	/VYA2OOg//4H076LlXW6W7pl1eAd1Uvux9uyt4rmJ/Ldu6Xn64NEKR9IuWQ4TOkzzZfXgno5CFM
	W+ASu9OUhEviULvdYC2ntx+RcnGj/OmjGegn5ogI1qTYew+I7yy4Ch2bfhFzHdHhPjrjcFAjpFn
	JzeWzIpxh58RTECoWyvY9ZcA3kMasJJZh6jVIftBQLZaKparUbYO+WxfLQSR+kff9Gx2FlvlnWY
	VejY/WP4IxQHL6Ht7IoatSMhNT49630Sl6euB7pQ=
X-Received: by 2002:a05:622a:1aa4:b0:4ee:22d6:1cff with SMTP id d75a77b69052e-4f4abd0fbf7mr223413291cf.36.1766484432695;
        Tue, 23 Dec 2025 02:07:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnqtDvfs58/8FNPecqty0tpc82p4CSjMOa4gk4+p4JxhVBjegW+JYpFSZ2UCoSeejH6wti7Q==
X-Received: by 2002:a05:622a:1aa4:b0:4ee:22d6:1cff with SMTP id d75a77b69052e-4f4abd0fbf7mr223413021cf.36.1766484432292;
        Tue, 23 Dec 2025 02:07:12 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2724fe8sm339882745e9.1.2025.12.23.02.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:07:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:06:54 +0100
Subject: [PATCH 7/7] i2c: usbio: use i2c_adapter_set_node()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-ada-dev-set-node-v1-7-2e36e0e785b4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=962;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QEe6rXC9Y6iF/RxxCQTbWYeF3ive9OROeR31RAjXXqo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmnDFBmT1nwHZMsX/giKTtNNh4D3lRieG75AO
 rtVkBXEGT+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppwwAKCRAFnS7L/zaE
 wzJ3EACrR9qemL6CF/RuMJoGx7GTexWtffvQCa98cmrYP1Prr1XMJ0sxjiNvY3HmzQqT8kwOs2Q
 uank+WXSwmz+AzyBC32Li4ZTdhaatkM2MbhnRkIgTEV8DfUoVcoiU5h0XEsBuSMxruQ3gqJFvOR
 IXhX0+FT6qCeF/NhyvdGBvSjS/6kLkHoLP1qyOBoKpO+Wb8ZEI8vd5GnI0KSXwdUBmPXxIobuQZ
 8SRVzxKbtK5zS5T8FWEA8At2Mi0zOkLcXSMFAmOhM1zzXAkt1wtzo02IwYVOb+j/VROqUSgLKDN
 ZL5vTyt30do20REFZQo+xWNMvzr3CTt9CeeqS3PGcHQUdbl/rS2ooaDNBxY8V97p0cIBYletGyC
 nU9bbUO9MA/l7lgnwmJorJ65dr73bAASeFs516QEwq9w/ZNyAgTHiZeEnx9QKnkdvDtOx1yM1mR
 6QCtG2fTxUf6IuUx7Utqgz1ao/atZDb2NNYejZbJzrJPHzUM5BZO5vgTcMTpqvIhKwJc8VasVhU
 3IH7MXZ2U0s3cecUb8ji/v5fktAa0/ss5TB5mPLwNg6Vixv5ZzS8fAH2h/wKoZ7vwsbflGQJJvw
 gDJEC2ba1vRuCCN5Ycjz9z7zSikj6SdSD3mXmcNhFKKYvB9jE/x78j4NalrX0hyF+tw9UV0jlus
 i4oRuYiekkFXMmA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXwobf8XudvcbA
 jvUAUUxBige64RRFyW8c3FNnL4YoRoBRa+T3ML7Zp7RYdiacMbYbBz7nDh+c3YKHwXy6Qayriqc
 D/LgcAQzoNf4ngVd73+B1AJtH3moCdOl2FyDMD88FRzLYvQyki5hpOqmVX8u+/4mSP1QCa1cFAm
 /RgvmCyY5/m+TP3i+uFzmQBcr6MnAohb+0vNxZQ8WQYb2mSFXjY+EglPpYLYr9d/wsP5g3MH6ef
 VuzQvtINgwK5GenW+YcE7ta6wjbVNfra8AcvRHjCNOFU8QL/kweafIQ+HezM8H8GxPPeK4ufzxk
 DN0Tych4QS9sSWLLXzaFkH2wTiHANkshDN96aTlx6gqSHTyZPctYXhAApGSVUlgNnxv8VdQ83hm
 IrYp6Yjz9wlIUVCVOqhzKGcjZaUU1QjtYpaV5rRdYJ0MzMRfn/h2sdp/Vz+dqJ6/yYm7pLxNTU4
 rVqeC475n4OMWYY+O1A==
X-Proofpoint-ORIG-GUID: L_iCCkfOObeJco3KmWPLGyuUAFSDWfs6
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694a69d1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=LnnhcGvh5R3LIPVl4DUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: L_iCCkfOObeJco3KmWPLGyuUAFSDWfs6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

Use the dedicated wrapper for setting the fwnode of the i2c_adapter.
This allows us to hide the dereferencing of the embedded struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-usbio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-usbio.c b/drivers/i2c/busses/i2c-usbio.c
index e7799abf67877906c7787235bddb28ac23168077..4824d61fc85d7b23fd7f6a8c2be5809ad9fe2613 100644
--- a/drivers/i2c/busses/i2c-usbio.c
+++ b/drivers/i2c/busses/i2c-usbio.c
@@ -278,7 +278,7 @@ static int usbio_i2c_probe(struct auxiliary_device *adev,
 	snprintf(i2c->adap.name, sizeof(i2c->adap.name), "%s.%d",
 		 USBIO_I2C_CLIENT, i2c->adev->id);
 
-	device_set_node(&i2c->adap.dev, dev_fwnode(&adev->dev));
+	i2c_adapter_set_node(&i2c->adap, dev_fwnode(&adev->dev));
 
 	auxiliary_set_drvdata(adev, i2c);
 	i2c_set_adapdata(&i2c->adap, i2c);

-- 
2.47.3


