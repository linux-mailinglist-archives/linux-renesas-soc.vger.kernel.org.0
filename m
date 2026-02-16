Return-Path: <linux-renesas-soc+bounces-28254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNljItUok2kI2AEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 15:25:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FDE1449CC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 15:25:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D8A9306900B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 14:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3393164D9;
	Mon, 16 Feb 2026 14:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MxEricMv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F92299937
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 14:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771251723; cv=none; b=ANy86LUKGZQvIzYyG1MxSF3CfFwBtgDfAv4/dNS5dT6K/rLyEFepLFR1GLpwY3+8KcoSn+7Gd9TnM/75SxGj46VOoPOjJPNehgCzWVJ0uKGkk7/E5GolbN6Rd2MNZzx3idtcGM1VLRQaVDWO1AY8OY7HU8Ae/mOReM1iRlJ0tQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771251723; c=relaxed/simple;
	bh=xjSbwzZtG5gO7c0c14CObzQrxd0ynl2lj1Czc800QEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g8XHcOFPeBn5bdCJq0ZEmKlysWdx8+sRCMLw/gO1/IlKg6m/Sh0mag8oS+BXkIIj4NP2YGK48IwBDaHtadg01ZfluB4nX53KTISeHErTEsiWL+nI4nm+gKRPgPz8wK7GqAgxZnrHwy1BKvbtmtM8ddbvylgaf3PCBSTmRPUSZIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MxEricMv; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-48336a6e932so18975045e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 06:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771251718; x=1771856518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/S0eg0m7isWhJo/g2N8HxsSID1GAb0gdwF9PpLKomXQ=;
        b=MxEricMvj5xHwQE26PfNEF8hJ6GYHG5UFdQXMxhZpZF6pGG7B6+R4lElKrg60H2AWJ
         UkrNQRVxLd8f+zmtDFdsE2ctuTx8445emtitgyLRx4DYnM2aFDdGA2XnkufENaBmuFqc
         egrFCtAcz6BW5bjDBY4SxfKVoXEgtdGiKhpcO4x/yJfcev3ksRspqXxZXK3VYnPkIBYz
         FvLJ7YtU9lk65c1/ThnWpzF224LVyyTds09p/pu7tHQvUgNPomNSBZoAOIVBwX7LjMwa
         Y30o0tLA/ht1+YhgfAMnbMmGpc3d/xOTeAIdbRfO65izZeciHYSlkJ9V530ejlWNjaur
         mxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771251718; x=1771856518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/S0eg0m7isWhJo/g2N8HxsSID1GAb0gdwF9PpLKomXQ=;
        b=TVjTAYIvH8yrWBB79WjJr2Fx7Z3ezGDNKmSabeLYFxvFNeDPInHeIC3X69XT1uz3M5
         o4V2hJlPzNjWQcH4DIV/EJDtSh2QjxzrywTwQoXGcuFLvaDJTAJr0AaePnmppQH7E2OX
         +G4dMz75ojIZ45V4tvG4IPkpmJSItQTZUvnZgNle79v0419J0RLCI+NJ15XgwBRQVQS/
         RUxvMnsUis6e/xA5aSIIfMot4gQ1LMRLyV1Ot2TignwTMD87ukO3/vuWaOouheZbkDnq
         PN7WEpBR5AXrqAyWqbGCZM0o/tSDoyhuN/XatZEnPUuswAi/ja9jlccpnLG+7R7+yRuG
         KX8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVymx9R6dglcPu7uw5D9P8ark/UOKitHOhBk/04pm87l2tfv8l5Fj0bwCR6ncc2/Bku5GVTMqrlr5zi4kuLIcBe6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzT4Ys1spe3Tk8kVhfufnPrQu5t/6DQhuTpLrRc9XHMwJ5AjXG/
	aBqnMRuIz9zQO5MsxLWxLbGCoCyp8GbVVH7PwCtKlfYI95nGTVN37vBa/8wcf/VtOt4=
