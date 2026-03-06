Return-Path: <linux-renesas-soc+bounces-28942-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CzmhFojDqmnVWwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28942-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 13:07:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A143B22025E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 13:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E1E331246B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 12:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F0A938BF6F;
	Fri,  6 Mar 2026 12:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+P1j0u9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a7df5IOt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6DE38C2C8
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Mar 2026 12:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772798600; cv=none; b=pq8R+pYj3vO6TdFrt30zMeLa8VJWcNADZPkPrbt51xxHKk5+KSVJuMbz2Oxj9Wm6Nuf44GWxDtFm1JA4aKX8E/iy+SCh7uU9ymyGZllRPTHT3/pdBpQ3flVTZnL27maNBdQRTn1Mi4Oa33C9cV/P7IM9HzVGZ+pwRDQt31pq81Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772798600; c=relaxed/simple;
	bh=Y8BRD2ebcFiEnL9gO+I3e2ZcCGMVRz9NU3aU1YNQ+4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U6SkhGa65Gw2lHR2B6vbIttZUeMtds6ew6CoqYGOqvtpOp83Mqnvq3CbQGTou0NDJroJ8mGx2wCr9H90aT1GiJsFB2w11SNJ1ooET11sAjaBPVslE6QyKXnuj7XqHvkX+A95+iy7wdPbwXCJzzFH3yNhsvL/SVURzU/5gNVZWPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+P1j0u9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a7df5IOt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BbOiu3717351
	for <linux-renesas-soc@vger.kernel.org>; Fri, 6 Mar 2026 12:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8QfJo5HK9r3xw1PIFCw+iWNIINNp809eUwF8A/Aun/w=; b=c+P1j0u99TQClv2g
	yzNuDwmXjR+Op4+iDrJ6R9DuTl8U+JYngQnYNzerJ2+/6jl27DbPjxmXCiXjT0Ee
	ehmwBPMZWiY4R8Hc4NRBza6Tu6fFmssX6e5dWZSx1DAAnwjgwtI23SMU7RyJufMk
	CiTD3P2iEZQtM1YHzdc0omzYi64/ReEmRf0dOisAfGuoP1WGwJr58FcibwsvLgcT
	zSAdMCWNCcEmlAI3PYflVeWGLuGh3koVfHPEc5+BxYIEWO/J1F9ITSTNSsloR12/
	wskaNvNUyv7wevGUkdaXSvsEfKNbqshy7HIJ7D2qL2ByX+kZdCWU8wbq4TTcy9Oc
	6vncNg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqv98gf59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 12:03:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb3ff05c73so4723918785a.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Mar 2026 04:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772798596; x=1773403396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8QfJo5HK9r3xw1PIFCw+iWNIINNp809eUwF8A/Aun/w=;
        b=a7df5IOtw96Q2wsJ21ZsuqbsEoS1AwqzRtqHcu8qSVvjZztye8TM3qiG02rHXzNipK
         NrmBB4alqH7MdejyKSohbpiE4KpPdztB8oax9dDzgQeZw3N18vnM6sqJ/i4iJByp9Rj5
         mc6+UFMqdpLtInngV12bZTpOFKJX/qKEda0+diQtMl0Yza8l+lKsbupw21zxueHDLjY6
         vaVy0wJfFIsxgXuxRg5e9n69qqOpeizHjLtz85dm1bxWAOvDyjbiVrqtnfMPV4yP3Psj
         DHegW2mYHDYY9RrDeFcF49zUQr8ZCcHxpJ7oBm9LJrkZa00xht0nPBkYwXBJpMSRsHaw
         lzCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772798596; x=1773403396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8QfJo5HK9r3xw1PIFCw+iWNIINNp809eUwF8A/Aun/w=;
        b=REiRe8ZcuoczEo+k0MWNEDXi7yM/Ud18VD0K3jm/jbnaag7lBXEoDTyMwSVmM5keUs
         Uojkg2eI7URorvgwA5AVrLKDZPm2CjP5QzVXx7GeOas5gFnXK24M0BK9EVoEW3KpgH8q
         RedI2R1nZ4TQn+s7B6xUeJz2RjZc2VxDkN2P3DWf08UQoUgBgauHd1FegjLkTSHlGGJM
         VsjrRcDrtNY52Ed2o88bXjtTyEnk5dS7+Aw2xAduphWl4w3zH0Z14y2j6EVw1S8xVnck
         aumFpVNxHkJ47mXvaxJG8Vj0SCPy9CIPWnmd0kSJgoF1CS35AGvx1Tbc/4N4TEb9JHd5
         peHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoI6lCTw7/0F+yVuF1pCJ+qvKlJIaiKKALlr/4fR5jgzmG1Vna7whGXdEr0erhaJqHZ0jnX6ip+wvsU6ik9CdZVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8ewXTUaxsn6EmiBG9DNzXJkY7OqwKz/d2l3oBcfuAmKO6+xoR
	rKKVbovGbSmQJ9NZX6N45dogvZs60Cf8bFW+2j8tu+Q7BK27JE7PzkNOvCi8I3suD2Yj3Q+nlqH
	mNqnCj/Nbj1Yk8pKCt6R6C4hqMWwTpC7tm33p3wfThhOU53AM0mVL3jpQ6ldEbff7k6vaPx7Y+g
	==
