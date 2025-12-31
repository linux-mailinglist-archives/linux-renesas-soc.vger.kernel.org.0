Return-Path: <linux-renesas-soc+bounces-26229-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CC3CEC94B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 22:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0A3E3007280
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Dec 2025 21:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 165E72857F0;
	Wed, 31 Dec 2025 21:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="QKuZX1a8";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="sPdAeBZh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD1C1B0F19;
	Wed, 31 Dec 2025 21:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767216634; cv=none; b=cfIzkLmaBxMCy1glA0oegBXqqMxA22E5FmFhfbxxgkl75QlgPBar+z/AUfA1tWNjSKWTA9B6fHNO5+94KxIc8/2CVUGecnNXj4CgdHjtjmewOf9Ejb6ZIYl6we0KBQAmxISsnLhEpSPtcn8x+UmVlAm5/hiYFcxKa2pH0b9zk0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767216634; c=relaxed/simple;
	bh=Fuq9AQgf/uMaTOeBeM4OF+Jj3GJDno9EpTQLqgBsQPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pK4Ptu/zZ8Lo9OJ6nr8U+ISkaC/h4GcU0xnR+7pA+pLixvLRAnCxFcOYK6DhTCR7LmKZ+F3JL1CEruv5Wvk/aPHQkjrtWRgQhbY/Ia5flU3+2g0h1ZhmBYFpAOEJBpc0N4uAvkBIAZ0nTzZNECGUnZJ7pH1nAY66TBcLgsRsmMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QKuZX1a8; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=sPdAeBZh; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dhNRB3pFQz9t46;
	Wed, 31 Dec 2025 22:30:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767216630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j99Q47GdEpRT9D/ae619Fkn+XOqqqjjTPDUmDgTYPwc=;
	b=QKuZX1a8bzocV5ijaLkKXrmXX0hI/s/Bq2+aP/SCcLnZOschHg3du5eONYmIsYnShEdyzu
	G05bnEjxQWnnKvA33L0n0azeLUOd57XGk/PeIrPKjyEQWquuk0xVyrYY6Oyf0IlOGIE+z7
	BavW8R8x1HJHQeUwlw0Xnw9Jrzm+Hr5+FjVbzGKWzIhkTydcrtDLmYeko7seBMgUKqDNG/
	4yB5o2gKlSQWbRoaYUDFY3KyAHLWHMwCeEj9z5wAwWITvpjkhdg+sG9eHPqaygAtoExxm3
	SZ1X/KhdHI8HuYI6VsAaEAw0ZeOvYOoPzW0kryzzfwHBiuvdPIoSIew8hSoERQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767216628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j99Q47GdEpRT9D/ae619Fkn+XOqqqjjTPDUmDgTYPwc=;
	b=sPdAeBZh8ViwiKqaFiXRlH7hjkWHKEK9OLcNI2kjZFKEnUbDiG53/wZqN4uIG/SHmnfs4F
	ke2P8ZCs0uA+rh+3szq9VmGvwOeS5qbwLZp5kLiR+NgJCobNriLRWcZ0dwSf/SFSQH+kLp
	jTCcnWu/shhoIflUhhMBz1US6gHKD7YbN806vFXDuZCayLPFHBufqn7hUyfGZsBtHUq4uu
	Gd5k9aKCrD4dn7wE4FqEPZBZP9mTzT0xUHEe3Z2Ny54408p3NrLozmYsFpOw03zp0hJyLf
	hwOF+L2z4EEGNEbO+OuyutRY6k4A8iUxUkUH8DW+nKphDCnHskR8RHNE1ABDmw==
To: arm-scmi@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: firmware: arm,scmi: Document arm,poll-transport property
Date: Wed, 31 Dec 2025 22:29:18 +0100
Message-ID: <20251231213016.185575-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: ksanyuhgeaad8muaa7msk9yjryisdh4e
X-MBO-RS-ID: fe2f78a35cf7f8eb2bf

Document new property arm,poll-transport, which sets all SCMI operation into
poll mode. This is meant to work around uncooperative SCP implementations,
which do not generate completion interrupts. This applies primarily on mbox
shmem based implementations.

With this property set, such implementations which do not generate interrupts
can be interacted with, until they are fixed to generate interrupts properly.

Note that, because the original base protocol exchange also requires some
sort of completion mechanism, it is not possible to query SCMI itself for
this property and it must be described in DT. While this does look a bit
like policy, the SCMI provider is part of the hardware, hence DT.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: arm-scmi@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: s@mean@&t and limit poll transport to mailbox/shmem only
---
 .../devicetree/bindings/firmware/arm,scmi.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index be817fd9cc34b..f4bf4173c5c7e 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -146,6 +146,13 @@ properties:
       this platform. If set, the value should be non-zero.
     minimum: 1
 
+  arm,poll-transport:
+    type: boolean
+    description:
+      An optional property which unconditionally forces polling in all transports.
+      This is mainly meant to work around uncooperative SCP, which does not generate
+      completion interrupts.
+
   arm,smc-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -379,6 +386,9 @@ then:
     - shmem
 
 else:
+  properties:
+    arm,poll-transport: false
+
   if:
     properties:
       compatible:
-- 
2.51.0


