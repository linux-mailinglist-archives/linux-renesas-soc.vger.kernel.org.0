Return-Path: <linux-renesas-soc+bounces-28377-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id z795BHMbnGlF/wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28377-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:18:43 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D705173C02
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 371E4305FD96
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 09:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EEF63502A4;
	Mon, 23 Feb 2026 09:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZttGWUyR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dATDcIrQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0473C34F488
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837723; cv=none; b=HixyCOnSwrhCs9Z7JnQ3HxSP4X5cNgvdPbnqFg1HBEhulUKf+nZNu/cNULDX2MKjvxVrEdHqReQdMcGj/CKbkYLDBFu2O2aaIalL+DKosxk8n7yCTgzesJ9iB+0Af7JdHBbGe/Zpl9e1phlQJNpbWVx6L2PblrrtOQlCYQcTzGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837723; c=relaxed/simple;
	bh=lhh1XUvOT2XreGeQrFVf34bZU6ssRCyS92Vi0TjtFb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VuPMTE3ctrRQfn69q+VNOkpJd8xOyhJiwlOVgMk6c8TI2cUD4DU+y2vp/sMwuqfNiVGRp47JpZhDt6j1H5T+3h9JvCvbT+FHnyDb/VGPY5jRhedJhyVPBl4UJztKsfsVHatRIiDQ+y3H1c9407Js0Kafn4Xfjgk6IeHnbb+MTzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZttGWUyR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dATDcIrQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N6Pqwi4109490
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sQUxT7XJsbvxZ+x0oPV7h39rYG7SgszR6ahsxWDopDw=; b=ZttGWUyRFAqr5Bns
	1MCA/to7IM7nOXQpYSMcOWfpa9yOfeToK3Dydor5E/PQaOu++n0NNV2h3U/lraQM
	FLR0FvYNtDeE6i6zFXfop39cZir5PHBeE6kZX5rJQFPqZjmH52CBonZ46BnJDrkN
	9z3O5qcUsV70idFN0sZ2kIrq7mZOUqggH5hJcEMAWH/HG9dMSRytzjktne/jBZCl
	NAncnXQA15/F4Ox8PnjcaszA2/qWB4Ic/zYAVYDSQYadBXJsSGlE53m6/iujAWHk
	vtZBdzjA7k8LAiLxe0PSQXOQ+TGoRpVq6dpXpVA8HVdu0OOLe9AJUJBg+ARIGtNC
	Jcrgvg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5x7v42e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb706313beso575968985a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 01:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837720; x=1772442520; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sQUxT7XJsbvxZ+x0oPV7h39rYG7SgszR6ahsxWDopDw=;
        b=dATDcIrQtU1ikgBF5l/yQm3NZmjWmfJP2x6Gn3DvShNrDJyrTRsbEyUcOqAbhrqUiG
         7cGWmGNaM5HaC521fwZYxzNyMvO9AHQZf9O+7IQl15hzt2pZaGmANusx5bOVzzpsnnzT
         YPK3eHBt5rTDFP0uIR1WmaxQeoMxXwm7HRtCdH8jZF0MHU0Ydkv8hexTxc5i6bESDTD8
         UTDkhy7FjVKqJxeVCBYiPvGbtaJiRujOG1pjFMHhX/XYELNTBYLQL9Ke3O3ZU/EIMfji
         uhgkjcPzE2e6NSAPELuurNad50+CGcoJb6/Sjaz3dOVi0Ni0Z8TFSpBi7YGY4iiksqVW
         5Nrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837720; x=1772442520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sQUxT7XJsbvxZ+x0oPV7h39rYG7SgszR6ahsxWDopDw=;
        b=CDhJJOwDjwmJJViHFFwPju9mRESbq+Qjrue6iR2trHJSOoOkt8KgJ4dMeC4r7kZPR5
         LMGT+PiZ0OzJkYv/Gm6m5DBQmLErgAIU2VAM57SIpHaxJb7yzi6vEqElG7WtoTb5b+eY
         eqkFiIe23lQcmjjs6Xcj7uyHYxu3GhWRcedP83XJSWYVpUwFgj44pRDQouPUbZSBMe/r
         xu4Gg5r5It4la9MRbBr+qKZ/YuAmj/XPZ+jLdI4grRa5r2LujZAxH8BZU66FzO+3IobW
         JWPOEW+Ivh3LDgsMBFJK18Gkm6Vggap2Hdoh1XeaySAV4r+SfWGCNU3jC9qJ5uUv7Bsl
         cw3w==
