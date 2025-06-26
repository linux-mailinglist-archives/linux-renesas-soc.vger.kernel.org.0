Return-Path: <linux-renesas-soc+bounces-18771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 500F6AE9A6B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 11:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 914E54A39AF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 09:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F4D29614F;
	Thu, 26 Jun 2025 09:51:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B78E239E79;
	Thu, 26 Jun 2025 09:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750931504; cv=none; b=rKx0xixgCwKp3TxmhQJgyb8SbpertsCOJfv8eF0jp6mvbqILqdrsJr2DMxqkLDYd2xzBVnunFDY/scgj6TDuFl9Z2nfqEl3SlgNQvpkN6H7bx7u/ok2Zt4miRqjXR478e0Fr3fht1sZc08QkCKJZ+FfBLCFP2sUfYVaEWkw9vXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750931504; c=relaxed/simple;
	bh=IFdLBeX3g2ayfv0IQgR9HmqZQ+S6NrWbrxK7eLceSEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YUEPnbHHo0+C9PBCtXKuR3kFmxHGZLd+YKufpGxfcYrnE6vnRog7jO23d23HNAZuzOXYNmF+dBufomAOMdCQeeiIwGUofmJbzvWSMbYOxe8Xq4srmzpLEvnuQk+Ech2r3UVPjWIhIi+PFuBaycWXgkvHFUKLDg3UcRX2SXD7BPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0DFC4CEEE;
	Thu, 26 Jun 2025 09:51:42 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/4] dt-bindings: soc: renesas: Document R-Car V4M-7 Gray Hawk Single
Date: Thu, 26 Jun 2025 11:51:32 +0200
Message-ID: <b4283a68aa01c82d4435ee8334093dcbdf5bd4d2.1750931027.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750931027.git.geert+renesas@glider.be>
References: <cover.1750931027.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible values for the Renesas R-Car V4M-7
(R8A779H2) SoC, as used on the Renesas Gray Hawk Single board.
R-Car V4M-7 is an updated version of R-Car V4M (R8A779H0).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 8ea7f69eef73239f..5f9d541d177a4265 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -388,6 +388,13 @@ properties:
               - renesas,gray-hawk-single # Gray Hawk Single board (RTP8A779H0ASKB0F10S)
           - const: renesas,r8a779h0
 
+      - description: R-Car V4M-7 (R8A779H2)
+        items:
+          - enum:
+              - renesas,gray-hawk-single # Gray Hawk Single board (RTP8A779H2ASKB0F10SA001)
+          - const: renesas,r8a779h2 # ES2.x
+          - const: renesas,r8a779h0
+
       - description: R-Car H3e (R8A779M0)
         items:
           - enum:
-- 
2.43.0


