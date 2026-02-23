Return-Path: <linux-renesas-soc+bounces-28374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GECBNWQbnGkZ/wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28374-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:18:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E73173BDC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2D6730F6339
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 09:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB1A34EEF2;
	Mon, 23 Feb 2026 09:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PsaBrho2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ExYXdqzr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6F634E75C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837719; cv=none; b=UZ9rB+yZXPXBTdOty129epvRwYRbA1TeNL3E+s1GvCWMP+RN+qByTGLHWnzeiSflOIMU+QCERmSp6K3+PwNs0DQhVERBB7mfkpYeOSEeeM4vd2ztidCmcD++tTChM8Mt5srXtqnRVB8keN7sEk13U8+a5q/5QHSE+aORdKYpdJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837719; c=relaxed/simple;
	bh=yCqBZlvfTojyzqPKINIhZxu0iYl01Le6puO4cMwx6mY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LA9piz+OCp7BZy+WmRnQ8eQin1HhQqMeXlu8mN7V/Uv/7u+6Y2FKzURdm3AXC01CzoRdPpY0/ZUDmn7EOOhkr8RKP0vQhZAhXPnlVln7xRpDCxovWhoV20ztQSWmlN8GwaJxtgqT+JzvrUA7Q4FFXNiVGuHPRRLpNOJrfcfHTvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PsaBrho2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ExYXdqzr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N933aC2080266
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WSQc+voghXG+egrbqQFmH2pPQOgAnp6fN7Los9wvsV8=; b=PsaBrho2snziwUeM
	3Oo1EvCJkqQU48Y4pElZSkh6qlzoakVLVcGRTNOaz8PhfNfovQMwkiV3QuMCt56U
	lTtkUc9buGvDVQkR95KxSlO9g3Cxb4hKWqQQpZ58fDUVjDt6rrQ+Sl7AzuKaMB9Q
	wIRYlWzBOR4ksIDuwy4EbaelwXvyK34BLHNI89iVB+34mwx3CMY5fZnW2cHUCbrQ
	2yXwqdwHJ3gIcu+HuUAE4xWyMfqWKuEszyOKwJttO/dTQvXf35SSTVjBsUvRFICr
	3S3gc46lMseG2gLLxB+odZTop+4P1pdjGbEw2md8W+sykd5LvkERQoMOxRaOv4KP
	p+0++w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3v25n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb4d191ef1so591274785a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 01:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837716; x=1772442516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WSQc+voghXG+egrbqQFmH2pPQOgAnp6fN7Los9wvsV8=;
        b=ExYXdqzrVUuQRBKWEi+CREWQOOBtZ3B6OY6ljFekBFt8b8U/89920h7FdBwFKbFD3d
         GcHwvWsH/zTogcuHsngH2E9w/MJUh4leQDp57tgTe8njfaxtYxoxDcOjVUPN+MKnOQFb
         p5bH0jTfCxvUgl11gpWCF3bcy0KT2SOboJYkpse28ZjhqWYkmMKOd+kuFdVXwgjiS2t3
         xB+zWvPyYNLozv1NMom1J9Ca5RdE3gQbMFufZLqKHcxVGTzAMPeypli12ayDKjCq5AJD
         qPjNXgVKP7Ql+wjCxZCkzeqTXc7HGMVEfI5/6YZgj85Phx1a3dVImfppqZon/L5cDzyM
         lUeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837716; x=1772442516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WSQc+voghXG+egrbqQFmH2pPQOgAnp6fN7Los9wvsV8=;
        b=sD//7YFgI67+gGUvQE564q6+7I3N2U04RbKQ682BIf8/qCuBBK/9Bc/QV8K4VilrOR
         lkKf3ssp4kaYbfOx6sy9aBVx7SEE8X/GaE6Cr4C5T9zJ/WbT5AwLCj4Yf50ak+5XS5wW
         tDQfTQ4sCGD120AFNM/zR/rmydStdWWz+VKyeAKhLvxcx5iT0Js4Tbv5xtl4O1x1jvdx
         WuGcwJdy5QKgOG1+iZaEhLJV7JBhoIaTNkxtcemXCuNhbYaTCTqan8zmuLZRC9a25jLv
         XgbKIfu1R2uMVIo98FOUcPJYHishw3776x+EIf+ThQfErZnaWH18oyCTcp8AAyPYMOg6
         xLBA==
X-Forwarded-Encrypted: i=1; AJvYcCV5vx8lxBvV9T5RQNo7YB9lqE7aVncGzyrwSbW6R1si+emhclHj+Jn1uFgW3UwoQ8uvpL9d9I+E3O2UfDa1L7ykEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRjikYtNvO0ZyJW3h0D+z10qMfQuJpm+SqLfNJrlZaFHqijsAi
	TPaxGabEWIEOdKxTBSBzuvk/kzCLQqxA+6vwMvHSYUByYL+6RKxgm6E39ZZz7Bd4sEUpWf98RzC
	z0SQT+Y3rRCotpp+VcrNE4mX3Vd8zfZZMsB/2UmI9Tdx4WPc45bFcak+DfN2gWD35qvvCHBV6zA
	==