X-Gm-Gg: ATEYQzwl6Td40K5oKlegVxzK1KaSHiFfE4mTBqcMbKnTLhtVovi5EqCuJiI/dmC4LoB
	UBGAJGneKREe5+CP7ESqXX/W7dke69i2uG+ZgNz6PXbEPIQtPz9KH567ScE+xk0ScAjMWKgrw1l
	4AsTV4FQ9QTizRyr7lRoLE3w88dmRpPDYrnDxG9qgqYKP572VVa1mb8Kkdkchp/50scAea1Aj2R
	K6Sq/6GOt9jD4jhmZHUKamMlM4gXWRAsY0L7kZP6f4FKdZNIkfUWt09z6LPuJtv4ZO9CBPFND2e
	TLibnDmOc2zuy6jGib2LAJQqRhTQmOAB10hUPSE0jX5F0p+7bS5RTmw4ebTMXU6FRyY6dU06Jq9
	MjjS5jiv6K+6Ep1spdBxrxUsd4nSdAxiPIeQKMiJMOK8Z
X-Received: by 2002:a05:620a:4620:b0:8c6:a5c7:a7ee with SMTP id af79cd13be357-8cd6d4bc1b1mr204031185a.53.1772798596429;
        Fri, 06 Mar 2026 04:03:16 -0800 (PST)
X-Received: by 2002:a05:620a:4620:b0:8c6:a5c7:a7ee with SMTP id af79cd13be357-8cd6d4bc1b1mr204027085a.53.1772798595919;
        Fri, 06 Mar 2026 04:03:15 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad1cb7csm3410129f8f.0.2026.03.06.04.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 04:03:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 13:02:57 +0100
