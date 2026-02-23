Return-Path: <linux-renesas-soc+bounces-28376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPasFnEbnGkZ/wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:18:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BB80D173BF4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D7263053098
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 09:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA575145B27;
	Mon, 23 Feb 2026 09:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mw8QNWv1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ArL1rcbL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866101428F4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837721; cv=none; b=lK+rrBhtZwf0MjUyL5zrqJ5oei/eTRq+B4p5gllEagQXRsGQkU3Zihs3RfbZ4OBnDSAyFJjslwjc5SRwi/JCLmRZCRMPgZPCdQ2ZznKhJrrsLBqW0d/KoqjAoMpJpDX6ahKJY++P1eDBceLggmkTnMn0+SS611yfiC4tD4LeboM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837721; c=relaxed/simple;
	bh=l1b9VnhjLxExoERgVTRD6HsqRNSjoAW17j+UY5k5yGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F6oqCYm2JCdnukpjOCjMG5bO5LzG4oMNZZ9CEvE7Y/yEPBWcziwRKQHeLf7bVm6a09/wtvShidh8PQQIEhU3xf3YZy9ZBV9RcvmmvMZltUAiA1OgTosbr+/EkOVcUGpnGDpQvdDoba/OibzXMIXHXGUe42KvOK9CHvnvgx6rXZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mw8QNWv1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ArL1rcbL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLEciG2079023
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WOz/vj4E7EAr5A9KF64UM36whlEv+sowffhauzM8bYA=; b=mw8QNWv1oqp4SAs0
	WP9bsnY9d5W7ZsV9wYxBGedWsRU/3bcRq5KadwlRYWkPmRtfWy/H7x4oGsqUq2VD
	In2AN2TBRF7V4BkLzXqFpwRMzN2eOvmr1j+xUW6UD/dZ0KddsQnrJLr2HKtNcDnK
	NbmuTAsat+xxhpKRijLRQQL9lC0uSKwxhh6+4tvtjv5T3oedpf9TKHf+PqsY9U6P
	HXO/UZOua4HrqF/+soYLI1QCtQHGfD56Pe+/+PcyVaDi+a41uP4bDbQTnX8fdrsr
	/FLl+cLmi323y9G+j84NgQUU5gcESdSWnDkRAADC86E9BSCet6yCn0g3RFp05M7i
	RyPtCw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3v265-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3d11b913so3829129785a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 01:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837719; x=1772442519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOz/vj4E7EAr5A9KF64UM36whlEv+sowffhauzM8bYA=;
        b=ArL1rcbLhfg7Gi1IJfMCf3ciEXD1vY1ePe9HWyqr2LKfcIl1ibp/yclX4g2TVRIexY
         wP9Tol9JW3SZTRitiA8PUkbt1UZ2tm8fUicgZZA9blb/8weL9C3FqpCybwufGkWZk24I
         uGjwLZ7aYKvXOJ/f82b0cf0RGTz1eThwPyO78asuEa+EgJLfp9uuO2r0kAvR4XZFGZ02
         p6JbrOOWZzvHf4p/SI0K2JID8rHzqb41KQgHlfwsIhUl1gCGR7cbX/r1stmN/YkpQJnr
         p+VNd7/b4g7n2RV3s6TI8kvPY2zQowGY0GGQirQ9nuJzysqicI5T32ykCT4sS8o0/aKB
         SAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837719; x=1772442519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WOz/vj4E7EAr5A9KF64UM36whlEv+sowffhauzM8bYA=;
        b=Pb0lMCjBWTSpxhvirEUdeoxJ0WEV8iqKeyMqhYNRParTpt3tF3kJ0MKLkyqGkMqggE
         D/+RJS8k8K8kbpXOBeIL7+9nlPfDntTKj9Zxr+3i1rRZNkp4wB7+/D3AZZZA9JX3LWMD
         3ssVa91HCP7DLwh04BgQNIB0M/j0iMW8NJ5bqKlAEgSJSCmFfSHylb3nAI83xmjcoK4Q
         n/L9V2ZtewhBMv4yTS5FS0p9HkWFh4T1zOQoSfIbmaKGHgQbvx7NFOEMJVOLg4V3mBlO
         6P/lINGmniJwUGKrTwadMQAhwHzstXfHSGRgTR0L+SR6bGnPrn1i4H9Fc/pA4BLCQULh
         sU7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWT/Hto2Fk1u+l/pIZd0gUq1YqEjaF4s/OMaceJ0MBVpkLTH4QItbk+ONCU+cS3BgQttiiSvViZv6TyKLeo1gvbw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+gHIAz3rO6y6ct/LRdu4hzg9YUJYGCdgN0VGTzeZVK7jtmqeJ
	5q2+Sxww337xApPXKLw3sWIIGxmuP8SGla/SJoIu0+Mlr8Xv4g7n2A0cN4il/1CxyWYlh4Tqhtw
	XLBMn290eGoOUOEtSLXQjLkW9i6Dv0SbUzDtF0VGcgGu4EJpONHyxVCc/cLnyVZcQd98ph2p7XA
	==
