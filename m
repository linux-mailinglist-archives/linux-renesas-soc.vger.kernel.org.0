Return-Path: <linux-renesas-soc+bounces-28373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wML+AGMbnGkZ/wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:18:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B827173BCD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:18:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D2B3304E724
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 09:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A8C34E767;
	Mon, 23 Feb 2026 09:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dL/Za5BR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C7QnnneI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1741DF970
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837718; cv=none; b=UOPykiVOQwEzuQixMJIQLfTnUjmn7bMdywy05oXalDXqsgXbOVuy/Bo/62yy/MLDgYNHQQZISW2sFNY3rlEfsC4UphxN54goo3EzqFiwxRnkgN7WzmsO09xFLH9ZLkdXIH4zicoe36S9w25lUoOK5eeardA84ZY4jYqIRc7h3N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837718; c=relaxed/simple;
	bh=kO3CZRW/M5+uqt+4EF42zBuOHZXpdkukqDjmw3J6cH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G0Kc2UI+IvrnBp428p854UGoIOhuZXb/peSBRSqKpbk3mFNsseCMWwhy11UtTE8li8qS0fn3yktDM/MIfHMKllOgVCzToKl33Sf+SOS1sapZte6AfePUzPprbHcj2Xjf52XXvYE8khXzhHATJvna79JCN3bkO3JGycDrOKbcZYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dL/Za5BR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C7QnnneI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N0kawK3271586
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QkNQCV15k1n4PNG/fKmbVth/Edgoros15TZDXRrsNtE=; b=dL/Za5BROt1ZQBR3
	szqvTsLeZdH4utEMEfAoBwMEgTbXgiVAxEulQ0ktfNP/F3js6nUn7wfh0selgrv3
	WUKE5DagFSRoDo5vaPyRou9ZSPNQCiOoBpAUqa7zRhgmQv5CItuoYeF/MUO0r8E0
	PxcDuBKApN6FhDf5j5U7Zvjq2AZSpp1IJRxZ9RIk0hoS3h+EdKUjP84JCX5vk+Zf
	JghyBTCVWhy0hX39fXilG6oezl3HjgGKNaDXIz5Xeqdp+/Sjo6UEMuMx9jVHsX2/
	WrgHXaFccgdnWAlShxkjUMX363IMy+EQDORx2cqeRkXYNSkqB7ezzNHSO+w2nuVa
	pY/BxA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vj41px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-506549eb4b7so541698491cf.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 01:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837714; x=1772442514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QkNQCV15k1n4PNG/fKmbVth/Edgoros15TZDXRrsNtE=;
        b=C7QnnneI5CN29/vryQcx2IrHO4UahgOH+4QYvfs4T8acT3eNotiK7ZkyQbOHwJRYWf
         4OerRWgTbffVdnIt/lnLdAC+7U6gJSPmhSGmhj8WBsubPgvrhgrbSv3fHfd5ZsM5wLpm
         72vHELRx7vzfhDtQ4MNtbtdc2AgySzIiZLVFuhgA3WAJBX4yimQ/pcogdji0rkaPK40l
         jB+PbEhXk9xBDfenJko/QBr0Du4uAXBQ4j3dJkh3c+RKZThqv2kxzNR072mRYtoutgVf
         x/ENRuNn4E+bOmLRmM/NtUCpZACYRG0Uo3KdGO7PTsBzDh9ap1YDOfP4y2yuRectkbG0
         5xYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837714; x=1772442514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QkNQCV15k1n4PNG/fKmbVth/Edgoros15TZDXRrsNtE=;
        b=wFaGtbmqt6WsJ/TM7RafRSqzySXeTuMSLJGcnPmjlWxEjWw0CJX0cXDiF4AWuy2nx4
         noZ/3KbYtRb494zXEWekcLgSNsQFI230ZOSv1whBdj5F82QE56yHTlVDVwMi8iZkiBWx
         4sdeQP+Gp7ajE6vwbE+WP4rN9fRdw0d0K54FoEKOwaD1HTaoqwk85ACoJYBAUWxsUvol
         indBlbxY5uvDho4dmBn8GLSycca3/WAY7+2zlwhX601YoFnmbtjq6pPS1Dq1c0xoVfAZ
         zVymCN30NgH2RpW6CzaZydou2gK8Po8aiPNVvdtUDXg155BRJjc7Cx/gW/yyABNWSyZx
         tGkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQUQyXt7nLpPSyG25AvgVzKWS1S6Eoh0MFYnSBHepjA8ozTNIbppMICqvivlnsA1HAXuqaIQ/C6aaTm/Bq9pnCag==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNaAzf208UoSWjbuU/1M71PQhYWa7pQFwBAbi6gz4W5MEofGdC
	Kj4H1UT4AZBRcfrePV+XjXc904r6/TokoCiWl/ZMYz9bi8gmrY7pKZDhFlBoJnq0TSEq8CLXr7w
	TUec33mXfaXAoT22DvosoWSBPxaOj1ZEQo5HgRynP/+WVsV2lgW7QX5JCtDqpii0Z9CHGvrQAFA
	==