Subject: [PATCH 4/5] dt-bindings: display: panel: Align style of
 additionalProperties
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-dt-bindings-display-panel-clean-v1-4-3086eda1efaf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12585;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y8BRD2ebcFiEnL9gO+I3e2ZcCGMVRz9NU3aU1YNQ+4A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqsJ1joJjeH50hDJmMgP5NhbKhC4tA4iN0aidv
 jytVxxZR/OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaarCdQAKCRDBN2bmhouD
 1/A4D/0ZhzjGHdGqnai5ZhIyrbK/DQ6HMbHE9jc5JxbEfvaPBCrBSwhuWj2Notj4F83mudKCKmi
 XwuwwzVS4sea+JRrzjhNUHWug7XqkxTmbZv0/Jls3RXHKGNUzFGnrOMAQlH24LJBNVYv4k+n9WI
 cLtmB3w277rlS5iWENuLtnmrgIGIY9W6QrrBsTvq27PCM8e3/ANujICSOJ+QM8ePXVXn0omNQxu
 /azXi5+SasbU/ree3N7Dw5g+Fb1FZmU6/5CwyY6osNotjsDCmjyD6a+jClYfIR3yrV9Zazuw3tq
 d2szyvpKN80CP4n+SZC3JeZBFx2x9ClJs1B6uKwPE7DhZ7KpezkJf7PLgm7ISUsAJ+Fsq3CT27j
 VrvTaLLNlAYoVa1KMeHARCzlMrRLGTq86273uH0ddTcBEvxeIVwJN0kUOxYStfdxLkab1jWxgBs
 mk8ETDyds1BHupzxvYDqM8PrUavlrTi96VOVkBR4tV+8/iOMdUJ+W6/1jAdsXPWSRY+8e1mE7j+
 Jt3WkCgrqwVsgpVoJABAa+1XD4hbYRk7+aaQy35FooERTbaXKcOwl7aQmmpKSZbmz0GjO8bvs+b
 81YzBEBlFfIgboArrUG1FBM/Sv9OJHHQevRkxD6ZTKR1p39YDym6rY/ZaYxitRGI4DPU3TLX3uD
 WLRnrES2RgSYwEA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: IOuOqNElei6iKSXPXm8Sc-FoNQRVcMdy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDExNSBTYWx0ZWRfX+EV9FRsrZgh6
 vNJY6pUGlcF3KXv8r++GQpReLwTRX3nnX3HmmEbx2JiBWAZ4FXokh5Xuk3gJhp0TK8gGREyUQpc
 fITnBA485zlT8mU0LehfaJRLO3Nyk/S4SLwxq87unZnNEhS/Iw9RxZwdHFsk1CKPwUFtOfz6Gj5
 +2AkxwYB1kxlsY7VIg5DrKZPYVC6BEVzbgExCjCTXOZUA5U5kgaMVrO/bP/nt3Y5XmrbaRR/Dcw
 xrWsSEr0bqKmWq5YIcC14f9hr0/n5Gv0DV0UegBQy8I5zkl3ApSE/+2sSy/veUkfMEtPKaYqsHD
 93HNBevUaPbxcOWZ5W3WO1IIc6w6kZ1Q3KCVcQ5kOTarz4ycpDtM2GWDft3rMuJQ9EX4H19s0ZC
 6DF641cuK1Djh+kFGGSo2UUf//1dvLkslbz2jkrj4auiOzueyqjNJ8bIrfHw4KTJN/U2ILishcx
 L7AmVJ58kONv7prmEAA==
