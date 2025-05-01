Return-Path: <linux-renesas-soc+bounces-16580-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B46AAA5E7F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 14:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21FE91B6264A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 12:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B00C622577E;
	Thu,  1 May 2025 12:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3AaEjWB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED004223323;
	Thu,  1 May 2025 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746103041; cv=none; b=hO8XQ6wFd+OPiTfhe1zCuYeuGg0O0aoS38L8MsIb9+nCjBFe+KbDzEhSmV1OP0UYhVmUjpaoRUqLMYGaj95LfAk+u3wVrp1ufWYQ4moCOeNJihlDG9JQJosfrqOxAtEIWY+AMIq2i8jBoVIzZsN8a41oAQbUdiBymfhA1aR+5Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746103041; c=relaxed/simple;
	bh=fPkJSMDN+OntyyHQGC2OKbESYBmNpsNmi0WqnE4+lpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u6Wtl0b2wlcSeoFcL3i9ljqqHnxh7IxeaDOgZgWWCgntlvNgqGsP0lqPYqmfiULurBXn1BNEU1hgK57yScIJrmOvYZe9M9lIsKOWCpG0eHBmhFbOo+JnALm8ByJBQPjxjr0M08Kzv99AdmsSHfPUJWx/0ZBPl3n6vIe3+M0l+zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3AaEjWB; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so14277415e9.1;
        Thu, 01 May 2025 05:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746103038; x=1746707838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fnvyeixn+1Lgru4M/HCqjV6TyqEDVE1iM8aBdkxEhXY=;
        b=c3AaEjWBU3nc2PMH2Mal1LIcztgCX2kit7/oht6XkgM5CeR54XNnyM87u7F4tOpFe1
         fBoQVrTtqUuV2tfs5u2yVPH3zb/gugOLqkJWj+IEtIgq9pj6yVhQsu5GMyN3Gd2uic3R
         qdLSWwxzhoE0gw59D+x6TD0QGvuMoAg6bA+7ic9S3XjGcHUwAJGy62EkggoeVhGU0Xtz
         LMvc0wxXzVndxsy7G/4qcTIRBMwY/Q8NzBk6jE+2b6lMSzh3CSlqCdjBz4xudXfnKsGw
         sSPWPtwQIAqrLij3BXUGAQAgYRh7ZHxCA8DpCtfO/S7QGi2LSOj3eYAKHAxvorvam9yV
         /G+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746103038; x=1746707838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fnvyeixn+1Lgru4M/HCqjV6TyqEDVE1iM8aBdkxEhXY=;
        b=Zol+sfoj0wp+TkObEcSbCTmDJCy7orgSUU3XnDqqT5ypwECf+7dSKYAQJpZsBu0z/S
         b3UBOOmRsBD3PkN/RPFBgVw9f5TOsICJbBTvruRaKKXieM1TrwUlka6aNAbdCMDhPAdH
         T+ZUujE8Bdq6TSwG50Crctn+ogOEKqsdOeGhifb45YWcpo2XPGDKpGWm2erauRE0jlse
         fJHyCEz9haWdSkhc4dfAC09ojkbxRHKLbiGqBMSUFKelPQn3DrRM8RR8qJ/Ii6flX9dR
         rFtAoRzJiPNsWUhWeZUsFgOCuO3dTZMMxhnVOt0g5grHWiVIKmfE7ihPirruncZQUnBW
         ez+A==
X-Forwarded-Encrypted: i=1; AJvYcCV0jEMc9G8Z1vb/7giUT0NqOzSB2wk+AxHPg/kC1pb3693TIlNB1jn2iasW8QMMpLZ/gFYuoYEGrsUys8Vakzw8imY=@vger.kernel.org, AJvYcCVuBXtdEaks/bT+cGMaydQF3+4TuzfUzKsiFnHzkKTbvrp0dUxUsVy10lPnt1AaeegsS8DdgDerij5t@vger.kernel.org
X-Gm-Message-State: AOJu0YwGZbNVW5xGDhsAZorowcElE5fJdnw/aFGbRGVXOBQrdznLx1+T
	tVU+xLHLanwLUCRP1phbsBFE/HBG7SQSzUwm3j65Qrio4tFijHnY
X-Gm-Gg: ASbGncsMjWaCfGCppbPSMJz5hoVfwRNEeDfoX5HNf4C63nCjDZXSu7zsRJnGDQFrVDf
	wr759C3j49Ba6j70lXqXzyGkG9+HSUcjpVw+9dMjsau1Px0143ZQCljnq763KClMzjH65a2t8cA
	50/iydT/KOlgbBvDKwTZ1hnsjbNkVKzyb3p1yBXad4qxs3FVI6XtOBy2YOQmXJTaXnBeL75kdm+
	ZipE4o26jaPyiwK8D5vHVx65PD0wVzBLrc+4qgeE3OU8ZePoW8p3Chdwe1sEmHlz47YvAhX67jR
	EX0vTvP/WBvXZpjLNgZS79nhHQdzdpY/srMiNXcq/5kRE6rHMB/ywpfvigXyHGG9
X-Google-Smtp-Source: AGHT+IH6jzylsn0GgewBtvvu8wy8bqEIx48tCATSZ1CDXZXmV5fbpP4GZv7mMB68aJ7aMPXOZZnKJA==
X-Received: by 2002:a05:600c:4206:b0:43c:ec72:3daf with SMTP id 5b1f17b1804b1-441b72ece6cmr13060585e9.14.1746103037909;
        Thu, 01 May 2025 05:37:17 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:f0e:4490:d947:2c92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89cc469sm11144765e9.6.2025.05.01.05.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 05:37:17 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] dt-bindings: timer: renesas,ostm: Document RZ/V2N (R9A09G056) support
Date: Thu,  1 May 2025 13:37:08 +0100
Message-ID: <20250501123709.56513-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the Renesas OS Timer (OSTM) found on the Renesas
RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to that on
other RZ families, so no driver changes are required as `renesas,ostm`
will be used as fallback compatible.

Also include RZ/V2N in the list of compatibles for which the `resets`
property is required.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/timer/renesas,ostm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
index 9ba858f094ab..bc421882cbc2 100644
--- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
@@ -26,6 +26,7 @@ properties:
           - renesas,r9a07g043-ostm # RZ/G2UL and RZ/Five
           - renesas,r9a07g044-ostm # RZ/G2{L,LC}
           - renesas,r9a07g054-ostm # RZ/V2L
+          - renesas,r9a09g056-ostm # RZ/V2N
           - renesas,r9a09g057-ostm # RZ/V2H(P)
       - const: renesas,ostm        # Generic
 
@@ -59,6 +60,7 @@ if:
           - renesas,r9a07g043-ostm
           - renesas,r9a07g044-ostm
           - renesas,r9a07g054-ostm
+          - renesas,r9a09g056-ostm
           - renesas,r9a09g057-ostm
 then:
   required:
-- 
2.49.0


