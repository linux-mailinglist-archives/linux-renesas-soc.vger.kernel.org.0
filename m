Return-Path: <linux-renesas-soc+bounces-31385-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLAlIF8v5WlxfAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31385-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Apr 2026 21:39:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE6B4254F2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Apr 2026 21:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 737A73045A91
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Apr 2026 19:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B63305968;
	Sun, 19 Apr 2026 19:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rBHIQCt1";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="l8x4Xy+l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0BD301471;
	Sun, 19 Apr 2026 19:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776627484; cv=none; b=Vws1wHGDhI4/h+41SF37HcZBYMupuLrsBEDhz5Gjwoohk/FA+sMFn+kJVEceQn6ecuKlW9JS1L352dMdoH2bYNsTzPBXsAI2L0gByuWgQHabzvwi7HdPX3hDiy0h7THyBwbWs4a67UqnVR3QwtdbIzDA4IxcgbohxyN693bkJZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776627484; c=relaxed/simple;
	bh=QwO018XjVhkeoONy4Rdr9TcaOhVLm4OfWNvvfZXp9/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=roc4NbOz0Bxl08JAbZnDbF+V1NV6K/oH8hhru98ZRBvmjHkS0QR1mXt32ntV4NxyYhkU025ytBKOTDqFBVcfy5B0euXE1BdZgpovDKVr1Jud86WyhBfv53uBg6QrHHcU3iPJ92vQr0w5BRABsfiisJp2dU8a9NA6Sz1fltQ54kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rBHIQCt1; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=l8x4Xy+l; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4fzJmy5YFtz9tYm;
	Sun, 19 Apr 2026 21:37:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776627474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5kerIpWs4ed0z7OiQKw7XLC1mV5Et0TeBc5iTrzRy2w=;
	b=rBHIQCt1CT508WBrV9/B/LA88ArwCh/J2l9DpZP2lZPqFAZ7D0HV7bx+85/uSL6OqfNlSf
	jVZAz6JdgjDQs/pYN2Kp67gK2EiK7ZPXHCCGLaCKmZP8P6tNJYVllQkTm2uidz4gzXM107
	DyTYpLdhjvP7K/ovEYeUEmow2Q193RRy9As0eVDTLiWxxCAG0rxQSqe2BQmt/w/lo4jauw
	gdohFhgyfPWq7D7uEiWEp8lS5aCRTPgAgrmO5TQFSB8RsE8XNp0ScZq6hRpmJMqaUDPjbc
	L5RzifLeG3sA97wX0k6V+XjDpLOjGhS0GDOVbtebj84A87qeE2xianhqAUZo0Q==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776627472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5kerIpWs4ed0z7OiQKw7XLC1mV5Et0TeBc5iTrzRy2w=;
	b=l8x4Xy+lj/mdLG8jFFgtzqnJpKwQDQOsC3UTD27udtR4N0oZUMZMixypXHp9cmLWB72FSM
	HfPNRhE2Y5VtuaRgF+Zu4rI3quaI03Hd8BkkaRZ0imlL8RUY+Or3nby+TkoRnGFWHvWOFm
	FV8MOEspdlzyTVMBX4+S2f2fG5461wGkcYcGFB+vF6cTb07ZoIEypX9MPSksIf07FiJ68x
	nie9w99SwFBp+szO+CPi8a58GWv++UeBP/qprt7njBkStJa/zVqxCAtpjmBogrAVn0XK3e
	1y/OPEZjDWJhxWvhhah1Y0rPIvf+t9UIjSKOFrZFH6z7S/2kYhy1Vyof006Mhg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/7] dt-bindings: clock: cs2000-cp: document CS2500
Date: Sun, 19 Apr 2026 21:35:34 +0200
Message-ID: <20260419193718.133174-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 36e649b870f355af3cf
X-MBO-RS-META: zuy53sxh3x97kehzz717wbpq8pnhyido
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31385-lists,linux-renesas-soc=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,gmail.com,glider.be,ideasonboard.com,renesas.com,baylibre.com,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,ideasonboard.com:email,ffwll.ch:email,glider.be:email,lists.freedesktop.org:email,baylibre.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: DCE6B4254F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document backward compatibility support for CS2500 chip, which
is a drop-in replacement for CS2000 chip.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../devicetree/bindings/clock/cirrus,cs2000-cp.yaml    | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
index d416c374e8534..031c52b2e5cec 100644
--- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
@@ -11,14 +11,18 @@ maintainers:
 
 description: |
   The CS2000-CP is an extremely versatile system clocking device that
-  utilizes a programmable phase lock loop.
+  utilizes a programmable phase lock loop. CP2500-CP is a compatible
+  drop-in replacement for CP2000-CP.
 
   Link: https://www.cirrus.com/products/cs2000/
 
 properties:
   compatible:
-    enum:
-      - cirrus,cs2000-cp
+    oneOf:
+      - items:
+          - const: cirrus,cs2500-cp
+          - const: cirrus,cs2000-cp
+      - const: cirrus,cs2000-cp
 
   clocks:
     description:
-- 
2.53.0


