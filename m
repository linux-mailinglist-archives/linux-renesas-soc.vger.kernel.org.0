Return-Path: <linux-renesas-soc+bounces-28350-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILjiCMx4mGlrJAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28350-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 16:07:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C11C5168BB0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 16:07:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC4903074788
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 15:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B5A35295C;
	Fri, 20 Feb 2026 15:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cyWC2YMu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B45A34FF5A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Feb 2026 15:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771599899; cv=none; b=Kb+46S6jmZzA465BlNyee6ngjvmSsQ8HOCW1n1Bpq5O1JuDBSaYb4+f+IYd8JG6eFBAfT6O9TcjBjunShqqFvjp+brF+LC+SDYXTOurGoCce5CKuWc5ogow5qhfWKw8+OTRIoW9/uGB2XgXKR3RO4ntTI2nLhxptfxK6kYoV3lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771599899; c=relaxed/simple;
	bh=8yqHC3Q06QTVh4Rad6+0BmCcHZT4nU0kbOj9IGmnP+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LM/06rbYUVRY2+Cntt/lT5AhDD6ZKU6v388N6PGEJpziGoPfIiQcainWc5KalfIF2a+RAXMcEAV/MubXQEBrGhUuGif502rQlY8eIeMZZOIVMQPP4lVf4NlWcNPQaBHumGNKh9t/kseb59tHzATMsYw9HgbSP10ndxV5F+sSIbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cyWC2YMu; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-48336a6e932so14137265e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Feb 2026 07:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771599896; x=1772204696; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jy2GARoXO50R7a8K0gt1dh0NietSWwPCxQNes2IOB58=;
        b=cyWC2YMua28r1tvntjSAmSJm5bhLBheQM5AD1FPNJMtQ0SyaRbN3iCcuO0XLbCd/mr
         fWwliv+FT/0E4BgU81mVVJOWFM7+v9Q3x2rNmVdakQzDveVM2V0abykO5CUxllpj9yNR
         v++i+vxxI9saSblO/O6/rLepJLNqJM+pdPfLbiFAEkvEAdF/0HgKBTNUGdT3J/gTn9hx
         +AnQar0/0Q12W1jPL4wpbSweAkzVKUhIqSnyEj/N8/CsH4fkCLXqcs44pH4iG0N0rN79
         lxrKQTRL/FbUN86uKbVU/6D9yRrwdnHAdZ1HbvRq9ZDSXGUjCfkBO0Qp+3aO9CJIZEn6
         yabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771599896; x=1772204696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Jy2GARoXO50R7a8K0gt1dh0NietSWwPCxQNes2IOB58=;
        b=OOBjfFAQtLWe91QvqabAZ/qjE02qBdGeM9rwRsIvWxPfcYA2mOOMOwWrc0HDFXYHZu
         NpghH4afk6NubYaGu9HtawYhEwvFKzOc/+Hy/L9COTnmv6i/Nc87DfyUIYz41jUMVKvj
         4ZBJ1M/zPSTJzFRmtLA+9PilNifD53Y4laucd/Kk0ozyxn7RNB1/dJnCoCK0kpcCsNa2
         8LXgAT4zCgyW4BzKTBjbEb7JrQEBq+iXVEJTfVZPyrLIa8LbwdZ6YGWwNatkef9R3XeO
         fjga/1yPYx95Y6ro53RJBMkuHGwEuXe4gxQa4p/uLKmuP4Y5blRR62PsQf5ujdr10Ycm
         ETcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMHf/kBfiAuGegDveQmpdToqqDz2D06vdnRcb9TmoXp1zIOTNNKHdQT6eCGmVaCqLJt0jyhBjcFtoTrJP+KqGxWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk/yb1MUTgc2KKTD4RDeS/06/u934ZUuJWls0Rf8ZWSYCmaPT2
	4zmj3gVfzaJzuEVo6OJFA1C2dzulSMs1RRXp3nBg7wiEjlqJI5+EWkAsAYLjKWZhRsM=
