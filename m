Return-Path: <linux-renesas-soc+bounces-16903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05973AB18EE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 17:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AB271896A40
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 15:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904FA22F777;
	Fri,  9 May 2025 15:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NvZYkXrF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621602248B5;
	Fri,  9 May 2025 15:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746805138; cv=none; b=AaZpOZAqvBVy1BHPkU0iwXzKCfWF7xptxajx+ZhgOu8aVy2At6QpauJuhrV70R0M56EkswqNXR5cBZOeIcikujcvZoeTMHwOC1WMXAte842EqQlP7wscquNjfxMnmyesF8RsXfOLwCd0Pr4MZie06V9Jb8UMWrUJkX0oJgfeWh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746805138; c=relaxed/simple;
	bh=Ey0N8Z8WV5ad3C3x2v/kBHdAy3SvzAdEV7ZQGrD+8OE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WDgiYDYJP54MJzPSbARg5SHJz5MF0mC10iJJ4Gr/FnCFUwXeBxiLoC9Km/HzPTQuK1WUI/8EpIdg7I7SBKX850F7i7oyRlZnyVsgEZixmtqCD+7cG20+jFWqd4zdFpLUrtyVCTxD2n/kkM+tufT+0ujP2c9ZrIb5OhUQf7YztOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NvZYkXrF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F2B1C4CEE4;
	Fri,  9 May 2025 15:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746805137;
	bh=Ey0N8Z8WV5ad3C3x2v/kBHdAy3SvzAdEV7ZQGrD+8OE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NvZYkXrFNWb6IqCX1Qd+VfPGkRiIRPXfEgsn+iCWIM3hf665Y7+0UYpAYVWtHKBzB
	 JcvguNmuM6E7082wJquFAhjGTNuF3iBYAlOqyHgB+KlqmilDTQeh9yVF13z1HK+53u
	 D6Pk8ZZzFGN+8OjrvfapKt4koYRXBuHM2DKUQhCUBgJx9Dohou6VXGxyDfqXgYUW2z
	 V4JB/EZkL9nUERvpsuIKHnNPT8X87Z3NDrv/hQNSZ2gprp4CdOzCMg1ZK3TRsOHiPV
	 Orf4Fqea+6B9TFsv44mFmBLeRK/CNNCRNFMQ/zQCSrViG3Am/hX7YFlBqfO7fWOFmT
	 IOnO4mJjYAmxQ==
From: Conor Dooley <conor@kernel.org>
To: linux-renesas-soc@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 1/2] dt-bindings: cache: add specific RZ/Five compatible to ax45mp
Date: Fri,  9 May 2025 16:37:57 +0100
Message-ID: <20250509-dwindle-remold-98b3d03d0631@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250509-sapling-exhale-72815a023ac1@spud>
References: <20250509-sapling-exhale-72815a023ac1@spud>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1501; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Rk7A7eX4TNNlV+Xu3RQLEr/u+InzTSKghNzmZBA2UQs=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBlyiiGS0+TcuiVcdQ9dy3Ltmbms6efl6XrmyobW6WHHt SYu3r2uo5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABPhkWP4n80T+nvfH+HDT1aG /nl4UbY5U0iu7toCJ75VjVKnb1uIvmD4zeL7t7ta0kxPn+/vhf1WdpURc0XX6uTwLZn2k+Xr28f 8XAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

When the binding was originally written, it was assumed that all
ax45mp-caches had the same properties etc. This has turned out to be
incorrect, as the QiLai SoC has a different number of cache-sets.

Add a specific compatible for the RZ/Five for property enforcement and
in case there turns out to be additional differences between these
implementations of the cache controller.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/cache/andestech,ax45mp-cache.yaml      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
index d2cbe49f4e15f..f533bd178a9f6 100644
--- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
+++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
@@ -28,6 +28,7 @@ select:
 properties:
   compatible:
     items:
+      - const: renesas,r9a07g043f-cache
       - const: andestech,ax45mp-cache
       - const: cache
 
@@ -70,7 +71,7 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
 
     cache-controller@13400000 {
-        compatible = "andestech,ax45mp-cache", "cache";
+        compatible = "renesas,r9a07g043f-cache", "andestech,ax45mp-cache", "cache";
         reg = <0x13400000 0x100000>;
         interrupts = <508 IRQ_TYPE_LEVEL_HIGH>;
         cache-line-size = <64>;
-- 
2.45.2


