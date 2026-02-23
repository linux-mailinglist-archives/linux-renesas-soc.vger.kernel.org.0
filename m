Return-Path: <linux-renesas-soc+bounces-28399-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI9UD5ZYnGkAEQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28399-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 14:39:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 685E31770FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 14:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CDC283041340
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 13:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923EB23D7D8;
	Mon, 23 Feb 2026 13:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYXQH0Mq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OaXCwwq4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3408523BF83
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853874; cv=none; b=MklQEKK5mtnFgsbP3luCp9PS2mK+tJZsuxurYVZcfZUdgxGPBghpYu8D0xnjzykPSVc8Sr+uiTMk8t6dtip0mtKqeM593UEeuH51B7hZiNpQWsWzvznCrmnVfLnzsEb1Izs7C8iWeQkyMDqkoqGVm6nlpAQkd88BYRTg3Ggr4G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853874; c=relaxed/simple;
	bh=kiNnpMfASMUUyUM3BexU/p37quB5SdiUkVxgKJCVWKo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=amZRo4tlVs3nbElusX0uefc2ZzU4DUMaJFlAxhq54MDOdCOugpFKn1bw0vNdeHr1MhtKxf2kATrVVZJr/eKyA1e5n8Wmzkshn6JN7e7cdXYzNTIxNI/RTVvdfKY2n67tt431pYLGqL2FjJLnir3wX8GVvETD7m3jldYB07lONh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYXQH0Mq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OaXCwwq4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9Bg1Y1249093
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iba8wNAiFrItxk0+Sa+CV0EOAdkMUhOqnjgeIwomRIo=; b=dYXQH0MqntZSpIKl
	cur+MWYG1rIaZsKmNba1FmLfUAKXHNpGFVT+7SP8N7Tr5AlCyvB36GtjALEOK0Od
	ckgnz5RR9O4aFrgY9dG9vbkCWvnORORIkbDI6rQMYjlkJlXEGUAJgrR6C05z+OKI
	s2pN+SWQiFcc6QTY62km53aJJCbrN8W2V/UX3nX7OX+tZTf9xjin8hyGcqx7+M1e
	V9q8/0rgb0cWFYQ9bGW5KfHHCNrbUZHa9sNG92N0hLnZhjUtXpMiJmJdCYIsS/PV
	TbPUsydiR94kgac/pi380Uqn5Dnc2ixobvxW9uOduwCGdexZA+M9ply2XCIV42sJ
	toiboA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9vuv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:37:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb403842b6so4700843185a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 05:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853871; x=1772458671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iba8wNAiFrItxk0+Sa+CV0EOAdkMUhOqnjgeIwomRIo=;
        b=OaXCwwq41e42CbSzsXYT/lBtLJnyrj4qXN2zwJ6xG+HRZioCaeteoqa2Qu5a8bokvw
         OsrqzkpleZD8MjSWJWtkGdMBs507xGKF9bEVb9OHepqRriFZaMACbISwQy8tqukJl+XK
         Qz7x1Wu8KXgg9IPcX5cCpu5uBjcsKsvGBQ7jSlDNy1UHyeiuJykP/uxBSLVouDgChIf3
         mGYI0p+GPLpXEoPQhG6Q8UqEKo8/0tqX34w8M/1+VwViqi3Yko5ngOr8lIYUJGKYcRCB
         Qn45kxfswc0ZE54tKJvJercnyj0PuJxzPKfJ8NvHaS7G9Zm1a5/vV2qBDZLjIYrV4DTw
         eS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853871; x=1772458671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iba8wNAiFrItxk0+Sa+CV0EOAdkMUhOqnjgeIwomRIo=;
        b=IMYu9vwslfoE8hq8H2BI0v80DqTUSNTLFvhXPSsRpjqOWgXah2qbpuvJv8TlYc25Wr
         0dZKqGqez+yUTaZ1uZIlA3SK2GxtZY49Naer4TOJzi9pwmWCIuwN0kmH7BpGRHHLKInz
         mYjF4QpwH5SJrNbOukaHKajAWPjkfXGMzVFf4j1N5w3DuL8CuHz0AgLDl9gccNHotyDL
         7+NfEIRzdsCNN1tHlkccwVDetqHJhVQP+jaAuvdicKqEmqmx6Vp1wX3nO7lWDVveqQo0
         tMBKOBagHtdel1ae23daAWp56id2/lpIidyi4lqL6fplMbjeWBQ1TXQzvG5lEdVvI9BK
         IpXA==
