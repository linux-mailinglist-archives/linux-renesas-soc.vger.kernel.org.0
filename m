Return-Path: <linux-renesas-soc+bounces-28939-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3WskK4TCqmmgWwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28939-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 13:03:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 654D622006D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 13:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B7904304FA74
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 12:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73287385521;
	Fri,  6 Mar 2026 12:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h81yUjPZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8XrRT63"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3475338B7DE
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 12:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772798591; cv=none; b=RxXrFxqmS43MvIHi6cwGUbxkE7n15TkjPL2FVApl7ZmSMcncFgwPiGs0izI1mvoYOoB1xpHKI4yA8rr03vZEt44CnpKJ9rCvPBUlcb9QuMbegp/oIWzKWBrW2J1cHrvsBxaNF9bdoLWmep0vJylXixR/tQYgjCROjganKes93cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772798591; c=relaxed/simple;
	bh=0qU/K+Jn6p4HJpuIpj4ovomOIHxCEo+b3fXQbSBzGFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HTrRbQ0KAYD2iBVfczlWlPl8MB06E9cw3TjjM9hUIiqjzLlMeLdt05I65pxHXqo3rOBdhoativATj72CSAh2du7q4hnlVl1JheJUAK05DJvcCIZOr7mFSlzhWPTYifF04g9PrPIwuIB9R/Gz1xtu1yqssBVZJ2nzLCM08fRursg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h81yUjPZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8XrRT63; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626Bb1l41188910
	for <linux-renesas-soc@vger.kernel.org>; Fri, 6 Mar 2026 12:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K2v68JVE0LJpsqlnjF2XfsZGXl238tbP68H8kBVs8fc=; b=h81yUjPZ3x2wYqy+
	1uCNgNBIsf3talcDjRfs2lfzVXbNWQaMLHpbXXdwWGwUUCKPKVAQPfgdx9pjbtSb
	XGcNifE1I3LOgKpF5EtL9CSh5sy6qTbYF62y0vfxtAgK6SQPckkvsVT/EbAqs3Mr
	4EFAzUXOvOcim/g6IhMAmsn3xUDUYtlsbdE4cbemBA8z1Eq2neQ1OnakfJ1MkExh
	IDdcc/yW/fWhgNxV0YW9rri3KCc+dN1/sC/v+dt4VWG3IZE3u8mrLSPM74m9ADVS
	T1Vzp7NRMqhHBLYN7jUpQ70M8YNkwMj4ZUjKUexc2zRVF7ONfQOrEEU+1u0iOQ0B
	H0e2AQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqx14g3gk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 12:03:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb0595def4so6366307785a.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 04:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772798588; x=1773403388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K2v68JVE0LJpsqlnjF2XfsZGXl238tbP68H8kBVs8fc=;
        b=d8XrRT63DyedtArOrG5r9mKbVCgAqJDF/UlV+LiyEsogRZ987ba8TkkVtTgwMnvQPO
         9NitDlL1hqV9QL1XRkFhcBQ2gUl4UuC0HXyxQ17WL0GrESXTMH0nlmuN/eWEgb/Y79gr
         P4J+VMlyhDRSHeCnY6To4AklalLL7zDNrLw+KKgiaClju4w5L11i4zX3Ql62wKZpWYV8
         yDyavB/f/Fu2daHw8nDUQ7kP0Bwh5uqzN+XFf9XJthDOIn2IY+lAeGU0etN1Qg/2Aevt
         bSVvgGbwsHF2wOjmqhuMOIuON8ZLKUWYbAtt1AKDirjNTrbDcT3Vrv+GHKWHWYQ2x5Xb
         2xqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772798588; x=1773403388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K2v68JVE0LJpsqlnjF2XfsZGXl238tbP68H8kBVs8fc=;
        b=AQNIoKvMXnhN1oNmJSmnH3e07PAz5eFXKGqhK8siL4Es00oMOqIwwdV4ScQhnEQ8UR
         Z3p2jt7FBAXxwfCrezY2ybqbFKcjmXuK8fYjtLiei+t7oZSROcb9ZKJavQmJzCw0lvdN
         JZmcaIZybBk0P4Q4W6lD0mI1d/GE9NkY1LNpRSC1fcvs7ttklKW//pGW6OfPDqeux82S
         YccCtbuUL8IsT2jnsSjd4mYfuB8ykepzBq5M8rmTJp+Ez2DvtxMJ5QzsG3WpRskclInK
         6RnBo2IanQx2UCuBb0zLNB7lkakpEkK4NUdrDFVSD9aujJmGD+8WmY0NiY/pO+JdjQmS
         pTTw==