X-Gm-Gg: AZuq6aLSEoI5kjVG+vxiv61yPahfCdAXdaNroMpwwtY0jhw2V2cocTL6sLeNH9xOlrP
	FcZzQY5bjIsjz9kbfsZaBmSVbQOs8lDimyXcvEpPDm7xDYGhLFDeQQnBoFfhcki2KSREmSHUf+s
	Ig0PJRJGnlJjTKJBxApgFwPbSdEplwDVC0Sw1U5+Vrh9Apgu/szzrpvyDaTT3ApBNsVbVtASAF5
	bTrH2Dj0SeLQX4jvtmMFuSrMUiQKPcu9Jm2W782+xvyWR3dPTXxkFX1PSn+INgk/oABb5wFLJIV
	JGspF61yv29H6JS5do66lJ3KytAroBM/jtdcnNEzxVnr/IPNjzoQYMepdhWXuLayyxF6SME/2dW
	dzwwgKkndG4lu2h5v7xzRZ2ZxsZytKqq2Vh9zZODBCEdDQ8ZgNuPL
X-Received: by 2002:a05:620a:29d1:b0:8c6:e8f6:2c7 with SMTP id af79cd13be357-8cb8ca6e5f5mr949119485a.38.1771837719005;
        Mon, 23 Feb 2026 01:08:39 -0800 (PST)
X-Received: by 2002:a05:620a:29d1:b0:8c6:e8f6:2c7 with SMTP id af79cd13be357-8cb8ca6e5f5mr949116885a.38.1771837718513;
        Mon, 23 Feb 2026 01:08:38 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c048bsm264049295e9.7.2026.02.23.01.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:08:38 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:08:22 +0100
Subject: [PATCH v2 4/9] i2c: ljca: use i2c_adapter_set_node()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-ada-dev-set-node-v2-4-77018c536610@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=l1b9VnhjLxExoERgVTRD6HsqRNSjoAW17j+UY5k5yGM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBkKnpZKBA71TcPK28qqvWtEwInm14uMmpc1T
 jgbj9McdGSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwZCgAKCRAFnS7L/zaE
 w84VD/0QSUNOcTSOUYuT8uZb0GQ56hLcF0r9pjAmNXFkzLbKYMfmCwjsNUZ0ZdVPO2zzsrNkBxD
 UfRXQQ9oddBGQJZd2nsJP9/H4H3stZ92FHMYlM+5Oucaz9unnek9ZC1MoZ0u4+tZfw2RSh6CUT9
 oWHiHdAkpEDkKQgR4gkvYm+O/f+nVRcAXGlnpye/FIymo/v53VTwyNTSCAlNPCE7g5k5rOIBS2P
 PzbrhMs3LXlf+zASckmE44dsSMhPY5oqNC81PtZVBBENKHAiKo4Iwd1RXTXMW7mLxWMYuP7b9n1
 g/tXOnTOJW01cJnLlExPHyDrfronv8qgxH8XpvGLJxrJkyCj2dXPp/MEEGUfYjIhtxic8fH7jsg
 cHcJ+ztHIz8rHSQYXrWMg+5WyDHirU3wtZ3nLI70QGG5ySGlGpg1p9z4TOFRv+ZlqpWbcU1Sgn6
 /Ya3yFiwyD/lCxW5eGXnbs9s+c7HCZ/2EbKvPt10Gg8SjdDT0GncICcKdQc9UlSLNXDQvIcC4m/
 Ci/kb3WmhxQwlMY+JnkxBpCTn94VyJLchpZq/IHuukIoANMVlwvDGUjGkUmKqDuXGvOQsWQ3bb2
 V3gxwaCa1O+6yUyMlAID/8j2IS3TKZcCuslng2E1SLtk9tuKHA2+daqY6TZk6IeNxwBRVX4O50F
 zD+eKIdy5kyPa2A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=699c1917 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=gbzR1XxPnI4f3MEL7tkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: fHZVqk5LsuLicCk5FjIzJfTSzrI_k7Z6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX25U+bPgTLIJs
 wHQUNdytenpJJt/pzOuCVnDuIDeo7FDQXjO00lyiQUucHEEQp55BaxxjjFgraS8/wLvx3rJ2CKD
 mvjuavN/Wf6bKCjA+URvWD3SuBSDjBfG/SH9/IaVOYPWcfzg96WpY70l2kBUlMRDG+fgkFhmu6N
 JKfNWg69qUflnEQxKhXOrKjUevkvWNPfb0UJOCQ6z3gjWRuLM8sUTf4lBESgVazMUBdg4KHYaQ4
 PaZQqBA4pauPZROqlMQ+Kwnwsc3H+oeHYdQDw/8MdIg+NjUpEXolwRTy/LbrYxmUkU2QcUKL60v
 jQyZff79lgOOCQVJBhZuDXI5G0Hoirih4E3NvpiF7U1dqwvBYAJtKII9I/iXF2tR3/3OUwFifCO
 8YspwSD8Lr6bksomvjbHkUn5N9YBM+omGv1rBqr1RK75HkTbsaQl521mPsorZ40sodP5we0zvCS
 Sa2kk5rQ969PwNXXa8g==
X-Proofpoint-GUID: fHZVqk5LsuLicCk5FjIzJfTSzrI_k7Z6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28376-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BB80D173BF4
X-Rspamd-Action: no action

Use the dedicated wrapper for setting the fwnode of the i2c_adapter.
This allows us to hide the dereferencing of the embedded struct device.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Zhang Lixu <lixu.zhang@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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


