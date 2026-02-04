Return-Path: <linux-renesas-soc+bounces-27924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOeiIKe7g2kgtwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 22:35:35 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4CEECC14
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 22:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0D0713004C96
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 21:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77A939526D;
	Wed,  4 Feb 2026 21:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQ2G+5tp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B52395242
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 21:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770240929; cv=none; b=lt0NePpl6xpBsfkXMlujkL+qvjw9q1ILIxbQ4dNRLYnfjcHFyKiC8VI+KaMdpBLrTljAXqVwgFfapMn81zFwCOfBWrjZF95qeeRZ1WY4jqsietLl4wnHnnI/l6dMqV0QzygLjofh7uRzkbHQJUSEkaxAFp0DZ73t2NfeOfRh1+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770240929; c=relaxed/simple;
	bh=/uXzpBkZvVH/CVh+0y+pkNOin2JA9iRNlmldoLBo3UE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vGejFgEseOMdoMuGq31oC7RlwkZluHPySxyaHsMp8ekrw0JXNQWhLY0D2YokjZxee6bWHzKioV7tfFIuuY3BPKma7nIXI/pHSe6qEZ6dgViGAGMtnXXABEL/xuz1buQ95EwtD0UAEy4gRBGcFe7i1KIc878aKepd9xzfXaDFu6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQ2G+5tp; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b8715a4d9fdso25049366b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 13:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770240928; x=1770845728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rSgRM+hXY45JfIAA1cA873q4K0bzGufihgURNC0AChQ=;
        b=aQ2G+5tpPXhMJEDc4Hbc0mwvkHitA5CQDEZmpSNEN8W/Pwq77UfgPD14jmkr3FMDjC
         JbTu5Tru2SpiZSbwCLisCqELFFvQY0PyOILvAuVUYZdLhU0ODL0QQDlUunEfdLaTGHhE
         lIiecsIxjsVnyEvqbdW9MQqVJWsadmTYzZoTHbNmSTRv2KztwSgh6sG9dxd4u+GmVisw
         I88bNuRB2ebTgD7CtFW98oV69qamxtA9IaJmlyAcfEbJ6sWVkYOabtUBLA5h3LaiDAmG
         gLtJdx4j611+BKRRAkoGstg/r3RqAWHgxPMjyW1NC9q0QKzuz7IjUKeoWbLXoTLbIe7I
         lj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770240928; x=1770845728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rSgRM+hXY45JfIAA1cA873q4K0bzGufihgURNC0AChQ=;
        b=YtsxqclzM+2RAIgJFDFvSPXzM9WWfsYDzjR1nJzcyc17FzRmmdqknCAQTm5RHKqISu
         ouOvOqR9IYqXPnLAG6jw+KDZUua/vr9P/HDNjHA/krElI7k7e4/Sj0pd7Y8mMw+origw
         6HQogCOz8csqZdLqxwCV6WmZBDvtdxhQOlkt488b3FAHeZ7bfCvZZYARZM5Gp16QFbAD
         RTxvFYWF8170Rw9TkP42G9gj72yKeDhspTcBNmu8fhJk8JBKk4ITZU5YWfbfPqfg/WN8
         LWa14bWymY2bQBGDUqTdbtacteu1mm3wW9NgJvlTrxsKXC6jQOMkfdNCm8/k5joyg5hR
         Qewg==
X-Forwarded-Encrypted: i=1; AJvYcCXFaIWBdhXb0r9UmzdDMCsyog9QQWJ6dqfyhn9DgPKVtTx8RhEQAaPckOa/w4ETDU6uIS0Nc8Id/SjMhOrMiTFuqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiLyp8LZrb8En9Su9TdyPfj25ukzaURIWjvsrw2A75Fl3u8I61
	RKVEkqTlditMbaDwnZRRZxYV2MbJHlRhzVIN1nEG2dgu/sBRd7cwnnwe
X-Gm-Gg: AZuq6aIsJ6BVNG42d0vwYkVuxVEESgF2BAps8nNGq+5yOGRFGtE8JjlXR9c7E7lXDs9
	MLZCludPJs8xP21taPU8MCunm+OVtXTYfLwhq51XsRWQOpbJUrvpdVzSfOeHE9IaMq2DUfWvFRP
	Z5AdnrVlaq70xK2MrF014a7u5SFeJIyDf+FIwRqvi+IWevNL6hWlnNnjkIKWd4SPZsfnLli9r7r
	ICZWGs/h6NauZdQ3oD3MRehd0QLexDwpGEa5+1WI/QkQafTl7VQQLHvFa4P9Ft/Wh4Gkmvx6HTp
	mRHxkvRQvN73IduiuBbkPTyln8BnJ+ktAVJwDzYkNwSzDoIXb3HktV41LBWztN5+045miJAMZyU
	lOYrLv6YXsUMWx3QglbkAaTUCwtwlvzqNyChW33Idj8O8A+/ogl9w3+T0zU0IfWwDUpmp/Osyk/
	cb/UzPuDrRR/VpoikG5CL/1YLj4FwFpvXED5Q=
X-Received: by 2002:a17:906:f589:b0:b87:a0df:2f98 with SMTP id a640c23a62f3a-b8e9f3b7625mr273262966b.63.1770240927584;
        Wed, 04 Feb 2026 13:35:27 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:27b8:773c:f9e3:1dde])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8ea00435fdsm155454266b.57.2026.02.04.13.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 13:35:27 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH net-next v2] dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/G3L RMII{tx, rx} clocks
Date: Wed,  4 Feb 2026 21:35:21 +0000
Message-ID: <20260204213524.3437-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27924-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,glider.be,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com,microchip.com];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email,microchip.com:email]
X-Rspamd-Queue-Id: 9E4CEECC14
X-Rspamd-Action: no action

From: Biju Das <biju.das.jz@bp.renesas.com>

As per the RZ/G3L Hardware manual, CPG_CLKON_ETH register bits{12,13} are
to control the RMII{tx, rx} clocks. Document the RMII{tx, rx} clocks for
RZ/G3L SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Fixes: 3ac2aa31b489eb4e ("dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/G3L SoC")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tag
 * Added Fixes tag
 * Fixed typo {tx.rx}->{tx, rx} in commit description.
---
 .../devicetree/bindings/net/renesas,rzv2h-gbeth.yaml      | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
index fb60f745a1ff..2125b5ddf73d 100644
--- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
@@ -58,6 +58,8 @@ properties:
           - description: TX clock phase-shifted by 180 degrees
           - description: RX clock phase-shifted by 180 degrees
           - description: RMII clock
+          - description: RMII TX clock
+          - description: RMII RX clock
 
         minItems: 7
 
@@ -77,6 +79,8 @@ properties:
           - const: tx-180
           - const: rx-180
           - const: rmii
+          - const: rmii_tx
+          - const: rmii_rx
 
         minItems: 7
 
@@ -170,10 +174,10 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 8
+          minItems: 10
 
         clock-names:
-          minItems: 8
+          minItems: 10
 
         interrupts:
           minItems: 15
-- 
2.43.0