X-Forwarded-Encrypted: i=1; AJvYcCWUrMFnFmv5r4IBQ2OWFssSgu5kJgceCCrAivrMy7OBm6K4b1SGbzLWHt5KT/jZINR8ajHdvagNOCrjpVrPR6C7kQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzguzOzoZcV/zksL6wyS2Dxh8gq6xgJr6qo1WFqoWYanEJX/7H
	sRPppY0NTj8fDtellFLMClItppo9FdvkmznWwyVXDFpMa3c4+OOAPusJLN4ul7Wn/h1Vjsgbk5y
	FNw2s7myFhQRVqGFFriomd4ZoP06eYGSi8qvxEcGQl2DvfaiLFuWppx17+tiicUJ/y0gWoO4ASw
	==
X-Gm-Gg: AZuq6aL8wSoZ7Wu6mIv0mUvId6wJ3QEff5w8kzYdUx5ugyT/PVjdtEBXk9XdcRHIEsK
	MxQVZoFMmMLyQxvgdDiaCqZrTnLp4lGQnSzEfw0Y88DEKhTUH01GcpQRM1PfvKEED+eubSZ3FFU
	pryUmbTI1mVLCCZ5O2v7SXyUSBghwWjyOzpMxFzpYQ/lYSerzpaci24sCaTYtAYynb7xq/SA0ds
	oj6+gJnDyJRR6qqg0BuyYuxjV8Gv0aduYoi0tU5UQWYNPQ5C4CUZAMmF6zhXGinLLg/RukD9lBU
	+zCvCyXCz7gin7fOBCxGU06eou0scpl35XPzEvi3EA4YUriaw3xCMUU6Jd9y2+iyEduQIC35F/A
	N7JPr25cTgbBvB+WZz1L0qPMefWVA2DYmw68qDuXthLe8WfgER3U=
X-Received: by 2002:a05:620a:4052:b0:8c9:ea6f:6a4a with SMTP id af79cd13be357-8cb8ca92f3amr1068242585a.78.1771853871511;
        Mon, 23 Feb 2026 05:37:51 -0800 (PST)
X-Received: by 2002:a05:620a:4052:b0:8c9:ea6f:6a4a with SMTP id af79cd13be357-8cb8ca92f3amr1068238385a.78.1771853870980;
        Mon, 23 Feb 2026 05:37:50 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:50 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:19 +0100
Subject: [PATCH v2 4/9] base: soc: rename and export
 soc_device_get_machine()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-4-b45da45903c8@oss.qualcomm.com>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2484;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kiNnpMfASMUUyUM3BexU/p37quB5SdiUkVxgKJCVWKo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFgdJ4S3kKQy7E5gZ1HH0U5SQZilqtbHrWuRg
 vsXfy1WCm2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYHQAKCRAFnS7L/zaE
 w+ffD/9rAOyhycwaiVuwUk5IsBC6AoWuSyHbtclUsR021hX341sTNrodmTF9hBEyCYtfeoID3s6
 6v54GhA+fRlXWOiMcydGgtSfnh1/l9JMceBWhF24bHQuSAibluRfYEHlf3q7KsT5Hf7u/YfHdwv
 0S7/gjaeJS30/KeoKhxy+4i3Zl33BKt/7NkLDJK4gyrzhOJIecBLTZZbC58VhpbOwBq1uchfsSI
 eM745iLv/Vlg99B9GuBna643AcG2mK0QBRJVBqm0q3ynRf2uJ2T4i6COg66w12blMZcHrZK28k8
 SeC/oWmP91fpkpb0irJ/icN6A6vIIFFenIGT85YwHaTwE3+gvxjb31t1Y5KompcEwLIPOAfn/TL
 dWoMEdcE8krPx2hBK8ylSyyT9+SD1tMG85TZ4OKKbSixYU5XP/Bj6mVeGH9+9pKUqXy3PSuU/An
 V1NP8SeznajicCUQ1QJF93oKppmUIm1V5gQQKKxi1I+gWRG5nG5W0/uTz33jh3tvhXxt14vem2o
 0Y3AZokJjVKI8Il/350KT4+2vWorZeZjVtaku4rZgEEcoxjQ4q8YP+ic+Pt5ExHSIkYiEzhC5jv
 r0utAOUE+xo8SMXpcDj7WmsGu74rh8oim9GPqphG9oWx8OlsUhJ5jecRvSRHBK043p5Arv3iWI2
 hnk/0nakVnNjHYw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX0gez2AZi/1Et
 v/LoHc/LstXg5UJbRXpOOOdsLNtXHkMmid4U4aB+zc5ps4DwBOSX8exEEFk8t5UwE0EqB8yue2g
 totW79lOiH+eR9VzGcEW0Fd8T+VasfbUA3C6h3r7n9dvIwKOXl/24cBCbQdxLe2CuXnM2LfvdFz
 JkG9PRLIUbhOzQkGyOjY+XAuxWN3eSM58DuoI6rOcKw1QhKmx2emQ1qzMR8hF2HnXEN1cYg8PJx
 C4dOYcp2sRDmakkgZ/WN8fq2FTGN8Z2CPYcOHZfLFdacBdQcsGnsksuqybbJWIrXJikKQiIxwKC
 TPTPjjYdFCJqyZmeJmJt/6ONUUQxybv/VwKoAXUxYA8pxK30wVODpDqM862sf+1kzcMI0IVazFJ
 EAJrFaRp0nIJIB3jrVmSfx8zz+ZmtVYm4gmS+ymwKV1qDfPAx1AWyCKMNZWcfO3G9NT27C7rvm+
 reAYQFJO3mVRmfLbgDg==
