Return-Path: <linux-renesas-soc+bounces-12199-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20237A13CA9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 15:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0303E3A8ADA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 14:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD74422B8AA;
	Thu, 16 Jan 2025 14:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="rWfPO12o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC4B22B5B5
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jan 2025 14:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737038891; cv=none; b=qvV7+HpLDtWPafZnjteeww1BU/IwQ7FxbbsQEnU0oh5YWLixWI3gfXC9G6uwD9q2mvkL2KoyDNM/f7zMcfeI+IgG2OJf7Dql4/lDLahoW7Stdr7DCBWo2/eLD7o0SL0WpnVLvjpm80oJlE/Tsid0xfzZ7WgyVjzYb/W3LyOp6l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737038891; c=relaxed/simple;
	bh=1SnJvhZS6jikGDoOS2o9cl06oHxehkH8QRPQU6er5s8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rwznnKobGQR5GYBT1UWqpSLCWNplpql/4vLgsP4CuzPpwjAdaO7UyKSmzLSlY4oBIVQCDZWbhAUym2z6p/ztzeUZGwS65DVsQiE3u4SVfgIdAbPuAJALgmsNXzozakqnlNI8O/5WCUzgOEkLDyX4TqCFf3YWlKlXxchb7AuWe2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=rWfPO12o; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2164b1f05caso19400875ad.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jan 2025 06:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1737038888; x=1737643688; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuDcEd84bTQL4eBHQ2himRHRr+9J/Cjh0Sxr5zOEoxE=;
        b=rWfPO12oHbE+jjDHb//PH4xVCiedFOg+v0R6Z6EPMIKvXLAUewJhVWkpleSGQltR3a
         35Y9UualnSSB7o+oBHfSvEPP1hjex+FnXHsQT6RIvwo510DqnUNYerAGqorW45p2hL/t
         GAMcOvgZF3mHUjmslAOcON+aGQKuC5+vGYr0wdXMt87CeJyJe4hloCfB80luJUM7/kmx
         XDyi8nfGgj+jaIGQlbE9jtFYn6e6BvdbSiEdoTVkzDMEyuTjyRleaZhUqnEDV7dOy9cp
         8/n9rsiufTvNo2eER/HfIjKr5OGMEAJi1dqBcCLORjCxTyC0PY4lMT/vkR7e//xdI1gK
         JpPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737038888; x=1737643688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuDcEd84bTQL4eBHQ2himRHRr+9J/Cjh0Sxr5zOEoxE=;
        b=RjKz5R9yAIKfXh3icmkMJDCa2eIzT3FgH0jjE5FnFy2f+iyOCRVzQOnFhmuTnPLtph
         E26kYCmKkYpmCy0hhHGLw0QGrqxJJx3rAOYL72kj4R0HvbY7whAW35HMiQXpaxVtfK95
         au9khw6fH8hFMOLqoeUMQVilvM1CkKGS8b7f1TT7ExDaHalYKjCjdpvu97ZStxUDyDda
         XGtlAn6JlKnijpCzK6LrTFUJ/fJw+/+GeQNKW4xwT+HdpLx11pblFJre2xJOcZhHpq+H
         io9JTRhzn+L83rPwRIP61NW8BrDRi7QNNFVQ5iiW7m/aqEyXnHfm00WGFdKzxLnXWcAD
         5wVQ==
X-Gm-Message-State: AOJu0YxsJM+l6meltf0pPj/mVyAbT/flDZln1ImTCQTcv/vtecT/Q0xw
	zy1hmPvIFR5MPhwQ9O68xbgrFkz8YSYZVvE13SPTQl14gaGWLI7iufHIQo+L
X-Gm-Gg: ASbGncvGtn+eaIRKDy03AcO/GtQ+5+9uODppMhmlZ58NuBBHfmOFyNcRJt2no/UlLlo
	gFmaJfQEWvPKYGksTZUyiWPFiY8M0DXpY8dRF6RM59PAruGd379ypi8JVsWrDvOHlyt/22yJ1uZ
	Gz6SakoCiQHCr3EK33Kbairk9BnGGsAnBVQBwRUH4AatTd8wLxXo53/4IqACzX48JastSxctP4l
	1JpK/xD2pnLrvaDD/1AJG7tsgW4LEqV83ybMb1sVvzunu+CovRqIzhnFg==
X-Google-Smtp-Source: AGHT+IE3p6Ovd9WA1Gh67Vw44Eu64B66cIifPSIaubS0QUHHHwiMMxwo5ZhvP4pAsQblNxqRLLERYA==
X-Received: by 2002:a05:6a20:3d8a:b0:1e1:b28e:a148 with SMTP id adf61e73a8af0-1e88cf7bfb7mr48403664637.5.1737038888678;
        Thu, 16 Jan 2025 06:48:08 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:4323:933a:5975:d650])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dababc174sm79488b3a.178.2025.01.16.06.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 06:48:08 -0800 (PST)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masato Kiuchi <kiuchi_masato@yuridenki.co.jp>,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/4] dt-bindings: soc: renesas: Document Renesas RZ/V2H SoC variants
Date: Thu, 16 Jan 2025 23:47:49 +0900
Message-ID: <20250116144752.1738574-2-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250116144752.1738574-1-iwamatsu@nigauri.org>
References: <20250116144752.1738574-1-iwamatsu@nigauri.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC documentation for Renesas RZ/V2H(P) (r9a09g057h4[568]) SoC.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---
v2: No update

 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 225c0f07ae94c8..4f2645e8140c5c 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -552,6 +552,9 @@ properties:
               - renesas,r9a09g057h41 # RZ/V2H
               - renesas,r9a09g057h42 # RZ/V2H with Mali-G31 support
               - renesas,r9a09g057h44 # RZ/V2HP with Mali-G31 + Mali-C55 support
+              - renesas,r9a09g057h45 # RZ/V2H with cryptographic extension support
+              - renesas,r9a09g057h46 # RZ/V2H with Mali-G31 + cryptographic extension support
+              - renesas,r9a09g057h48 # RZ/V2HP with Mali-G31 + Mali-C55 + cryptographic extension support
           - const: renesas,r9a09g057
 
 additionalProperties: true
-- 
2.47.1


