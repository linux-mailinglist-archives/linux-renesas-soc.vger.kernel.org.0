Return-Path: <linux-renesas-soc+bounces-26946-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AF24DD38AFC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 17 Jan 2026 02:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2A8E302BF79
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 17 Jan 2026 01:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233F814A4F9;
	Sat, 17 Jan 2026 01:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Xhm6N6mk";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="RRFxTyQv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEBC49620;
	Sat, 17 Jan 2026 01:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768611775; cv=none; b=K8irVuud8YtQsFkg8w/KisKPfAEEwSuBntHW3RQ9lBPGiraBTU3l7vB8i1RFRhCCKkuBINF0qc+8O2to3FjmsIdk3NcUnwJxdZ5Z9hImSbK8zqcARJBJz9Lk0VDVE/+fX/1NrS3+e74Mq5EtMWQ6UwBoOXHFieKJvRe+4BnNs1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768611775; c=relaxed/simple;
	bh=vxdsqZuALF7aFBUwOZNeVsg+67Zx2OGNwU1431mmkoU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DTRiWz73F+QLOHMNUZIQ+LGYPaJaTANdhM33oF+Lea9ljU5D1iyDLIZMJF6VjLYqwzfrDsRNtAt5rNH9M6vxlA3CU0pdQg10RzRsnY9Q5SjxW7Mc3X0rWIjwiZ0t5mrFj3ValjiMRghH2nDcTV+HmfhXusXVTzGNKsPBrncafds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Xhm6N6mk; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=RRFxTyQv; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dtJNp5FL3z9vD5;
	Sat, 17 Jan 2026 02:02:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768611770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BBh+2qgbpQUHoDdDr6BIlnP2VoX2nm99cWm8zX7p714=;
	b=Xhm6N6mks76A6Ov3xkJC7dgJ2MaVbO/mcUgNfLKkhv+OYaQ3KYOTmNU4meJysCwax3VpRq
	gDKtj/fCwdU1xFEVvt6YO8Mp3+6GElrTpJJs0lnXo7yBvWBQs2xVILZXxo7d8FgZprxFgo
	4gvm1N6qag5VOqgv8xdpESVwwtQZXFRzsNfFUhzIu8wLBEpO6TqE97KQBJ4U4GEeC/Hrx/
	fRoFY0bQfNAjGuE1sNMP6XUej7cImeQUsbBeMU8dqu80WDjqXimK695kT0isrFvyrn3LtM
	Fa+tl1tIKckLUk0HMf9kA/ay8WPHzAhcoR35KcV86V0nX6SrgqPY6lSwASglDw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=RRFxTyQv;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768611768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BBh+2qgbpQUHoDdDr6BIlnP2VoX2nm99cWm8zX7p714=;
	b=RRFxTyQvLLwFd3nQlZ1ju6DXpJUsakpguv9UKXuBeSlLlsLr9tRFI/kMXZnPY+G4rtxoyA
	Eltx80J9LBOE6DknwbRjO3/PsxNzD1gCerh57es3ddI/5PAPj7/CNnyGJ6RR6J2hr1Unef
	yO86pwm1B29Vx0UFv+0TunRkq5bCYceVgWMYqIFsdz2RGZE19MPKRGkWh/wLNRg/WWkOhc
	xW9mn0TPKnnaucFSKIzFqlzXUDHtGw0Zq/y86lhYKS53mB2CwP87tt2qgiA2rUpNoNwWWg
	YIvQIRHV0fvtpK/1wE9b2YW5RFDNriXPltmyfo/AQeJGx3RJ+lvJgcEjdhq8hw==
To: arm-scmi@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: firmware: arm,scmi: Document arm,no-completion-irq property
Date: Sat, 17 Jan 2026 02:02:28 +0100
Message-ID: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: qc7wgykt7qnp4aab8fxq11e6mrj3judq
X-MBO-RS-ID: 55b7f5a610ad4e19108
X-Rspamd-Queue-Id: 4dtJNp5FL3z9vD5

Document new property arm,no-completion-irq . This optional property
is intended for hardware that does not generate completion interrupts
and can be used to unconditionally enable forced polling mode of
operation.

With this property set, such implementations which do not generate
interrupts can be interacted with, until they are fixed to generate
interrupts properly.

Note that, because the original base protocol exchange also requires
some sort of completion mechanism, it is not possible to query SCMI
itself for this property and it must be described in DT. While this
does look a bit like policy, the SCMI provider is part of the
hardware, hence DT.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
V3: - Reformat the commit message, expand property description to
      explicitly spell out this is hardware description.
    - Rename property from arm,poll-transport to arm,no-completion-irq
V4: - Update first paragraph of commit message and property description
    - Add RB from Rob
---
 .../devicetree/bindings/firmware/arm,scmi.yaml         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index be817fd9cc34b..d06cca9273c48 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -146,6 +146,13 @@ properties:
       this platform. If set, the value should be non-zero.
     minimum: 1
 
+  arm,no-completion-irq:
+    type: boolean
+    description:
+      This optional property is intended for hardware that does not generate
+      completion interrupts and can be used to unconditionally enable forced
+      polling mode of operation.
+
   arm,smc-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -379,6 +386,9 @@ then:
     - shmem
 
 else:
+  properties:
+    arm,no-completion-irq: false
+
   if:
     properties:
       compatible:
-- 
2.51.0


