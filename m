Return-Path: <linux-renesas-soc+bounces-27470-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IO6zODCMeGmqqwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27470-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 10:58:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C49CF92399
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 10:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4E4C030066AF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jan 2026 09:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7EA33A70A;
	Tue, 27 Jan 2026 09:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DVJ4L/G9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC83B33ADAE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 09:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507871; cv=none; b=K7MZlygLdlLg7OEkF/VHAIariIC1ooxTqapcNsDBdQaNbx4nthIxlzp3mTj3VY4ZfU63/V7cUZTmU6U9HYzTEyPD/akIEM56Sj6TJJZxB8tDIgp3T1L7yYI4SEk+EzaC/C/NWQbAbcbbp2i2Od52IztSSA8WguD3q4ANfBVI89Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507871; c=relaxed/simple;
	bh=pirzvUMS8i50SX74B9DHasjEK/A+JFKmccu8rvH6JXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rfzj/4mWoPxi6vd4gKh6si+2ivmRQelbiydBJ0Dzug3QiKJ/mS6p0XOIgrYQddngACLUVP4cWUhxlX2UT1WbHxWULt9XETn4V0GeRJ4OlxF0754WRbHsHR0JrxVReLQBA+PJYc4NRGcg+TIDwZuQMTjp21im8Hjcxc1Vc2MEvIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DVJ4L/G9; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47ee974e230so49037245e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jan 2026 01:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769507868; x=1770112668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/72d5PFTHkT60QbelpzW/GReN1mxIpLMWRlkdIN95Hk=;
        b=DVJ4L/G9jNhAiDu8bQG12PnQqDrAVD7z2J0rEBczEt+Ax1Miyo2b8Y2Pl3imp9MsiH
         6AUdJVd23Syw1UxP4Amrnghve4056g8QKM75MyUor3WFQX0Diof06Quksi110n4/Kxls
         qxAuGmhvhCqR/DUU9mBYtVeu4XwEJo6wuOw0gnTssNleLPnB0mOkRFEuIQsJ8duTLf5O
         XhwBEu5uZmiuJj57YTPows1Wko3vrHDgsXMt1yPBwPO1TYOuOTlu2TA4dgfiCQ1PPOUh
         46iYQ5Pr0gHAbHjUFoggBkS6i64B8I0O8FbNSGfsOR8oHDq2Az6CUq3Ij4IDbsNYL1Jy
         ELsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769507868; x=1770112668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/72d5PFTHkT60QbelpzW/GReN1mxIpLMWRlkdIN95Hk=;
        b=wOj7s8bNQsngpIBDJnYD5Keo13iwuwdML4cE72Bfmi/xbK7EjoXxebyaBlmGqPn3hx
         klRv8hZdPoc7zE0PRuG3OSxRD+3jLMIJxEKXItX6b3HE5C1Z8kDFwcXeP2aff/SAxT1K
         ZmgWhzQxWo7l5OVzIP0sjDS6fG2ukQwRhD6Pea0sDJKwj6kno4jrZFiQc9WD1gCb7sC5
         4tbF1AZaHmR5VwuYETlbsccRaP95xJ2eR3H4uzGg2p+su9GOnrABx9P02ZFjbpQn4X01
         SGzNxcbGjAtBXLVJSoBnePGJyltbWFFgEWZlypOF+otSiNqG30uVhDs2j+MLkT1FZw0o
         /Pgw==
X-Forwarded-Encrypted: i=1; AJvYcCXGq6Alw/Ze5kXba4/XuR4z3dEm08Klz2F5QyC5gJaewVhrcIO7/JV2/Y2UcVXj0Ngaymm8D4j84tKpPMm6HXuiFg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/+XI63ONAEIl98Qltu+ZZPxkYQUsLdP10mljZrvCwvMu0Bmks
	qsdK1e6xznp2UBkR+kQl+nnXycJUaAY2LhxUiNqVL9uqIo9S4bwpKmeEsChE5qBj2Z0=