X-Gm-Gg: AZuq6aLBhfedM8a9fMUM3P8eyhnuM8AHB77Ycth6p6OydvC1Pmmn8HqIESekDFFZNzU
	CsoLgc2Ceavjjd5KgEyOI8fFdXBowY5ex6r1MQeKmdJ+WLSEC1ER5Wbfc2/Y4ryQlw9k75FZALA
	VbihlGuX1sC27ZuIFcCQJqJkseMeZxeC35qxn9r9NVbVZufK9dP6nnkVxHpKQynDg3OX1bgM1Ue
	UzCno7lzSh/uJ3zquWq5xP0I46CwB/h/s5atyei8TuB0aXY5fw55EaqhLw+Ki/bIzpyFeoMVpsk
	oKHblwiCbkhC5S3fY7OIy5UoPkxOvcPhow//KY0/ESt1WJSdYj8e69gA87O0fUVxpksLwQc118w
	XcgSbEHdzcAw+plqgHMLx0KXoN3rpbo0gdAxS7n9tqUq+vp9pyXCL
X-Received: by 2002:a05:620a:1a85:b0:8c6:a5bb:f464 with SMTP id af79cd13be357-8cb8ca80011mr932891685a.66.1771837714561;
        Mon, 23 Feb 2026 01:08:34 -0800 (PST)
X-Received: by 2002:a05:620a:1a85:b0:8c6:a5bb:f464 with SMTP id af79cd13be357-8cb8ca80011mr932889485a.66.1771837714053;
        Mon, 23 Feb 2026 01:08:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c048bsm264049295e9.7.2026.02.23.01.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:08:33 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:08:19 +0100
