Return-Path: <linux-renesas-soc+bounces-28015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NcuBR4AhmnUIwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28015-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 15:52:14 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AF0FF3DE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 15:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 25D423054649
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 14:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A805A42848A;
	Fri,  6 Feb 2026 14:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w61DOjpC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C80B425CE7
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Feb 2026 14:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770389448; cv=none; b=t2WIecaO24BJEFlvlJ1tUyKMaJ3mmooyba2yWcreK/1xyqfpj1+p1f8jeIGJkfknwckrbsLdkYKS7JkkRY+cU7mEKyuvo8q0s0qPUh/W/U0GUrE2rpWU6FWDRw9G76H96rZveOT4ynegfQa4zmAwTpLVoWiDPq2TZcPmJQVnF7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770389448; c=relaxed/simple;
	bh=pirzvUMS8i50SX74B9DHasjEK/A+JFKmccu8rvH6JXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CRpLFrGKtHlZCaOFD9wEN1/Bg4HiLM/as3bkoJotbEwgHBpnQozzTzf6yA2la5LbxuSSy4tlimQp3gOYmREKoQksuy+ZzRB9FbJq2ioebRt1PSfKlk3T1HK9IZ2ggos6Jo4dc6n0od3NwZCqAEQeophGrA6b+ndd5/PlZ6L9ruc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w61DOjpC; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4806bf39419so20008495e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Feb 2026 06:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770389447; x=1770994247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/72d5PFTHkT60QbelpzW/GReN1mxIpLMWRlkdIN95Hk=;
        b=w61DOjpCrOOldTj6kJXzEcy1+RRqFagslwNCBl72Zl/jsH1KYwsFNTyvalNVrab77b
         dLSLS/PGXKdiGhcy9nFPNuv/9HLZKafdVEMcHzRxPSd/G4fUHdkwlqZpyqa2RjavY+sL
         0a//fMMERPBcKzGX79TsjVJfuVZ8BCDoVBQnRKu2uuGIQVC6tLsXTtINL3cEZRPf49Mr
         M+yCjBpIVIUXLLsfVdAFHijfVIL2QXtR69ZVsPyn6J5gR3G1iheH9jMMRNslrYFtxccZ
         /lnc/xYVhV42xUOpR5u5jN1RnSDEu52cI3vQJFxJiyOhih13FHVv41+ok3JviTMjMSAd
         9uqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770389447; x=1770994247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/72d5PFTHkT60QbelpzW/GReN1mxIpLMWRlkdIN95Hk=;
        b=FkzjXOuY9rCXYi43nfquS02/FW//G4jbAh+CMwP2HSoTv+xcqrDZ9zaKv1PPJn6BA+
         9bd/2PdPeqWnmZ0shvRYVVXzhcgPornxZnEZtMYssOvdikwQkjht57jeIRfnrPPUnOeP
         2kqPr8vRke8X0V30nFdYsuBcYYIztdgJ2G6OT5P0PyY0M0ifCXkDi1aMmpYzQfQZxFpZ
         uepKj/OWE9e0D92DjXZhLOWrZwd3iaLN6czvByw8yiw7bVnKMFOeS0+Ucy9N3yv0PytS
         wh1dmfNoNMcUMvcCB6hR22WTihVL+cQXanCcNU6sB89IsmS/q2TPefeyG9PCINovOHb2
         YV5g==
X-Forwarded-Encrypted: i=1; AJvYcCVtEodvdffv5c17CmP1+CY+jnX4MSE/ofjuowvnRIBSnkmkPqi9UEE36aLgfEqAzGZnzooHdkEmqv4dlj15zkSkMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Wf/iakkFWFB5trV1V8XwIHYqY72oqEyTPeBqEZHzBvsBbm8T
	P9jnl5FY1DFI/s62VnYrab5Ku3CTiwPPW/FhVGKL0tC3oqYBBk2oZ+4LWgoXJeBBRqQ=