X-Gm-Gg: AZuq6aJYiOZKNWDhmJyWkfgDnPLQJh8shcuHkoiasUkKJD98uiDfeLirq3WOIZW3nbq
	6l4+faIOzinTAzySEA5LV9YMXBLjRfObqVkKYs8JmvwSQ+ewyzD3DdPqRzsubHUqbHYvUUxpswT
	GalNQkq65NGEEGOSNYV9Taf6Zpy0E8T1+rAGpYWusgReYj86vv0rq/8ZWPrxKgw9RPW4mFHuW8G
	Z7yecXYAEmIhHwbk7eIERUGLepSiyOsOAgYhaRtn5iC5tlLL/Jwcqr1uwcfCvb9/CV8abc2bnLX
	4sCsBzTyx/DJYkIWa8SMMwBxWvXKJolc+oioFislfVLhi3C4FO4okh193iBZiSYA8hNlpDKWRmb
	/oHgqWPN/yq/TeTTv7SrqkyMrQ5lLmAQJdF4civBbcTNjINNydkfzmFWoKZIEi5JaGWh8SoQhwi
	tWLhLFOtHybXQqior57aAwEDmVdLHcrHf7q+/a+6t7oEGK
X-Received: by 2002:a05:600c:35c2:b0:483:6de6:37ad with SMTP id 5b1f17b1804b1-48379c14f3amr386937005e9.34.1771599895705;
        Fri, 20 Feb 2026 07:04:55 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c56d8sm122064505e9.8.2026.02.20.07.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 07:04:55 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Feb 2026 16:04:46 +0100
Subject: [PATCH v5 7/9] dt-bindings: arm: qcom: document the Ayaneo Pocket
 S2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-7-1ad79caa1efa@linaro.org>
References: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
In-Reply-To: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-0-1ad79caa1efa@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=763;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8yqHC3Q06QTVh4Rad6+0BmCcHZT4nU0kbOj9IGmnP+g=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpmHgN4MX3KTDATN+UnKZa9eCPfPNgJVm835Ie+gP2
 2ZitvCWJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaZh4DQAKCRB33NvayMhJ0YbED/
 4kpXMeGA1gUD6tjoaezhD7zsaGOM2hv59m08S+AgFJWfvhNoDFQaM39IOv1QKMiNUNsKzm6rb1f6aW
 sUdm11Wkvhy5JSxfXWigf4POVO7pa2uqxFfF4pHVLgYt2V1pfG+jhm6Dp217y3xRq6u8JphpYETj+F
 G0z3Lb23Al42gXanY59/orKNTQHfr9X3qLyCdRB9u/R2auP/lPbSJpbGq9z20I7qeiwGJREdd7Bkv6
 Lyy7wo12wtxan67J06Vh1KZgqpVhWQYjNc3Rdo0gD7p9M8SlwSsHzV//Em3YGSKBobnsqrgK0I1TzS
 Ik8V/sJsoF4jvH3GD9g2ZH9gTwP4bCxZIHIWQlDWRYZ8CevgN5pLG2MgW0ag/Ei0GO8AcVsY/Bevq7
 AMilOcLmkNUetCf3FxbV/F1H5o6uPYUY8AhQlLTUWa00TURW0lsuDktR0KiKrVLzFPHYD0IUdsTvDX
 P7S3Cc8drqMLppXOyKDKVpoFPGsPYj9uObgL3RW29jrIbJXphfaZQanLGwCGuw2uvRJa0bujpPdOoo
 xBlnGsfv+2AmiJyj3JfRJ4IuPS6isyfo3ZhYJB4Z49o/HU7Azgjn5bYF2/jdZ8bnnNwYaYJUHpbXiT
 MMNiia6R65Jfmpjqqgr7AXiv53pdC22cMULi7rBuyKwPyHTRMF4NWzUOCGNA==
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
	TAGGED_FROM(0.00)[bounces-28350-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: C11C5168BB0
X-Rspamd-Action: no action

Document the Qualcomm SM8650 based Ayaneo Pocket S2 gaming console.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..dc00fd1a77b4 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1057,6 +1057,7 @@ properties:
 
       - items:
           - enum:
+              - ayaneo,pocket-s2
               - qcom,sm8650-hdk
               - qcom,sm8650-mtp
               - qcom,sm8650-qrd

-- 
2.34.1


