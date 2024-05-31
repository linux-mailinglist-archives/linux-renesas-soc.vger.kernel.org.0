Return-Path: <linux-renesas-soc+bounces-5749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF968D5B10
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 May 2024 09:00:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0887EB25A7E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 May 2024 07:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B50C13D539;
	Fri, 31 May 2024 06:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="UyFKYK5L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B9E13213B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 31 May 2024 06:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717138687; cv=none; b=At9gM9Mxtt25a4FkysyEylUJwxJ0qwKuLNDLkDITfbj5jeGufhZBXaGhko86kdd5IXZUWr5OMeCyhWFqMKusasZGkFdz3VzlSl3jr5wuEeKlJ+/1IDeorbobY6VJmxKRk0BztvYxp1MRVGBUksoyP/exgc1aSzlkqdKSCREyahY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717138687; c=relaxed/simple;
	bh=SgoDvQnygahdoutjIc9prfX+wgUSyYSEJoNImCfQ4pA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m6ThUxE7T7mL49/Iu+AJlY/UOSLU0nFX+JnMhRjxM7EmniLzl6XJaXRtgD6wVnqH+LJlz1uGvHkRShQ9rZ0vO600zaROzo++WpvM1xArvIti2PCD2Bhr/xwhZGB1jpxSpLAst84NQ0YCA3lfl6puFu1h2KdJDOPMuBI/WuH2bxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=UyFKYK5L; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52b8b638437so165951e87.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 May 2024 23:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1717138684; x=1717743484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tBS+l7TGaeAomOSQfJ8g88idIPgPbvW2eMoPLMjgw2I=;
        b=UyFKYK5LOmpVMu8JVYeh+pp3z3D+b/RcvYc0MAp+fD5bxFv4iqe/1YZRhW0619FfU2
         Ty7QwWyc+rw8siiHmWsW06p8O6PFH7WONwwcaYHKUerndmPiIQqGloNQtqaAFGl0LDBe
         lSUT2WXCPL/IKQWYdWUF92DJGsJ5w66rifGFPNBgp4HOECmTnmTUWXnv6+X5k8HN/s8L
         PSnWjR6Tdu980CKl4+ZjP3UkyvUHQvvKL36VcfWELHTkKVOC6p95ME6ADMCARZTsQdp2
         41Zx34V1YJ7rs2goT2zkg5uQ47aHMKp7ii0ULmMi83MsTPXPRRXBDO6LStNrMAq/iiGm
         3bHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717138684; x=1717743484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tBS+l7TGaeAomOSQfJ8g88idIPgPbvW2eMoPLMjgw2I=;
        b=ngkPfgHISPUK2jsX2HoyrnaP1dG0zKHsK6KI92rBxbWsQPB0xIVSN0QoC3tZ4TcPRO
         UnSG0WVL6K6zBl3eNnUEdSS5bSrc/HwrX5mCY2dFsvzPWzCIUaKpfVwwpvYR/pt/ftlN
         Mp0R3yzkRu8fn++VxkEurGyOc2eWZ+C/9mK17ibaXnDzQvp4f677TpwyQyOWwHxApcqF
         MVe1vd6e9m/OvBpLZ8sOqG2RtD39Qbl5AycrcfCDrGmAzwbJemk64l0VhZKusfJosre9
         Q4to9V3xGeDhj0paNHq1LmNm42QPVpuETSGDUcGsn63U3nzXwO7S9rHA1b1vILaJtZMd
         g9jg==
X-Forwarded-Encrypted: i=1; AJvYcCWZfVJzW70ShCTh6utcw6ov8nLjQQxW9pz/KYK+U/2JZ4wF1UeXdBKS9ibMJAlXy9gSANwbsFAAsPw9r8eTn4ii7t4kbmfdURf/vIQV3eWvR4k=
X-Gm-Message-State: AOJu0YyTXfupp/JU4pV7FuVG6iKvh6jeYuJk6sDqtX26UYMjON68VMyD
	o1L2VIgl1bUFBNWEQBjTPpa86bxLCZnc86tfhaqoxqS+xkI9fLfeKQ4VOvQwfRE=
X-Google-Smtp-Source: AGHT+IEcyG1M6riI17p2bccika8+2c8x0/U5C5XU7YCTkfFMFXVNfVGbi2NX2FHHz6cClYrhqai0ag==
X-Received: by 2002:ac2:4853:0:b0:52b:8877:30f2 with SMTP id 2adb3069b0e04-52b8980aca3mr441625e87.59.1717138683718;
        Thu, 30 May 2024 23:58:03 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67e73fc1a5sm54205566b.53.2024.05.30.23.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 23:58:03 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: biju.das.jz@bp.renesas.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	claudiu.beznea.uj@bp.renesas.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v9 9/9] dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support
Date: Fri, 31 May 2024 09:57:23 +0300
Message-Id: <20240531065723.1085423-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240531065723.1085423-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240531065723.1085423-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document the support for the watchdog IP available on RZ/G3S SoC. The
watchdog IP available on RZ/G3S SoC is identical to the one found on
RZ/G2L SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---

Changes in v9:
- collected Guenter's Rb tag

Changes in v8:
- none

Changes in v7:
- none

Changes in v6:
- none

Changes in v5:
- none

Changes in v4:
- none

Changes in v3:
- re-arranged the tags as my b4 am/shazam placed previously the
  Ab, Rb tags before the author's Sob

Changes in v2:
- collected tags
- s/G2UL/G2L in patch description

 Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index ffb17add491a..eba454d1680f 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -29,6 +29,7 @@ properties:
               - renesas,r9a07g043-wdt    # RZ/G2UL and RZ/Five
               - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
               - renesas,r9a07g054-wdt    # RZ/V2L
+              - renesas,r9a08g045-wdt    # RZ/G3S
           - const: renesas,rzg2l-wdt
 
       - items:
-- 
2.39.2


