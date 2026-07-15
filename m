Return-Path: <linux-renesas-soc+bounces-35241-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c19iLmxAV2qPIAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35241-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 10:10:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE7175BBEA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 10:10:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Wekywhqj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=kRZBMsvQ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35241-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35241-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 99C3B300468E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 08:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE703C9EE0;
	Wed, 15 Jul 2026 08:10:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4E32DCC1C
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 08:10:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784103012; cv=none; b=lNHiClr985e+TIBFmV6hqr8Ix6wDXEVbJeXYKGLnqJXz6jHwBJU1mRIYz7N7Fnv6So+lTPbBDNqnRVabT5EUl/TUOTULsF8ahwFUPzZ2Ax8jXUMgGf/J84z/96KNIxzVhUhMbeBYIVI3bwh/74pZB1dz0fZ0Sc3gVzJz9cN6BxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784103012; c=relaxed/simple;
	bh=EGRw2fBsRpRQyisPahAfp2ecLjjUFqBJGdDp+knzIwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W7G9Za9nkEiE4lrszddEg9DVl25FLHeT2sbggLQ/t5xHEHIqxSP23eVif08Y5ozUeWfriDmvO9i8OADcN7v1h4qiEnXJy1Jcnox48L8xhrgUCJSZDqCq6Z1J0VOgBBEuSVw2p6O4HCldaA1v0AuSek3eqGYqD15fmLIO6icNXxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wekywhqj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kRZBMsvQ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3lmiS2622261
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 08:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kpCDfWnG6x6iulniwCnMQw0nNHe8WfFFqms6j5smjO8=; b=Wekywhqj5tW231B5
	ZPwssmg7opISH4nPPWkWuqukB9Wn2Gr5/neh6pCxb/aA4uXbJFvIatuaR9nWfSu9
	hy4DxXfX/ajfc/2OGP130mAmnigr/J7oHn5muPNwLfjRkEJWp/yTgiRyYwkdK7A8
	UOjFxoa2TraUnMirpHKPX9skvZYvZYGC4SrAZIhLuDy0AWiX21fUAFyv6jOs+FX+
	O59dZ+k5I0aNvEfqoZfDUckSF+jhAxSF3jG5l3916luvtZHMZuWwj+v+rB5LiP5z
	prSfpbEuSl+eNHAUaUiXe4ruIIBpqVeXPcWw7m+d5sEnKN/yAyBlCyXIe6ioy66w
	yN0Dzg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe03vh9rm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 08:10:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1eb52e1fso88627621cf.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 01:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784103009; x=1784707809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kpCDfWnG6x6iulniwCnMQw0nNHe8WfFFqms6j5smjO8=;
        b=kRZBMsvQ5qh4irmh+QAVGNUr6Rt3zygrZzHHvCUonWGAZyZC3uNbSU5caR0CBIwGpr
         wVLvh38aizNYH/RQH7jY4d+fL82o5xJ9QhSKJQ7brpRBh5rOuA9tQ6zqMa+J7sKrj6Fb
         8HTlCYahuMwwAWcSJYUaIQDc31OCKF5I+WSYmm9uv8BIsnY/swQvOyaZU8KKbNNS2QN3
         DGkRfq3FhYq3VweDREWiuge6EHChtPLW/FJifqD6nsJwn05iXKyzNWCYR7IdaaTD9wyU
         IO4f2IAtlwq5izsMnipO1WIE8MrU+7xWAO8XoiM73izrdFI5Rcii/M85w07Kk74upZGJ
         VYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784103009; x=1784707809;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpCDfWnG6x6iulniwCnMQw0nNHe8WfFFqms6j5smjO8=;
        b=KbcJysmFznR9Psl1iUn0WvNpF5rd5I5MBKKh46+KqkZvXLLX40hShz7vfN/tP8SnOO
         keZA15WFhHOab2CAflrXTafUSa7nCu6t1IWid7hCYV6dbZ146jvqL7Z1xXf2Vpqprtb9
         r0AQMYs9bFJMVGsqX1t4V2KlEKK+kVSZMtKu7nerKlze+V4cPrMXIjNdNCTO0hqcmK31
         BlrXbZUAwmOV5TTD/7nn4iB4VS8oXLTqy54VEuz3smCUGR7d/n9ykiaQOLO+XTsRjZAF
         g5Awp5c2XHRcMsMHDLs1DP9/pDpj8ZJVx7dfACU3Tt+15M+Uh5nmj0AqKmK2KUyv48pg
         wCyg==
