Return-Path: <linux-renesas-soc+bounces-28403-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABTLKvtYnGkAEQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28403-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 14:41:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCF11771AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 14:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 45FF6301615C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 13:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757E9263F4A;
	Mon, 23 Feb 2026 13:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LcPCbrpS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W63u/d4S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C952571B8
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853884; cv=none; b=dIw6o3ByuQ6zdKRwCcIDFcXl3st85URd8XhG2sWBfH72U6SVZH30SQx/Uo3mTlFjl7r9vt089ABI4s9+XGhfwFnm6qTeDxTUaxtunF+DwhlpvCWEzUlo5Vk0X0CQqtTknYImLjpNAzEKl7b96nEnUP4cGMzIvY53l86Lk21pqB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853884; c=relaxed/simple;
	bh=KMszzjU3UQ1Jk3+c+DzRdD3TJf0mZEwo6CMTyg8oKHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WU+iS+Ei9sCqUcCe55aCeNHxyBcQa+pZcdWt2qkEwipWGWVps1SMt5Iy1y/nR3TxM7KVim8LG9Pnm7GHGXGqSFuV70BJAnQxtZnfr1WDY+SL0fS7SPcmPeAijbqhSrB0F4VReLS+yAUbJglKPRr0MTFkh69ZPNmnmHZ+gxWtwi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LcPCbrpS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W63u/d4S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYmSM322482
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SWvoqMQvd/HR1Whim+d9dj4uZuzbTBCqd+clBYIGe20=; b=LcPCbrpSbRKCIqwN
	9+BLAYNwVHfItZHCbpfdNEb6/duhQGxQ2YYNCDN5J1RJXbduZLRFHYL9xZg+8PyV
	kQMsmjEI/il+4xxv3DisCyESeuiMQBtC2Ak7tHKN5hIAKII2ZrlT/KRdY6aE1lHo
	0uadnjIE45fUbkVxMF27KLjmiLR33YjGhmlAUpZBCN5HBtrEn7rddow52Hr7ElD8
	2HYcj9LTPeKB2iIkme6gSl9kmPJgEhxKZUiEmGqZlG5fRB4D0nQjQWc7SBoHZsb2
	lLZa1q7uxaaGLComc3rjBscS0BzK6/TJkP5uQDQ3C4oBPHdSWm3tVg42iRKlRuk+
	DhNBCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8y0fd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:38:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70d16d5a9so3815285285a.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 05:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853881; x=1772458681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SWvoqMQvd/HR1Whim+d9dj4uZuzbTBCqd+clBYIGe20=;
        b=W63u/d4SczBFOHBtS/i49YIXwbDK3EvOl8vW5iEHKb0BScUeiRQSAsMsDk0hc3ZSUh
         5rDFzeqeML+ZIdm11DsPldoMkZAJIq/aPQDKLWE8ZMkarWjqQTV6grmy1/794GusdrFF
         E1UZQKrxtVQsfivEovvtgt+Z0LTPYiKT4BRFHdFg3taeKl+kdDf2gpAVHkO9ZeLZvXES
         jnF8C3rvFHOMcGNPiLpBAU/UqcP3Q1g1YF+qrkrtHweUZLjZoNxgCI0A70adtkPXTNLB
         ygQ1CaqhRqAeGxOOjuJQknp8xJBH9Wa+iWFqPKeP6Yj8i99ycbTq+S05q8+YiYvKMmtQ
         qLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853881; x=1772458681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SWvoqMQvd/HR1Whim+d9dj4uZuzbTBCqd+clBYIGe20=;
        b=lrY1LQU8O0Siu10Jm9GDehGuT6yhyA0IgM3QLkPsxtvBZQ+WtdBIDemiTR2rzTqB76
         LT+b6KU55s8hjZLlFn5l5+Mtdc+W0uF6xtKOIdRlR5fETLKzwm0En0c/xPnT1iU2uUft
         2WydV9obZSQGlEM0CEFZRztmCPssrdcpIsa2Wp1guNeKa87/9wqFiaAkhmGvmrxRSIe2
         7B/Ylx9c7TnzlZf8XZ4cRK/vjg3zQtBHJAulspha0dYgUbYET1+T83RmFLh8CJ6Cii4v
         +YGdrAMhLLj/3ztdAzLAqfuF3uhaE7pn+LKJ29bhxNymx1FSpdPiMBDsYY6nSzlc6ZiD
         M9Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWpclHl/qX1/FDBWr7l2lcV/L4VYWthAQalHI1eO2bMkuaCXabJ28mQopLJbuZWnrj/7hylZMd6kg/Silwki3CJJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3VcWA0JAS3nASbrOK6gufaWrjMt7pK6pOgJTG9XHcTBUqAtV7
	fQeCfSfUCZ6l37I428oUUiFEgkZV//z0V+zf3M4Q65IR7ZKU9Ulypv1C/n21j5vi5m5SEkIr6vx
	r2CyrT8vroBe/PaNsM+i9xknZiYfR3TeXXv/68i+RRwWSd3fp0Vkm25U7z8JKVHnzRAqCVZ86Vg
	==
