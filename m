Return-Path: <linux-renesas-soc+bounces-7263-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5768D92E793
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 13:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88E7B1C23769
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 11:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D43B1161911;
	Thu, 11 Jul 2024 11:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qwfDhuAA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF801607B0
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jul 2024 11:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720698755; cv=none; b=CcVGvDxxO4IbfkkYhCaqGOBLf5vFLUPEcFcLvhBXtrgaBH/iJhYJLV2XF2YGLmEZoOi2E0DO4I5u51Z0BGM4JVHlRONzKZI3EdLSzkA5VC3yGoc/sqbMtffzXYUboifshgsIhVdOYOJ2WmhOXJLV5pthCZnqXx7KnFmUBbMxba8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720698755; c=relaxed/simple;
	bh=0+MicTBHiUKzvnA3rZDDq9j85qpZ09p47HPHzZsgs38=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gR9IekaAuTpW04pIrE1G9z7LglkY8dbCIEBQ6XKfcicWdtimpO6EF5Q2Ah4LbPO16VIVyuOS5WDMmSDsdOUYM1DbBo4tBiuvb3Ilym1J/0vfrY5ozEU8knaV4mOUMpsrKJg5bkqpgtRSMrhPbfQ634LNpAEwXerYryAg/dYFz2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qwfDhuAA; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-36798779d75so620895f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jul 2024 04:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720698753; x=1721303553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZBCyPn7njPR9/TVlgXLD1ap+yXkWFzpRikQNXyqWD4=;
        b=qwfDhuAAmUgYd6kdIbcXojcJsddV+Pj/auMcM0EWiQLQ/ZApnO70JQP8qoU9y232H6
         AHsfYVHH1cnfxM8gt0scrVPMkPFzk54Ib27VCgSVM9+zaTmfmIzwRRtt2TLnn54JYg25
         bbuRyPKjNYeFZqt3vDkUr/6NykMhb3U8LgguAhXCbz8YJtBaF2rQRLycDZxXtaMJdIXm
         8xoYCjRsUJ0IbceJ9f+l50zKu32LvUbWgVXFD0oVFf2SGoNsmvIWVIs41ngDJNdpS0zo
         fYRumkgE3Hznsdpnp1P/62KOlAVybYajTlym7f+NM0mjbJRolcKYAKIBbZfABjX01sPA
         6YEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720698753; x=1721303553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZBCyPn7njPR9/TVlgXLD1ap+yXkWFzpRikQNXyqWD4=;
        b=KPncnXdExi2AmtBY7NFHFqQTS3axk34mCLTUVKbbleER4AKBQB2CbzGTXBfBG4md8B
         3wtaBVC7bT9F8msbQEW+vwVsTKvIVqTXfalzCFLPF6b4TtAYYLyKezOdTa8Ae9Muuwgq
         weA9WImang8EOOwFIiBWZ5PyMtJ7d96f+TigtC60KfyR9ZxIkTzBQEQaUrtNSMnscBC9
         rhE7lTNiT4kHQEf4TiWvosW2udGMC7qDbXJ0PV6h+SVHVcrAckUw0/9eFaH1lt3wT6a9
         8/1GX3zan+ckhtjTLsJV64PWQw7TzC4RcV7og2uC0vIxcNCCU85rr9iWn+tXLbmxIKQ0
         xS9w==
X-Gm-Message-State: AOJu0YylY3GHoO5TulLmqunpbFZYYI+DvuqLbztOteZrw69HGbPI2fAb
	Vp/R9K5u0UItnBmq9iXn1YhmG5vUCaO7imFMQJn1g6xebK9W1aSKgnBbkNR3Hbs=
X-Google-Smtp-Source: AGHT+IHCT6dpGR1QFEm4/8GPvCs4Rsey07AX3T4PoUoukEJlV6fa1h+I+5OqhxWN6XoK14pz41/4tA==
X-Received: by 2002:adf:ec42:0:b0:366:ee01:30d6 with SMTP id ffacd0b85a97d-367cead183emr5919650f8f.49.1720698752834;
        Thu, 11 Jul 2024 04:52:32 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde891cesm7615728f8f.62.2024.07.11.04.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 04:52:32 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 07/11] dt-bindings: i2c: renesas,riic: Document the R9A08G045 support
Date: Thu, 11 Jul 2024 14:52:03 +0300
Message-Id: <20240711115207.2843133-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document the Renesas RZ/G3S (R9A08G045) RIIC IP. This is compatible with
the version available on Renesas RZ/V2H (R9A09G075).

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- dropped the renesas,riic-no-fast-mode-plus
- updated commit description

 Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
index 7993fe463c4c..e520f06f2c39 100644
--- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
+++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
@@ -25,6 +25,10 @@ properties:
               - renesas,riic-r9a07g054  # RZ/V2L
           - const: renesas,riic-rz      # RZ/A or RZ/G2L
 
+      - items:
+          - const: renesas,riic-r9a08g045   # RZ/G3S
+          - const: renesas,riic-r9a09g057
+
       - const: renesas,riic-r9a09g057   # RZ/V2H(P)
 
   reg:
-- 
2.39.2