X-Forwarded-Encrypted: i=1; AJvYcCW/5b2tvP9JV0tkyrEb3kvxKSSMHowKGeRH2XCj9qivVVt9IYwbWIXv9/MzcTTnsU2ZJVduMfjvjTYW+XDiWgcZyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlFmN83W1dQE0fPqmDjaEzhym9tUVwOnBlqmYnfb/SbigMCFC4
	nUCW01T/6zwXmtyzicdv3emPM+jPskTmlzuSypMcPAPlfCoPr4i1TF+LNctglsrqdZSZ+HP7ReV
	rCvf4FNH5/9U9pznfxiVhjXGQRJGNXB6tyfRYz+vYkobb9R/9cMO0Wm4t/kXf9jETpT+ULQXygw
	==
X-Gm-Gg: AZuq6aJYKRdnsEnJaOgSHZDrL7p07nqDCwmhyfa8TgoGqkr7BEQCCoOroRCSivzZkWY
	OVbRFhHPoGSZTpmDo/3dyFdLOLRenoULaz9CJfDQzYLggJAz2P4GxfZ4Cu5xMTsgrX5yUWaWWy+
	WvA1n+Ddp+Rmm4H9Vx+mvlg+buuYPRBgh7HdnSzCCjnAya8iPQwabOPw9KLdT7+0JAhsFJIlgWm
	uCu2/dPo5s55+BN10zHZ6mP+2mCwhE8UYdk0I6e8gkLcfKPTUZnEWg4gvZaOwHJ2k/q3lO9znaE
	sG76JgkMKscCi8szUjSEytKNiFFV7TlDbbOMJck9urig6ZHy6PZmz6z8fybaE1lGJLFjE/UrW0F
	gRWSHlWgLyubQw45D3Qu26PlUfLwwcJmkhWf8aezD91yb+BlPsgxh
X-Received: by 2002:a05:620a:4150:b0:8ca:2cf9:81a3 with SMTP id af79cd13be357-8cb8ca65d75mr933763885a.40.1771837720343;
        Mon, 23 Feb 2026 01:08:40 -0800 (PST)
X-Received: by 2002:a05:620a:4150:b0:8ca:2cf9:81a3 with SMTP id af79cd13be357-8cb8ca65d75mr933761985a.40.1771837719883;
        Mon, 23 Feb 2026 01:08:39 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c048bsm264049295e9.7.2026.02.23.01.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:08:39 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:08:23 +0100
