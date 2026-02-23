Return-Path: <linux-renesas-soc+bounces-28378-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0BekAM8ZnGmq/gMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28378-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:11:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 272EC17396A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 73CCE303F9C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 09:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEFD275AE4;
	Mon, 23 Feb 2026 09:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iPzPn1bF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kq8fF5aV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28A4350A10
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837725; cv=none; b=oHzCBF1imBgN/ksCOU+MzrYm0W2BLfMLy2rGDWCizsAziZtas2rwqfy8GrVRikekd9eg/xSVM0vtGjBkMhjeYBwQKolQ3cHr3mYsAlEwrga3ntPJVeW2txs2jVmylGHQf5bmzDD0sqe5Yh0Vg9BxqTarMr6h3+v17vTdyfabp6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837725; c=relaxed/simple;
	bh=MLTwawtfTpB+fe4bTt16Zwk3NNfXbG15dNLUxdP0meU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fEXU5xVvrSR0xZPkYh9jBN0ndKu1pjmIs/hYitQiiSh9+C8KWhEyCFiUSqPrOL64qvWPGQXuKYSK0IGFJ/vugFbqscPU5BNz/08P2F/0vpxGFsME6AGa+o0wZeSs1shPeNgePJ03d8De3vZMqeoKTS5KtidyQrpk5YGYThOLB5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iPzPn1bF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kq8fF5aV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMQd8C3552830
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NnFA/84aBnN7uyUPE+7AE3QKriks5TgkPppD8ha7sRI=; b=iPzPn1bFSpyvRLDA
	TQClVZ9nft8mRntLzNIls+gk4zWHiOHDDR2ZL/jdcA7b3b1slBcjFEtEKtDla+CU
	oxdfkNuJayH1xbPtslw7dYaUQd6vo5WCR2vqSmUsxgSqXbtYFd158seSiaQ06k/M
	AqW1jwdAPinBX5XZfMAQaSx/pzydmhZGYV8otNAKyPVzYIkv78scR0om3aUXJ2Oj
	SJfvaui2qhnZQafLvvAChLakarNyK6PijxBtSw4ps5xX7ZT8kVc3dk+/WQj8Y8eQ
	1DAQvgSPgvG7+KpXC0xab9gqh7e+tKXnO26BETwHN+e6AVVIXuNyjhMacCNCXAf/
	xrJmeQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8m2h2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb0595def4so5273206685a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 01:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837722; x=1772442522; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NnFA/84aBnN7uyUPE+7AE3QKriks5TgkPppD8ha7sRI=;
        b=Kq8fF5aV6vYxCn3Nrzrq6WWQoMuAAiUmQfQaZZV4X/Nj9U69DDqUmekSncuaicw7wE
         Bum6UJ0/FPqG5NkYz4rkDR8WeoM06qMJ0fmtRtd4akKMvJVJbEXYjTBE4JxW232TKbba
         7m8Jm47IQROvaIQLxufEBXFE5+0CvggUYtd5a5xU9Bd+H5LVhJ5DwYQ01P+DOoZ6A20H
         +WfWgFXC9ricnBeE/IaC4xvCnSO+qrSJb2DYz+dGIKHmpr/QAH5J2bURkuhK4sBPxFZa
         wVptNy852VRYF2KhsSyXLX7+vU9kw9ZxyFCxgjcrMBupWsyar6WwC7uzG/XoFXyCye4I
         gziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837722; x=1772442522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NnFA/84aBnN7uyUPE+7AE3QKriks5TgkPppD8ha7sRI=;
        b=XUWS1HvpR2YBs3lU5+0iT7cBOvReXd7y6z95jmG7jUi1ZvbmxaTSJchfXvr/urE3Gs
         BXxYVjoASgnCeCQx8VnVZelr7Hvv1LUZWglWKRRn/QHingV4mbrciiwFzEszh966oBdl
         vKufh9g6Be8n76GtCBl4Fd6NU7aC7xHbdKuSRdfiFVMCyJK7EveUB/KExs/+hQVxJWsf
         r3j5TcREI7RY+CouwH6IgnK7xJb0yCYcPb8ECiCnm9rUb5LDbNYBbW60CWmjFtsdhe99
         WiJw3TIqoHBAvM0ZULgcJX4UKYC+w4kXJMgOll1Z6szHUQSDvywAmQh0WoGXVAqUagcA
         f2DQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQEp3cSxRXJ1OP7sawTJ12eYhBLNbNDOMNfqNiKjvrjWXJ4xVbdnDuF6pxnuPKk1TBv1o3cQszCaTmqnbWaZS3gQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMIW/FX/Mx8puuxxaJbcT6axgBwhyoRU5eqELYykHHkkgbtsc3
	bumRebMo90HMAgo0XkwY7SQ8RxpBtCsc07MC6JzrJUgvyNZ6Tqa2S497sdCKxur1Dduj/9gBMsH
	z+dhUl2G8nJ5Z6zUuk7gHyTP1CpwWbiKKSa6gs16JjPn8EverCDwM3YFjg8azyU6L35Rxh0i4Aw
	==