X-Gm-Message-State: AOJu0Yy7JebvoOXvoGeyySmybc0bfZyQOt0x6lt+QzkRbYjQWStnrQp8
	o5srlM9NsTL1GiUEHBL67cx9vCrJ0pwbCQirtf69yKNRbhnnaZThw903DED5vL6yN89GzrqdllL
	0mWJXmHrI3LG1hZ+ZJmhLDRqlX5E8DpOD2xuVxzsUFbpsGduJrVzs6x0nPG0DSADyXzbbSnzQcR
	A6KC0qvw==
X-Gm-Gg: AfdE7ckUbxWxust5mbkpB0vaYdVXo5HBBei6uuejg6IbCc3Mw7dHAsSapAyXVFqNVh9
	WgZxffvlDYALmVcl05Ttp4L7k72kTx/nma5bibPvfvMxz1w/cbdkUMTV6ojsohi6oJ7R2oe2qra
	hd9vVXDROOyg9wiJbXSqX4youXNIWMRds+fxs+etcxzkZY24iJ/80ncTbt5CjvHjUffxjATkFmi
	waDWZGO4QN0RUpaZg4esmg0yGJl6uP9ifRK4Xp7Y2edkOYxMGDpLCeJGn3qZNi0LBVlFcj3W81W
	/xNX9L+UeYlfBnZqoB+VorxAjUy65mNowWfVG2Kz5coRtqCk623s4iDHaZNm4cJKiinu5VjS8ze
	87rZkUri9t/TLhZBNvUmn0/0RG2w19Okz75viyoA=
X-Received: by 2002:ac8:7fcc:0:b0:517:7188:c47a with SMTP id d75a77b69052e-51e4edde147mr15727471cf.2.1784103008702;
        Wed, 15 Jul 2026 01:10:08 -0700 (PDT)
X-Received: by 2002:ac8:7fcc:0:b0:517:7188:c47a with SMTP id d75a77b69052e-51e4edde147mr15727241cf.2.1784103008173;
        Wed, 15 Jul 2026 01:10:08 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1716:4a80:ed58:2ab3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495086ca93esm134353965e9.0.2026.07.15.01.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:10:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abdun Nihaal <nihaal@cse.iitm.ac.in>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpio: sloppy-logic-analyzer: add a comment explaining the buffer init
Date: Wed, 15 Jul 2026 10:10:02 +0200
Message-ID: <178410299644.7541.3602139988348182553.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260712093148.21446-2-wsa+renesas@sang-engineering.com>
References: <20260712093148.21446-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ife3n2qa c=1 sm=1 tr=0 ts=6a574061 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=L2B-HX8WAKF3q-jLy38A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: NMXVX9QnSr7yQpgAG4t6z2bi2sb3PNPn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA3NyBTYWx0ZWRfXxdes0hzH9+R/
 q0U+ItsvQFktEdtneBBOKTCgiPrH9VdyVV+W3hC0+OUBlgS49XbLpu3bfsXUM2RjnkAcapkrIJn
 z8GzygEB5afb0H4bAgRGz1D+xFMQ7q3sDRZ5VZKqoornVeruifvW4VF6YGs7OgbJAYgd52rdZ7k
 eaXthOhqi0cOit19laShU8lFfG9SdBijFBFPVLIcMbgbskR8Xz50u2fBUEHHQDrANZTV5KpJ9Vj
 G7rxmeNPqHvNiEne3IYINbsQ93vrxlsl7b5/y03aC3gPwFlLtQMaSLtJ70IYUABc6DrfdRjGr28
 d1XaIVDFAzRpsnFadK4KvHP6ieGoAs/KuwD2BeExnL8ExhdyLN96EiDx60X6Dqj1RrgI+D1mDWz
 qNs7eFDLfLs+MojwO4asj49cE1l8I/YKcEVY0u3JTkABYwAB32hDsjPdP9f43orWOatylB9COc1
 Y2plw5RXYdSwFa3Sn9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA3NyBTYWx0ZWRfX3Yro6TCv4iG9
 qBIXizpW10V4qGbEnO5JXEiqCKu/wt4FZmSJ/PLEPmE4eP6dxdcw4ja11OYuctvfOS3qgZn9/t7
 dOAUOqSgorz9CEkcPcRUYG2TPlh1HO8=
X-Proofpoint-GUID: NMXVX9QnSr7yQpgAG4t6z2bi2sb3PNPn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35241-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:bartosz.golaszewski@oss.qualcomm.com,m:nihaal@cse.iitm.ac.in,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7CE7175BBEA


On Sun, 12 Jul 2026 11:31:48 +0200, Wolfram Sang wrote:
> To avoid more false positive reports of "leaking memory" when
> fops_buf_size_set() returns an error.
> 
> 

Applied, thanks!

[1/1] gpio: sloppy-logic-analyzer: add a comment explaining the buffer init
      https://git.kernel.org/brgl/c/57eb9d14b4f6dad9c340f88f767fc54609bcdba5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