X-Forwarded-Encrypted: i=1; AJvYcCWIQuU57VhzSyxMLgnL6BoLzfIzotDv49jLJOWY5gqm/SbmhIErdneeSeEK2p4yoJuANCRnSlf7nLDm5dHkfzXSLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw99KTsqQTfDJ2GkDmcdObqRR/RMaTzYyU0Rh/2RheFXrsoY4CW
	8Juff+yxxRyy9fZm6RLYsGY6pppgQJxF5+jMgv1uflAdjbARahFn451m8Ec+EnZaByArbg70RI5
	1bDsA00fMlR/5PqrQBaKImuqTe+C9VGlstD2yn2ac6enCC01balDZRY0P0g7ttNoUYChu8+/SHA
	==
X-Gm-Gg: ATEYQzzJ62ifvc2vts9r6ez3lXHbvU9HRIwdn+Pu28XQqAGaWeCpwxoq19IzqPBQt6w
	R3t2NygSF/HwuQoWd5C+5YwRR/lONKegnK3KWm2coShlix/HQqdZhHpacnncq1C+mzSv6Sx5uxr
	RGpzHYnZ158TxBUg4Gf1McxLKllFfBTuOYrHn1zZ9PBl8mpQ58/k8nqjTOkVUj5dnCMMHzoaOj1
	e5cudsuVeRj3xqAfU9jaCbJ6XgNNpUdeVjgPb8ZIMtR7J89qsuaCvfJNems8EghFeOJ5rchx08Z
	JgQInyktmbrZoPBUM/io1Tf28moawjPGmNB61FbCMzGRqwoVMv0h83GYwy5D6P4AuLOK0FYxXkK
	EWp8zDP+seK7xefYTOcqlPUw/f6NrajK5u5iiBxfXQnsW
X-Received: by 2002:a05:620a:4408:b0:8b2:e3c1:24b7 with SMTP id af79cd13be357-8cd634e8fe6mr675773885a.29.1772798588410;
        Fri, 06 Mar 2026 04:03:08 -0800 (PST)
X-Received: by 2002:a05:620a:4408:b0:8b2:e3c1:24b7 with SMTP id af79cd13be357-8cd634e8fe6mr675768285a.29.1772798587937;
        Fri, 06 Mar 2026 04:03:07 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad1cb7csm3410129f8f.0.2026.03.06.04.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:03:06 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 13:02:54 +0100
