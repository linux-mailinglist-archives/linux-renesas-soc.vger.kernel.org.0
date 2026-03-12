Return-Path: <linux-renesas-soc+bounces-29311-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KH/cOgpDs2l6TgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29311-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 23:49:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FCE27B1E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 23:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1EA473014894
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 22:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF756394498;
	Thu, 12 Mar 2026 22:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hU2e/Jlu";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="tR7big1g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A4B326928;
	Thu, 12 Mar 2026 22:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773355781; cv=none; b=vEhCdmeN+I3UKlqrO25YJPXkR4DRVymMwUCAXf2gGeyBjL2/cWcHbOVbhRsPcUTK642T8CxOzsod5URsoknZMg2BFGGgBbEdEcQIE3owOZaHtxvlgj+YIu4jWZrgfiLXQzNq0yc4IVMTsBgieXhrFeQ+vql0GL26o+4ypUKy/2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773355781; c=relaxed/simple;
	bh=SPYlkGlzcRTZp+SchLjy4dTRJNBK6DMGNOC3k3ofL5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XfuxSLGBRL1weYgKs+B7Le587+jtDhUVSaLx9B0jxt1OqelccK3Rls3ESyVANAFrAtPesJUOvexPgHuFBnco7bpGcYh0t3fnDNdIOA6HX7q1vyN01AfOfiWnvw16wn3FaFqcR8WeOgLKll5vM0gdLDhcC5poJfGADCaVnADfm98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hU2e/Jlu; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=tR7big1g; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fX2qZ4M9Zz9sjG;
	Thu, 12 Mar 2026 23:49:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773355770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BrMJ1rwOOlJZeWOhtfl5114396LYytDQ1D6kbadPMDM=;
	b=hU2e/Jlu1IYttT88I8Rd3IXPx9GUoIX5HmRFj6/MyOWuFMG6dC3mDTDI+7tZ/AdIToZ1iX
	sK7JMxaKcylLa63HnqDN0PZ/VUgwUW7tiaU2gAXZXY2Ehc1U4/u9IduvhNqQoQFvWFL2Kb
	X9qMQlASg4Ez7ojcLL7iWwIXFW7+DK5p340hQF4WiTkQqyUC8VsdDjVcvRHsclx1AHcUou
	oAM2Yzseq8e5fL03kUIepmZCOoSdi9NdF2TIK3hB7vXLFL2fa+inHMzKAdKKqlaF8FCy6k
	kyo6iZymAQeyfdiPNvEShK0AJZp6tEeTktykoqA6T+98wEUAnKWFEM9/ny1Pfg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=tR7big1g;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1773355768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BrMJ1rwOOlJZeWOhtfl5114396LYytDQ1D6kbadPMDM=;
	b=tR7big1g2fylDeqiS5oZPnRl8V09dC3kK4LStT5pJXVncakUeHr5xvvWheoo/FCGMjYRVG
	y1uXSxZ/SaIAqsqH8IUjIcpqUhPPJObfhYtZTAlie4eQhLTltBE1rXNNu7M+XiI8Nb0Fcx
	XTWoENBh1JFYCP+UPfAQBErfLAT/uIlWy73EbvqmV8ttlzbX7Ws4zMrewCvCx8sUMbxX5H
	7Yrx9R7Ce3cyeNaOoOE3lRwf0BMaaGcJrE2OaSDK0r6aG/oyiwKyeMSOavHspBW543hwq+
	DMYqukrQkDLsmwOg5dmUMKARzNnAin/oTuF4VghD2tnca0HJieHjAxzy7H45Bg==
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Job Noorman <job@noorman.info>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-input@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: touchscreen: trivial-touch: Move allOf: after required:
Date: Thu, 12 Mar 2026 23:49:01 +0100
Message-ID: <20260312224925.186077-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: g8inqgxx61bp6qgxh48fr6dhjsusrk41
X-MBO-RS-ID: 8ad9291e0188dee46cc
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,gmail.com,nxp.com,noorman.info,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29311-lists,linux-renesas-soc=lfdr.de,renesas];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid]
X-Rspamd-Queue-Id: F1FCE27B1E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Majority of schemas place allOf: after required: . Documentation
Documentation/devicetree/bindings/writing-schema.rst also hints at
this ordering. Trivially update this schema. No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
NOTE: This comes from https://lore.kernel.org/all/20260117-grinning-heavy-crab-11f245@quoll/
      where krzk comments "allOf: should be placed after required: block."
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Job Noorman <job@noorman.info>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../bindings/input/touchscreen/trivial-touch.yaml           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
index 6441d21223caf..6316a8d32f39b 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
@@ -53,14 +53,14 @@ properties:
 
   wakeup-source: true
 
-allOf:
-  - $ref: touchscreen.yaml
-
 required:
   - compatible
   - reg
   - interrupts
 
+allOf:
+  - $ref: touchscreen.yaml
+
 unevaluatedProperties: false
 
 examples:
-- 
2.51.0


