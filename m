Return-Path: <linux-renesas-soc+bounces-17627-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D649BAC6AC1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 15:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A64524A3A75
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 13:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7F22874F5;
	Wed, 28 May 2025 13:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GhCCRGkK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C40F26A0E0;
	Wed, 28 May 2025 13:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748439547; cv=none; b=Lac9aS3oDslfdF09LJN4AnKMACjxTtsidjTdyKxDjIBIBuU189wi1YiXiIdIt+LPnwLrqKBTrEjtjjyNqfkxp2mbqEpOdeFxSKrR5ahq3quWjHCnxeSMMPUFIRiapGtnwBRR32hC6Qb4119QKmPgW0klp67QQioUVaEdeJtq3N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748439547; c=relaxed/simple;
	bh=XhsAe7+5ooO9w3eLRw5+xUsEm7gR5gLMmX5HOCIA4XE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pgmur1SkR/hpAJoCRpB5W8MukxzoG0/BoekLJOkmzGu++TcbyYhZKrC6oiBAikV1qTO9qakNXi34b49r6knOE3RDa23LijMcL8UQ/GhRSEBWNSRNVhQnDy+p7iYAtRwpi5AoS2MqM+zR5UB0WKZLP35rk/c1GdFleFAD8de8Ubs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GhCCRGkK; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a365a6804eso2887838f8f.3;
        Wed, 28 May 2025 06:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748439544; x=1749044344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gcx+WlhvWOc4VQ1Qrqwnlw9XmLmnMgNUTYRDj8TgLrA=;
        b=GhCCRGkKRtg12KwLORUUEKYOME95B2FyXojMz46IoHPQpxNzkl6WieEw47MY3IDvsz
         74thCAmyTNkmmNF8zQRpNU7KvQJDzPoPc0oTLMblpmLPBp5nw9xkemFX8opOjS2KdbgU
         Gv+XtCvW0FEmMqiK3nuPoquu6qnftZ9+N6tlD9WmgV4g5abpj7LVy0mraXoZRWDqe5HW
         pczvbl+20tAZFS7HFYn1i+H0QacqMyHyojBB6qQbUMD1Kzl1zEaIYDuwn/A5RtjjVKv1
         A5RF8XU5/t4dezoB2BCI8+3MaTwFBCxpWY6z84+02dQrdOJo9ChkZKpcFhuC4RZJW3KI
         Z4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748439544; x=1749044344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gcx+WlhvWOc4VQ1Qrqwnlw9XmLmnMgNUTYRDj8TgLrA=;
        b=asPg28s55Zct2QwGYbesEBGxKjMO+ngcT0i8TzK1CfONlIMMZqc24pfkLsrc+ZBPiL
         0Nx2jWs0MIQGhCOSpZgTg7rNX9/OD3EN4H9MCZyxg88Q4c7aqoCVvUL/fA08r3Fycvi1
         lBiEsOaB4CFixrUByBKNj+6nBzM0et2NSPaBhshdAQkt4IrnX3+xOIBaTYxBM4+XKxcg
         sPCIRnaoIO3FWk77AOqWzrzmQoQFJ43wESbusZD7dQrPmcohiv1JjV8Tj2q6xRdrLwti
         4GP4UzdaIdEov1p5fXgkxXT+whg8u0dmwBwD/IS2rxyEKhRJc8bX84VNOpvYsoQ+qePR
         kvJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRkKiyjNAzBc0b5joIPpvjbxdGaA1wrKYrCtFlUYK4n5TLretrXUgrr0v61p/Pt2/fW8EOc4XyHPLX@vger.kernel.org, AJvYcCVYwUPchKhiWkNjomnLbrUrJ3X3JXTbVVnHUZulKqDQqErLWZ3vVbgAoSE18SXlZgYBmS3ZLuSLIVDkhVqQ@vger.kernel.org, AJvYcCWUIj9fkLmTk343DamkVTnfvB3eUmRYJct711IKqTiU9VeXyIf3aZzLU2avUy0Mp8WF3VIXe1uVCSrNFnEKmEQNjfM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq95ODuLHAEhfJw1sDCEcH+SXw7zql6OaJ/EcgTl99cwBKbrw1
	7qlSUOA3QOHtre5tbAYS0J8a0glTQlwXhGeOkf3BUjb/oTpFpu9XiN9MxqEUK1jZ
X-Gm-Gg: ASbGnctbtL9TOPvV4Qh1TuB9Wf0jqHWkN1UpdFIQvutF7HdCr3fB9KkEXpvMhOiIdAv
	50+A5+SF5Qni5z7jApQ+1XHgz4ainystclFCJzOHCGKIHT1yb6ep4bbGpFymEMKP6dQy/zv0w/O
	/DbxVx6MmaBDzf/itLQqDWWdmtHDbl3jAjHEITuzCxK4j1PD0GAdd8PqzYXZecmkyXB0+AqFsQQ
	DSlErh4RFggNkubtd4LssElKXaXo1A3ZF7xfJnw7xIqHUFlRH0ZtocFjF4vFNJ+yQ20kbDnGXb3
	kFQmaHX2oZJBj9R/qgHY3Vwy1u7qOGNba5wntwc1jBGx6eZArxGHZyoyJmV1T6KM9yPgH+8v53V
	e
X-Google-Smtp-Source: AGHT+IGMEQa3lxp2ZRj8eP4aLq9vdjyWpPZAPQ7Y+N8XaT3vap/p8VkDkHt1ioZAELbgXk1At/1pmQ==
X-Received: by 2002:a5d:4448:0:b0:3a4:e673:26cb with SMTP id ffacd0b85a97d-3a4e6732770mr2920173f8f.40.1748439543816;
        Wed, 28 May 2025 06:39:03 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7078:193c:ccdc:e2f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450064a133csm22631925e9.11.2025.05.28.06.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 06:39:03 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: phy: renesas,usb2-phy: Document RZ/V2N SoC support
Date: Wed, 28 May 2025 14:38:58 +0100
Message-ID: <20250528133858.168582-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the USB2.0 phy found on the Renesas RZ/V2N
(R9A09G056) SoC. The USB2.0 phy is functionally identical to that on the
RZ/V2H(P) SoC, so no driver changes are needed. The existing
`renesas,usb2-phy-r9a09g057` compatible will be used as a fallback
for the RZ/V2N SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 2822dce8d9f4..f45c5f039ae8 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -40,6 +40,10 @@ properties:
               - renesas,usb2-phy-r9a07g054 # RZ/V2L
           - const: renesas,rzg2l-usb2-phy
 
+      - items:
+          - const: renesas,usb2-phy-r9a09g056 # RZ/V2N
+          - const: renesas,usb2-phy-r9a09g057
+
   reg:
     maxItems: 1
 
-- 
2.49.0


