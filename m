Return-Path: <linux-renesas-soc+bounces-28396-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PArBjlYnGkAEQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28396-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 14:38:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F52177039
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 14:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB390304AD3C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 13:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20A821576E;
	Mon, 23 Feb 2026 13:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mgNOIZOY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i5vEsKq3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7A11A00F0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853867; cv=none; b=sTlAGUIa1zSP+6q9KTb7xxE9/3/jx447zBXAz0aJhy1d6yxWq+JJrv2co7oB4hlnQldm8bG0WMrNJC/DECCjwny1w9oBGG6qtpt68fKYsQlQPvPOUY1kSbn2z97gpm/uouSHGZCyow8M9Powe1e/jf4fhQMgoo5uhuAQj6Ufdzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853867; c=relaxed/simple;
	bh=QPmNRNSabXl3r0S7jPuSa+7dPpXvOPNSvq8pxO+7W4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XOeqZic00PH1UbL/UaF1ilT8498abepBw684FXxMUAJPB1ougHkSbVZsf8JH1Ataalhq6DE0UEtG3BYXVEIFvpeZCSqLLr0LMCkujBA1lZwfSYmaTnK5+ui9zXXdoZpc4dYhbEozqzwmcIqn+fP2FxSpMUNN8zD4eVFhhv0vG1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mgNOIZOY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i5vEsKq3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYdqk322212
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JfqVgMrz95q1UhPiHRN80GDjYxrg8e7CoggRr5e9qQA=; b=mgNOIZOYdqaEeMQb
	ri/vqPoX9fCBh9wx3S+uAWh1y9/R60wqQY7ofww98qjP15gtNhXKd5kz42bdAee0
	eOE4jEXR0zg01jndXaBcI3BNyAkdY1h9AKf2mDvEBu2BnWxGS0kJANIqS4CVLqdS
	9ZGcRB03rlDMDme7gSzYbH5dr/1srlerCWQQ6GWKF9n+peFK+hE7hiSR4utjlCeZ
	zIkLp1D8k2BOzuMmzyjUvnU20XrVler7Ad9n0uj3IhoHUpNiku+XdCvDUfUpJKpl
	eeboqonnskflPevjO5I44TDftYCJ4cbaeDWoK/fEtcj/S9Rv++aA6Fk3MM6z03oT
	UU0p4Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y0fb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:37:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ef98116so4780889985a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 05:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853865; x=1772458665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JfqVgMrz95q1UhPiHRN80GDjYxrg8e7CoggRr5e9qQA=;
        b=i5vEsKq3w3GThOKRxv9MD6Rhw+OQOOyULW4omV8xkkvt5brdMbSO8YirQYYObd188Z
         D/KDs3eZ1LeNUOENlOxlArbNG9xqi9dlpw/vS6+V4GWYfJWqv5bBn5UVfrLi/+6MMqE1
         8FAcjLPJoza2EJZqnHdDuh7Sgkbkkj3rCmdNHLyQjXmGuN/6hHMpcKWqtqU4csigGcEx
         C2sFG+tmFmOC8GHX6Zw00LmlH8goL2+OmG3+p6ymFE6gwMAWGSSeIbVCCmAJZx0KCrpA
         Whdwfc+I1YLQNC3VUrGnAuMeJ4f2MMSTC/w1p8nHmDG5xYX4Kd1Z0kBe5KlbxpBmQC0a
         3cxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853865; x=1772458665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JfqVgMrz95q1UhPiHRN80GDjYxrg8e7CoggRr5e9qQA=;
        b=qe3DuY0NWSIbcUhlQZgkH0y6Wd37d1SCbaFP/Kw1dXOiG4YYty0lpyTpjkIAm5p1es
         JlNSm8wnH3wHZgaA0waa5Sik+OQ+eBm6Hd2zTfOw4IEPwJBAb2t4PGdsB6GY8A2aOXZF
         L3PT2HjBwB0HndQ2tw3rHZ2n/z2wPCz5RUGgi4q9qUkp2aOtmLlhIq9puj2zhlW/55uf
         rP7uQ8chBUHYrYPPpj/UANtmyUUZmyKJW4gs4KuTYyT/XTu+qwHmO7rxYhW5mwPNyvPz
         ze+u7syy5Pprd8fJ6wbjZcsTkuq7F8uTIdzFYX7rzBwb9t59xNCee79AxAp1MdiQsegP
         R5dA==
