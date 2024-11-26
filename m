Return-Path: <linux-renesas-soc+bounces-10701-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9B89D943E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 10:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13468283789
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 09:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF7031D54E9;
	Tue, 26 Nov 2024 09:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="m8nlkNVh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04C71BA86C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Nov 2024 09:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612887; cv=none; b=jSaT/lRB8axnDobOMrM3q031IeidpZpdPNtIHX+3n5+jDmR3wnVbxFkUrj6gQwCPgbHSayFGuPCB9l4xdk7HmA2mOFwqp9/9onYP8fUiep63vVtaKYz1N8XWZxTs415bZvYwFeuPf5PQalNCFDfkndgd1BX6xoJaH565Stv5r74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612887; c=relaxed/simple;
	bh=65f39XdX+JOlbTHLjNv6Nr2gl6HREhiCkJ3xGoC26cY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aSKw5/XUh71e7IECoikwQqBoE7NyrBuBjA7+dlzNiDR5QHx8dGfCTKVsQb0ADNx1yYkderC/wQYkqtyIUzeZJgEZB8x3BVUeS3tVMtf5/5B3ZE5TsLDhioqqwanNmAYU1UA8/UuJgvdY1VBxen4xqml6XNMFeDf+DD9+2IvOvrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=m8nlkNVh; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3824446d2bcso4767578f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Nov 2024 01:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732612884; x=1733217684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4yY5kKHWBOgnydB5P9+GaDat1sMgmo5I0rPUXNWFHQ=;
        b=m8nlkNVhsaB3jK7XongGdX628G4LHMoP0RQb+Fy2eThGVVjEpYrIwzavXgidYzXjpU
         Akrc2K7sKR/89kelyfMJHdrFuLjNXnRe7qLuRhmkQL25PTdqWdrLdqfV4KJ7lKxB/Zpe
         AsBPGroAlW3ebNVbLZ96mDTSxMaeIFRj85CXXA4R0Bu6HfPNCyXQtgrk2t6HhhutSHHk
         Y4szJqEUgY19SJU1s1cXtwhWV2FIolcF7Op8oeYeKnpetH7MZTiTsWXHmQtIS9K2+2L1
         gyHrEC26t/ks/8oydQHYVQ7AmO/LpIoRpakONOsedYvRhYPxKsBRh5E0O5kgtRD89RGD
         HxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732612884; x=1733217684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4yY5kKHWBOgnydB5P9+GaDat1sMgmo5I0rPUXNWFHQ=;
        b=jc7RQp/DhNvhkotrq0QKcEWe0GP5ZoZnw9bIIqGme+cTFFF2kGjyUuPgysebzn24Ay
         AIhRyNlTXZMpxXX+6f3OOH7Teaiu6KkG0GNi02gyTLyPSrh05sFkjsgTmyPOAFmYkuM5
         OZJR2ebnv843se60NroG8N4rw01KRrMpt7iHIi8wNGD416EFjxf11wkbaWBRNRHl6Bc6
         k14tj2q/m1sYlrW+r6T/x+NzdHEXj9q+Nb3CKZ2TgQUXnFDXkHMnDyPxAkJSeLq925up
         fT9GlO3/LyD7+KP5SmTFn3pDxAim40GlOH7rzhQ8VBSdlQSb7/w9ggpUwXIrfAm4eeGX
         lHbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR5FIBWxkBPixugPrG9ToAfxjlcBum2rv6vF4qYKxgeL6OYGHDAvnEqHox1pMq0MhnHOejEPff9MsU4rWRzvdYmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVyX8mBu+8qaZ1BtkahWQisazNdpi+lsouZv6CLiN6rIu/2fvi
	h/k4+xOn0hdZIabJciMMhIRA13h7cnMAHJLU39FjLwB2gHLxh7X6u+bZjrCoz7Q=
X-Gm-Gg: ASbGnct2JJ3MungdGj2dKYuWsAqaoUm0hA6vktrJ8K7DtcV82cLvDWjtToNMQ4gos7x
	RN1AE/sdYXCjvba+Qte8JEIu9n73+HRuKSri0zC3w0wGZKVw/0Nylj1v1xiKt3YptPzylvGmrOC
	7UDzCBTGckR1pGaRndhxXdPwqfTp0oqqNpa72AzCzbseOxBtdfKCvj1mF6pXlNYhe23dTZpo9FV
	DLGWHbKj4YpgwfeOlxsYE1sigahRA5/vlRKkuFBQEbGWRhYIgYCpTRXBJLqEpaT+idWyodlEiMY
	JeQ=
X-Google-Smtp-Source: AGHT+IECNxqnMdsMr8sIEyPl41XrbsF2Eglii8m3iIb2siIoiQVCnnx0E2A0rJ4JNGhhSHg/JoNpCw==
X-Received: by 2002:a5d:59ab:0:b0:382:450c:25e9 with SMTP id ffacd0b85a97d-38260b8ce0bmr16781285f8f.35.1732612884408;
        Tue, 26 Nov 2024 01:21:24 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3a47sm13027694f8f.73.2024.11.26.01.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 01:21:24 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	yoshihiro.shimoda.uh@renesas.com,
	christophe.jaillet@wanadoo.fr
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 11/15] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3S support
Date: Tue, 26 Nov 2024 11:20:46 +0200
Message-Id: <20241126092050.1825607-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S USB PHY control block is similar with the one found on
the Renesas RZ/G2L. Add documentation for it.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this patch is new

 .../devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
index b0b20af15313..ae59c2dcadbf 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
@@ -20,6 +20,7 @@ properties:
           - renesas,r9a07g043-usbphy-ctrl # RZ/G2UL and RZ/Five
           - renesas,r9a07g044-usbphy-ctrl # RZ/G2{L,LC}
           - renesas,r9a07g054-usbphy-ctrl # RZ/V2L
+          - renesas,r9a08g045-usbphy-ctrl # RZ/G3S
       - const: renesas,rzg2l-usbphy-ctrl
 
   reg:
-- 
2.39.2


