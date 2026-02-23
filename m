Return-Path: <linux-renesas-soc+bounces-28375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0I8qEWUbnGkZ/wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:18:29 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B88D1173BDD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02A83305DA2E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 09:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291EA34F46B;
	Mon, 23 Feb 2026 09:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ckm4iia5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MM/yr7r1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD9134DB71
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837721; cv=none; b=GymVoD3wLVGkwZGfEZhp7rwS/eBuQYCO0v/VIv7oOlpbG6RYSvLAJ5hh6OvLKfsnNFsrD3gQ5zVPH8o5t2v/JQujhEMWYNR0QPxYg/ibdtiC9znzhEcqeGFIArT1kMKmHLr4mtyh7RKzmOeev3SVnoBtVnzBj8feFn3TJvbUZno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837721; c=relaxed/simple;
	bh=u+/H7vvdEZ7SOFMMJDpO4mOKAWRFZzYVzUxPPEI9/d0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KFKupT9U12g9HREB3teaXDv1D36NyrN+/3kETFDU5lMxFFUVtITlNU5kLoU2ByVc2D5GkJHD5fESIbl5UEdqbuxqkh/YGCU271s8i7D6f5A74JbVSN2x2I9dwPkelc0rRMLrNwLXqyUos+4VRTmKvZ2g9y+Z+rGMUTEmYqkow30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ckm4iia5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MM/yr7r1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLvitK2163668
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gzr8T4jw7dnU/hiz8xrqCKbqW3AVDFoI1XEyASSfc78=; b=Ckm4iia5m4Wn8J1X
	ecycJ/PY+73WCckuel594gzkA1nXC0qD6NL8Lps7e1BHdEF0Y69ejtOBHxh0/qT8
	VTQM4sTA4c+ywh527RgzQE0zVyBlGIwrFztUjuW9Xelknk3AVB+PJxyf/OqFBFI5
	mliW9Zf9zTmI9FJFwIM7fMWNd66cMrukD3NBYuQJiTwX5+PDupWKYbcFnkuBPrq0
	8fdOdkoiG1Dg1fbGaYdJftRUaSvQP7BFYDN1TKBL99Y/pnys5bE5CmtMFumDCyCr
	v3aj0K3T1sHMZ5voqmwA0/M4CivjZlq4/5obYdF3GcP9lwbPEvOQyriU59a5tZX2
	5Qerrg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3v260-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb706313beso575966385a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 01:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837718; x=1772442518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gzr8T4jw7dnU/hiz8xrqCKbqW3AVDFoI1XEyASSfc78=;
        b=MM/yr7r1ql3HJmzVQspw+jrmc6HxTavWU1aOtuHOZWITU8eNXhHQj20yHD6f+Ekp37
         MVu7Iyr/3HUqG1q4CG/hCsM1UU6VZnCYaiiyxtw9tYX70FwbqLBOr5wM7kada5TEybZz
         q2+gdabvglxkOCHuq7RMsgb8zx9ZzcZ8ZP+xegQgDbhQwD1z7YcmaAtBwGhrdwEiar0K
         EEkzgbrSGXayMFQuydYJqBPDPEHnzxzymvW+IHeFI0EBGil570P9m12axs90VHgoznl+
         E4qIkqqUERP2ki57bPNLQlDWvF/R1D8vOXAyXpdRJhG512GZVZyLs2A8g6k5Jrm9dCxD
         yNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837718; x=1772442518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gzr8T4jw7dnU/hiz8xrqCKbqW3AVDFoI1XEyASSfc78=;
        b=gJ49mv4AeIPVfM24C5LR8JzSxBve328/Jtu1fXGE9DEmLGFjbmCfDCvxta+X6F0nRl
         xx8kTXhq1BKTnBvKv2wy1/kAzsIgfrvNbuO07+u4Yu3R8fKnVHBsABWnYDTe9v3W5Izc
         /w/Q/sdH9Ev/kiK4Ij8H18eebfQdxT0KET8Qk01Sh+SMgS/H59k5ThFSG5ea4R8DydU8
         HeyKk0D18icTDaT1qjKxQ11G2G5kxvjZsvFOsGqEX3pi4PwNj/+6eXKDQAFrldWGsuha
         +sbqDL4gpmaPp7T0/pDrXS/0Ht8qk5h3jtTU3ZPSzyp6tcZe8HQCbjKla40FeVGNv2qL
         lpqA==
X-Forwarded-Encrypted: i=1; AJvYcCXD+WzUwZgILoiYNNl2MSieEW5oLGMR7fUi4FL6GsiVy/ByyI6WBIFy+gSoCwl3eLpOwE/6tR265zQ+xRcC7do3XA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx755xB/JGNKc+OAfkzjf9J60h3RMr3jDtOnD3QbbXFeFUZP9h2
	YcDOl3ghzz52XaRTfT/DyoUxtc4EHlmS0umv6FOSnSMDKZJyW512oMVZFzM8ze0ekSN42iisK3x
	foks1+227S10E2xnfTaacV8TfRgR4YxPAoYc0tFeqmzqLZwrh4yRNDhUYyXyo6qVeAbkx3Jv5qw
	==
