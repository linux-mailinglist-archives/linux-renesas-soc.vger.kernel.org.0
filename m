Return-Path: <linux-renesas-soc+bounces-26042-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5310CD90D3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 12:14:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F21F3046FBF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 11:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36D493587A9;
	Tue, 23 Dec 2025 10:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UHL1HvxQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J2OFlZRS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DE71D5146
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484425; cv=none; b=vElK/zXu/ESBoDJwLb5CN0QgRmSaZZil09BkC6TQl9R1yh2nLc4UkVkVdjNskgb9+YE8yUBVPz4ds1nVusSNTEHZwTjOTXrJYM7mmpVLT8fqD3oSs0aXXWeQPjUUCy5BXzMl1uB67WJWaqXTPr3WgLNydhKi99T7EaW8eHVAzI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484425; c=relaxed/simple;
	bh=4liG80eegRKzVP6ub+S13GEjrdWbxD9v62fLqSuQW3s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=osvTOUDSQzygzNLwk3ngp5FWheLYujmFqRnJI0FvvvCi1PAuUjDbid/l0hf8Z///hNWl9De0sXxCL7F67be99AJtTSkBek2zLKeFq8rRurvcbKRn10p9iDKQrGo+gFkFOmg5u9yRs5TenVZWVd3aeiJY+Hp24Ykd4HERUxeFL+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UHL1HvxQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2OFlZRS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN8goFW2748768
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BpGzdD+YISdiozYSnlIYG9
	jIT6FuvbT1k7YyC46Ff+g=; b=UHL1HvxQ+FDjIaC6Z0CffS5N0D5s9D7lqJslOJ
	yCBLJyqe/P4TGVRfm06/ErzKTSmpHWNKlH7gjQBhmnXk9y9sK2elCBvzZRAH65Wh
	BUuDUQAuWULZOOfhN8fp0Qj3gyTNk5ljw/O+wwJBcIOX/aRlyaWPu3pNP6NkI08t
	ttwEBHgPfx3uQptMQ8lXUU//RaUPlME2IK+lV6TwpVdU3srpLmXEAAmN5Dlc1Ykd
	kTuSKvFkr6Vzm829Rv5LXcfFJcKLAP9nm763IK2y8CtaieyBH53ASF2DW7XIO5QF
	b5s7gLa1NfN0ATbg8RMgGRC6ggZoqZh4iUd8WQEJFXhpJDOA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7h5csnpy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 10:07:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed82af96faso96328811cf.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 02:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484422; x=1767089222; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BpGzdD+YISdiozYSnlIYG9jIT6FuvbT1k7YyC46Ff+g=;
        b=J2OFlZRSlaqtBwAZ0Sf00YGDwhjE5kFlOeU1A/OPjY8/U/O5Mkz1zSfEwAHIe6wRtF
         QsRROWoqkcFPufqJCEoCDjDrs5TCWorx/Bo8pDBzFcL0+fh7YF8vmSzkIkLGCuc8K7BQ
         LI3AOYE1EQ//ig/Zh9dS7HGvFPvnf64sjtKmq2cQJ2cMyZL25D8He+WmyN9snLa3wI7a
         cGn3Rg3sVAkYvTGS0G/svKFBre/eNQp47gvY3MNOIILngy7R828QQfVvUOxuN/zxotE0
         ffBiTwbgJOvITf4qxYiHR/+ynPwqv+rTvy2aoY3rIhwAehxaYC+SkoBdLXWFsiphvdMj
         tiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484422; x=1767089222;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpGzdD+YISdiozYSnlIYG9jIT6FuvbT1k7YyC46Ff+g=;
        b=f7JIq6sf327396Nti5+W1F38/HcMPBXWGBvFb0+HbBgBMBDZmV8Btrts9OCxlfrg5n
         ICV2L/7u4khiGRI5ryS8VBGu8X7I8+8B5bGyAjmt+hBSUwlV+uyGO7laR4tKaXiSYYgU
         3ay7oZwdaIJH8W1xREEu3p6TeDlFeHhjASrviJTuQhb5rQ4fu6o5PRtBGRZIUOVBLzCv
         xmY4WoNqIPJdDnYpXbCXqQXeIrXpUYqTHYI5zExpPGjMOYkFEeyDs/NFDS79O4VW6+6J
         x2NWFc5bGVa8XsQ9vUE6MipH5FJPmdWY861W9XeORkH7Yc00p2eeYI4e6ko6SC0YjM7R
         GTmg==
