Return-Path: <linux-renesas-soc+bounces-28402-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCfQC95YnGmzEgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28402-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 14:40:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2E6177179
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 14:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55EA9305A963
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 13:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F00FA25524C;
	Mon, 23 Feb 2026 13:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FKPEA8Fg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hcYZFp6j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655AE230BD5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853881; cv=none; b=CehP4WUxdC/9cQ4EkK3gp5upBAYrfC+Bsi9JGmd7KSwBlg1QiDRVOKy7oGLJSvLg98BPbjVhhGIefYi/IaIbiofhqQR2ZTF3hsyJjrKnZXKsNs3WtGKKcjrOfFH2quEdQdIwNEEf058Xrf92QBisbgvsVATTRRIRaRBCR6Wtad0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853881; c=relaxed/simple;
	bh=PJKjL5w9GmkNdzF3k8paqIospNea5xR2VwPf/5AEtMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IkdAze807cSG74C0ikMiG5dgH9GPPLUaerXatRJ5AW0p4t03LPF5MJcPqnPXqKZUHiPbf9w57Q62VldjR+fEZOcJc7UeS6uKRMXj76LFOhrdMeaPIzXCBRCBRbxnojZ9NaIl3MzPDipNlztWTfDt8x/sPBC4GW8VG0FMP6X5/vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FKPEA8Fg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hcYZFp6j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAWg883698120
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8IEA0OJO03Pwu/2FEJJpmeYxqL+JqswxTgLe31jsxYM=; b=FKPEA8FgiRKeXm9J
	CxfKM9/iMzcE+Gk5wEvWu5Kn3jdWqUGr4q+mhSly82EPrBiUZLxmUAId5zieD0uS
	b/e3qKrZ7lX7XI5ePLkFOIyloPBK7ln4unmLKt5bHmraRfcAGEvRnLt+iaI/5zYb
	cKk6pcUAvtErYGISlTVYtEiim/TRnJQGZqxYraeoRaYMZU9wvyrgmLjSTfYdkzRx
	/R+xQOGvH+Pn3gsEn8ZkZw9rmVRVENB1Q0u0XrpcSDSyzYmAcD5lhOARsBPaRyOj
	nrJACCpNaM+0mIP4So7pfxAbupEy+KKuG6Yp3xsBfZpKCUV04i2M/vBn6pfbtjP8
	TobfjA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn818fj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 13:37:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3b0d938dso4625984085a.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 05:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853879; x=1772458679; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8IEA0OJO03Pwu/2FEJJpmeYxqL+JqswxTgLe31jsxYM=;
        b=hcYZFp6jgQ6CFkcGfSFSbP5/74xO0u15+lhB3Q93PSfeJXRX4wXiksceDCCoGbELSs
         jYPWMtLcHxUWJUR+D5hBBcApoh53917DtVJwL4j86XIOaHOgF6CUoQupUD3JffzaFQ/L
         FWIxLV+pM3DhLKx5470Lt/gJFplWDdLdLpM1j3vM6mAJsOUal84nQO5DLCUOoYPuaH7K
         w+bB88zQvitYhIbR6z61Glbf8JBTWCUCaG0lbx3T7cIEEr8nhT1nhVVdQHdRm3GgObKf
         uuXjktOEqs8pDPO+41LtZysy4K6xq04xfemsAf4JKY7lTmSS7jvqyZfDvfnslGaxi+Ga
         vPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853879; x=1772458679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8IEA0OJO03Pwu/2FEJJpmeYxqL+JqswxTgLe31jsxYM=;
        b=TLJSMhEa9Za6vJwuomgF/QbHpMVTyPH3z6bB+LwnXst/QvHQ8dfQzQ1OBIPRW9f6Rh
         D8FesbUIu6NStvt6TDhk9zLFC/889O3/sm5dUS2/YJgwmGGEe4P/Fa0SScO5pqs7hT6y
         wGaTtjYe071GegFzayg6KPpCfm16elpOQMI3RW3FI3iEC6OjYGGgUpBCF2CLqGoWOs8M
         b3S6N3oZmAoFH/X+S8NqsSbCHFq3yGYoSw9xfWZrG0rfy3K+IOtf+UqqHWyPvNJaED/8
         ma4XYhDxDh9YsUNF3D60YInSt7MRI82/lGoFsxM8dnWQ9sse6Luc8YCeUt57KLnUQqdA
         s5vg==