X-Gm-Gg: AZuq6aItoCKaE1P0zZ9Q+Brib9Bi8Dq830seZavoZcLDsrizNZ1bLKIq2yvnyVli4JL
	fs4psYKFzvxN0UO0K9SQnFNxd40mtm9YRDx3E8MY0VXUBv34PHBchzSdMQvL9ce1tLQr217RBG0
	NOHUEB1j9RrLIKV/WHOS5LCc/aDsBnOMXZXgXoXRPcBw3WPxSg6h5wukiogyV6oLLuXYOlJSByt
	hvMkR/eSnbjtXsCkXNo/DGM8Xb3cSiprff+Dk5iYHWXbsHwmlkH7BpNmhoF7/SUa1aPgL9Y18Iu
	iziJwNJkbX32WtsUiOmkXlB+79FnPHpSXSYXKdHhH3YjMFW2oyRkYl4ptja47MoYWGy+XSQaJe7
	nkkVhTkGuPWoJZvtSWjBtpSx6sbC5PrWme7ififL8NK++4Ij88nZB
X-Received: by 2002:a05:620a:4416:b0:8c7:9e6:3a72 with SMTP id af79cd13be357-8cb8c9cfddcmr962674485a.6.1771837716160;
        Mon, 23 Feb 2026 01:08:36 -0800 (PST)
X-Received: by 2002:a05:620a:4416:b0:8c7:9e6:3a72 with SMTP id af79cd13be357-8cb8c9cfddcmr962672685a.6.1771837715665;
        Mon, 23 Feb 2026 01:08:35 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c048bsm264049295e9.7.2026.02.23.01.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:08:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:08:20 +0100
Subject: [PATCH v2 2/9] i2c: designware-common: use i2c_adapter_set_node()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-ada-dev-set-node-v2-2-77018c536610@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yCqBZlvfTojyzqPKINIhZxu0iYl01Le6puO4cMwx6mY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBkH5ixszgMsJSWyggENfQ8Rb8hEEPtBX7zdK
 w8lvpjXJ4aJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwZBwAKCRAFnS7L/zaE
 w8hUD/0diWfXcFUQnGcdSVXAUpVTzKEt4L01fRw9Txrrm++fRYDM+89PIKFJ+fPigm1Yd5UTyxt
 jiBnpGjhxV6nxergOVM2w18ased5EKDFbgiEssbCLShrPq3PmazSWzSlnoj9Nl/bGt/1GiNLbrd
 KzyFv1SRMSq4Sk0BoFFI0TQ+nCXu8An85A5xCwFR1xi55xTYlQGkFzan9XdUGlIuM/2QwHmG1kP
 O3QmP9r+REL94Fznmwhpl2Tds3Mwiu6EwR6tW6xhR5oCNNL7lN/jVWbQUTP7SEGbJYkvntipjpO
 EkxdvN6WdbVUtK+mtoNFg+O2V/sgsIV6BW1M/Vc2NSSY6iceC4TYqp5knmVwF3awztFNUUMCRPb
 vfUvQzgx9gqhnvtBrgRUKK4o+DvBdLqOomxFtERluXRoT7Q2onw1/ZunKlPfWyNXfFc/r+DKmAO
 QfDpgvPlUs8NIXQm5adBLaeLJDv4hCxa70i0icVdYfOilEEfn52lhUOF0ER/difCA9n8bAqh7yp
 YwI94nLZ1sJ2k8Kq1uHbbyimS3l8OXiIv0HbXrdv5Ct22lfB7YVhL2iy6jWf2OoqZUDjkUlay1O
 l//j+dPSplPCfKtJwcMQijJFPshxB4mZvIH8MSznrIWYuIFg3mABXHmVhmjLjze62+CSVzyQxCh
 aj37VlJnpyhhspQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=699c1914 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=-kqZBCbCPCnDthpcomoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: dswMauCtOz12liXW7dpx6XVDfgq5YKoV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfXzHjQ+PMMN0EQ
 Ma3YU100cnuxG8MVcP4j+AagwNbmA+dUzqg+2NALXffGjeOWEYcMtrgbJIou1Zfs7R5B+Qd0+Ks
 +9sKJ3xMFJQryrBg1xjswnU23dFCsY9nkTVaB2gV2N80GrnMzfLEWGUg9HN7VIEFenEtHsYkbCd
 kKUV/BYnqUeJu0zlP9IyUImDHdHI+YCh2MSXfKkLxP5PUBuoMvZ45bwhGm8lyRzZEDZsYzbEXTn
 eLzpDoYSSDc+xSM1OnExJ5q4SuU760x3Uvg5lPqGe5BLmOLsabd7MdkTg1cecFmXI4xdc4iv1+x
 Gdh80t0p/Oc876riOjiAIXa0tV1WDn8P204FwpEKmTO0kdHZkJdyH4lc931gHjtrmfzd0EmpNBl
 Fmj6uOV+BHs8MuxqzeLuA+xMxr2bEsMkVGThR4LUxaJUjlfpVmHpdK6GrphnENuUf3QsS05PDci
 w6B9IrsMUHemHFHucuw==
X-Proofpoint-GUID: dswMauCtOz12liXW7dpx6XVDfgq5YKoV
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
	TAGGED_FROM(0.00)[bounces-28374-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 47E73173BDC
X-Rspamd-Action: no action

Use the dedicated wrapper for setting the fwnode of the i2c_adapter.
This allows us to hide the dereferencing of the embedded struct device.

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 4dc57fd561703bc12a0c40889841571fd2943e70..3c761c4d818c12eb9721893d43a443374b8766d9 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -882,7 +882,7 @@ int i2c_dw_probe(struct dw_i2c_dev *dev)
 	unsigned long irq_flags;
 	int ret;
 
-	device_set_node(&dev->adapter.dev, dev_fwnode(dev->dev));
+	i2c_adapter_set_node(adap, dev_fwnode(dev->dev));
 
 	ret = i2c_dw_init_regmap(dev);
 	if (ret)

-- 
2.47.3