X-Authority-Analysis: v=2.4 cv=LbcxKzfi c=1 sm=1 tr=0 ts=69aac285 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=tGnH7XJvyaa94d3unYUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: IOuOqNElei6iKSXPXm8Sc-FoNQRVcMdy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 phishscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060115
X-Rspamd-Queue-Id: A143B22025E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28942-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.1:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FREEMAIL_TO(0.00)[gmail.com,linaro.org,linux.intel.com,kernel.org,suse.de,ffwll.ch,ti.com,ideasonboard.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

For code readability the bindings are expected to follow order shown in
example-schema.yaml - put the additionalProperties/unevaluatedProperties
entry at the end, after listing all required properties and possible
"allOf:if:then:" conditions.  Meaning of this style is to close the
schema, after listing what it contains, with final "nothing more is
allowed".

Move the code around adjusting it to coding style.  No functional
impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/panel/advantech,idk-1110wr.yaml       | 4 ++--
 .../devicetree/bindings/display/panel/advantech,idk-2121wr.yaml       | 4 ++--
 .../devicetree/bindings/display/panel/bananapi,s070wv20-ct16.yaml     | 4 ++--
 Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml | 4 ++--
 Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml     | 4 ++--
 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml   | 4 ++--
 .../devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml       | 4 ++--
 .../devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml       | 4 ++--
 .../devicetree/bindings/display/panel/orisetech,otm8009a.yaml         | 4 ++--
 Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.yaml  | 4 ++--
 Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml  | 4 ++--
 .../devicetree/bindings/display/panel/samsung,atna33xc20.yaml         | 4 ++--
 .../devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml          | 4 ++--
 .../devicetree/bindings/display/panel/startek,kd070fhfid015.yaml      | 4 ++--
 Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml  | 4 ++--
 Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml | 4 ++--
 .../devicetree/bindings/display/panel/visionox,vtdr6130.yaml          | 4 ++--
 17 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
index f6fea9085aab..76b48836ddf6 100644
--- a/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
+++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-1110wr.yaml
@@ -41,8 +41,6 @@ properties:
   panel-timing: true
   port: true
 
-additionalProperties: false
-
 required:
   - compatible
   - data-mapping
@@ -51,6 +49,8 @@ required:
   - panel-timing
   - port
 
+additionalProperties: false
+
 examples:
   - |+
     panel {
diff --git a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
index 05ca3b2385f8..c9b066e69e2f 100644
--- a/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
+++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
@@ -56,8 +56,6 @@ properties:
       - port@0
       - port@1
 
-additionalProperties: false
-
 required:
   - compatible
   - width-mm
@@ -65,6 +63,8 @@ required:
   - data-mapping
   - panel-timing
 
+additionalProperties: false
+
 examples:
   - |+
     panel-lvds {
diff --git a/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.yaml b/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.yaml
index bbf127fb28f7..46e7cff5b2fa 100644
--- a/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.yaml
+++ b/Documentation/devicetree/bindings/display/panel/bananapi,s070wv20-ct16.yaml
@@ -22,10 +22,10 @@ properties:
   enable-gpios: true
   port: true
 
-additionalProperties: false
-
 required:
   - compatible
   - power-supply
 
+additionalProperties: false
+
 ...
diff --git a/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml b/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml
index 287e2feb6533..9a2c532dbc92 100644
--- a/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml
+++ b/Documentation/devicetree/bindings/display/panel/dlc,dlc0700yzg-1.yaml
@@ -22,10 +22,10 @@ properties:
   backlight: true
   port: true
 
-additionalProperties: false
-
 required:
   - compatible
   - power-supply
 
+additionalProperties: false
+
 ...
diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
index 5725a587e35c..182a2b825e1c 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -54,8 +54,6 @@ required:
   - vcc-supply
   - iovcc-supply
 
-additionalProperties: false
-
 allOf:
   - $ref: panel-common.yaml#
   - if:
@@ -68,6 +66,8 @@ allOf:
       required:
         - reset-gpios
 
+additionalProperties: false
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
index 3cada0f82951..aeb7cb26c058 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
@@ -49,8 +49,6 @@ properties:
   vddi-led-supply:
     description: Voltage supply for the LED driver (1.65 .. 3.3 V)
 
-unevaluatedProperties: false
-
 required:
   - compatible
   - reg
@@ -66,6 +64,8 @@ then:
   required:
     - port
 
+unevaluatedProperties: false
+
 examples:
   - |+
     #include <dt-bindings/gpio/gpio.h>
diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
index 96621b89ae9e..43e98bb07c38 100644
--- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
+++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
@@ -47,8 +47,6 @@ properties:
   panel-timing: true
   port: true
 
-additionalProperties: false
-
 required:
   - compatible
   - data-mapping
@@ -57,6 +55,8 @@ required:
   - panel-timing
   - port
 
+additionalProperties: false
+
 examples:
   - |+
 
diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
index 37f01d847aac..2af993d73619 100644
--- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa121td01.yaml
@@ -44,8 +44,6 @@ properties:
   panel-timing: true
   port: true
 
-additionalProperties: false
-
 required:
   - compatible
   - vcc-supply
@@ -55,6 +53,8 @@ required:
   - panel-timing
   - port
 
+additionalProperties: false
+
 examples:
   - |+
     panel {
diff --git a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
index 1e4f140f48b8..1f697dab832b 100644
--- a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
@@ -31,12 +31,12 @@ properties:
   reset-gpios:
     maxItems: 1
 
-additionalProperties: false
-
 required:
   - compatible
   - reg
 
+additionalProperties: false
+
 examples:
   - |
     dsi {
diff --git a/Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.yaml b/Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.yaml
index ccd3623b4955..871e4c2d9824 100644
--- a/Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.yaml
+++ b/Documentation/devicetree/bindings/display/panel/pda,91-00156-a0.yaml
@@ -21,11 +21,11 @@ properties:
   backlight: true
   port: true
 
-additionalProperties: false
-
 required:
   - compatible
   - power-supply
   - backlight
 
+additionalProperties: false
+
 ...
diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
index 46fe1014ebc4..8fb7c013dfb8 100644
--- a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
+++ b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
@@ -33,13 +33,13 @@ properties:
   reset-gpios:
     maxItems: 1
 
-additionalProperties: false
-
 required:
   - compatible
   - power-supply
   - reg
 
+additionalProperties: false
+
 examples:
   - |
     dsi {
diff --git a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
index f1723e910252..1bbe0da3997c 100644
--- a/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
+++ b/Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yaml
@@ -43,13 +43,13 @@ properties:
   no-hpd: true
   hpd-gpios: true
 
-additionalProperties: false
-
 required:
   - compatible
   - enable-gpios
   - power-supply
 
+additionalProperties: false
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,rpmh.h>
diff --git a/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml b/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
index e32d9188a3e0..1beb4ba92248 100644
--- a/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sgd,gktw70sdae4se.yaml
@@ -41,8 +41,6 @@ properties:
   panel-timing: true
   port: true
 
-additionalProperties: false
-
 required:
   - compatible
   - port
@@ -51,6 +49,8 @@ required:
   - height-mm
   - panel-timing
 
+additionalProperties: false
+
 examples:
   - |+
     panel {
diff --git a/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
index d817f998cddc..0819f38a9d2c 100644
--- a/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
+++ b/Documentation/devicetree/bindings/display/panel/startek,kd070fhfid015.yaml
@@ -31,8 +31,6 @@ properties:
 
   power-supply: true
 
-additionalProperties: false
-
 required:
   - compatible
   - enable-gpios
@@ -42,6 +40,8 @@ required:
   - port
   - power-supply
 
+additionalProperties: false
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
diff --git a/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml b/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
index 187840bb76c7..49ef45c03593 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,r66451.yaml
@@ -25,8 +25,6 @@ properties:
   port: true
   reset-gpios: true
 
-additionalProperties: false
-
 required:
   - compatible
   - reg
@@ -35,6 +33,8 @@ required:
   - reset-gpios
   - port
 
+additionalProperties: false
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
diff --git a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
index f0a82f0ff790..f61a528c0413 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,rm69299.yaml
@@ -36,8 +36,6 @@ properties:
   port: true
   reset-gpios: true
 
-additionalProperties: false
-
 required:
   - compatible
   - reg
@@ -46,6 +44,8 @@ required:
   - reset-gpios
   - port
 
+additionalProperties: false
+
 examples:
   - |
     dsi {
diff --git a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
index d5a8295106c1..c99f4146f1bb 100644
--- a/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
+++ b/Documentation/devicetree/bindings/display/panel/visionox,vtdr6130.yaml
@@ -26,8 +26,6 @@ properties:
   port: true
   reset-gpios: true
 
-additionalProperties: false
-
 required:
   - compatible
   - reg
@@ -37,6 +35,8 @@ required:
   - reset-gpios
   - port
 
+additionalProperties: false
+
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>

-- 
2.51.0