X-Forwarded-Encrypted: i=1; AJvYcCUkQtMv/L+OZ7hKRetWC31/BH3S3KVHMnc5zP9KAgUB70o1ZKfcrM2NYFYDG1nXGEOJfglX1n/kJrnUtDE1kdhHYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRwAOC2ybyrYpRB6ZBEeVl3eOoOeB6a/lcABhY8lXSq9Y0MEhs
	mU5TgCQ1ytFxaZSU2+g0y5SmR6f4N+bnUovFf0tnIEvm/VNYPokOIDETfDfGhLYNzIrObxRdton
	s72bqYjtcwFV6ex5eOLHjL37udTceK0tYGcZWHF1XM1cRLGWKQLVTk5VWTdjwRUfYVDQNMqDUAA
	==
X-Gm-Gg: AZuq6aL4hq5pUVJ3GrkeYQokl1VqK46N9qzS8kzGruhoErQWDpazZ7fqupRbXkPtlXD
	BLtHjDLSEjVg98j8CJmydIHm4KuqqXUDq0X7kaaSf8VxVps5swIczdoAYWEFx4K12qvYGVV3Llz
	TD/ME9bV6LVTu0Y9DgubVHBjSJtLzjaHT6abTeu8mggERtkwsYYB35Jx/eWKxNAVI+wS3zmu9T5
	oVrBS+I1PUr672uZYsgzkKorX2449qfEm6NZsGVNEN601Wop4ZgB2FaKYw9276TYKKmdnXGfF+f
	om79VMaUCf1DO8F+hCwloYmbiq6PGisXgM9AwlLD+BPH+CJ3RsQQpDt0BMJyQw5P8o+ae+DbIwa
	M0LB7ZB2GdejEU4u5CgN/L5Mww5JMTNjLByj69e69ap6l5UWRWM4=
X-Received: by 2002:a05:620a:4492:b0:8ca:123e:8196 with SMTP id af79cd13be357-8cb8ca72253mr1151982885a.53.1771853864509;
        Mon, 23 Feb 2026 05:37:44 -0800 (PST)
X-Received: by 2002:a05:620a:4492:b0:8ca:123e:8196 with SMTP id af79cd13be357-8cb8ca72253mr1151976985a.53.1771853863950;
        Mon, 23 Feb 2026 05:37:43 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:16 +0100