X-Forwarded-Encrypted: i=1; AJvYcCWHosBP6WJ66bT3TvxSIs97eAmkjXFeKxEIPdGKrPGaqxYJUfTOG/qRtYEl6kpYd+rP+Sobd2TfAuaFmvxIUe7Xiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYqFYXH6ndHXZtM7ecttw0fP7IF4ukxu/EsjW4sQ0l2eJxjbIs
	0MQS0kSCv92Xzkj8yzcNsqBJ1/bziwm6rne3ZUfdBuaL69B4Jc2J2ZKpaiLQSzTPE4THiATbOQO
	bJ4mR5CtskmuHxh74/o4NopIwRfQmlTXkmd8J3ZHvA8pCtasJ6ZVuDVuaa5G0ZHmX/b9k8s0wQQ
	==
X-Gm-Gg: AZuq6aLUGrhGU/Rb3/PL4XEY8LDt8cWyInm82C4XoU9/Ufd4FbyE5LJMaC6tuVYQIUh
	vc56dPKYvuOCv44h0M+Y0kSNNuqv0B+zlP9EwcabCrcZXbBjVZstKoSIHLQOJ61keubDXfoxiRt
	Uj1DgC/MMhITw0QJRlvUMUoiZ1WdnBQBY7hUkdIe6t2AcUX8cnW5JPN8m+h+9NcQJrKAWnADvg+
	URXYrob9aKLIeBukLfDMve4TMR6fAdWGpcmdBo0bqGndd7WA3nGTEM/h9DBLyKG6GJexJ5l9gJ9
	R4moFfn7vXNwylQRxKLSfb67YvG+6i2RebCKisJL+nhT4EeCgtjwtyyaT2VQSE+98zvltyTImKF
	kcTwoXlseL9ikBNpC/1iclzAqUCzCOpj/K15j0dzkD3j7qs1VuUM=
X-Received: by 2002:a05:620a:440f:b0:8a2:234a:17be with SMTP id af79cd13be357-8cb8c9d2b8amr976097485a.7.1771853878719;
        Mon, 23 Feb 2026 05:37:58 -0800 (PST)
X-Received: by 2002:a05:620a:440f:b0:8a2:234a:17be with SMTP id af79cd13be357-8cb8c9d2b8amr976091685a.7.1771853878214;
        Mon, 23 Feb 2026 05:37:58 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:56 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:22 +0100
