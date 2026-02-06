Return-Path: <linux-renesas-soc+bounces-28014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLb1BY0AhmlhJAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 15:54:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 894A5FF4D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 15:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EABB2308F69C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 14:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E718426EAB;
	Fri,  6 Feb 2026 14:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i0aorkFC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4533C425CD7
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Feb 2026 14:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770389448; cv=none; b=e+u7uHFfe3LHeJjdZWL9bXzJruB/YxtwUAWEzyAPrvgimrOVIWYZh6xVMXiNSWXUhDiVq09VDip59wg9h7HMmoPN/+Drrk8K97FVpcUlSzW7LpEKk+TYW9kb6MtX1VXokT/GMtyBc1wkQXLsMtK2Zo3Hd5SMx2796Xjig/TKn4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770389448; c=relaxed/simple;
	bh=xjSbwzZtG5gO7c0c14CObzQrxd0ynl2lj1Czc800QEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cqplHbifvlo+xqK6AkvnD9BJ/7lx4bUbVlgs0/74e3KYyEU1EAoxMDLh4mZEOjZOnS/TExarrCziJ+t5npwj9bF8YttUJv0VjuQs8iATfeghLm8HzqCEoghlDaieqHS41n+e7QVvq569VHK1MzIcgk5VHBx2A99AftBlZsM6mYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i0aorkFC; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so22607845e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Feb 2026 06:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770389446; x=1770994246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/S0eg0m7isWhJo/g2N8HxsSID1GAb0gdwF9PpLKomXQ=;
        b=i0aorkFCznCoPibSub6kpOKyeDFgw5BAx5m46zB8uf0JmChu/HrIa6mLHKmJSJfY+m
         6rBYFgwgO0q6FG4WvR+q8EtB7oJaWn17GJ/GZIkWleOmyDAyj4mJmJ0uaIrPMVkR2Soc
         VSYQMxUvKzoMw5S5Y/H6hHwckh7Fok8SghmJRtbxu1TO/8bno7LNk3ZNQWEjdWwRJdLB
         tCV2tKH5QlzL1k6BRhICQmzaToV0BX3vvKZLfWCkFoHeGYHZZug+1nrqIioAFo6A3B0J
         XC0r9UvK9B9VcxGoOKByiKXfSAcupguIGoF6aoIQu/sGan3So7ZLYq5hM0VNsanF74L8
         hEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770389446; x=1770994246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/S0eg0m7isWhJo/g2N8HxsSID1GAb0gdwF9PpLKomXQ=;
        b=r/IbKJYyNSSyl8kOSY1hcmMphTOjdh8yiXep2WzUnu/vdYXPLpLYLuW0Zns1fBSZeA
         Ya6ioYOZLftZl9tLS4WN+WAwzdMVphXDkCq/XJF9Ei5tr6b2St2Ke3vrA4HoDRIgqvSC
         BAdxKNWKoteoTS+dFnSusbbMT48gX2A0Wa+AozLSWLlqiqi41bZTIoTiZBtdPRGzMEtz
         H2NqKYzP1ka1f42p/pxN4HlsbraZRQDJ9UDdQ7U9/+dSF5TyiOAo1eT+zJx6Rtp0cLeb
         9VbY3jVUKeZ8vD/CqQE2el7sHKaRl2jxUZyX2Y/XwEaqkiasUlZAcxsqP0F+0XF1qWo8
         sEYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpi3qh1TjEcDLi8eTkR3AA8Y6tFlGy2+nUoSbsu/KDIeJixnYVbS490K91v23UkZKE1dtYUF7VdtVHLZYM9rwBDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ1UZZMVR3AkhFz7+lvJCdgwktNJTD+YI+MZ9P2h1DRtha4rfi
	btqZ7ltQEmPfAQCrr/H3t9HtTCPrxMCnex1WVaAbeY7R3JhiK5JR1JRSMNUuZQyfLzk=
