Return-Path: <linux-renesas-soc+bounces-28372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDWpJLUanGkZ/wMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28372-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:15:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C449173A9C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 10:15:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B7F47304EA78
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 09:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17116145B27;
	Mon, 23 Feb 2026 09:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYwMG4L+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Da520Obc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE16A35949
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837716; cv=none; b=ePq8G7cmqiIxemHbJF9xk6AoXrUTd/qHpUUVnqno7USZOwn0bhXVEn6EfLjk+g57hFq3p1joQY+S4GEJIAGPh/oc199pGlnlqCn6hPlcY2c7hivBQSb0nAq/KHJ65zfA89gODeG8w+gvQmmJASrR4v5D0FYBG9jI6s0e7n7ujSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837716; c=relaxed/simple;
	bh=f+o7zKj4zAvMbrNGTjz6Keu4CimId9xpD6/Hm8UgSwE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C6+/3RstfBzaEaQBOay0Md8lCEjrXyhIy6R3wDSU1wWaFx7UW17X5ulMxi1Q68z+nZVwLk0UA13oFWb55mIamlQxD6xEYmkHaiRKTI2rqI8na1AtuiUVVynaYkR4OZ4N0dEns6m354kPYfXnGPc4u7PJ8v39J3UUqKOI/Lft4MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYwMG4L+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Da520Obc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMQd863552830
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6X49WfKYYr6iFab5tMQv3P
	2lu+/R6wte1/9Fm8vd9sA=; b=VYwMG4L+gWrxSj/H6FaOBf+tD8GdOmEtF1OYfR
	F5DGNZjEkQN73ht3clU8RV4wF2E5EKPv22mD/hpWqVSJfcjPNlPV0V7BiOz9ObKQ
	gZ7XRc0TzMS/vDqdig2emctTh+YRWl7aET6n2RwODiiUooejS2RcO2N7LMvHIrLv
	J/6Uy9HsZrJFo9xGCi/e6G+Zogq0rqFZQy9F6YAKPEZjlE4vx+cAEP60eh6z1OI2
	8vP+65H5Ou3JyaVJ4I9MCvosth+4u3fqj0oXnMRdKCRe5imGAM/SFMWuklbkSabf
	8dnqlsWhz6VCiHbeKc66eUA09u1DbV1MNXd7oaW3ZS1As4Xw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8m2fh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 09:08:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb6291d95aso2683384985a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 01:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837713; x=1772442513; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6X49WfKYYr6iFab5tMQv3P2lu+/R6wte1/9Fm8vd9sA=;
        b=Da520ObcCtbfKThgyYPqRZndHhslfZWiw1S6qNXSCZVL3OsUYOtX2ibpv44QCu1I3B
         UJBvfgJnYoR7gdzvXrOgB910kyZahn53HPYsxqCnGqgA5qqeYX/GdazoawwvLdauH9ps
         hfXbZISiZC+Ugpltn25gkyEWQF61ZX1ptrox5XIEhuCgkdDXiZsMmDnB8kmQa/zAnMZ/
         WtYnsI/jwOQ4vR+nowNsE0rl47pm50X1xuSMu+koqAWYuc0r5Ix5VDfhiXX7cRvOVc3w
         VcA3G/Vw1FzQYLqyCaTYOXp0ArLXQf9F30743oLkGJM20K0JMIudw+5N0q4EtlZPd3E9
         GUeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837713; x=1772442513;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6X49WfKYYr6iFab5tMQv3P2lu+/R6wte1/9Fm8vd9sA=;
        b=QOMtX79SbPLwBnSjD9lIsyYDz9Hag10yHR5wJ3kqASp+4ZRFi7e68/kCOe6sjiCGsQ
         imG7GnkXhmct32LeX+KGZ1QRMplYCca8Q1GXwygG5T7t3yvSbFfoqhnyR4ZdXiHmN+IC
         zO/HJRuQEJ/SAy/2Z+oxxKNmyvmNYMpNKfvZ2sSZNMwlpYmZYk6hD33Ukj26DYxbpyfa
         uw4iq27LP6M8WqHzGzIjykM41mcZS1ZQFI177kO+QnP0DSs+3fLjYQ4HexmMeHa7slgV
         d/SMseZhISbpWAp+loYDnCr2kjQMFrkjQtoKKcSxxEwal2+wx7Y0WIpJfViuNVUxYD5u
         E07w==