X-Gm-Gg: AZuq6aIbAjUsuGNy87A+FMfSLDqJQWxD6OQ2+MXQfz/i/HApI38L5OpyO2RxsDznjAu
	B5oFyuLUYJxxmQ3K60B4u6Ibw2gljMeLf6+dI3/8Pj5MGTMC+iFdd36UUjNtWLYQoMlp9M7UUOP
	EyGudV1W8cMULbHJq5jbT2CkCga2wBMDlT0QOd6bmgcq6xHWEWtAxNPiAIOqtflkhyUtR0Gz6Q0
	47IADgMAsbC26JOcFk458GRUALOh5/EbxRdvSuTsd3UOuW8XVbxkurUm0UgzloEMeElFTLOZagY
	280hba0oxtNTxeWXciy267out6wQMU+83Itoc/Q2K6BnXdgCqE9HwEZrDH6+ekqVAG9CIBALE/H
	hCMG1XGYc59NoE9D/19Zm3o4syVRT0vdg21ghTv43a9fZ3YIMX30A
X-Received: by 2002:a05:620a:1990:b0:8b2:e51d:610d with SMTP id af79cd13be357-8cb8ca033c2mr959138385a.32.1771837717715;
        Mon, 23 Feb 2026 01:08:37 -0800 (PST)
X-Received: by 2002:a05:620a:1990:b0:8b2:e51d:610d with SMTP id af79cd13be357-8cb8ca033c2mr959134985a.32.1771837717244;
        Mon, 23 Feb 2026 01:08:37 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c048bsm264049295e9.7.2026.02.23.01.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:08:36 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:08:21 +0100
Subject: [PATCH v2 3/9] i2c: gpio: use i2c_adapter_set_node()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-ada-dev-set-node-v2-3-77018c536610@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=958;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=u+/H7vvdEZ7SOFMMJDpO4mOKAWRFZzYVzUxPPEI9/d0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBkIpDTW1hMpAJay8n5Gt3+s1I58uU5eXv3Bt
 8xudrjHBgCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwZCAAKCRAFnS7L/zaE
 w1MGD/9+0JhDgmVu6hd1Y3r0aHR8ruMviPjCQb8fCTCB8wFihQKj0JKzTBNveVY43pc4jWuN/mU
 oEKhznzlJqwvcNM8JbZ5HiCaE58PSTn8lHJkUgn6y3c2pJuiw+4wGjIKnDpX5TknLD0yWtCSNn6
 BL6kbm8wXvXPZj2LrwBjXbRFPGuNpBIRFluUjyo7dy1EGdR+bhLq8/wyem1AxQuhNlbtpTxFNRy
 Nvbqjiqt2QsAtiyZAktUK+z9sYfCmPSrb3xVIafwmnNqDDpg6qx7g7dJnMT6pN+zzLnzZ0FHVAE
 flK3spR99T3u0Nwpk4WVjLJ3eOY7Y/yvMKQ3paS+EusdVX8MynRSm0E9YiqZ/Klzvu3d/qWz9Jy
 +DxWiOpmXCNS/6UoXBecZAw2vwvvNKCfIZlOaxYEXbY0M9SO33pbBiSvhLDQLGYWj9CGMtzrPpd
 C0CbnQ7W49AND+7V8rE+m7imh1zkZ22+YzKCqW82Etix9AeZYCswo+wLicAUO/KN1qi013FVJUe
 jl2apOgIuNymkMum7lJ17227jUnCW1gUs/DQZx7Zj8qoaIqlm/+cTiXjlQWywQF6ytQtai4fQHY
 heHzyE1eSmGsLYdxscEAfrtft29oIx8RIhedlHSSJgMHBG5kdV94pvigMH7WgQKde8slcfkijFc
 tYlHDVeumo/Kgwg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=699c1916 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=pE1K6dWVpd1ae5t8GSQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: p1CxkgSvB1qy8_86QvXV8lN_bMW-9h-f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX/SbUjhMgETLi
 Bn9lCstMPazjlMvZawki+0wbZ3cAz6npGbmM+/k84Vz4IWuVFWGInRZjtd59O7XJZXdWXpO4NU5
 ARHiVVHp2SwJ1C/tesIx19Ap/WS8w43YkzKtpOrSgEK0uwfu5bybCwpbBytrUSug9g9m93fdKUI
 jKR7UYiua+NRyR8kqiG6sZ8TgT/twJObzdwzmnr3tHkan+ybqAiZ7f8d6O9j/z/Hzqc5qLLFXWv
 mgwueubeVYdHJ2jNsgxHUOjpZ5iNedpByDWZtBg8/CBMI1rg+Hl/+3Y7jVG+HdK+202LYOWz6ve
 6ITI60A35LtWji/JlQHVsT+/6eUWQuiBNpOJ56n+MiGXwwg6wmchS7QzTAmoZaVt5DRaxdUU4/e
 gFUjOOizVOZl03L4grtMgdGFuiK0v8wKjdeukppHEfmprVadykt/BCi1MUTBouIudfwHngwVIDS
 2Io94XI5jZ1FU/1yePg==
X-Proofpoint-GUID: p1CxkgSvB1qy8_86QvXV8lN_bMW-9h-f
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28375-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B88D1173BDD
X-Rspamd-Action: no action

Use the dedicated wrapper for setting the fwnode of the i2c_adapter.
This allows us to hide the dereferencing of the embedded struct device.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
index f4355b17bfbf15c402e71096ccbb99f5a35bb479..4984736969e1bf2d11620772214cb13ceb411b6a 100644
--- a/drivers/i2c/busses/i2c-gpio.c
+++ b/drivers/i2c/busses/i2c-gpio.c
@@ -426,7 +426,7 @@ static int i2c_gpio_probe(struct platform_device *pdev)
 	adap->algo_data = bit_data;
 	adap->class = I2C_CLASS_HWMON;
 	adap->dev.parent = dev;
-	device_set_node(&adap->dev, fwnode);
+	i2c_adapter_set_node(adap, fwnode);
 
 	adap->nr = pdev->id;
 	ret = i2c_bit_add_numbered_bus(adap);

-- 
2.47.3