X-Gm-Gg: AZuq6aJ0hLj5jxoZovTykzfLeg2vNLVOgdRwzfi6fHRdhFMpAnMb/xkU6AozJIFnl8F
	2lQAy4BrfbaUwU8JBtizPBHIWnyKdoGGmMemcLGVL5H4Eh+w+74c9QaFt258SWZl2vuqDUW5+yr
	88cRLopHW59lQA7iMdrt5jANrEPQc0AQQCM1/n/RHcFNYyQcpu1uC+d05shvqGyoy4UKZWhShFA
	5ui5e1tQZ2JU0QPj46kwUGhY9EoVxu57I23KDVQLrBOBdLCB6o6z6dZVsulpg4CqgwZ9bWN6xba
	iDtU+MD3D2KugJyuhIgJK1MiU8UhutqiEqfyGyYO5bbrTMG+cO4zOkMayYye24FQXM2PNJrm/rI
	b8gxepcV1wyMTaVlB6F17yUlJwg7jmroWKc4RQNUGlzDtM0rmr4JJzHyeTcWlqA98/WIlSvRL17
	ZMKWUlCgUrBf6e1KPXnfHe/pqUxMoxoUTw
X-Received: by 2002:a05:600c:3f08:b0:477:a246:8398 with SMTP id 5b1f17b1804b1-483201dcfc4mr45291315e9.2.1770389445562;
        Fri, 06 Feb 2026 06:50:45 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4832a38425asm3825805e9.7.2026.02.06.06.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 06:50:45 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 06 Feb 2026 15:50:34 +0100
Subject: [PATCH v3 6/9] dt-binding: vendor-prefixes: document the Ayaneo
 brand
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-6-5b79c5d61a03@linaro.org>
References: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org>
In-Reply-To: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=982;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xjSbwzZtG5gO7c0c14CObzQrxd0ynl2lj1Czc800QEA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBphf+8g+1NPjgeJYwBAdgU+CA8HJk/PsNY/WtwXdyu
 i3Q1KXSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaYX/vAAKCRB33NvayMhJ0TJiEA
 DK9zFBLu9rmXyXa5in0iqKaKheQVxSDqnHAbfbf3BXqiEmnHuedAe9egyNmclZSJ4NOohRn8GVe3pk
 ztmewIdHh/6pQLHWjZMt8i5/l2vXZ0wosRXVom0ot+22LwCh5oufi/RMCiJff+JhdM9Ru+epbf3KFM
 J1s1rIUMDnF/fd5N0Eu6BVklVQh2UIQCn0C1Ya4kAhj/6ElouepZllyAR/jaK5H6z4pNuu14imyfSW
 38xlF8sBmpyXsoYXTZMRqe61qh5eR02Q4tZHjrK9QGPMWJkUtbKf1WzwJZ87M5O5aLuqnJtjTlv+j2
 NTy4RCxKQzMRLMK8qUOFZ+bsapALsB1ZOstCRRPKPCZRJgwLhkiT9kWltlsVqgj2yb1gaALM4MndTc
 32X2SgvyxLg2lrxXoqBZUdxRx1ZJDSShwWZdZo8OyISYBoPbwEx2ZuwhWtXft1BHvjpvQlFLhkS1mP
 nvyF+1u5TbBY39cCom+gUh1Kkwx5o9Tz+w2+pQCAm0gUNuakVgGe8ABOHnPo7m6TrDtP2mHZByH3oC
 +7hvPhq+a1J6jKmkjqQbJCYRkZvAYykYHoU81FiPo4+EaOU4yVZkFXxOqX1Cm45FDeFk7N6MbpniOk
 zRFxYjShLB6j8itkdh1lveosi+F0TgjtrGcm82hsfNFR3yFBVTGjWvO+b7og==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28014-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,ayaneo.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 894A5FF4D1
X-Rspamd-Action: no action

Document the Ayaneo from the Anyun Intelligent Technology
(Hong Kong) Co., Ltd company.
Website: https://www.ayaneo.com/product/ayaneobrand.html

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c7591b2aec2a..45fb1a3a3a06 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -217,6 +217,8 @@ patternProperties:
     description: Axiado Corporation
   "^axis,.*":
     description: Axis Communications AB
+  "^ayaneo,.*":
+    description: Anyun Intelligent Technology (Hong Kong) Co., Ltd
   "^azoteq,.*":
     description: Azoteq (Pty) Ltd
   "^azw,.*":

-- 
2.34.1