X-Forwarded-Encrypted: i=1; AJvYcCUl+gDcQ2RaVvWpPndnjzdabtXla6+bgt9d3c+0VdYXmv++Ami0gnYvpZN+Eg0pmaIY/bLf+5rgzrCxRNdHX1l7YA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbUh4/HyfrIZdGXX6l4g0QdUyyG0C8SOvKK8xPH54/gzj2zmW4
	J9lvF9s8VlLLedZ1Mt1WK2ZFH48KO2k3KvxVZvO+m46bIG8IZLFFV18VZAUlxVgcQf/713fJVYQ
	ANtNc9PcsNirW+os04b45p6bXrPIV10a0PwgVVTG6AuoO8Ll39xr115ZGhXAMwstBygUP1qLiUA
	==
X-Gm-Gg: AZuq6aJh0C0tfovSDb7A1ks6u9Vhr8O0MUqV04EuvyiwjMQOaA2XIAHNKcL2NQBhDW/
	/skoX+/3YlGHeJuKyt4rWQBFUKFM401o94ezlfG3+ezC2qrTqZwNmqWduJrSXRI2Iq74rn81Ciz
	C1B38Lml9F+erkvaRdYKWMRzlkKleT3UEucbezc93g1+YnYn+hIkFpWXXmhsno/v2xHjfutWJ45
	rXvpoqkP0UL1ssfDQdvHgAOYthZEVOALjR77UfnBO+vxUL31CaVa74wRAvt0b0BiQhvd39Wn35v
	ZwoMP47cFKvObY08jh45ribM6gLm2yAmTzWZdLauSwryOe6f0b/CK1cTJs6tLrcIvb70ZVtEo0f
	7PqGhlQ0ojL7JlRvH/x8+7T04OvyThQPEGnhTBg7DkxKiqwZZIjeo
X-Received: by 2002:a05:620a:25ce:b0:8c9:fa4b:1269 with SMTP id af79cd13be357-8cb8ca0a29fmr981095485a.27.1771837713196;
        Mon, 23 Feb 2026 01:08:33 -0800 (PST)
X-Received: by 2002:a05:620a:25ce:b0:8c9:fa4b:1269 with SMTP id af79cd13be357-8cb8ca0a29fmr981091785a.27.1771837712716;
        Mon, 23 Feb 2026 01:08:32 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c048bsm264049295e9.7.2026.02.23.01.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:08:32 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/9] i2c: provide and use i2c_adapter_set_node()