X-Gm-Gg: AZuq6aIVxD7Zt97iP7eAD+hfoTKPMsaOF13J7kuCa1qaJ9EusA2JpkeOAMW1eLtGq0m
	sO9QAwFhiwTfUHxnd+xWYNmhHOR7iSNmVRJZbJ7QojiWili+ottfLz7nxyXyIday0vAVtlTH1SF
	ZfP6KkYNg3DwEQP4tR2e7VAW0b1+8tJYUR8IOzAqVakpJzuZT/D/FFOymwkqaZKeLdGub5yFJVj
	INK2Y1Es2Fafsgu+7EnAf3orAGcZkuxjc5xHTxvpEhfVtIpAbYAd6FKym2+2Y4Dx9AB2ZICMl7X
	+m8x8pAqfvf0Vx5qArBUZfyqZ12pDvYm8XCRXUt6u/1hI9ur1i5kGNwXTqPGDYo1HO77C9DXX15
	T9bOdmXBFyZRseyp60KS0alEBdllp+ceayve33YviPgms8f3j+CAnfZ+OgcIFjLC7Pfw7W74eus
	gFfBu8ghOlBey6Ti1+/3+48Ju8YI05o0Ic
X-Received: by 2002:a05:600c:3e14:b0:46f:a2ba:581f with SMTP id 5b1f17b1804b1-483203db77emr42394815e9.16.1770389446464;
        Fri, 06 Feb 2026 06:50:46 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4832a38425asm3825805e9.7.2026.02.06.06.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 06:50:46 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 06 Feb 2026 15:50:35 +0100
Subject: [PATCH v3 7/9] dt-bindings: arm: qcom: document the Ayaneo Pocket
 S2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-7-5b79c5d61a03@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=716;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=pirzvUMS8i50SX74B9DHasjEK/A+JFKmccu8rvH6JXg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBphf+8LIVwVOGfaj8vA8kiyspuw1o2XKUl5qHvBU3G
 YjPBJeOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaYX/vAAKCRB33NvayMhJ0a4ZD/
 kBUC8ByNS0Z8Z5TN3IU/BTmOXJ0muNmK93A0saVzteh71XXt1UYFxQdDpGOVUgGS17Ml7LDcCSpnDy
 n8DkQkQQuUQYbZAS7zKZqMft0O6D0ABRS9CW5HNqPIhwyJHXhoibqLs1KrSY2xFzZhwxdyLHgcDUrW
 dlrRch7T7JdIygSFiTWzsc1BCaOC44MzEZQQ2hA9avqObcNKHrMrjlbAqcuY3u9JNXD8TXK6PNFsKc
 1x17X7B7ZWdh9xVvT6dwZqXaNCejL94wWvEYFjVqo70YgFPcsmDYcw2dCSEKH/pV/7Z8UOmdl2Plbr
 O3WOBhlozx04I8XWSrKkQ0KZJ3OREgz0LqfOgVVTSOKeUbRMwSN0mUzRxEWuDItyxTndSMvgDKaEPX
 pXygzstIhoYOGMar8ZlcJApMhT7xq9iW+JVLfdNIHoWQfU2+Wgc+zYES1gXBV23C2X5X5eadvwHk5m
 8c/aDlNqYiDW/z0Gi6FxTCL0wHo+8KKD59/SIoQRBpO2AfWiyc7lJR+VAaDsf7a+lJMHz7hfbdUtIg
 rJ6C+T0YKfzjO0ak/CMsGPIEEFFyMASlz661ELcYdJqEskI4+4udHvh3DY8KPntKPjehmrmbp93j7I
 J6/0ra7CTmZdAQ9G1jx5gSfAAqS92j1AjdxlANKszyhOSLylRTF7+Wio06kQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28015-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A3AF0FF3DE
X-Rspamd-Action: no action

Document the Qualcomm SM8650 based Ayaneo Pocket S2 gaming console.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..351cc2eff14a 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1042,6 +1042,7 @@ properties:
 
       - items:
           - enum:
+              - ayaneo,pocket-s2
               - qcom,sm8650-hdk
               - qcom,sm8650-mtp
               - qcom,sm8650-qrd

-- 
2.34.1


