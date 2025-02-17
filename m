Return-Path: <linux-renesas-soc+bounces-13196-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F312AA380D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 11:56:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 533F63B37EF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2025 10:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9D3217733;
	Mon, 17 Feb 2025 10:54:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9DC2165E2;
	Mon, 17 Feb 2025 10:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739789681; cv=none; b=Pc1q+YGXV7jayHRw2fOLlY+4+hIxXWFGRBQkey3CaW153NRKhY21PTYwUO4+14m4JXw6xoap/3nXIWk0WlNYfkRRtY9Iy8YMfU3nBcyP7ef8vibqyLyCxQDYUHv6RKr9LqPiadLSg7dTRhJat2qMUjV6wU6UPOwLMb0aYbblcQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739789681; c=relaxed/simple;
	bh=7Cw8nSNpz+d/AhPNLIncSlnONU0fF/Y/38MVZkIWN9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MhenlFl9A0HlT9THontfg6aEhRg1HtVp0gKcnmi7fNlQIVyI5MrGUMX4p+gDkEaPh5sogunG9YQeJITPqXFZLcQ2KnUu8dqGCxE6HvSpLWm8aZ1VtUzjANXGmWBrHWrK6D8qf0646eR8fizb/dZotF3XKje9qBFZIx1PUzYUDMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: eWyQJpBRS0uCzQlNxeQYHg==
X-CSE-MsgGUID: kYkymZq1SiWeOy3ZPM/UKQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Feb 2025 19:54:38 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.254])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id AEA7D428055D;
	Mon, 17 Feb 2025 19:54:33 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 03/13] dt-bindings: serial: Add compatible for Renesas RZ/T2H SoC in sci
Date: Mon, 17 Feb 2025 11:52:04 +0100
Message-ID: <20250217105354.551788-4-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com>
References: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document RZ/T2H (a.k.a r9a09g077) in SCI binding.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
 Documentation/devicetree/bindings/serial/renesas,sci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,sci.yaml b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
index 64d3db6e54e5..ff86c1e5864a 100644
--- a/Documentation/devicetree/bindings/serial/renesas,sci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
@@ -20,6 +20,7 @@ properties:
               - renesas,r9a07g043-sci     # RZ/G2UL and RZ/Five
               - renesas,r9a07g044-sci     # RZ/G2{L,LC}
               - renesas,r9a07g054-sci     # RZ/V2L
+              - renesas,r9a09g077-sci     # RZ/T2H
           - const: renesas,sci            # generic SCI compatible UART
 
       - items:
@@ -71,6 +72,7 @@ if:
           - renesas,r9a07g043-sci
           - renesas,r9a07g044-sci
           - renesas,r9a07g054-sci
+          - renesas,r9a09g077-sci
 then:
   properties:
     resets:
-- 
2.43.0


