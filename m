Return-Path: <linux-renesas-soc+bounces-30787-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPAfEsqbzmnfowYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30787-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:39:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C074F38C091
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:39:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D57F930FD78C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 16:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560833F1662;
	Thu,  2 Apr 2026 16:32:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F0A3F210D;
	Thu,  2 Apr 2026 16:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147551; cv=none; b=f4EkDJQvjAHTFZVJKi4j62oGk1JjkDj25GwEHpsZqQGq9Yv3RVmdaQNSogL0n2DVNDBdeezG8kcmqJmG8bDrIX+liR58jgqKMSFOFfPVvB6MHqZ7Q0C8P/4LqYsYkHypBJhMCPxq7ninPyiF1E+TSNQxuUGw/jLa1AfwoygRcAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147551; c=relaxed/simple;
	bh=FqfhaaGORDtC0Sg2I4bOKsTv/3W4jMWHDL/jX1f+hs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IvUvFX1JuEIPWmQG7cBHk/8RNc7OnyfBP2jnb7tCwuRnxX5Z+hKUC8oFfLea6uSa0gWETBcbifUn/1ssdgm0fphEXvrSMFzT4gh0wjOlFFcuFLQ1SSEw75yJ0468FIvyy2bza8lI+Sow9HBYzj80EfWRXLyHgcGSwj7UuTAuH9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: MZK23wQsS1SKIZPPmwTHWA==
X-CSE-MsgGUID: /zlyM/o/TBmFwZ9L+vzFRw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 03 Apr 2026 01:32:28 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.38])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9965540083E2;
	Fri,  3 Apr 2026 01:32:24 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCh v3 1/8] dt-bindings: clock: renesas: Add audio clock inputs for RZ/V2H family
Date: Thu,  2 Apr 2026 18:31:19 +0200
Message-ID: <20260402163126.12135-2-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402163126.12135-1-john.madieu.xa@bp.renesas.com>
References: <20260402163126.12135-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.14 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-30787-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,bp.renesas.com,gmail.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.962];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: C074F38C091
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

RZ/V2H, RZ/V2N, and RZ/G3E support external audio clock inputs
(AUDIO_CLKA, AUDIO_CLKB, AUDIO_CLKC) that can be used by the Audio Clock
Generator (ADG) to derive internal audio clocks. These clocks are optional
and their frequencies are set by the board.

Update the bindings to allow these optional clocks for all RZ/V2H family
SoCs.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v3: No changes
v2: Remove maxItems as it not needed with items lists.

 .../devicetree/bindings/clock/renesas,rzv2h-cpg.yaml      | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
index f261445bf341..d9cf62f5224e 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
@@ -26,16 +26,24 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 3
     items:
       - description: AUDIO_EXTAL clock input
       - description: RTXIN clock input
       - description: QEXTAL clock input
+      - description: AUDIO_CLKA clock input
+      - description: AUDIO_CLKB clock input
+      - description: AUDIO_CLKC clock input
 
   clock-names:
+    minItems: 3
     items:
       - const: audio_extal
       - const: rtxin
       - const: qextal
+      - const: audio_clka
+      - const: audio_clkb
+      - const: audio_clkc
 
   '#clock-cells':
     description: |
-- 
2.25.1


