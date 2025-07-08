Return-Path: <linux-renesas-soc+bounces-19375-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F589AFC81C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 12:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 199EC171D78
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 10:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B9226A1B5;
	Tue,  8 Jul 2025 10:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PrHf1cTZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B2926A0A6;
	Tue,  8 Jul 2025 10:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751969907; cv=none; b=taYv7eVkwVh0Ph6p/XtR60CEwUDio41IOJz3wKUw6sTE0AMiEu63Rcum6r0z0AUOGqY1eoZOjdlOAuog75EooRzISbDFDU2FNQSs3Aqt8cDqzuZgy15gsQJmjhf0Xl94BfYHL/3JZMSzuGw7xAontB+XOCfppi8SnhNfPHNHLTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751969907; c=relaxed/simple;
	bh=UdUlVB3sLQjvW2UE8GW5YPaGqKYD71XlsLy5fP5Obfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pzfL7N3abcWO7lNC7pqGHuEkrw0yqp1FR1VfAyV+invpskaCqzbB67BCIyZ/kgBxfN1UVfbQyMQOv08dzy3fknAUg53ok53MQHNOco7Cj+QzQkVApYi0HyiY6/Qb8yUV8q975PqDxy0m86shi8CDXbaoHzyPr6te8IDhJ/qh1ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PrHf1cTZ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-234b440afa7so40252025ad.0;
        Tue, 08 Jul 2025 03:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751969904; x=1752574704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdLp0YjegKAXW1He8H6sCHobxtr0SXLGuwvu5w7+xXs=;
        b=PrHf1cTZN2a5koue8eBP/dSemDwBg1WFf1Y5JIuTFZ8UUcchDSmc27LnbxRfuDchO0
         1gzrxqVZcRbUTKpUCdPwh2fQsGhqfuFs8hhuZIy1jfZGG7l7ZFmChkBr0z3SoG5QrMak
         zI/um+4TuZM5WkXy6AbSkY40RxGGl2tnexmHnzgMTU0KvtpnFvSFD3lfuAesfonSv/Yj
         rvJAgPJUNxlt+0Ffu5A80ljhgbSFcxSGGPs+2BjUqhocotBIDAQLKNafGZElKl3DugzE
         Gp6ScB0G4HPkxxYI0ynacoP94ODZfuMqSnEhetcBvF/aOD9UJYPGSCd+7QtU5cEYe679
         5toQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751969904; x=1752574704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mdLp0YjegKAXW1He8H6sCHobxtr0SXLGuwvu5w7+xXs=;
        b=BB5YDbi1NKqd1MRvzCbGwSYpxcePHLXah+hOoI31daHMMzXLgSU4LxFK5FcOaq8MzS
         q8RWjQKvIqxS9zCVTgHh7MGitmE+qnY0+qOde+aRvlNHqS+xUYCXH93mgBLvTEXEqwEg
         +NPIteumeKh8EokX8TzfgE5BD8Y74B7YQspeFJS4Qjchu3pZiGWyIJDNl+y6RGmtEQ8G
         oC1shrjiewhp0k4p8B/rql+0fR9S0/DjNUJruXwjvhyibKwDaGDwz4FTWnMu2mVRRYka
         +MzBucSDhAMKSUPUTy4rfco7YyPSNB4uT2tiDUpdfTF9vTU0JJsCenzNktAa19buHxY9
         AgoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2P5rso6AQ3X0nQtPpCTJbNPfmP5UhG2FZqDDzlzG0EvKCOCG6pG+9z+YSeB353JyD2kgL9EIic5trI4daBTLNeMc=@vger.kernel.org, AJvYcCWF42jyGvtr8Sd5wdXObJBZFAiBuMuQ1Ov3SDTFF0AFwg6azN2cSKmb2/9lOqoX/eq20HceAvZsNec8PF1mERg=@vger.kernel.org, AJvYcCXDWg7VdDUXJsGK3Hp5o5XH231Yacr/jCe+KnP9EVnQeONQTGSDq37bvjzEwOvNJ84ZGebw2UIJMPUkb0JC@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8yYbuoWQNvARutk1ia+JRnvKgrm3ZnqjvPTvPwo/YeCS1OG2o
	jDaG2HLkL8q7vvk4Ty4k2d1qRzNUyNY2JfFPp/sgLVOO2kWNCOohOuEQ3fo9Qg==