X-Gm-Gg: AZuq6aLP2bU9a3f1zK7O+FBTahGrCWxEs7gfOvLSzrrg5O3k5+ftru6pFzUNdT/ObzQ
	rGL4lpR8HZgZ4wbvgjQHM/z3jgHfY7kF+J4YW0FYYSFedEfJMyHJNuPhwRRgZ9TqKzean1lbihq
	uqCG8kBJ2ZvePRQDYNe8B2akovdk5JbVIDffILS8Pc6ffK5m6o4u83Kq20WnNy/wkLByNSF1gxP
	/Y3Ki0w6vONvOFQFVql3UQF5wrqdfdQKbR1FViBAAot7twZrfrn15z/QBtuSqQ+D7TYIkdgcI4M
	Wzisrlp/nl1R0DbH4gvzMt/kvHeZXbxHQCFTdTsfEITtN1q+8CgZKShD5pTAizpzkFItYfuVAbD
	Hp7gZ146w54b+uIW48y3f8WqZPZJtbaM6FSw/iV4o/Vgtbnfdf/Q=
X-Received: by 2002:a05:620a:191d:b0:8b2:e827:14bc with SMTP id af79cd13be357-8cb8ca809e2mr864841885a.56.1771853881079;
        Mon, 23 Feb 2026 05:38:01 -0800 (PST)
X-Received: by 2002:a05:620a:191d:b0:8b2:e827:14bc with SMTP id af79cd13be357-8cb8ca809e2mr864835485a.56.1771853880417;
        Mon, 23 Feb 2026 05:38:00 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:59 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:23 +0100
Subject: [PATCH v2 8/9] soc: renesas: don't access of_root directly
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KMszzjU3UQ1Jk3+c+DzRdD3TJf0mZEwo6CMTyg8oKHI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFghOtq7j/iaDL1WAiPG/QAsHsRBHvV9a3nbj
 G82aE3Fd0OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYIQAKCRAFnS7L/zaE
 w3ZAEACq76nSv0Z8rSsnvGgmS5/mwpaIREv1PRZlCvVtRhoMKRBufC96Leq9sX5QOvd7hTA4xeB
 WMBn4CRDV8eO7tmNxBUe6TA3bRZwlZGt50fLOQ/x0euytqiolWTednJw9IUH0kbKEhqH3EIpi+2
 gpmgUmMsKkfOFVy3NgtrzdSf/VGpaQQFG33HplYR/ulRhVxY8WIrPe6Aub2FrESs/ostBms1XwF
 jWW4trZ6JRLpYP6rYxHoFg9e7BBbrbHgHnN7HevKXTlG0gqamvekyLeCVQTGueIB265F6p+Iuv0
 TH40PbIdWRK15RqpOKKn+LP7GUy+H0zwPxweyJbMloeXmP1NN1A0tcEQplBHAROaLbjgAHLtZwr
 GdS8OA83zzoPCG+E02zTIAsC4IoN7lOyEm+9ych8d8yrms/dRFYSq4Bx/7amt8tvEvCb6q9modd
 Dm/7N5K1m+gQx+XuqXBeSV4tLpHT1dek9h76Cv5QmAdqK+j6ODcDsLWPukVAYlelvk4QrN6ZXr0
 c0VCHVAZbDI4bl3m1jpvyH8qKa1u19BV4M258yoP324LUlv4MCXh2B87jQt5K3etJbPOVj5v4Nm
 Aea7iEMtxHyRgaAnIMNS5r70A/i/XphbgNOa5UZ3EYdQxIcWG4MOL8227hqj1DnvymIz0K2rUhk
 5ESczUqqojWKsMw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfXzYQh7qaLtp1i
 H88oO+WpLgT+2SLz7VdPfzysqH3Le/sCAGgsE/OW+9jvglroM+BXmRPOHJ5wZNyk2F6+kib2koE
 0DjlL9oqNeO8C8w37SvYJSYl/piQb5AobZQoLX0KK0N63XXfPqw8W8MT9/pqqedT3IW3p1Jw+Wu
 mXuIB7rEGQqT+oognMR73SlPX2+eV1t35w0K1gQK1tVQg8D85BVN/HrBY3Nt7/nxj1KN16lGpRc
 iB3L/6yBeFvnRxXlpBpLktw4PDN8sE7ulYUgJ+R8e2vYVt9gYUj0bJ8tMpG6HPN7FNkBNjFyhSl
 iLRrE5RN7sviwwu3Pzf92s6GlMqBGRSu2R6wcVOD6LCEn2RlqNGDYy5bngf5SM1wrIrzWZx/pPd
 n73F3fzx51J/m6K0fAPKhPedwerdoRL6ENRXi3T0GhcUNrdy4LhDay5avWtsAT1MkzsHyESJ5JO
 LJTBRxfyKRIZGoZCyLw==
X-Authority-Analysis: v=2.4 cv=edYwvrEH c=1 sm=1 tr=0 ts=699c5839 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hcp4X6t0sg7LPBOUZMsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ckG8eAAwk-uAE9hXv-IWXH_0IWLeNGEz
X-Proofpoint-ORIG-GUID: ckG8eAAwk-uAE9hXv-IWXH_0IWLeNGEz
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28403-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
X-Rspamd-Queue-Id: 0CCF11771AA
X-Rspamd-Action: no action

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/renesas/renesas-soc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 38ff0b823bdaf1ba106bfb57ed423158d9103f8d..bd8ba0ac30fa91fcf2a10edd0d58b064650085cf 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
 	const char *soc_id;
 	int ret;
 
-	match = of_match_node(renesas_socs, of_root);
+	struct device_node *root __free(device_node) = of_find_node_by_path("/");
+	if (!root)
+		return -ENOENT;
+
+	match = of_match_node(renesas_socs, root);
 	if (!match)
 		return -ENODEV;
 

-- 
2.47.3


