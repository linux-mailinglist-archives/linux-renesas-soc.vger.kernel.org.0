Return-Path: <linux-renesas-soc+bounces-12779-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 548BBA23BBE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 10:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D08BD1889CE5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 09:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7104919D06E;
	Fri, 31 Jan 2025 09:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="IVZpQ6YO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9271317C225;
	Fri, 31 Jan 2025 09:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738317487; cv=none; b=j6t4NUdfIH4XSAABCXj6GxCmuIo6EoMA+JQMd1sxL3hxEtdWR613hA27RkssmvSMIpCoYBbvI745s+GkE0Yclrm7mZdtghWMuRuA1lfL6cpwqAw5qyWsfIYKZdmqZ7W91d2l/aYZfY3awRDp6sG4FO3fKnXx6W8ot08UUz2pRh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738317487; c=relaxed/simple;
	bh=RtVefdD6GDzkYxWAXRWMHWEa5TJQfzMkGPzyRHy6aps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eZomvqY9p3PrI1IJhCw/Mu/slh8J+kyHxA5UjCCcz/BzBoCvWuU9hhfoTEruhpWLMkkeZ/6yasnS+Nn55xrVJp1hPfvw2aCrngpf+PS57pdm3hcULYPE0aeSwtwQJI04/BTtBq7YDE+cap0QPnlqyOAx4yOl1U1j7ydvlceWexw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IVZpQ6YO; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738317483;
	bh=RtVefdD6GDzkYxWAXRWMHWEa5TJQfzMkGPzyRHy6aps=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IVZpQ6YOufX46kCLuNq8bcHMNWSakXKqlERdT90W/KPISHUCJGpWStE/N89BFuvU+
	 RaN+6S2E8uABnU2wrDFUaImR+V1cUZfYRamJhFVfW4rEeTbWkKVUizxVlWsJtL5XMC
	 T7W89Lcgy172fWJWkoIKAV8mgrNuYfRj5yyeoULKipHQE4XLMCMRqkKtHbCFlPz7DQ
	 UXwtZhuI8CJFDMvdtHbtaJVssQYOLNYHRWWiYlMbPDWBAFSd1jItxmtyqRKXElrCeX
	 y0EGd6CGpj2rl/AmRn9yuZbnyvYX+J+eKAgraczvgE9WdfLTP9n+Rul6m4NcpND2w5
	 rH2sXLza/kvrQ==
Received: from apertis-1.home (2a01cb088cca73006086f5F072C6A07a.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:8cca:7300:6086:f5f0:72c6:a07a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1384917E1013;
	Fri, 31 Jan 2025 10:58:03 +0100 (CET)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 31 Jan 2025 10:57:59 +0100
Subject: [PATCH v3 1/2] dt-bindings: soc: renesas: Document MYIR Remi Pi
 board
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-myir-remi-pi-v3-1-2dda53e79291@collabora.com>
References: <20250131-myir-remi-pi-v3-0-2dda53e79291@collabora.com>
In-Reply-To: <20250131-myir-remi-pi-v3-0-2dda53e79291@collabora.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Julien Massot <julien.massot@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Document the MYIR Remi Pi" which is based on the Renesas
RZ/G2L ("R9A07G044L2") SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
2.48.1