Subject: [PATCH v2 7/9] soc: imx9: don't access of_root directly
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-7-b45da45903c8@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PJKjL5w9GmkNdzF3k8paqIospNea5xR2VwPf/5AEtMw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFggsAfK2L599u52s0jxxDBJVDwECvhtJQ6BZ
 ShZXXzZl6aJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYIAAKCRAFnS7L/zaE
 w9TLEACvx7EUOkNExR6rxJvbiPrwBxde+MzYk8WnOY0KUo2qQYe2IV3v4Y2OLkNQxLORHNTmTet
 tL8qdFdcA7/EtkfNAUf86JGuaHxQWgvPaQLo82VmtcJXrb3s4ChhMHQTxwSIzk57nVcuxBwXaoC
 d6cLiDC/nMwvrZAeyb+0Z1LBwzE7OMUXdzVztRyUlBioOA+aG7+h03mNocovFYbn8rvTos+rY0Y
 e7h5NIVlwUODtq0Ev51CGoFbC6CaCwiNXJba+UycfegX2W0Kkhwf0Zyi6DiT6gQq2D9oI1fRdMD
 xIzw0mWS+oLN1VnrqlYu5wL/Ku4iTSggD+ob4YpLXraU5R+wYi1r0Azeg8et0za9it4PFjFPnfh
 Dl7dYRS50ulZCrHTUPGGGGvZLPZT0QgfYfmQTBBovf+cs1qrWcAVJPUnA+5OIsPfTAX4tiEFRts
 P28q4vNQSZ0M8Ztild3VhrhzLubEMw6II5ymoX4cbhfI53GoFeJAcgxeL3sNXMCDZjbybvyP/7+
 P6DMYb8Zm0nYj6H3x+3/s8WEK2ZkHPtYYlR/xxt5DIZKaoXnhqi5T+1/EOjQ5KwLwJVLhLEEqcO
 /410xgEfAAQKBXmwObvlKe9pciFTnNXitRVoM55CA5VOT0ToZ4cE5MSg6+N9VqPGbRfWHk49buK
 slcXvQ/kjdLSnvA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: UQyXBasIIMYmiwZzisUOzDPvgPNawK36
X-Proofpoint-ORIG-GUID: UQyXBasIIMYmiwZzisUOzDPvgPNawK36
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=699c5837 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=PMAhrox8fQbXPR-8CfIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfXzWoAOIUVvVek
 B1MZLzeCV09Poea2SE+d0Tt/O17Oo+EbV8/Vj7VdRbYdYLsNSEHlBwJEBDsbK0MG62wrlU2x5SR
 WbdJVJKX4WYJAiUKfmKCKLmL+ShU9BxKTvHdm8vu+OwpO1pAORaGFT8YxtVz2Lb9X1W6XWrSyYa
 3je9ErWND97NzO4itbQqSnR/yQkdGxh0vqZM20SyiidZyfqN/AeVwJqxGbPVK3x/DxED+Q7TYg1
 Qxawb1fgS5yVyts6fQzu8sN+GpD3WUkPstpF6LKyYzQBQlFhIRmZbCavAcyqMiNu7cvWAiaUn8f
 Oj8cHr48DxWKyeNiXVXBqviMrZEXatUHnzVnkBInKufzUOkCdBEV1+57b7E+wQCKl/uFJr7q0/t
 ZLNHSv3Zuyl3M0/21xy78S2xo7m5wOJ3Rcr/imHYViavU5cSw/f2cv2XvKYYQ52C5DTWWvk2Utd
 bZvHmNFS/K06dWpKaoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28402-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,i.mx:url,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,pengutronix.de,gmail.com,glider.be,sholland.org,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 9A2E6177179
X-Rspamd-Action: no action

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/imx/soc-imx9.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/imx/soc-imx9.c b/drivers/soc/imx/soc-imx9.c
index d67bc7402b10e2966ff77cbf3b15c087540bd377..58eef7d4f9089ae56891507e8dec383e69884ec5 100644
--- a/drivers/soc/imx/soc-imx9.c
+++ b/drivers/soc/imx/soc-imx9.c
@@ -30,7 +30,7 @@ static int imx9_soc_probe(struct platform_device *pdev)
 	if (!attr)
 		return -ENOMEM;
 
-	err = of_property_read_string(of_root, "model", &attr->machine);
+	err = soc_attr_read_machine(attr);
 	if (err)
 		return dev_err_probe(dev, err, "%s: missing model property\n", __func__);
 
@@ -89,7 +89,7 @@ static int __init imx9_soc_init(void)
 	struct platform_device *pdev;
 
 	/* No match means it is not an i.MX 9 series SoC, do nothing. */
-	if (!of_match_node(imx9_soc_match, of_root))
+	if (!of_machine_device_match(imx9_soc_match))
 		return 0;
 
 	ret = platform_driver_register(&imx9_soc_driver);

-- 
2.47.3