X-Proofpoint-GUID: pAO3BDxb9N2GWj6km_VOExvjtvMvq-XJ
X-Proofpoint-ORIG-GUID: pAO3BDxb9N2GWj6km_VOExvjtvMvq-XJ
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699c5830 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=VU1FamAdWuTKyoDMntYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28399-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 685E31770FD
X-Rspamd-Action: no action

Some SoC drivers reimplement the functionality of
soc_device_get_machine(). Make this function accessible through the
sys_soc.h header and rename it to a more descriptive name.

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/soc.c      | 13 +++++--------
 include/linux/sys_soc.h | 10 ++++++++++
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 48e2f0dbd330b8d402135ffa7308f454eb4ab7a5..65ce72d49230360c22a812cb9286e7fb4de0baf2 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -111,17 +111,14 @@ static void soc_release(struct device *dev)
 	kfree(soc_dev);
 }
 
-static void soc_device_get_machine(struct soc_device_attribute *soc_dev_attr)
+int soc_attr_read_machine(struct soc_device_attribute *soc_dev_attr)
 {
-	struct device_node *np;
-
 	if (soc_dev_attr->machine)
-		return;
+		return -EBUSY;
 
-	np = of_find_node_by_path("/");
-	of_property_read_string(np, "model", &soc_dev_attr->machine);
-	of_node_put(np);
+	return of_machine_read_model(&soc_dev_attr->machine);
 }
+EXPORT_SYMBOL_GPL(soc_attr_read_machine);
 
 static struct soc_device_attribute *early_soc_dev_attr;
 
@@ -131,7 +128,7 @@ struct soc_device *soc_device_register(struct soc_device_attribute *soc_dev_attr
 	const struct attribute_group **soc_attr_groups;
 	int ret;
 
-	soc_device_get_machine(soc_dev_attr);
+	soc_attr_read_machine(soc_dev_attr);
 
 	if (!soc_bus_registered) {
 		if (early_soc_dev_attr)
diff --git a/include/linux/sys_soc.h b/include/linux/sys_soc.h
index d9b3cf0f410c8cfb509a4c1a4d6c83fde6fe33c6..f19f5cec18e28461fef57f22702d2c44a41e4193 100644
--- a/include/linux/sys_soc.h
+++ b/include/linux/sys_soc.h
@@ -37,6 +37,16 @@ void soc_device_unregister(struct soc_device *soc_dev);
  */
 struct device *soc_device_to_device(struct soc_device *soc);
 
+/**
+ * soc_attr_read_machine - retrieve the machine model and store it in
+ *                         the soc_device_attribute structure
+ * @soc_dev_attr: SoC attribute structure to store the model in
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int soc_attr_read_machine(struct soc_device_attribute *soc_dev_attr);
+
 #ifdef CONFIG_SOC_BUS
 const struct soc_device_attribute *soc_device_match(
 	const struct soc_device_attribute *matches);

-- 
2.47.3


