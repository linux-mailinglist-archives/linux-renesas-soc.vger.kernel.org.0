Return-Path: <linux-renesas-soc+bounces-22813-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2CFBC79DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 09:10:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 150983AFCB7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 07:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93202BE048;
	Thu,  9 Oct 2025 07:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CTbbmr99"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F5E1E492A
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 07:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759993840; cv=none; b=n9M7QYOOVSBnaDaweOQii0HTkLkl6PZE1MaXvlOuHTzRpTzSo/ptULUAKixIgP+FIO/RCmBza+k2QcViOBsHxn+gvY3DD0gJGzNhYlUHW7C0+g9TpB8+UmPlUmUNzCqOLwn4FMOs0cSNi40Q4OGI/B9kKpGe/ODXVNS9LMYxkfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759993840; c=relaxed/simple;
	bh=ApBUIJ6bWG7E4YhO/0r62onkrBDlCuMkjjVEzmN5eJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kSkZGmYS0VwFB5CXigPz1+pPagq9wOcsmYHyEnnYgZNM6thQvA/11LlFDgGts40wfzokVYcW9FamqKKMQkSZQTsR/Lkzqxf6rdynEOn9425BmfjpKeWGpAru2jImHWOcuHoic/plyIJegBEtVhvBH0i1KYFs2MFBpXNODw1ZD2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CTbbmr99; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=pyao3LeznFGLt+
	FjM7OooqCAp46hdzl+yeYgwjHsZJQ=; b=CTbbmr99L9nXM0RDeUF3jLKqMmRjwv
	Q5SJa2cdvlcYAfDkrbkpOJ1LG/iDRnTueHiUs5pIWMgJCU3L1uEm9PU5N4DMSMNp
	toLC4TJsBUTq9zmbwb/EoNmcQlutN3TPh/06zQrkmwGZ4R6NsHJ0Xq4sgUREzlE2
	bKuinxwbaRr+esuC1TLGyBPNLXHM2t+dLuBWFXFFRVaED0O/K9Bcnz4fGZectrCb
	tTLDJlkXoHNFcK/nMTuAU2W3EG8t9+LO6igiU/+dQ04Eoredw5gDwTa1Dc9o6HKS
	haNZqmPntNUeYHJFoLQEdngtD3c7zT8mpfiWyIS4ZFIz4oxdopVY84bA==
Received: (qmail 969000 invoked from network); 9 Oct 2025 09:10:36 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Oct 2025 09:10:36 +0200
X-UD-Smtp-Session: l3s3148p1@5U1uf7RAtuYgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org
Subject: [PATCH v2] dt-bindings: bus: renesas-bsc: allow additional properties
Date: Thu,  9 Oct 2025 09:08:19 +0200
Message-ID: <20251009071033.5378-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow additional properties to enable devices attached to the bus.
Fixes warnings like these:

arch/arm/boot/dts/renesas/sh73a0-kzm9g.dtb: bus@fec10000 (renesas,bsc-sh73a0): Unevaluated properties are not allowed ('ethernet@10000000' was unexpected)
arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dtb: bus@fec10000 (renesas,bsc-r8a73a4): Unevaluated properties are not allowed ('ethernet@8000000', 'flash@0' were unexpected)

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1:
* don't restrict node names, the core already does it
* drop A-F from unit address pattern

Thanks to Geert and Rob for the input!

 .../devicetree/bindings/bus/renesas,bsc.yaml         | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/renesas,bsc.yaml b/Documentation/devicetree/bindings/bus/renesas,bsc.yaml
index f53a37785413..48b9d02b65ed 100644
--- a/Documentation/devicetree/bindings/bus/renesas,bsc.yaml
+++ b/Documentation/devicetree/bindings/bus/renesas,bsc.yaml
@@ -41,6 +41,18 @@ properties:
   interrupts:
     maxItems: 1
 
+patternProperties:
+  # All other properties should be child nodes with unit-address and 'reg'
+  "^.*@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      reg:
+        maxItems: 1
+
+    required:
+      - reg
+
 required:
   - reg
 
-- 
2.47.2