Subject: [PATCH v2 1/9] i2c: provide i2c_adapter_set_node()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-ada-dev-set-node-v2-1-77018c536610@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kO3CZRW/M5+uqt+4EF42zBuOHZXpdkukqDjmw3J6cH4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBkG2zPpG8Di466UOvtYxyfv63pDibnP3vKb/
 0tuNQANP9WJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwZBgAKCRAFnS7L/zaE
 w0asD/0e3puICkKbF4SdUNpc/i1iaNevfAiKRUqumJQoNae+cW21yghL88N1k+aNV+XBPVh9zEy
 nyd/K6n+e8XBPdGmAoNsmgafUNq+yJgztZzvp9LdTiX1QA0O4aRuC3YcQq6keODHFUjUYDoRjuj
 2+FP+LyBZ0Aay2AQMJ4YJPewItq1fR9HN4q9vvRdrwquw5qaz+avyFUXzt4SN6VzrttCRKPMfGb
 1R0EigxJU3JBAMUArdeNL9ij5RewDfWD7uyG91Q2lvrSWMeJ4kkKMSNaf183KRWDpS7nhXHPWZi
 NTsSLt2hVGMXEHYUTw+mfkYzcLmYylP/nFcDKysfM1uKi2kk3j54Ohy7CfFnep0+PVSyN6AJNmL
 cPSgg2dJh5iBLd8L4JkTgwU/7vPtP7FONXQH/qrNhqxECvtSE61RigSNgM4z7/PalSJ5AQWWXVI
 6F7lNKR83iK+cjmzafpPOqef7HuclurQA/djNLx2C+ZZNq/KN531tAcqVBTCHbd2vhhmSO6xCkf
 zrAYm6QGGcoS2MZqFKHBKcB9A26glg18qjc6YKBISwDilxZpqYhJHyX/M4uz0hdYTZA+Iao+xvA
 b94pcHKwTUL302EbVjQ9JFVlrOUZlKcQ43q84ZuScPhsKYRyjH2OGeRQIhwzbAsJ+WvEmF/PipJ
 My5i9NyJMh0PWSQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX7VjmnuY8i0Ux
 Cycd3MexVZE0aumBsQiAVAs+oxWh6xEnowSZ2iVJjZNRwGc77CpZTHMXMy/NvyZlwSTX+JRXZaF
 /mvRjXvTeTvvPK0RVQrAQ6Px5hZXYMjcllrQtAvCBhst19mKwm6Syye4v3wSnc7mwDAUyzsv/Yj
 9wniOfIx8/EhmGDShS3uB8zS46zvTx9iJPY7RuXr6szcf53OixutaXLwTD5TpgYH90mU4IEAVoo
 rwlPchb+jYxiPEyRYFNj/n7TtVb9hwlFd74K7/2m593VEfzTF+MCVi2uIvug4Z5uNjPbJMK3ykF
 S2M1hqpJJjLKjFM2u0RNv4yqw3B92kSBclSJi2tSAYVyOrpeVlWSONLkE7NoGnb3xC4pCsGJpsD
 mz2ZwUZBDqI0hAQ344VjfLNPEHswEYzkhcENN7aWqT6sJew9q8nuHoTt66YVYh2/gF7r+V7esCs
 dQRCqTTDQJgO0gDIVgQ==
X-Authority-Analysis: v=2.4 cv=T5KBjvKQ c=1 sm=1 tr=0 ts=699c1913 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=IgsMUyhKevcMw2BC1NwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: rqKgGZ7TT1AN1vJbm6-32Y43wzrC69cn
X-Proofpoint-ORIG-GUID: rqKgGZ7TT1AN1vJbm6-32Y43wzrC69cn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
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
	TAGGED_FROM(0.00)[bounces-28373-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 4B827173BCD
X-Rspamd-Action: no action

Provide a wrapper around device_set_node() that takes the i2c_adapter as
argument. This allows us to hide more dereferencing of the embedded
struct device as part of working towards fixing the object lifetime
issues in i2c.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/i2c.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c85ee1665395c07345faafd8e2fca..38448bdfac671adcdf341adbe2f52341e5aec41a 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -29,6 +29,7 @@ extern const struct device_type i2c_client_type;
 
 /* --- General options ------------------------------------------------	*/
 
+struct fwnode_handle;
 struct i2c_msg;
 struct i2c_adapter;
 struct i2c_client;
@@ -778,6 +779,12 @@ static inline void i2c_set_adapdata(struct i2c_adapter *adap, void *data)
 	dev_set_drvdata(&adap->dev, data);
 }
 
+static inline void i2c_adapter_set_node(struct i2c_adapter *adap,
+					struct fwnode_handle *fwnode)
+{
+	device_set_node(&adap->dev, fwnode);
+}
+
 static inline struct i2c_adapter *
 i2c_parent_is_i2c_adapter(const struct i2c_adapter *adapter)
 {

-- 
2.47.3