X-Gm-Gg: AZuq6aLU+GNQmGLO9/oRZcnASj8Ag0SqqU1RrrbVsEkWTVre4Ad2B93IRcw5EgGPg6q
	4ZEgV1w28tcnS55gjtb8jkxowZSxJiG0Rhi2bdEgDhaa1Tu4JbwWalHhlPDzSaw25YQBgcsMYgL
	aQujMfrk5qe3P69YI5iD9Pb72ONe4QZ/CDNXhSEEOp5bnmvSvRKF4/2Z+ZDzfejnc8Zi76l1sWJ
	PHfsLB8v6RH1cBjKEXNSI5R2worbVFXXsrZ00EC4J9/mLDSigTdFHmXjhDqOV1YtyeP1tuweaXY
	UjsEcyKKPKLpiTOYdiEW6kADClOkAFA3W0NHRxchGhJVLFeR8icIFlLOqCdN/8iVem/rTWEmHxw
	fROysT1GoVcMcJQrjU/uoAXswD8Qu/OeIzuGRQoo2BNP5/3BdJW5z5pLtBLu8lON2GOyDh+TK9T
	X3OiJmG9s3bxwQ/XIMEg2mFJoV1gExxCzFbTahkQ+Ktw==
X-Received: by 2002:a05:600c:34d0:b0:480:683f:76e8 with SMTP id 5b1f17b1804b1-48069c7c265mr12611895e9.26.1769507867692;
        Tue, 27 Jan 2026 01:57:47 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bf93cesm49056225e9.9.2026.01.27.01.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 01:57:47 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 27 Jan 2026 10:57:32 +0100
Subject: [PATCH v2 5/7] dt-bindings: arm: qcom: document the Ayaneo Pocket
 S2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-5-c55ec1b5d8bf@linaro.org>
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-usb@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=716;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=pirzvUMS8i50SX74B9DHasjEK/A+JFKmccu8rvH6JXg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpeIwTWMafMrwJi/UrUblmDswBaoYuUWQ2fwrzpDVA
 O9HMxsmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaXiMEwAKCRB33NvayMhJ0UFBEA
 DPXxue632XoOKUO20a+YCsKF2UAhWuEgIA/+CWcQ8AAkzX0mKU7Ada7O5tgYC+2C6JOx2B2DQX43te
 +5aBc/dnZY90jLZ3DsrXJS2l5r3LPEBqFYiU8u0M+pLDYuDucZBdExoCYmTVshHoXtkJ9LSKSo6nnD
 gqQ0rEjVHTYrjcLYTIxxrgyNitSAFvzcgsm572Gu4urrwcWKJPKHg+PGxRimxRLB53vR1LXsM4m9Eq
 3I/aPsGIlOU4qsl+NSziBRL0bQrh8FLncxI33/Yq+ApgJtf9GIFw5omCPOdmxRT2H87qAV5D4sbJYO
 iw7Ewf9u7IoCJgr9dhpmee043Nnnj9HipdhsM83tbrjn2mJPoSIgufB9qjTvP46AlXiEYtz+rDvilE
 iXYM+wcORtdDgiJgLxqX9LkYxY2s8syHgTWBQBm25ZuTUDuXoW1Ze5IVTFbnJzOY2klsyaFf+2V0Y4
 Ipxpetfml5c9XHYicXC1Kc31vpoAToQckxTjybcua6AmKRLOqqQiRbb0RoQgLEqWbw0QUeEXu97Do1
 fUEazfXdUSif4MYm7YFXrQuMnegrrN039OGFUJXegyNxbBjUSgsvyDGO4woBlxzYT6LmqCIThzJrIF
 gQq3gUt21+BhhuVP8g6tOCoqo602mIWnf7znRDzCQeo3vM7RmUPLTXT1z3jQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27470-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: C49CF92399
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