X-Forwarded-Encrypted: i=1; AJvYcCUslkOrpISERRPTnU5ZQZyoej3EaqlESqT1oh4I7s4/0Rrxq5xYtnc4UmxHzCfAHzvrLAbBEnamxS7CvedfOThRoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxX8tDi5fY9qJtwqpWtX0FCX4/uifJdS4h6cFR6LBk9xuYo1VOt
	7YKsTAzGE3yZdBB+LqGB1sOMzTNp2khtgNHK90k/XNwTjjpXRoCEtjtuzEuy2APdNBxAYugY4Db
	fmlvAn6ZULlnqv0AGggE9Me6L/9A0O82HOzCCEkKZPUiET1v314apRX4jQsIKcZLbNTcm/Q4lfQ
	==
X-Gm-Gg: AY/fxX4LfAFCrvbbLoVyROh2WB5cFSvq8pbJ7R9BMQAYGjc8f3MD0G22vkFoRKh2Ow1
	u6M5z3ubS1hYqnLz2s0UQ/wvMwtAeuol/N+IPvSq0YAOYbSKNC7cth/G4udi3dQ9m00mF8n1gM5
	bhLbE1Q+WdDCbWxAhi0wEU33DyWuA9xtMqYRvnDBD19TgWDPtarZrYv8LOGACnN55GnfqYz4tbC
	Dr1OW/iFgQ5quqm932RzxHLeBlkJKLimMaUaAFKK2Eer0AWi0D8+Esafh6n7nK2R3RQTpHmyH/j
	iGqJfXlFuAUL3OEE1OWqmcOke0Yzw8//cwr4AZdqvROCdEZAU+fV9l3doJ/VX/NbWUZwSKuObor
	F/c95gPWP8S0lo5hsUmBlCby7aZQcPhABzG0kwuE=
X-Received: by 2002:a05:622a:4c9:b0:4f1:c701:f7a with SMTP id d75a77b69052e-4f4abd9dd9emr203244101cf.60.1766484421652;
        Tue, 23 Dec 2025 02:07:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPrdTFHmzURF7H6QqrVoSNh9xbxAyykUnF8oZi9AVH3uVmB6xUj2hW0seRMzCEHn0zokdwEA==
X-Received: by 2002:a05:622a:4c9:b0:4f1:c701:f7a with SMTP id d75a77b69052e-4f4abd9dd9emr203243871cf.60.1766484421253;
        Tue, 23 Dec 2025 02:07:01 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be2724fe8sm339882745e9.1.2025.12.23.02.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:07:00 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/7] i2c: provide and use i2c_adapter_set_node()
Date: Tue, 23 Dec 2025 11:06:47 +0100
Message-Id: <20251223-i2c-ada-dev-set-node-v1-0-2e36e0e785b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALdpSmkC/x3MMQqAMAxA0atIZgOaYhCvIg6liZqlSisiSO9uc
 XzD/y9kTaYZpuaFpLdlO2JF3zYQdh83RZNqoI6GnsihUUAvHkVvzHphPESxY8d+FMfMAWp6Jl3
 t+bfzUsoHafdBLmYAAAA=
