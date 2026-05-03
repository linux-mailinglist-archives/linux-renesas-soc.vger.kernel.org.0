Return-Path: <linux-renesas-soc+bounces-31902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GC+ZLnJt92nYhgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 17:44:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CED4B649F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 03 May 2026 17:44:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 220B1300073D
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 May 2026 15:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983C237DE92;
	Sun,  3 May 2026 15:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="NYF1sa57";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="U0gP5MBz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652A914EC73;
	Sun,  3 May 2026 15:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777823088; cv=none; b=kyiNlV4LZ92hAt7sFNMM7SzqwEbUINryC/fhv+2EwUmo2UKbgVX4WfkOP9oa3PrGRm/uj0tDf8oQJhgX1pWEPz0sJ35LdmKL41Arlgz5hnIAe3K4uO8hXHEvCDVUUgBv7fJhU8tGU/Aziv4K75fa4rr984012AIcQBOEFOS3Qts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777823088; c=relaxed/simple;
	bh=KvrSzVRlTtgdyIyOHllZeU18ckjlbXnfOtScHBIg2+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fsnmQBmAApwfxxvtH47zCSJbHHhCFHAuCCDldfavGt46EfnLZVNU2ukrHI/1Ck261shkL7u3pm1JoqQ6jQZaNg0VmnFh+5UDNtJaKTUFwhtPLxs3C4ML8VbcRziJsFhIb8YxMF2C+h8OSXfsYI7pX8F1KnrVo+ctOez2nt0/DxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=NYF1sa57; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=U0gP5MBz; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g7pxS0xq3z9tRM;
	Sun,  3 May 2026 17:44:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777823084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=C5ndckZy3D++ygR4S2KuLZlKgbLjiLF0FZ4orIPcy4o=;
	b=NYF1sa57Mu7V6hHn+z/sgUVc0p2VzdOu2fxRzR0Q/nlqSXZZP3Yxg7deD77CNd3PB5o0+G
	ZIrWrknCgmkaO8g5a//sdYHH+e5pki0kMiFkJvDn7nr11VPSfSfdHd+AqiEQthnhiwenux
	RQugUWpmp6tI7UHKZzmvOEJoGlVB0MrPeTsCmuE7iNpvaqv5IWehoNzAsyqpMxtvN80HeD
	NHwhGiBh4N+2P5H+SKIbkRT2vVYiLZGG1GCnrSshjAtIaVmwmBNknZ2d8LPmnjWfIiCgsR
	2ap7xek2E+NJeFuCRCCd0tCeIRHybZRqXnJbtDXP1wxt+BHktc9uzzDSycSkpA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=U0gP5MBz;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777823083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=C5ndckZy3D++ygR4S2KuLZlKgbLjiLF0FZ4orIPcy4o=;
	b=U0gP5MBzbWM5mlEYDBACRaWwxW2CAsnl0H48y1IlyPg6UGxFA05hAu4lBpvZ2tTwqM6FcB
	ifHQdKJyMiLsa/RmSNaL88d70y65/yY5dbCzuVDQhtDjyxakT0kxVjjeDobo3aFRfagDtH
	ybg1ClfOZWYoXBOskA7afdlg8iC9LitWJnCVclWNH9th/Hxrt+lcrxbS5cSSYz+UiY04it
	coXAZ4O/OOMONWcIQNaLArQYrtK/+PmpaZvzvpMqIjlIRLg50EAB1wWpJsPDM0M3wtP3o5
	KwVNcqpywb8BiouEt8kXwQkDxcPspYKN0bIP4rJatp+1+564BT2unP54ZSzCZA==
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] schemas: Allow clocks: property in cache nodes
Date: Sun,  3 May 2026 17:44:13 +0200
Message-ID: <20260503154439.27362-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 7fa1ca7aec103e1c8da
X-MBO-RS-META: 4xodjuiiisazkf7hch37sdzhftahx3kq
X-Rspamd-Queue-Id: 38CED4B649F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31902-lists,linux-renesas-soc=lfdr.de,renesas];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid]

Renesas R-Mobile APE6 currently describes clock which supply the cache
controller in their DT using "clocks" property. This is not the only
hardware that has cache controller clock controllable via some sort of
clock controller, for example Altera SoCFPGA Cyclone V and Arria V also
has controllable cache controller clock. Allow clocks: property in cache
controller node to allow users to fully describe such hardware.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 dtschema/schemas/cache.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/dtschema/schemas/cache.yaml b/dtschema/schemas/cache.yaml
index 73d345f..dee1cd5 100644
--- a/dtschema/schemas/cache.yaml
+++ b/dtschema/schemas/cache.yaml
@@ -33,6 +33,9 @@ properties:
   compatible:
     const: cache
 
+  clocks:
+    maxItems: 1
+
   power-domains:
     maxItems: 1
 
-- 
2.53.0


