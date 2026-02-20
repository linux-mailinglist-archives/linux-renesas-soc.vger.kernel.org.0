Return-Path: <linux-renesas-soc+bounces-28349-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cN9xNJ54mGlrJAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28349-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 16:07:10 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF8B168B5D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 16:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BDAE83066803
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Feb 2026 15:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0CAA350A16;
	Fri, 20 Feb 2026 15:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GoqEblxN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4747634F474
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Feb 2026 15:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771599898; cv=none; b=IGleHwLYywA/gx8rhoRn4k1vboFhMq2j45PgJiSzMTpy/EkUG4vCPXzdCRsN3fE4Gh+hKCKvkmcA9Z+BUVQnm5UxnpfrEbFr47Idtg7tw9zXY/f1lQ/L6ydi/J+PkqSUDvQ2zyY1Ld/NzH142zCLVnktt8LbQLyUU9Oq0gABwy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771599898; c=relaxed/simple;
	bh=Q4k1qY+2qeDncThp8d0KDSr9HMav0dIlAO3IsnJqkCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=idHSlV5yHY/MCTL0LvAHStMt0ZC3qTS30eAHLCan7rLc8j8NpuNdgarZPtoqW6+8zzPFQHgSSIOGgGYhQw9VoCL8v5wXnZty3TLWe80t2J1br9rc/RIswa05b4ipW0e7hXZ/peO/9G3p7h2xn9UA5kz0IkRk0d7+4SGkwtz6OAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GoqEblxN; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so13082165e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Feb 2026 07:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771599895; x=1772204695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXw1FfKzRF2kVWGBwLQMXuaHJG0AS6qeU677cniQ7Rs=;
        b=GoqEblxNQrs8/AulhBLnn5ITID5Ezz21Tum4Nvf8fHM+0iephPrArBPznOl5MoAusT
         KF8DJu/FZgom4PQoAmmvljQMt9fw8cNo89LLMNMr+NjYTbsVWLgrgmQsgvhr2sEbRMYI
         bvcbZdoTavp9DYnf1siZqGsA9iLnJn6Wg+oW4KOTzDFrlbY1IbpvJN5cPJ/rE0O+NUWR
         s9oGB5GnVwZiG/pQthdfg/NlEt97He8+N3dmi0N53sAA0OWCvF13wDDcSc5mFgNYQSQg
         BBMP0bdWnvXFsWQYYXDfwkFsOzjxbhC9A1PDP7bIlU1hFJYhE3TZ8DV0+z5wjKT7i3Jt
         aFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771599895; x=1772204695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cXw1FfKzRF2kVWGBwLQMXuaHJG0AS6qeU677cniQ7Rs=;
        b=eo+LO9L4A+pqNpPb9LysMatNV3h5y8NDAUkTGYdLa5dmn1y2JngV843zwlMb80VWp1
         qbkgJLVtTAEDpfIwJplGBiFERqqG0kLUAz+NkF1wXwT0nOC3frDjsfzbCCZTx0/ZNwzA
         uAPjaZLENKde5zohoq5e3nsVioY8B9Exk1snZRAmPsLWZNLuwKztswMqNmKB2+Fvo+D/
         BoYTK0G4+wQYUW8DRAageFPflPdN7e1KWOWnUjKbIr+BzCP3eJQkodKK5dJ7P4esDUkC
         5gawFPookCro7zevs4XP9No2SUD3Hxf8twPPOQeX51lXFfeZNf/mkiE7mEjrrgBZUkdY
         XnYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH10bw9ZxhixUh4F2t/0Uu7jBMNXRIo0sNO1kR5W9t6IjzrQo1w2eWDfJeWP8lIeLeu/8t7Vie+k7N+ZGQkWCN9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxihSZ2ZHEJo3kmyEbVeRGETXLvUyKTqvZbV5AJudZjU0O04XCM
	HMeGp19eQoVKdAGZCydpM4+bPIAxWBZv6vPSrnWRR/eKfyX7xTcdn9IzDb8Jm5k181s=