X-Change-ID: 20251223-i2c-ada-dev-set-node-0636a8d3666c
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2287;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4liG80eegRKzVP6ub+S13GEjrdWbxD9v62fLqSuQW3s=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmm7u43pvUKXsW02la4OEt23/V4Tk5e9vMe0r
 rBMFPRMkJmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppuwAKCRAFnS7L/zaE
 wzIeEAC9DYy50U09jVGCQFLzL0QLtcZIn3g60Zo/bdfOKkTXKZy6fvO3aXEiXXU8uDN0u9cWRNS
 Uc1i6Z+1gc690+f2ZH6UUKIz4Ce3Mtf+H0iNOpIpuQvbXk/XVfTuhDusWWDP/L1d53rmBGK65al
 2wDx+vgHcXVBsmagieF+xNsbFBPc+LNWQxAUkEwqkLN6bPyOcLTaacY4MNg0zlgWro/BB69apXk
 Hsy3z1y1dTv1d67kgHzI8pEShxLSo+s1UuFM1AwTCYN7TIcaTmGUv613fvdYTze1SX/puo29Qpi
 K/gio9y218vLkEcMYIUsqFZFdr8ojekxl1ekCSl+qg8yqWTjqfwA9hf+HC/3X2IiIN0ehaIWMzX
 CMbnGSDEo81hFzxErokrcDnFBGrUJDsVb5wjqgTbxNLrt76kICr5kQg/8EXts9CGyhFY/SFcZIT
 y2mAq3kMUV7XYpTKV/l/w2QdruEEw+cy58CcocWkKXbnoQkkwKTF4N80dbpb4sLSDnhTA6uZMgb
 /dqyEOZgXKGDXjnzS0lIY77H0oaCTG7M/yw3lJx4WWKSahxfuIuVdV85MxhspthcBGv8HVh6e5+
 DojJBUuHy1VPhmEOeWas4cNIO++VaHgkvQ2zvwJEhY/Vl75EuG+bAVtkE8FbUOUDK7HX6+UuAHx
 +BVszrRvC5pNflA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX7SjCE9eeUvzy
 VC71WjjeK8wo1Dg6WzuECMBC5dtdS9sOooqLOGPseu8ZtijM8SpiBvx/jfs2KrcrYRIGQLVtO7K
 arDzbqKtgtMPRzTISbf6swe1L5HeNY0ScpEyKD8RykicjQZ4eCqjvyxycUgl0JdGeH5Kf50Pf/g
 phHp7DK+1DPwbcTkAxTbTBlIaPDzxQE2fYgk7Vn/uj0CuWJZquOQi/Y9uwLRoexNS49BxC9+hm3
 2Pr1ggSZvhXWGz6bzjlx/KIC0QdZx9Vnoz4ipZKfquOQn0YTQ+sK5r94cUPDeYE8NqoP4FQdqoz
 oiIqgkgkVq56iRwvbyqiExZ9wP05GXKqdWcbyq4JPD/qqWOSzD4a80EEq+1JtkF+vwpkM2Inbty
 r/1L0eWtWrJKAsM42b/RF3WaK0wt2ZjRz/zPGeNBj/s0xJENqgkzx0c2rG7MxELYL8LjfivIpDp
 WBFSVTPc2IcUHYYkgBg==
X-Proofpoint-ORIG-GUID: BokLKLRWqA9yD1V8uYZyihWJiQc4pscz
X-Authority-Analysis: v=2.4 cv=LeUxKzfi c=1 sm=1 tr=0 ts=694a69c6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lUC9hMLxrJuMSK10UuYA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: BokLKLRWqA9yD1V8uYZyihWJiQc4pscz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

It's been another year of discussing the object life-time problems at
conferences. I2C is one of the offenders and its problems are more
complex than those of some other subsystems. It seems the revocable[1]
API may make its way into the kernel this year but even with it in
place, I2C won't be able to use it as there's currently nothing to
*revoke*. The struct device is embedded within the i2c_adapter struct
whose lifetime is tied to the provider device being bound to its driver.

Fixing this won't be fast and easy but nothing's going to happen if we
don't start chipping away at it. The ultimate goal in order to be able
to use an SRCU-based solution (revocable or otherwise) is to convert the
embedded struct device in struct i2c_adapter into an __rcu pointer that
can be *revoked*. To that end we need to hide all dereferences of
adap->dev in drivers.

I2C drivers use device_set_node() to assign a firmware node directly to
the struct device embedded in i2c_adapter. In order to hide the direct
dereferencing: provide a dedicated interface that wraps the call to
device_set_node() but takes the adapter as argument instead.

[1] https://lore.kernel.org/all/20251106152330.11733-1-tzungbi@kernel.org/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (7):
      i2c: provide i2c_adapter_set_node()
      i2c: designware-common: use i2c_adapter_set_node()
      i2c: gpio: use i2c_adapter_set_node()
      i2c: ljca: use i2c_adapter_set_node()
      i2c: ls2x: use i2c_adapter_set_node()
      i2c: rzv2m: use i2c_adapter_set_node()
      i2c: usbio: use i2c_adapter_set_node()

 drivers/i2c/busses/i2c-designware-common.c | 2 +-
 drivers/i2c/busses/i2c-gpio.c              | 2 +-
 drivers/i2c/busses/i2c-ljca.c              | 2 +-
 drivers/i2c/busses/i2c-ls2x.c              | 2 +-
 drivers/i2c/busses/i2c-rzv2m.c             | 2 +-
 drivers/i2c/busses/i2c-usbio.c             | 2 +-
 include/linux/i2c.h                        | 7 +++++++
 7 files changed, 13 insertions(+), 6 deletions(-)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251223-i2c-ada-dev-set-node-0636a8d3666c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


