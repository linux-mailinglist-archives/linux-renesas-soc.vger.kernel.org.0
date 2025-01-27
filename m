Return-Path: <linux-renesas-soc+bounces-12548-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C078A1D39D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 10:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 027D33A3E1F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 09:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D37DA1FDE1A;
	Mon, 27 Jan 2025 09:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MMF+0IDS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35991FDE04;
	Mon, 27 Jan 2025 09:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737970752; cv=none; b=BQJZGJiveujchszUfzr6u9vXnbOsPUyg5IizJWUaUR/C0oy+P7kM+rSEmgKWnHztCTnDEJVP/GcaKR5l6zmbXr+whhJK5UGHphA87uuVtzXNDwEKmzYlR9TjtQXYFK0u9zlTmgcP1q9CEhmZmT9JX4/Cs+jsVt1cnEerE3c5iiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737970752; c=relaxed/simple;
	bh=KqZm4MD5/2nzq1lDTKuip2lJLdqrPklenXHEb7RV4Js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mPuU9KplWPoijd0wN08KLxwHR+fr7FoiwsEWkTukSicd5CPuq0GdhLXYO/0RN5KaCKF8+98bz3XbfiHx8F/ZCffhGHQsYObrel76deruivWkueJ7/oetvk6jqTZCRC1w6JNWTd8o57/8M/sAFJM41QuVqrN5XKGYxpekGmd0u0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MMF+0IDS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737970749;
	bh=KqZm4MD5/2nzq1lDTKuip2lJLdqrPklenXHEb7RV4Js=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MMF+0IDSCx+beoTBPt1K8NVwiN5AZBo1dyZIsCWAluY3yA6iRVDJIsAiW1UnQPMHE
	 mLuUmpBqIQNMwStTHztGSoBGLh9bcyNtQtMS3j5YAzQHLW8KkFG5kcXD1v6pFTfi+w
	 PMY01pTcwzloCQQsO74nScBBuSeJMXgghgZLGjeuUyCn9c9krOiUoWwksmAgBogG4I
	 oMrUZTaHXdloMt15bcBl1cNfO4e4wESsu4kZbX2JTDtVK0SZUMCMHIAzfxT6DYrvqO
	 J5WW5bmr6yq9xMJXwMFKpot7vdaNMKctR+/310T60bcp3NpCgypAWW8a+tWWigOHUH
	 AhNnvRJ2u1Q9g==
Received: from apertis-1.home (2a01cb088CcA73006086F5f072C6a07A.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:8cca:7300:6086:f5f0:72c6:a07a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9557B17E0E8D;
	Mon, 27 Jan 2025 10:39:08 +0100 (CET)
From: Julien Massot <julien.massot@collabora.com>
Date: Mon, 27 Jan 2025 10:38:46 +0100
Subject: [PATCH v2 1/2] dt-bindings: soc: renesas: Document MyIR Remi Pi
 board
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-myir-remi-pi-v2-1-7bd3a1c62752@collabora.com>
References: <20250127-myir-remi-pi-v2-0-7bd3a1c62752@collabora.com>
In-Reply-To: <20250127-myir-remi-pi-v2-0-7bd3a1c62752@collabora.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Julien Massot <julien.massot@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Document the MyIR Remi Pi" which is based on the Renesas
RZ/G2L ("R9A07G044L2") SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index b7acb65bdecd2a3828f5757735eb473c39f27b57..3e02bc2e17483cf53679a130eaaa5943d2f9a2a7 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -491,6 +491,13 @@ properties:
               - renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
           - const: renesas,r9a07g044
 
+      - items:
+          - enum:
+              # MYIR Remi Pi SBC (MYB-YG2LX-REMI)
+              - myir,remi-pi
+          - const: renesas,r9a07g044l2
+          - const: renesas,r9a07g044
+
       - description: RZ/V2L (R9A07G054)
         items:
           - enum:

-- 
2.47.1


