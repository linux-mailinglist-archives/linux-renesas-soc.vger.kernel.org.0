Return-Path: <linux-renesas-soc+bounces-16979-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D50AB3998
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 15:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDC9217FA27
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 13:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A171D63C3;
	Mon, 12 May 2025 13:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tVXfo23Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0797219E4;
	Mon, 12 May 2025 13:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747057708; cv=none; b=EYNExIgEIFLoS/PKrV2Qh/0TurCI7KY5DlcSKgKhW789irAXEmTJkK2tF/5QGrYQdcGtaSfnp1wBlXIl+NHPCJbr7zg4oEDsoyp5DmIigzFiwdX4NMBnmZFoBsYVGbjK2Q3+60zDsue3gg4ux8Y6FuEk4OTD09E/oa/8bUYz9uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747057708; c=relaxed/simple;
	bh=2eyQSXPPXqrOE9DTVZr2ptWdA53fkPCZ6kBRgliB/0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZHud/BV4BSvcrLVde1iTg6IsqMifyFPVZcSkR5wCm6KF6AMM2JwjVgHJLy6q7dU4dm3QuJuA7ohfG5s9qzewO9cXlOa+HViuSyAyM3VZPhLpZIDdnWLrkOAB8JggmAYPG3n0mXXgjcdm9j0ccnE4GZQqllQmZ0ptw8A1dldMid4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tVXfo23Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E428DC4CEEE;
	Mon, 12 May 2025 13:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747057708;
	bh=2eyQSXPPXqrOE9DTVZr2ptWdA53fkPCZ6kBRgliB/0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tVXfo23Z4KQVo8PSPZGABI8ItdK6NoPcZqmnretJ8YaxmOpzIUkC51mIZFSG6Qyol
	 j4qTj2qjATwiOveKyUsVqsXpkVnbCQ8EM6H7G5I0H47r+HEVdLgYT5v4E/JEPMBQEC
	 +gMF/IPOo+qvJ3lXkX8RpqSnoykk5u3ATGopac5U23vAuYOPgHZjNz6pWs2UHFzbNG
	 aROjXfOkz+4L5BUif9Ot+HEDCtEQ7qJps84eZg0zI++YxI6HR2hyjIeW3P+3bU0YX7
	 s2J8yRaP4AtAQpQzrCpkW9VNCQOnxf6EZG5jGRG0VhnSPJmdNG1Z/RMrINvORxcej7
	 ADhCJFpi9syvQ==
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
Subject: [PATCH v2 1/2] dt-bindings: cache: add specific RZ/Five compatible to ax45mp
Date: Mon, 12 May 2025 14:48:14 +0100
Message-ID: <20250512-sevenfold-yeah-d40078a9249e@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250512-daily-saga-36a3a017dd42@spud>
References: <20250512-daily-saga-36a3a017dd42@spud>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1589; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=sAzgf7QxM5pm09G0aavl/SdXDXsl+gJHEI1v9VqIti0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBmKf2Q7hCKrzzsZZgrs/jlntf5Jzra9E36WtH2d67zg8 amr6/aXdpSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAi1eUM/6zCA2cp/oxkK4ha vf33pf9Xk3+dW7pi9/sNrVejP1VkuJgzMny5p7x3xcHUmt+Nh6cemOFoaRWo9Ex4U4/NhKaK24t WXOcFAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

When the binding was originally written, it was assumed that all
ax45mp-caches had the same properties etc. This has turned out to be
incorrect, as the QiLai SoC has a different number of cache-sets.

Add a specific compatible for the RZ/Five for property enforcement and
in case there turns out to be additional differences between these
implementations of the cache controller.

Acked-by: Ben Zong-You Xie <ben717@andestech.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/cache/andestech,ax45mp-cache.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
index d2cbe49f4e15f..82668d327344e 100644
--- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
+++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
@@ -28,6 +28,7 @@ select:
 properties:
   compatible:
     items:
+      - const: renesas,r9a07g043f-ax45mp-cache
       - const: andestech,ax45mp-cache
       - const: cache
 
@@ -70,7 +71,8 @@ examples:
     #include <dt-bindings/interrupt-controller/irq.h>
 
     cache-controller@13400000 {
-        compatible = "andestech,ax45mp-cache", "cache";
+        compatible = "renesas,r9a07g043f-ax45mp-cache", "andestech,ax45mp-cache",
+                     "cache";
         reg = <0x13400000 0x100000>;
         interrupts = <508 IRQ_TYPE_LEVEL_HIGH>;
         cache-line-size = <64>;
-- 
2.45.2


