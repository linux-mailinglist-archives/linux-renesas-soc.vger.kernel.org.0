Return-Path: <linux-renesas-soc+bounces-26791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7F7D21E44
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 01:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AD923024119
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 00:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C797260A;
	Thu, 15 Jan 2026 00:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="taqLXqw4";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="KSHFcQHL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC84D4400;
	Thu, 15 Jan 2026 00:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768438179; cv=none; b=AnoZy2QkOQcPyeLA1e3yB7dRvvONm3abZqg1+DC5QQ4NWysVrR6b4Lb6Q/O8KXO6z77meQ2LwBoNuMZdfSSK2y004g/t0Wqnh9YuNiZA3MCdKqMjK7VPKbmwycMJzYGHq5TAbq1iq3VF8MsToyj/0IuBFbTX/EqMLGFL2s41iiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768438179; c=relaxed/simple;
	bh=A6SUHQbdaI9gDYxKqXxSly8GUj0jMgB7kTwfSXEMNDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uQPJNr4lrp48fxPfKsufRxb5t8Y0Ldnj5NO12a0fkI7+F+ebeABII+GKJcNyPY3ma2pgDBdFD9faa/O+4pk265vKlNwXBb32cDAx9CeKkuYEcq1c9pzgG2d84OfL2Z3+ZxbufwGtE9x0JyAkVx4qL+hDXANeLVBEci5JDgvcbKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=taqLXqw4; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=KSHFcQHL; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4ds4BK2FpTz9t6b;
	Thu, 15 Jan 2026 01:49:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768438169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VgtwkFnLHLGeFiWQok6lp+mGBG+8RAMBY4LEJIBqATQ=;
	b=taqLXqw4blf2geW+5SFAgncMx+ULvPFhCxOwoAxzFJl49yXFNZERBwEvqhL47I7l4fw6iD
	qLCyzFjD4x+I7FdQH6HM7GwSbEeiFwSJRjvyvDXHSjTuKwlF3B5NAkZEAgzvceuP/mxlc6
	MsvMRXA+0Q3YgqDsiIApfzzWByPdvmr1vtdorZffitlDduBBnxkz0GDMnJKYGol1VUx4TU
	zeZftX5tM/8jHnc3XpYeevkUnzXOtb6iE/5FyeGpTk3TflykGyOd+6WK09mbrohXjOGwU7
	BzNVJugLZLCA0+jfiuotvktdSkHn735QUg84YJTpfV1Nri0S6RNneTg7G078Bw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=KSHFcQHL;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768438167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VgtwkFnLHLGeFiWQok6lp+mGBG+8RAMBY4LEJIBqATQ=;
	b=KSHFcQHLGPFGYoHiCKIIEDQ733nW2zdEoK2WTiBf3D/KUxLktnYA1Aq4Wq/vfTCVbYMOXM
	5v5ou+oHmErvp518WdhNk3YClFsTqzDvTxZSxkK8LNhjHgUnJ14vAzjtkQSzHsfrPtu6qR
	BsRrX/Zp9F7nZQswKEu5jiqsA0SP7kl/Jqwkm5+vr/ei2pliPfVEbHLs0inFTnBeYZjbLM
	8zA3Eftk9RlIfBYoW8YXTfs8qQ6n7xIIBKx8vaC7QBE6sNn7BK5YB4ojKrSOiiW+CCuoEv
	+wL4yUGrNig1u/cgyE1/DTORPiDatcL8QKjcVL80DMjc6hy7ruQveNu1WUOycA==
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
Subject: [PATCH v3 1/2] dt-bindings: firmware: arm,scmi: Document arm,no-completion-irq property
Date: Thu, 15 Jan 2026 01:48:56 +0100
Message-ID: <20260115004921.548282-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 4s5t3ptatd9debkizza3rmmcj79dtxan
X-MBO-RS-ID: 8336ff34b2745b0d966
X-Rspamd-Queue-Id: 4ds4BK2FpTz9t6b

Document new property arm,no-completion-irq, which sets all SCMI
operation into poll mode. This is meant to work around uncooperative
SCP implementations, which do not generate completion interrupts.
This applies primarily on mbox shmem based implementations.

With this property set, such implementations which do not generate
interrupts can be interacted with, until they are fixed to generate
interrupts properly.

Note that, because the original base protocol exchange also requires
some sort of completion mechanism, it is not possible to query SCMI
itself for this property and it must be described in DT. While this
does look a bit like policy, the SCMI provider is part of the
hardware, hence DT.

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
---
 .../devicetree/bindings/firmware/arm,scmi.yaml        | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index be817fd9cc34b..46d9a0a9a0e58 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -146,6 +146,14 @@ properties:
       this platform. If set, the value should be non-zero.
     minimum: 1
 
+  arm,no-completion-irq:
+    type: boolean
+    description:
+      An optional property which unconditionally forces polling in all transports,
+      meant for hardware which does not generate completion interrupts. This is
+      mainly meant to work around uncooperative SCP or SCP firmware, which does
+      not generate completion interrupts.
+
   arm,smc-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
@@ -379,6 +387,9 @@ then:
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


