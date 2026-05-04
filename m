Return-Path: <linux-renesas-soc+bounces-31954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KfsB0iz+GkdzAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 16:55:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD114C031F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 16:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B11D03028F5B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 May 2026 14:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E74293E3DB9;
	Mon,  4 May 2026 14:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="XZMyFd4/";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="QGwH8TbF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A10C3E3DB6;
	Mon,  4 May 2026 14:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777905968; cv=none; b=QuROvMOoarq6f35Prhzw7l35cSqSWS31QhOslQUzqStVmu8eKd7u1TDarKuExJ5EWJN0ZnQR6oSlCfw1YD1Z5Pkumz4VlLYbDI7CrGHMhrBsSDyUmggnrKD1qMb9EQ6g1QfFyul8yG0AcFBFKOB6nQtSLbn4Oof92ZqCj+mH0U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777905968; c=relaxed/simple;
	bh=PuDwYkvXmSwbfNtwj6MxgYwg4/XpE7BkI/XthFNsU8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PekW867usaLiRyxPJhFlSJZJkvDjNGc+Wvd5vQq5YKhhoZLw1mk3YsIEfOkS5PBq7RdVB9zxBTBw0Py5eti5Bqt0h11gJmsHit2uz/c7AcpgqgxTJE41a+7zfdg8TvNi20w0VMDQU2Ww+4ztfgRdvU1y34WwgjoBpWMVLLE+WqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=XZMyFd4/; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QGwH8TbF; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g8PbJ5J6fz9tSP;
	Mon,  4 May 2026 16:46:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bqBQI5ZShnSxB5z5FL9+IeZXqZpX+/ABiAi5KCnD1Jo=;
	b=XZMyFd4/PVTBYBe0J464a3FIHqCuVc9yVcl6LvhiRNUQVXRTmZYc6J3m0G+c3sBafo4JqN
	ZJw4nel4bFRPtXQJj2uNKTUqm6vAFq884ERnL9TzGe+cZsEq4DeKfcgV0SDKShwz/RYcuk
	XEKnF5iqTGcEdoDQlIejP3KMo2Z+sNvHPhwFr3M/FNHQBGkX3pcs64vxxpXIP4v/b1UasR
	jjJ3cISDabseYaTf3nKntZPOHpMZBv/56riZ1OpxqbtFNUhzSKU5/aYqfTTp87AdMWUD01
	Oojtgjau7/mPx3HZ45osrJ2CUXyag/gdvcVMtCoyYIFKwWMzS9UWJNAIWUwSyQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=QGwH8TbF;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777905962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bqBQI5ZShnSxB5z5FL9+IeZXqZpX+/ABiAi5KCnD1Jo=;
	b=QGwH8TbFsOkCQUR/QJkkcJ+uhXLzU5HPtXU4qzg3o+yhy8dptmV6JH5Bptkmc/qtvZPQAr
	/ctB+DMRP/kV/A0y3Vkuk5jgH71kqFCaBvbo/H0d6oH81L6heOPs7xhUNVX09Vl1hzdNMV
	3hauGkZzCt27JcyCZ4yPbPqpRlgdcBvDuTC1KebXM93dX8H1WtM5PmZGJeAWVQ/8OGlWFu
	NfDqc2Gi7jQqQCcEgz6rK0b3Syuzy6P9Wkx//AoVobXDbBA55Em40WmfuAfF7x1JchNNiU
	DKnfE7nJYDasp/OPfHZv3AsEDyPlpaATJO98VPMJ7v1BsvIvasMOnyiWebZmCA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/7] dt-bindings: clock: cs2000-cp: document CS2500
Date: Mon,  4 May 2026 16:43:25 +0200
Message-ID: <20260504144534.43745-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 94ec97eb4d7439e3b08
X-MBO-RS-META: zwxwmftrmkdmexfdqt1omou8jkk1qacd
X-Rspamd-Queue-Id: 8CD114C031F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31954-lists,linux-renesas-soc=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,microchip.com,kernel.org,redhat.com,glider.be,renesas.com,gmail.com,baylibre.com,sang-engineering.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Document backward compatibility support for CS2500 chip, which
is a drop-in replacement for CS2000 chip.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Brian Masney <bmasney@redhat.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Ulf Hansson <ulfh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Add AB from Conor and Stephen
    - Drop variant suffix
    - Fix CS2500 name typo in description
    - Add link to the CS2500 product page
---
 .../devicetree/bindings/clock/cirrus,cs2000-cp.yaml   | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
index d416c374e8534..ceeaa8f9fb08f 100644
--- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
@@ -11,14 +11,19 @@ maintainers:
 
 description: |
   The CS2000-CP is an extremely versatile system clocking device that
-  utilizes a programmable phase lock loop.
+  utilizes a programmable phase lock loop. CS2500 is a compatible
+  drop-in replacement for CS2000-CP.
 
   Link: https://www.cirrus.com/products/cs2000/
+  Link: https://www.cirrus.com/products/cs2500/
 
 properties:
   compatible:
-    enum:
-      - cirrus,cs2000-cp
+    oneOf:
+      - items:
+          - const: cirrus,cs2500
+          - const: cirrus,cs2000-cp
+      - const: cirrus,cs2000-cp
 
   clocks:
     description:
-- 
2.53.0