Date: Mon, 23 Feb 2026 10:08:18 +0100
Message-Id: <20260223-i2c-ada-dev-set-node-v2-0-77018c536610@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAIZnGkC/4WNQQrCMBBFr1Jm7ZR0YmNx5T2ki5iMNmAbzdSgl
 N7d2Au4+fA+/PcXEE6BBY7VAolzkBCnArSrwA12ujEGXxhIUdsQaQzk0HqLnjMKzzhFz6iMNrb
 z2hjjoEwfia/hvWnPfeEhyBzTZ3vJza/9I8wNKiTWhhUfuvayP0WR+vmydxfHsS4B/bquX3nzd
 x6/AAAA
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
        Hans de Goede <hansg@kernel.org>,
        Nirujogi Pratap <pratap.nirujogi@amd.com>, Bin Du <bin.du@amd.com>,
        Hans Hu <hanshu@zhaoxin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2755;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=f+o7zKj4zAvMbrNGTjz6Keu4CimId9xpD6/Hm8UgSwE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBkF4iKe/nh/X5J2A7Bd3+y1LLpI3zpRDY7zx
 sduRHKAVWWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwZBQAKCRAFnS7L/zaE
 w0/LD/4z8nLROBHpU3J0BJKElvjY6J5/xap/tSJpZhT8yfqf52E7UBed9VUfRD5pCyAuOQffhOx
 kSFsz7q1a/C4WbUdkyZd3u22DR96QiVoyRKxwQdXIDhU0SHWmg3OIX970qQnaJQY5J2Zlf1+LzT
 SOeEE8q0JMlbiliodw5CqJHKkI7lecJCDHXbZq9gvzoxT24uta03wOshcNj8phgpYjPiiOqgovH
 NHvYvPb5516naDXK3p8viBqwiLxrBtHQyPS/RMTiAzS55o7t1UypqTyhhPo11QikNN0iHM1+s5c
 c06bszAs3gi0G7U7VfjpY5WDBGlKVK8kbBvQJ4mlAKyNEzEbKKv1qChz45v8ZwjOZnfV28NN013
 RVj+LSz8hlpMj2Gt1/67q/+taqr2VNcKVVABj7W9y2edA+8QGqbRWrrkmtv9oEUyshA56TfVMxS
 Hxrs0JoZVqYENpup5I99Cn/TSQ6LAdK05mt1dA2ToZVJwi5nCr1ZwKfktNjvLJRTEVI9AST/P6m
 UIRkv1I+7OcNA4yVFdUmF5t+QgYeTrysejjCTe12v2Ht/z0avRrRaoTmV/48dvq/MSqLUdiYjen
 vTd68Y+VmGTE3JOIqAbR0IE+W/fRPR6GWWvugyKou9ZRHxlUHz9xPkQdKA++OxxNUvtjRvTGNS6
 QG/kgmMIjxzpIrA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 8kndsmf1uu7T-7kOgc6CKebVADYLtafr
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699c1911 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lUC9hMLxrJuMSK10UuYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 8kndsmf1uu7T-7kOgc6CKebVADYLtafr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfXwgVrmgjBEvTz
 MFGqEOrix7KXe1JJfKvAQm+weGyfa7/LrlK0ZAQzMtwJpmnLrk2CLHDeu6tIXci9ae4Npxu74WZ
 tsFlOW03s9hdLgPC0jBLffDdnsxo8w8zE72TjT7D4VkP8N/X4tANth9m/Eo+O0znbwORyZixE1q
 d98OI//kBjZrbRRXQAoOj+mH8QqnMO1yUcbRptG/BGxPWAMLT08i5byhjwid6W087ozESzKC/7G
 MnCre5riNc8weOsVcdELn6CV3Jm91CtlYOMZry+ePsgg4S6AaE4LZs7bXaM+Xiz9HX4EsTTcbDp
 d2XNDZIYpbgZF5ryVJaq+8JwDwIJHQWUCejySFbW3jKLoPnF62EgiDCzFL4IwNzJXyKBBLy1DM2
 uHGl73yMSQaUMF7nK2BcLDfv+mERDgKqXl4G8gTOsXUy5ONieWPjuOACYywpkTI/v//esDjZ9Hr
 eGwZNrntCDxYyv6yrDg==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28372-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 0C449173A9C
X-Rspamd-Action: no action

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

Link: https://lore.kernel.org/all/20251106152330.11733-1-tzungbi@kernel.org/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- add patches replacing ACPI_COMPANION_SET() with i2c_adapter_set_node()
- rebased on top of v7.0-rc1
- collected tags
- Link to v1: https://lore.kernel.org/r/20251223-i2c-ada-dev-set-node-v1-0-2e36e0e785b4@oss.qualcomm.com

---
Bartosz Golaszewski (9):
      i2c: provide i2c_adapter_set_node()
      i2c: designware-common: use i2c_adapter_set_node()
      i2c: gpio: use i2c_adapter_set_node()
      i2c: ljca: use i2c_adapter_set_node()
      i2c: ls2x: use i2c_adapter_set_node()
      i2c: rzv2m: use i2c_adapter_set_node()
      i2c: usbio: use i2c_adapter_set_node()
      i2c: designware-amdisp: use i2c_adapter_set_node()
      i2c: viai2c-zhaoxin: use i2c_adapter_set_node()

 drivers/i2c/busses/i2c-designware-amdisp.c | 2 +-
 drivers/i2c/busses/i2c-designware-common.c | 2 +-
 drivers/i2c/busses/i2c-gpio.c              | 2 +-
 drivers/i2c/busses/i2c-ljca.c              | 2 +-
 drivers/i2c/busses/i2c-ls2x.c              | 2 +-
 drivers/i2c/busses/i2c-rzv2m.c             | 2 +-
 drivers/i2c/busses/i2c-usbio.c             | 2 +-
 drivers/i2c/busses/i2c-viai2c-zhaoxin.c    | 2 +-
 include/linux/i2c.h                        | 7 +++++++
 9 files changed, 15 insertions(+), 8 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20251223-i2c-ada-dev-set-node-0636a8d3666c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