X-Gm-Gg: AZuq6aKP3BJJw1HWZ0rAicCOZjrAIl7WA0yPu6/DGgwdo+KaUWWMhcK3AUM244ij3/w
	91cluqv3DVWSX24j4T8J9YTd/6visdDfu3spPEXrKVmS3EfAy3RKmX+GVS+tPm7I1bn/Lm6tF+Y
	eERwDaCNa6FmpF9YHIiwvNg0k2uBcghQjU3KgYXJKklmaHXDIbWsSQL2q9NLaT/zOE5ggg2vhM3
	0y56uaciNJ4fuYROZfAuZhkATEgEik4mxi/6yY2WmIXEUIV17mUXFvdQ7tocGD2K4NcbKI5Ac0T
	9IjOpISB8Y7jAd2nKokbk4Pz545UPBmkpbL7mO1SPEp6rUQb+zUutqFO+hJhnEEGXgFcDfxx3+d
	gR3XWsKkyLCPbcT9/08N1dh2O4u7PO0/1NVEFxrvSlPxsN+AFMbU9
X-Received: by 2002:a05:620a:370a:b0:8c8:e139:b08e with SMTP id af79cd13be357-8cb7bfe7d0emr1621200885a.33.1771837722300;
        Mon, 23 Feb 2026 01:08:42 -0800 (PST)
X-Received: by 2002:a05:620a:370a:b0:8c8:e139:b08e with SMTP id af79cd13be357-8cb7bfe7d0emr1621197085a.33.1771837721864;
        Mon, 23 Feb 2026 01:08:41 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c048bsm264049295e9.7.2026.02.23.01.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:08:40 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:08:24 +0100
Subject: [PATCH v2 6/9] i2c: rzv2m: use i2c_adapter_set_node()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-ada-dev-set-node-v2-6-77018c536610@oss.qualcomm.com>
References: <20260223-i2c-ada-dev-set-node-v2-0-77018c536610@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-ada-dev-set-node-v2-0-77018c536610@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>, Andi Shyti <andi.shyti@kernel.org>,
        Lixu Zhang <lixu.zhang@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
        Hans de Goede <hansg@kernel.org>,
        Nirujogi Pratap <pratap.nirujogi@amd.com>, Bin Du <bin.du@amd.com>,
        Hans Hu <hanshu@zhaoxin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MLTwawtfTpB+fe4bTt16Zwk3NNfXbG15dNLUxdP0meU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBkMUEb/19hSHDh6xvi9sv5JqmHwncoRmAqYy
 o8X0aO7uA2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwZDAAKCRAFnS7L/zaE
 w6ZAEAC8dO/V7JAhY3MSz/cDKWqhyGofDmAMXZwvnR5U0zmfJE5p5uDWye5EjZ8GegNIfkavR9P
 dbZFJUSBRn/49Kmg3PjeHORdq7aLsGD6LVEVLpgRSU2us6i0VpWW6gfov0PXdL8bbUxCbMILban
 aNWZEE/BVAr4FH3CSEgyCwFA10iaQUDkCOPx5KJz79QGdn0em7pP2je73Q48Pv6hVv7M7/Nj+iR
 zNQKJGRA5QuuqiJV5v2vN+64K5o7uqluVbsueEeZAh2wuuOv0qII+hfkmvq0Ooy4beZFizqnLJo
 AqDR5EtPZRjZx+xV+4sJSjSG4XiU1u/uu3yt4C+Zg2hbTnFD6D645EJQr2com5jKnJUCtrW7dDS
 dAftl8YX/VS3+r+2qahyBxxGsM6Ebqe/oYGexk5aaOn7RnV7Dss7WvkyLHLu/P+aSMwmtv+98DZ
 ND9XHuK7ObAdLl4WMB/uHpRwEv6cGSsdjQ2VqEDPyFWVwErS2FkOPf0f1c5b4S8vamAeExumprC
 bbnOwzxRFjhB+WAzrG+opCMmeCh7KTfQ0upxcVSbMHkC2gQK6zcqURyj2yc1mpvBh22BmCWh/Pr
 EBKMHIfcAy+2266hpm57EVNvJmwmUOQgFLccOFhV4verUq8HiRu3BDgiSPdQIJKHBm63fN1SFS2
 dhwNaxi95ERxSxA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: heX6mTKJO3qQeiL_AGUgC1JGddVC3xOT
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699c191a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=yC-0_ovQAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=IpK5jtuPe_Edq4YlPLgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: heX6mTKJO3qQeiL_AGUgC1JGddVC3xOT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfXxXOBsOSFNd/b
 DMtWI6joEslhfJEw8PDdsJIrkOJdDo+0O/R+tIXu2mgSTpeuxJ2R0BLOApranXesUtzZGSWvfIH
 kMgKy/i7AKlaFEOULaYKdIk/KgRih4dDHGqrU8SbOBDdB/O4HDu2A2fneLBWqKkW4dT0b96Mn7S
 4x0X+qjSu2hlE9Hcmw7FZNrKCGX59TjImsKweyypGMhofXRQa6DAxtzpruX0x2AiUkBoNyjDoXM
 Q67v49jLl9Wjf2ht0HxsZgm+Emtw3yA7yMIGHk7je+uQx85nte2FPK5Ba1vOwucD5n50MIUGtVI
 gwkL1i6ISnWUSWg5bJ+f4RdBmdtptcMCPWCP7CEhALuDZBmyQA4m9ehAiXc4r66D7kLAshnI4bS
 WWUo7iZsT/pJnLpRIJxuTHKbklPfmQ7EOz6I7d8sB4qVExvA9bH7xVp7ZZ7N+xDR7lcotyvh6e4
 kuXzPeK8zKMqHFVeOmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28378-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 272EC17396A
X-Rspamd-Action: no action

Use the dedicated wrapper for setting the fwnode of the i2c_adapter.
This allows us to hide the dereferencing of the embedded struct device.

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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


