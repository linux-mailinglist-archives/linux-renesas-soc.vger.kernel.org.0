Return-Path: <linux-renesas-soc+bounces-24722-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E748CC69EC1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 15:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 6E28E2BC74
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 14:19:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D9235CB69;
	Tue, 18 Nov 2025 14:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUPcV/+D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D86E35A14E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 14:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763475527; cv=none; b=nhk8ORb7gimsEjVvMXqCgKqwJcHxquxgE155HNvPMmSU7kS3qbwe6jKNOfIfmRC269gtm+Wr3p0YaemjfzgZxlsnUtSo4XtIhaeqPn6GsXC4UY4ALPntv4/PhoVCJW8FqqtpQk+lqm+sWeQ3XO1T5xL7oG54JnpgUvvMt/xMi9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763475527; c=relaxed/simple;
	bh=haSsgGLj2LFR4rRVPSrOVj0UFTthpfQ8j7ArNRNCmRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PUGIeXxL22ObuuMV57Qaakk/H4NKR4zbSIsW01CUN0W0uD9SnKOcSTuzaXKclLIV93mCECftfYxKmht3cp7DL8DzYLcw/cIc+zxfqroJxQ/tecLBiGzsBIudMXiuGCEIdVjyTRat0/EiJJkwaDt025r/PgwCgHAk8xFNcvhQARk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUPcV/+D; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so2870094f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 06:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763475523; x=1764080323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJmzG04+rJ9YMJz0FDJL+2PqD89ccz+qPnT5FslFWMY=;
        b=TUPcV/+DBsqRpDm0weqV/UA+OdNJQI/WjH/1YIb7qZBqStvbtcKffvs6smZOjDOhuD
         6yTDGoYJRkE6Hu8qfDPFqrlecYuoF1ShKmvpPwsq56izBfwBm918AC0PbOmOydnEaRJV
         ts7+2UoTJj/ySwgtpkTCZq5UpcBhmGakerFEROl8FLII+TD8x8K/vlnq4DS7xNmbxtTD
         cCqZvaiS/X/OnVOJPKbrmoDg3R7N+RjwwRZmvrOtP1FcLMjNvYPmrOG+IFxu0dvwKuta
         LV/Q721Gq0gZoRQ4G+cT3BfHU9dxvmWSg1JXiNG9hRvnIn007+ocHH4GPpzd93bYdvW8
         kTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763475523; x=1764080323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BJmzG04+rJ9YMJz0FDJL+2PqD89ccz+qPnT5FslFWMY=;
        b=lirIh83kNBotYH8dmcOInt0tu7quU8BXAwfOZakbPdSkWBUP8CobR3Whi+j+z2AYgC
         mOPfEmzfMKExbXxepqpX2TzkwkGs2QqNq6rPgDgRGMI3XBzvo6uvtrWWnbkSwq80fSD1
         RbUiDFEjBi3+o8mClD6EhnxGkV11VXtr0Hh23MyKv5qou1ebJoeNhkG5h6TQ3c4r7NW7
         WkpzF0n+fSlMTKBk5E4yGslsD9OohpCkr17/W32t6nMWmULkqiENzK5XkQ7ALtfC12Oj
         0sclQG3p6J0elVmWdqVIYDeGNxb4SIrlJsV+wclT4Pf0oozGL91HxChag5SgUdGEEZnm
         imYw==
X-Forwarded-Encrypted: i=1; AJvYcCVv7p9zq6URSZnv+bpRx1W722slSwL+3+FPqmNG3jVfEIMYVzlgcNJXe8v5HBI6XHxevorH1yJktqCTYUXlByXBPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwT+bUaAmCCYgY2axAnI6PAloR9tR3oOkvRd1qDW3zfeClB0nwX
	+BixanlYPZNnf9keb/7NxMLkpWgY4SV30tDf+pHQxCy7qnnjHya89uHQ
X-Gm-Gg: ASbGnctOo0dJBm0CDiOWuGP/kLjfyXHqmypbavBM9tTwCaKCWhC509aVbhd08lnw5c5
	y1xOH9y3sT+K04bk6CRM7ZrcooyoM8hED4mgN2uONi5Y7xyO6n0WbdH7H76qX7htSJYs/xcN4tT
	SFr/Oa4j9mP2J8j6K/xuora0PxlAvpEH0EjSOIwiYXHWMeNIYp6+QVO9F0xL2x1XxxFoDLO1p5d
	/cXMvVVQPQSL63ww2aAvypZs9ntG0YjRw89RM26LBpqF7djTabr5zgS0uwnkKkbiiLJtlPL9M7G
	X2b3UCE8rpMbl7FJDnteMMtNiviLgLxhftrM8MesIb4g4Dtpu4+X3cjEx8wMqOLKXaTk87RrH8H
	tbCa6ctCVtmRJl1apnbb6elnXBT6U3lKHr1Uv9E6RDOpSNl0OIBNWBzRsAx79Q573+vPOs1kozz
	QciYO6LfCcGQGL5d9A6nxn0ooqgyBpo5gOENskkdeCt9GBh6e514BtWMEUaWgPuUjh1hG43oYNH
	ElqEJyDZ4tobsM4
X-Google-Smtp-Source: AGHT+IGr0W3BKAE2tNSYntGdfGD0jqo7iYO08Mgwtq3xJYbhwCRI1m3FKOoJ2p5oqbRAo7p+OICvDg==
X-Received: by 2002:a05:6000:290a:b0:42b:3108:5671 with SMTP id ffacd0b85a97d-42ca8cd2c00mr3388172f8f.29.1763475523364;
        Tue, 18 Nov 2025 06:18:43 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e85e6fsm32487590f8f.18.2025.11.18.06.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 06:18:43 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/2] dt-bindings: can: renesas,rcar-canfd: Document renesas,fd-only property
Date: Tue, 18 Nov 2025 14:18:34 +0000
Message-ID: <20251118141840.267652-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118141840.267652-1-biju.das.jz@bp.renesas.com>
References: <20251118141840.267652-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The CANFD on RZ/{G2L,G3E} and R-Car Gen4 support 3 modes FD-Only mode,
Classical CAN mode and CAN-FD mode. In FD-Only mode, communication in
Classical CAN frame format is disabled. Document renesas,fd-only to handle
this mode. As these SoCs support 3 modes, update the description of
renesas,no-can-fd property.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../bindings/net/can/renesas,rcar-canfd.yaml       | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
index f4ac21c68427..bf9a7d5288d3 100644
--- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
@@ -125,9 +125,17 @@ properties:
   renesas,no-can-fd:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-      The controller can operate in either CAN FD only mode (default) or
-      Classical CAN only mode.  The mode is global to all channels.
-      Specify this property to put the controller in Classical CAN only mode.
+      The controller can operate in either CAN-FD mode (default) or FD-Only
+      mode (RZ/{G2L,G3E} and R-Car Gen4) or Classical CAN mode. Specify this
+      property to put the controller in Classical CAN mode.
+
+  renesas,fd-only:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The CANFD on RZ/{G2L,G3E} and R-Car Gen4 SoCs support 3 modes FD-Only
+      mode, Classical CAN mode and CAN-FD mode (default). In FD-Only mode,
+      communication in Classical CAN frame format is disabled. Specify this
+      property to put the controller in FD-Only mode.
 
   assigned-clocks:
     description:
-- 
2.43.0