Subject: [PATCH v2 1/9] of: provide of_machine_read_compatible()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-1-b45da45903c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2454;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QPmNRNSabXl3r0S7jPuSa+7dPpXvOPNSvq8pxO+7W4U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFgZHBYkzb/CkVSuWiIkaFvkB1D7XlGgt7SZk
 chVZS6T0G+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYGQAKCRAFnS7L/zaE
 w+QED/9rJEQy7HuSo0BQ9ZoeKG0P8FHVreYTHlCWGpsvaRCRMVMEZyB4slmYakmKcWwbnLENZY+
 1jIDpUXY5mLSHXTBrvHdUX6k60h0nmSOtaSHaJ5CwTfVjYRZOIFm/d4lNiJWerGRMV4SQe4X3ja
 ElpspUQUiXTLqsn/oKdVztBdHfQ6dBu1h6OxB2jg7DTnJ6AetZfAhGOhrKSrpBxUEiHqsUzniBf
 Qag5wN7j1cez9TTi1UBpsMw6M2SvVq8S0qOP5bjLmfgCM19TW6oj+mzMS5upC5HYbqPxUQPaB+v
 P60UueWK9KgDiWBdgNtF7igKVWiFUTIEWQ6QMcJXKpoEERLk+oq8SMJdcijxhcZajFfXLZ8ouPb
 7JVcABKecdQB2lD02pkMg3U3BQVszqyyGcfNur/rhPdzgIclUBm8MnHdp9vSje5kjv9en9QKHJ7
 CW7zKKKB9MU7VCUdHsUfXx18MOWWzL8fPwQ4+f8fmMkJVNPopP10lUZ8soUJDtOHhihRMiplcJ0
 rkeqaq6C7WB9ZccLKFP7/4brEWVRkh3IYNwuisoflhZHx81R9osQr0U+ln92f0YFQukvCpWQOU+
 q9SJQrjsARlsv7DOFf7Er6rfjK+fnpLqp2sGBwUL78PcdMaGpX/udpqn/CgJO8S9HPHgVVsOBrg
 xHABeyImOD8ufjQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX0D8stSEW1s2H
 2uv63U+Gp94820M2UOsGe1pL2WboMDqq/ZCrPARrkKEMUnA6NGmtIdi/zUaZ0pHvPITO4bj8u8m
 IRbCJDS6skerSevomaVYiwfW22AUcIaXFuHBuQfwxgVnL49/gRDPHkNsz0ldUV2S9vBgErt3mui
 g96Xi6mzioII0BCU0ojzX4Nyu5XrBxvVQFqA3r5bLYlSDJOU+/pTukioI6/pasjkzBCptDp1Z4f
 Z7qMauSncoOe0YuJIGuOm2Mrdd+L1gTO/odsP2qlvir4YNTW36JxlZWxTPknTVR8skcmSkgw/E1
 +cZVg5ihPSODtZJsPphom6DCW2Ryukq7yKaYMTpVKmoeBK8IUF7IaTRHg6CYp56hzJ/WrgV9jSq
 IOFtnwZkYiZiY/c9ElR53WotZoOt/LfHzIBELyaUEu/SWzTD2Gn+WyKcQQaranNogUOIyp2POgk
 kyanNLKLRLchL8Ktb7w==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699c5829 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=aMBEx6ZYl_lYKPCdRXsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: sIIep6mIUNii_zsscg59XPfFxwrN6oNj
X-Proofpoint-ORIG-GUID: sIIep6mIUNii_zsscg59XPfFxwrN6oNj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28396-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 84F52177039
X-Rspamd-Action: no action

Provide a helper function allowing users to read the compatible string
of the machine, hiding the access to the root node.

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/of/base.c  | 15 +++++++++++++++
 include/linux/of.h |  8 ++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 57420806c1a2b9a3c67b5dcc0f95610a87c2e46f..b70aec32e0e35ee232b413e548742491bf763df7 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -434,6 +434,21 @@ bool of_machine_compatible_match(const char *const *compats)
 }
 EXPORT_SYMBOL(of_machine_compatible_match);
 
+/**
+ * of_machine_read_compatible - Get the compatible string of this machine
+ * @compatible: address at which the address of the compatible string will be
+ *              stored
+ * @index: index of the compatible entry in the list
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int of_machine_read_compatible(const char **compatible, unsigned int index)
+{
+	return of_property_read_string_index(of_root, "compatible", index, compatible);
+}
+EXPORT_SYMBOL_GPL(of_machine_read_compatible);
+
 /**
  * of_machine_device_match - Test root of device tree against a of_device_id array
  * @matches:	NULL terminated array of of_device_id match structures to search in
diff --git a/include/linux/of.h b/include/linux/of.h
index be6ec4916adf522aa5e4dcb1480fe91e1a4e29d2..7df971d52b556f21b510a8b5ebfc8df49a2a6f64 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -426,6 +426,8 @@ static inline bool of_machine_is_compatible(const char *compat)
 	return of_machine_compatible_match(compats);
 }
 
+int of_machine_read_compatible(const char **compatible, unsigned int index);
+
 extern int of_add_property(struct device_node *np, struct property *prop);
 extern int of_remove_property(struct device_node *np, struct property *prop);
 extern int of_update_property(struct device_node *np, struct property *newprop);
@@ -851,6 +853,12 @@ static inline int of_machine_is_compatible(const char *compat)
 	return 0;
 }
 
+static inline int of_machine_read_compatible(const char **compatible,
+					     unsigned int index)
+{
+	return -ENOSYS;
+}
+
 static inline int of_add_property(struct device_node *np, struct property *prop)
 {
 	return 0;

-- 
2.47.3