Subject: [PATCH 1/5] dt-bindings: display: samsung,s6d7aa0: Document port
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-dt-bindings-display-panel-clean-v1-1-3086eda1efaf@oss.qualcomm.com>
References: <20260306-dt-bindings-display-panel-clean-v1-0-3086eda1efaf@oss.qualcomm.com>
In-Reply-To: <20260306-dt-bindings-display-panel-clean-v1-0-3086eda1efaf@oss.qualcomm.com>
To: Artur Weber <aweber.kernel@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1341;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0qU/K+Jn6p4HJpuIpj4ovomOIHxCEo+b3fXQbSBzGFY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqsJy6QKWs/86onDS0X79u8TjSCuYsK7kXkI4f
 X+KCSvseSKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaarCcgAKCRDBN2bmhouD
 14BBD/wJP1MouPXcUEseSrsnBW7PgSDQl9MEXMnvxojb/3vzTetwcO6CI7uXUONkfhNIJ4ziUQ9
 jdujvQOLNiKlWExNUhQ71FF9eC16GI6qF1T8r8uSKUjSZ4Rs3FicK35qs/AOSVqJHoIxrUc2rnn
 Sj4ScqIODBAiQOaI8HbhA5RhWbongYawwycZ7E64xZSWLeWOo0qN1FC70qGpY75YInvzoeZznAR
 I5nEorqzpdO72o6WCvI3QLRuKjBN/ywABTjPQWdPfjx6ItB71NkUa1c+2WgCDiPhLd8Te2Xmt3j
 0blJnO8ho+V5DW9RhdCSdWORui8Pw1D/1pTLetcRvnjnbvEizLRonluoHa01SXNsxO0JOfu9rox
 uR54pSsbw2RP0zR1O07btOLW1wYcMr9DHmXqtK3vyn21+i0B3sWzSrQeKwsXw5qCkMhmybpsrwx
 oa/haqNd+CKldw6U58GoHwmvebMbYHhu7uXMXfxfH6+f0Tl/AKNVV2VC7ktslpDIzCDt8yxmLig
 6ayWdArmdwMI+lASA8616o6r9+oHuUwSfQoZnxKJMO1fEQ8+vke3om5BWVKkWX6AOp39i/3E/5+
 VUu/MxrOTIZFouaUEjtalOq9Fr74bwPh8tdKXdtME/IZpmTtq2oZ0gXAC0hNcodkzB3HvghjKiI
 mdbaRN6XHx0S3ow==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNSBTYWx0ZWRfX02f0n6t4BVrB
 jYwcBkcMgic30ABLzBwyLF4Mt6Sr4+QHvZUuzwHld1uFCBdLVtFcG0a7q177D10w+r24tPgDMpu
 YmnkC/kr1Ts3FlhtVRCf7xEi0/0D5LIHT7ZESK+23UdGyvAvLrEIDRN529jZMVuupKzhJqrRt9D
 FyCQwkhMcjiS8pscZU3LIT13Q8+dGRDM0gL6wAMX7E284XaGkNoRZ8mErR23Tp+l0vn1qGijC3g
 /hh/sFyHI+NPSJdvRzUS43t9QmSuMsk99qZENJZmQI0KHJo9BjjpwQ1Cz2JN+g8DmShwSOuS26n
 NJ+fMcHIZ9w29tYuaRKJZQjcEDLqDnlV7ujVIKi7mm0vwQS4f39KfqmcLJFebTm+wNwhMmQKmOc
 qFo0GLpdsOlIVI65LIwtk9qwyhwJf1KGnjzrOWaAmcLfqKG8TAeLESsCd26COxB+DfG0zq95XvE
 mwz82QcSuw3tavQLfaA==
X-Proofpoint-GUID: 2e5wB-7wVc4sn8eVXObP6kqcrMcJvvR8
X-Proofpoint-ORIG-GUID: 2e5wB-7wVc4sn8eVXObP6kqcrMcJvvR8
X-Authority-Analysis: v=2.4 cv=e/MLiKp/ c=1 sm=1 tr=0 ts=69aac27d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=NWUlNo3lQsMGyr1Nd8sA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060115
X-Rspamd-Queue-Id: 654D622006D
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
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28939-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,linux.intel.com,kernel.org,suse.de,ffwll.ch,ti.com,ideasonboard.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This MIPI-DSI LCD panel must be connected to something, thus add missing
port property, already used in DTS.  Reported by dtbs_check:

  qcom/msm8916-samsung-gt58.dtb: panel@0 (samsung,lsl080al03): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/panel/samsung,s6d7aa0.yaml        | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
index 939da65114bf..1f753b706911 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
@@ -44,6 +44,8 @@ properties:
   vmipi-supply:
     description: VMIPI supply, usually 1.8v.
 
+  port: true
+
 required:
   - compatible
   - reg
@@ -65,6 +67,12 @@ examples:
             power-supply = <&display_3v3_supply>;
             reset-gpios = <&gpf0 4 GPIO_ACTIVE_LOW>;
             backlight = <&backlight>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
         };
     };
 

-- 
2.51.0