X-Gm-Gg: ASbGncuFJlsjv3oSn0th6Oov/eQovlGa2z4/t5/GqfAP4ijwpj97a9Rt0Ax52XJkAL8
	7i51wM4J/H/7IovPIIPI2trZbVjcRxRtB7Ebn8YfetFMir+5MQacnt9QwGaolYC2LDn8cHa+vLE
	QGCSrczk/XY4+pvzycCGTW9Q3dB22LtwNdZ0lRzfLUR2E2JXqnxusf9pcZ621jeb6c5FLibSDb9
	9SsbccSK/Wuf+Jle/MUWskICBI9DPIVwzKJ5krBxgkjIJ0O16MRaDV7PE6TN1ZPsEy0e2hO07WL
	V2SohUaRvBtDSkaBHiM9FuwYC9KLl5P6XhdSP+CIcG7CppIvCrXNho1fVYfPAjz2yA9aWg0/Ckm
	BhkXMx44Uu85eSYTIEYI3+diWWA7s14g=
X-Google-Smtp-Source: AGHT+IGu7WYapWMHc9637DgsnJHKg4bnLFJuKBic8k4Cy5AmF5szo6dnD7F1fr+X4Zl1kXa/RsNNJA==
X-Received: by 2002:a17:903:2443:b0:235:779:edfe with SMTP id d9443c01a7336-23dd1d5e471mr35706785ad.43.1751969904340;
        Tue, 08 Jul 2025 03:18:24 -0700 (PDT)
Received: from [172.17.0.2] (125-227-29-20.hinet-ip.hinet.net. [125.227.29.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee4a40e3sm11114709a12.34.2025.07.08.03.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 03:18:23 -0700 (PDT)
From: Leo Wang <leo.jt.wang@gmail.com>
X-Google-Original-From: Leo Wang <leo.jt.wang@fii-foxconn.com>
Date: Tue, 08 Jul 2025 18:18:00 +0800
Subject: [PATCH v6 1/2] dt-bindings: arm: aspeed: add Meta Clemente board
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-add-support-for-meta-clemente-bmc-v6-1-7f3e57bd0336@fii-foxconn.com>
References: <20250708-add-support-for-meta-clemente-bmc-v6-0-7f3e57bd0336@fii-foxconn.com>
In-Reply-To: <20250708-add-support-for-meta-clemente-bmc-v6-0-7f3e57bd0336@fii-foxconn.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Leo Wang <leo.jt.wang@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751969896; l=880;
 i=leo.jt.wang@fii-foxconn.com; s=20250618; h=from:subject:message-id;
 bh=Vkb9aXhwjRXn290zw8y+gVMx1U5e/fNse2oic6Bf6HY=;
 b=bPsPFlNf9KCv5/kLFTdwnvncwMCBUnDkJASOXjZZIH2IID/WfCpaxiJ2uad0l5I+UtHc3qCyD
 hfxgrBqr8BoD94uBPmk1ePYW7J8Kb4DHtjBSdGA9XGTcRGquyi3YA92
X-Developer-Key: i=leo.jt.wang@fii-foxconn.com; a=ed25519;
 pk=x+DKjAtU/ZbbMkkAVdwfZzKpvNUVgiV1sLJbidVIwSQ=

From: Leo Wang <leo.jt.wang@gmail.com>

Document the new compatibles used on Meta Clemente.

Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 01333ac111fbb076582a6c0e801903c3500b459f..ff3fea63cecd99ec2dc56d3cf71403f897681a98 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc
+              - facebook,clemente-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
               - facebook,fuji-bmc

-- 
2.43.0