X-Gm-Gg: AZuq6aIc9WoVk1pJDUEWaQ/AhH6hLXjMcFguMTWACaou3pOlwqaDjXGcAMAy8RkuvoD
	BfVyePtIw0lIIXkGyf3REKiaDCWG92jWtHdWZf0TyMYNmHwv0rxV4bgDjLB797NKEbHe8x1GcP1
	NxTx8dUWJa50hEUwf0B8gusnqOwjt760a3cc2Rjmb1nqD1FReZGDccqpBCpH37z8X2s6YB73qs1
	5Zwf0sId80iXFMzNKJpvcmti8PdIYqeteONn1D7DSkqKL/IVeAafUQ+2rsMMj4BQ9rnQaOzpOTU
	fanm7M19uTBiWQGpu8uDZ4bEi19AnyzfQMcWfpQeWjYyYCkbhFffL2r5JFE0jTLpxIO1ohH7l0g
	YlU/Z5/5A/atKgXebtTQFuLrtHJphiClU9F5QhMgkmEW56ATAXTQdwYXH03RxIYHA9RLlsw1g1c
	mS5vhU7bxmeZoHggQ18E/DLkj1nkR74OEfA58/KUHRNI3n
X-Received: by 2002:a05:600c:1d0b:b0:475:dde5:d91b with SMTP id 5b1f17b1804b1-48379be820fmr142745455e9.17.1771251718189;
        Mon, 16 Feb 2026 06:21:58 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370a63afesm86717475e9.9.2026.02.16.06.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 06:21:57 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 16 Feb 2026 15:21:50 +0100
Subject: [PATCH v4 6/9] dt-binding: vendor-prefixes: document the Ayaneo
 brand
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-6-802c82795431@linaro.org>
References: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
In-Reply-To: <20260216-topic-sm8650-ayaneo-pocket-s2-base-v4-0-802c82795431@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpkyf8Uu3n6GpXXDa87jAG9lsUR1lBcqU5hQZIE7XL
 Low8Gr6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaZMn/AAKCRB33NvayMhJ0b9OD/
 9KF4Cr6edVuEMj97z/U0INVHJpC4/15/NVPxKOxk2Z/MsWvqryxZXdrWJcs9RlsjzemxTNUKbGRTjQ
 PnPmdDo7LtdmMP591wksNyV1B+ZCnxgw+07Qa02NO3jSN+XR4omNq/sjpYJW8OFdBM2UpywuDl3Wkt
 yduFtdQSKetYXqksUmccdxlk1hpEJDk53IogetHWlmGEcg9yiObzK3Oe9SCD6+EK3nKnn3iW4yW7j/
 o67qwTLeVZT8HLqLEycUi7EBgFMeovMJfW9HIPLjDK0dLPXjh0ELv9fmTP+2+8i4M6+rMwpJ6OYjJn
 jK09f+bwR/yaXEhWEGX7+5J0u98WnR0asnnCjxJKRZMGfzIZUbD3SVat8zn83ZjIGNo7c3C78fk2Lj
 gJzJqO7DSq94NmDoK0jWT/cS5kLegARRv7Tr9KqIYmybKKfYC7SFU1FrtxFdkRvw34mKpHluaFSVh+
 Os4ZrVR46dHb6zSSG4Pl4TosrYWUQp2d74kMs4868vZSFjIJOXR5sresyaC4F439lcf6Qit5gg2Vyj
 nzdurCS50pb6nH9e4E5NLxK2mHiVk4Kye2ZYNUYY8uzLczNAhpdg1ClmFGfRWpWDD7Kg/EfubAh90C
 n5NMnd5A5SI9HQXXMFr7gE5pH471Ig17h+5WT5NWJd2Jy5UW4GDvca5cLW5A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28254-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ayaneo.com:url,linaro.org:mid,linaro.org:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 26FDE1449CC
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