Subject: [PATCH v2 5/9] i2c: ls2x: use i2c_adapter_set_node()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-ada-dev-set-node-v2-5-77018c536610@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1101;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lhh1XUvOT2XreGeQrFVf34bZU6ssRCyS92Vi0TjtFb4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBkLlxyhAwXOO7J9iLEoGL8nZnYMHha4TmGCj
 XPy2dIFyWuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwZCwAKCRAFnS7L/zaE
 w17hD/40rCYXKs2HZJs5KrjzzHBNrJIHndhHBf6LhqQoU38WenNySFbu+jwr3VKqBtdaJyLc1Uf
 MIfOLKLBwUeOiTYkfK876Sw2h5RACn+AC9zQqXNL3l2xwK3IK9uBNwsdUjsh0YtQjr9QHviVbBm
 H4IYYG8BXWyyFXIXOGY5lIqo7eo8ds4rHeOE8dLC7R78ZpKsD+kMOv6QtBXNRPirfvl+SRw4QhK
 03rFKL4DsLlKd3oYD3popJcyJ2hIEWxHYR8VvxCnx8AxZxuIVHPmSvuY++yvMa713lOQ+f9Bd3k
 Em3pIDyUihqgqcL5pW00vFZjARv3unU734N/bLtnhUM73ks5H4nuxHt3KV+64Zk6lKFSusAo9/E
 Q3NWicLssPK0zNdeWJnCPOv82nqA498PlsrPCU0CX/jebYlDV5t/eDi18uZ2Wvd+TPAJ1ZFcj42
 sInKf5DYwQW7poebO/NXsZhxTRseU5zuBHCEqL4h2FHbATCuUkvFsr+oYQgrC1iUA62Eqh6Gf89
 G3jrJNMnLW1Z8/7H1cT5uYQIzm6bCzCpI3pPb73vJWBOWFQsZl6hl+qnVOB+YcHkD1gWhCVxO7W
 Grw/qpVo24a3QgeH9W5gpc7EhT52Jq0uRA/u1udb6m4gF7GrG0xGq47xZO8NxRkUC9nxuvMSPNP
 dKIZPc3H8n1GbTw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX+I8HfQoSV6HB
 VKJn3j3H3SjnB/GWkggfYqUjeRjUFbXWbJipFQARY4vVTuwYWSr0A9gkHi4FXO6VNZucrBZCp6E
 wEGEF2z44kiGDjbo0mj2S7qDnPWF0ITmd/mxj4LF1YEzJo2aXHaC3FX9T2BG3AHcVPcjEQ1qYuW
 8wJTfsKvGz3cBXD3GBM/LUd5UivRsAJZDAZhbhZj5unnddqcatNIoxXqU4QiHONqK2froPVgqRl
 H9TwmkN2ZDeHaAQPiHS28WQSz8Vw/dDal7Gnb56e9PAgHbLd6f9nWfjrt91lfk6Ihbt0jgWb28t
 tP/CKF0izp68tjO/sy3jeyfLdr0vhQ3j9PxBFRne3qp6SPNLjrrjdmmQF8tjr6TjBnpSgDkS0RW
 7lUqIIfN1444ODDjQVjUtwrOU8dbJisOVdmvQnjnWan8JRc8pYcLFxSQ3eHugP83rBJQDeL2Jwa
 oUyJRFfbpC6W62rhAaw==
X-Proofpoint-GUID: HWKyWupWNnDfHg_O3KG5eFEU3M9iNfw2
X-Authority-Analysis: v=2.4 cv=X71f6WTe c=1 sm=1 tr=0 ts=699c1919 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=e8V8pJN_GwanwSKoVN4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: HWKyWupWNnDfHg_O3KG5eFEU3M9iNfw2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28377-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,loongson.cn:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6D705173C02
X-Rspamd-Action: no action

Use the dedicated wrapper for setting the fwnode of the i2c_adapter.
This allows us to hide the dereferencing of the embedded struct device.

Reviewed-by: Binbin Zhou <zhoubinbin@loongson.cn>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-ls2x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-ls2x.c b/drivers/i2c/busses/i2c-ls2x.c
index b475dd27b7af94a22537f1000e95606774d6c7f2..217a55d7d90b2e515ef33e9014263958d9258b00 100644
--- a/drivers/i2c/busses/i2c-ls2x.c
+++ b/drivers/i2c/busses/i2c-ls2x.c
@@ -312,7 +312,7 @@ static int ls2x_i2c_probe(struct platform_device *pdev)
 	adap->owner = THIS_MODULE;
 	adap->algo = &ls2x_i2c_algo;
 	adap->timeout = msecs_to_jiffies(100);
-	device_set_node(&adap->dev, dev_fwnode(dev));
+	i2c_adapter_set_node(adap, dev_fwnode(dev));
 	i2c_set_adapdata(adap, priv);
 	strscpy(adap->name, pdev->name, sizeof(adap->name));
 	init_completion(&priv->cmd_complete);

-- 
2.47.3