X-Gm-Gg: AZuq6aJyHYiaCEPHP6HFrX/3WLjBXIhG1LZcFHP+w27fcNB3Gjkn1m8lwlpR34hySJQ
	TU1q9M0jKKHDq65VtZj/uOz9sprIFNI7qGSZQrw8PPD380NU0rfJVAG1v1hmtCbpYxcLfuz31Cm
	Hbh74EWA0xkUnCEHKlE+1KAysCZ4qYebaFe83TEfnjd5vu///q+hvp2gnGy0BLaMqyLaQ1ebQpY
	w+yomtguJFj5dAd1E48NIM4h8i8bNj8nM3LNUMxucQpv2P1iDyzZo7ZYEcad4rGrdV2mxwqU1t2
	OsfMmLFh5ka0egRqAGU9e3j3QxBCJErpgqSGRJvlszJGE+eWjryDjsp8E6gP60A5J7toTCdWcM7
	/Bdq4YNCj6eTB2Qg0aMRWhACxvTnPidoF18lyvNCTbKybbrTCwtfL9BXZbHdv42H9gqcao1yPuX
	Q/YfO0XoEqQYRgGQwL3HzTC0fA6ykQC9Oi7/c8HBOSBL0A
X-Received: by 2002:a05:600c:8108:b0:479:2f95:5179 with SMTP id 5b1f17b1804b1-4839e63e76cmr110149565e9.15.1771599894480;
        Fri, 20 Feb 2026 07:04:54 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c56d8sm122064505e9.8.2026.02.20.07.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 07:04:54 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 20 Feb 2026 16:04:45 +0100
Subject: [PATCH v5 6/9] dt-binding: vendor-prefixes: document the Ayaneo
 brand
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260220-topic-sm8650-ayaneo-pocket-s2-base-v5-6-1ad79caa1efa@linaro.org>
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
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=982;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Q4k1qY+2qeDncThp8d0KDSr9HMav0dIlAO3IsnJqkCw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBpmHgNxJGv0Fz+bdH9uZJiuQAWyBYvq157EGpydvAO
 WnjDWRmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaZh4DQAKCRB33NvayMhJ0dPbD/
 0VTCRNj6jKYPXJt85twc7hCebvM+v6agy3pBcFpX3S0lD8WYJyxCMjTqMHuAFHhfwjFyBy9FeJXJZo
 SXPXLZOvAe6heVGxha+IZehEbbQ2l6jnAaFwucsOh1lPNTwLgPxkFFx2Zo3Hm7mm6lWetBEU+5MIKL
 wSGHIhHVUCWZWRdQPHn0kx/qb7U+4DUue3dbGjsLUj2b7DyfJFpGOcWWyMpa8ZMfuFdmmzE/nbYIYC
 4sxLGVx1M+WzoGgAR6lhA7Q7SECMNmLP+/Md2+2lughy+Vv4Zn8mHkcjWYXED/5TznVKxfrQ+hyxgO
 A66Z5nIp11nBrso61mmpHNNei7M4V3WyERjglBVWuHctqaFO1zOPs3ZnQ2SRCgjz8xWiHM+DcgTfeq
 foVpccmyReBhYmOpqkHB+D9B3Fp2eS7J9NISvmgI2x4BaaHAoGu8mw961cB0RX2aGhKQNT3JmZv96L
 vE8CWXwpNMVOFHS119uMrZWP5qGnaJkzGM3nPa9sZMyzu9CBZv3x2J5QXvEuOM4RnQIU3qfOP5wNVK
 261RNWghPzUWOBEhJXQ7dnqYLlT7ucQ7oTru9sETcixPjsl5MfoQWSOicgdN8IniUToAv8xD4GFh3M
 YaorV1GMJU9VaO0DCAIfcG7PeLC93D3AYqDnYNk1n68uoD2RK8M4cAdrrXxA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28349-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ayaneo.com:url,linaro.org:mid,linaro.org:dkim,linaro.org:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 4AF8B168B5D
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
index ee7fd3cfe203..2fe39a42cbaf 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -221,6 +221,8 @@ patternProperties:
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


