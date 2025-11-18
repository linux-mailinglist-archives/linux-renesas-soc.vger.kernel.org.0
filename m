Return-Path: <linux-renesas-soc+bounces-24743-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ED5C6B1A4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 19:07:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 94EB128E35
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 18:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33812D6E75;
	Tue, 18 Nov 2025 18:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/ayGtqK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B69246770
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 18:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763489268; cv=none; b=g1K7i9Gq+PtalEs3gKQDT5MHyy8UFCWgs4wH8PPC+FLHtKiECev2mpskc8SCPMUIHoIg2KZT63dbNmUl4vFFdZSiK5pN6JeLm3y+GMlRrlHKZatlgH5VovNfr9hK3ZjZ3MPCqLZe/tEwcvGEsUBkg2iHNfUiCnnmsFYerbsa7Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763489268; c=relaxed/simple;
	bh=El2h874yprF5L8lfJm+Xu9NQI0aJHjJbVyMuzWMPmDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cv4qd76dM7OycT/oVUSLturg2dnPBH7egpzxlxR4nIPfTgvg9hl9vwO2yFazg+fhMSC7HvkoRljos4dTsea7Q1LY1FQuDRrdZ6g4jT4F6cJsv8NgI7kOqFeTxNUQCHqJ6HUODKhoewB86MotxgMBqLXrH0QZSqq497zKDV1r3Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/ayGtqK; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779a637712so24009105e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 10:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763489265; x=1764094065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R/M1YJyRKnlzVlZ9Q7GR17zCRQfIeFWmJQjOozU2zL4=;
        b=i/ayGtqKvkchWgZo25VqSgwnW6LoMeZML8mlMHrmC0Noqt9jarWC6Wu77lmNQLdwzq
         A3Av5ugWOw3aZDVTxiFaCxbeuYYUK3l3efr6NubHfDDTTudkMPD813gB2g8EE0fSstpz
         Bch59p0uQeCo0R3ftD71mv3EMXp9MBdirtbCYzbdSGT1roK7HnqLyiNVuoHFCfh7orYB
         caZamByQ9zwQZp0smzbrNDFtViUJxnnL1CIDo5bu0/PTtcCiC0oVCNngXmh3hU+VOgzx
         LkAthYQl0KVddQvY5Z1MMM8YCGxi9s3ez+MVUs4YAfn3wvlrJruICUMJWv4eh+Z8W3Sr
         WRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763489265; x=1764094065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/M1YJyRKnlzVlZ9Q7GR17zCRQfIeFWmJQjOozU2zL4=;
        b=jQPNTHFntZnhMZ/BYu3AYV5KuMyIKmFUssTihHCvt4GxTvNO/eOZ994Y4gtir+ZpXI
         NRdM61lHDEmo5U089chh8JyURdFwdmEmyIyvNplt7M9YKo5+wmJLkxYzbANQhHrCvBmb
         TsmYmf76QbJ5gU6oDVcX8f8ChSkUqkXAA7DMMBTcdkkl53gLqycYdjZsGVASHUrnRLbg
         hEtZfTk6xwH4lry0YEwFJxB3uZmet4uI/X3ryzC90cXy7B5mWmkmMwOWlB/zA5XoGbYo
         +Bgq8lE1Y4yveAB2dRFH0E5VW1CwRLJ4/OIv4QUHlrEoWkTf6E6BVgHJOCcvatHBmE6i
         zmfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+HvH0CjbHw8injLI2tliiJYd0aVLUB3V+w0/BJ7djDCCace2LYXl+bo1x+vB+6I9F+d/V3JiOnl6L+tH1OfNmBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh3K+qi0S8TF90HN2ufFnDCtbI1IraFfAtYeVMRcEz/wdzqZ/z
	9RKWzJbXXLiGkhxWmO5tGPEnK9GR2pwU0cAJfsqoK0JO99zMDk3l32wKqlRui82m
X-Gm-Gg: ASbGncs+4lqrcIwXSB+fPM3/HiqdhwazeEPtBIrHrkD8n4kEmgRnS4S6CEeu5vOVstz
	5qKGN+OLJ2P4ZCp040EA60RE6U9FWVjTmUeLAk4b2Z/ASv9JQLHb96cXMr6spt7OZqNr+NMngNU
	Bb6S33Jvr156ad1ly9wmhDBE+zAGnHsEB/5xMG+qDVAFoXk7uF6rSzNHh7cH4uGAagOabFBLaDB
	4Kg9/fh9i3rYIiSbp3F9YtcfM86TIZp7evXfnmsQj4ZXSnS+6jHy+LoHTxR/EW6rzDydPkWRRJq
	5E+97s27BjS6mtJde997qU3nK0CosDlEW8W5ZYumq5Kvt7HbJGjs/qqrQHDVO1qWPvtWcQiezMC
	5L4dRj9X7kORihEvNK/x9+PXeegPGW4fWEJx0a1DTG/R3lRcxBb1/pNC6sS/9cxj/tQ+zFruAl5
	K5lfaysd8KYpJQedzoLNZcnosJZ0TxeViIGdw=
X-Google-Smtp-Source: AGHT+IEh3sirWGP1AlsXkj1eQIWJOzKDxVDaDjqASMoIHo7Hap8krokdr+e8M1r5XqRdGdNKwyMiTQ==
X-Received: by 2002:a05:600c:a06:b0:477:7c7d:d9b7 with SMTP id 5b1f17b1804b1-4778fea6cebmr194830125e9.33.1763489265043;
        Tue, 18 Nov 2025 10:07:45 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:af61:3b49:841c:d9e5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f0b894sm34832452f8f.26.2025.11.18.10.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 10:07:44 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: phy: renesas,rzg3e-usb3-phy: Add RZ/V2H(P) and RZ/V2N support
Date: Tue, 18 Nov 2025 18:07:12 +0000
Message-ID: <20251118180712.4191384-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add compatibles for the USB3.0 PHY used in the RZ/V2H(P) and RZ/V2N SoCs.
These SoCs integrate the same USB3 PHY IP block as the RZ/G3E, so the
RZ/G3E compatible is used as a fallback for both.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/phy/renesas,rzg3e-usb3-phy.yaml  | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/renesas,rzg3e-usb3-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,rzg3e-usb3-phy.yaml
index b86dc7a291a4..6d97e038a927 100644
--- a/Documentation/devicetree/bindings/phy/renesas,rzg3e-usb3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,rzg3e-usb3-phy.yaml
@@ -11,7 +11,14 @@ maintainers:
 
 properties:
   compatible:
-    const: renesas,r9a09g047-usb3-phy
+    oneOf:
+      - const: renesas,r9a09g047-usb3-phy # RZ/G3E
+
+      - items:
+          - enum:
+              - renesas,r9a09g056-usb3-phy # RZ/V2N
+              - renesas,r9a09g057-usb3-phy # RZ/V2H(P)
+          - const: renesas,r9a09g047-usb3-phy
 
   reg:
     maxItems: 1
-- 
2.51.2


