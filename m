Return-Path: <linux-renesas-soc+bounces-12186-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B739EA12D94
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 22:18:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15C7A188A102
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2025 21:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD351DB924;
	Wed, 15 Jan 2025 21:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FwxMUUmB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306B51DB92A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jan 2025 21:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736975881; cv=none; b=Rbvhml7vtKKGgAeInD3Id46N4i2pvm77wveu3mCfSYjiHI0TesmtJXNO0VuGM67KBeHr+TZMR7Q35lN61OoJHXAXvE5yiFQTpfaIvrGI4fFFWDU4AY9emXc2cX4cqUMfkiNi7kOryUVpm14JxodhBbCJaU4JX6CVoEAKLMz9RcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736975881; c=relaxed/simple;
	bh=yDa0Qe46Jzwv1wq36DpTjz7+V6202a1+5RibOpikIik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=glguWGq2+PLnSUY4PHGhorE2+SDEFVwSOP5ku2tcalaBF3XcTS+l5vE36QDWIlEkO31xj7PpiSt3jvn0SKM77XwSvfkHBni1HbGd50ZVkBlgcjl6ja2Ow9K1adDrzlEihSLcTCEJOgg+5biGPfPl2kexQoAvmlHGMosJopUVMCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FwxMUUmB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436230de7a3so182175e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jan 2025 13:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736975878; x=1737580678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9qHKVl8g8d6O1jTs6lYX8V6Xx1+0T2EHi+qxmLZOjZM=;
        b=FwxMUUmBeQJOHuOs3yfM8p57TtmSzGRwaUOBFohV+zXBhCKEPpImZnRl2Zo7+UBYgj
         XCt7/F1yRZqrkWO1XRGGl+PSncH1uh54/TpPQEWZmDgXVEsGSCEap6EAbtlEZ7XhgI98
         aaJr9Ua+B8WjhxgsHKnjznrAuOrLGH/0UP+0bMBx5nvm2b4esc3VkxHur0mZVx4wERka
         qxRSLbAWWJGRZWJSpU95WjXvR32IxGvO7F8whPR0OAjWEKXZWlD8l54QPPGQq17rSGwi
         IZunzOJsMpcaUqBLBvxwfTR+9Vd4cdEa0YYj+jGOxfbb//ViWLQtLXSU4kq/MwqvovJ6
         VsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736975878; x=1737580678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qHKVl8g8d6O1jTs6lYX8V6Xx1+0T2EHi+qxmLZOjZM=;
        b=Qoonb2Wf48KIkKQ65a0G+LY9zeK6BY/7qunw+ylgCwqRLrr9rFg/wfha9qsGu6rS/f
         BPmu3BOKePEYz+biVUQZFOo2ByBGxGKrhvtu6b0oCZMyVeDhWGj+FM7KhFtdh9YwImD9
         GKV0AIrCuONkYoPNRfPuwuobPpdZPDk7kf1hjNIMq0eyUEPcoSUjSTQ8ZUi6ZrkRKXNi
         d9NXrqpboYqw/IytHFg9fYVflqzPDmx/OPIwBmjpNu477lUTWtPpU0BDXdF58mWsgPuZ
         QTS4bDtkV+j6zYJSMa0HeP9uCasKW09FpFMmvIZsmSOsLteBt/DZ48wlpgjrO8oDbpE/
         CkVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVlUurdOm5oVUwDOWIN+mN5jao7I9feQUEuchR+nm3CWKCbwfozClmMOEb475sT+T/4so/zvRzpliZnc1Mz+JAeg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm2taXpnXJCspqGj19Gu7lXboSoLcvlDouzMrsC8YJUOARa4tG
	v1pau/VvvE+R90r6FqL0d+a3UeC2z0REGf8h2WounEY0DXj93N4nm+OlQLQwjYX8XQ6UEw0Y5Gf
	t
X-Gm-Gg: ASbGncvC0gkc3UruVGRqONKMguXtZveF1QKtdchBM4kX3BtWT1UNTTE6pO8nG19nY6u
	dGiW1IskII+q1+ChqnspJFGcbWHdnln5u1Y3fM6Vbbky7keTAU7F+fRH/V1U4OMl0qvsQ0M5Igz
	pU5dibkdcmDNZjMbKTy1f6YSN/StlS3ot1rKKzvf0aCAvrMRK/u1m4WiRKrO6Vk+Eak32isSO2g
	CmQvD4i5O4xe7OSV8vdjbUZRPOQm2k5FmfPBbVj4Aq+Uge5/Lh3lx/osiGdW0Rw7+4SIKE=
X-Google-Smtp-Source: AGHT+IEFvnu8OXXeqoDb6YWSdPhGF83v3PJsG+NWti4ab2PS4rU3HwnG9ln5bcto94xmLR+2mM5RYQ==
X-Received: by 2002:a05:600c:3554:b0:430:52ec:1e2a with SMTP id 5b1f17b1804b1-436e26ffdecmr121126635e9.7.1736975878544;
        Wed, 15 Jan 2025 13:17:58 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74c4f85sm36623335e9.18.2025.01.15.13.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 13:17:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: renesas: r8a77970: Align GPIO hog name with bindings
Date: Wed, 15 Jan 2025 22:17:55 +0100
Message-ID: <20250115211755.194219-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
to fix dtbs_check warning:

  r8a77970-eagle-function-expansion.dtb: gpio@27: 'vin0_adv7612_en' does not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../boot/dts/renesas/r8a77970-eagle-function-expansion.dtso     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso b/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
index 9450d8ac94cb..0c005660d8dd 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
@@ -70,7 +70,7 @@ gpio@27 {
 		gpio-controller;
 		#gpio-cells = <2>;
 
-		vin0_adv7612_en {
+		vin0-adv7612-en-hog {
 			gpio-hog;
 			gpios = <3 GPIO_ACTIVE_LOW>;
 			output-high;
-- 
2.43.0


