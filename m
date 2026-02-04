Return-Path: <linux-renesas-soc+bounces-27923-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G7XC125g2lwtQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27923-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 22:25:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBFEECB9D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 22:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF3373016917
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 21:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6687038E132;
	Wed,  4 Feb 2026 21:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBBMXKwX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0624A3093CD
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 21:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770240346; cv=none; b=po57rcnguw+lSLuhnY6jVMHQlHea2uOFjdOL2261Cf6nO8lwGXAxi7idbOP8S5UCTx7HgTGlQOYKumfh1/BltW27SHKo/MeMIaufUNVOiYZgpARSRSWf3pWmFAigy12+mCUor1uS4A9iq2tGiYjwABGTd0DlVtpwOtu6KcJXRx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770240346; c=relaxed/simple;
	bh=GGx3tEEBEsP/zWuuHQWsGEcQUYRZMy5fvKKtRcj/Ppc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dp0S4sW+vllZvg9xdZnh9UuUYDpWmc+pwaihMiFo0MHdcbUqRIfTHPCusuHbuRY+SlrarIefjFVN+nDMGWi8DSwn+Zpo/SrjAvWAQ3wX871tp4EMbp9ms0qj6Xq+6ttmMhnCGvmvkdjPHsMI9tWxy3TB87A/dOXeCdjbO83nZRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBBMXKwX; arc=none smtp.client-ip=209.85.208.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-6581234d208so440840a12.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 13:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770240344; x=1770845144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+Pp2YHDz9lMmySFFkUv+WXWdk3W/He2Wu8AaWjmXkg=;
        b=GBBMXKwXcxfW3dRSNWd2akhvRNCAkeCeistqXTd1gdJaO5M/00ET7al+y3zH7Kw0tP
         bjkskAcZ3j591bDx72Ivo4oWQL38htP5XOdTlguf/JrvpepjhSppVqYlXxn/DmxuTHee
         qjJK/A9Xln0PLYKzo0g8HxiLeCEnPhNC0mDTusaV0+Ej8cavm9qrnqiGswT2naZAqtCZ
         eOY21kB+xu0OwL2J9XycYAvTSZNqFaDqMUSwkk5eaKzi41dtR3M3lLd9YLPiyJT/yOBC
         72DiWWOWXpWL/VbpIZHBXfzJFYOqppq5zM4GEnIi4drUj7FP9s0bVscOVQhxJtcbrTN3
         5XuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770240344; x=1770845144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+Pp2YHDz9lMmySFFkUv+WXWdk3W/He2Wu8AaWjmXkg=;
        b=DH6Oydy5s5ok1C8p2t+8M+BGkOm5IISsOEwbvDmboPZS6bQD/zjJV/hrU4LriMPz7j
         gZdBpFzqLDYJ3lzaH2xGwOMJWx8ykMfic/dJ8sCkCm7RK1R4lBjeg4i3v9OkpfqWhV6J
         K0i2GO2jUeWazGqB6cSzgEmC60r8cvDPYWOY5pru5+PcMvmdaa7ug88q8CXMs8/naPLG
         fqSDcNBFHueGwcq3rYa4m58dVFa/2Nrl+2BRebgiUkFIkUipOSpVcuEy+pH5u2uBbSlO
         NbPk+jBF8M1HEF2lBk2q8wq1AatinCx3wBwX9Asg2PXulHiuX9Wso1Z3LrBT3yY8bZEV
         ZWog==
X-Forwarded-Encrypted: i=1; AJvYcCWbtTB+371chgl1pi6rP24Q0qGoBmm43PdzoIbrWqN85Fv030EEQFuwfbdGy2Kf3RCSUXVOlYfhmieFCgnz32tBOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx55DrVy4/k8bZASoWW6wVft9TLutY6Iya6ykFW0rnDRe64AQD
	QrP2n4/BAltb8EFqJ+w+3iTlT10p6z3cMUQxq5qRUJmxk/TQXa27yEXM
X-Gm-Gg: AZuq6aL4PFoUcRV1gUzmUyIGl8ivecHZaUSjlzjPI4PXN2yhh/+3nCvgJwzT2eQY/uP
	EWXK61DmE9ChzBI3IkRKrOfOyJ6Vw1L42Rt1rKoWgAxkaIvshEOKenwljR9eIYWqsDghH+b6SW0
	mf/li5bMURedo8QyjZO4AYxdWm13YvdslJPWGnGaQsiVurA/w+6tpiaW/fzD6+Eg9qGbaHXL7PK
	ansUUkyce7xuaMyWTLmoCYXtFjKa/6oFkile/FBH5WNX0weap0fDl3lKLj+byIjonBYgymV54+C
	dZJy1Q5wF7qLp2WcB0yWCahJ4yNdOvg9/Cfd4TmcHvmSwxIH2eUir3Iqe/hqRUS2dbQWeVyZknT
	8kvCJ1NKhaIUJmjp+6mB8nF3B0MdhTkDBJ/rH+7YPWsDTpsQWuWGd7Vh50XCwH2mbYb87F6Vo+4
	TY+87epEE05pFvS+0Zl8un8+/41WmSRAgmHKzuAe/21ARaYQ==
X-Received: by 2002:a17:907:7b9a:b0:b8d:bf4d:7464 with SMTP id a640c23a62f3a-b8e9f1757b9mr332256766b.39.1770240344250;
        Wed, 04 Feb 2026 13:25:44 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:b4a3:40bc:353b:1368])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fcd8f7csm156558166b.14.2026.02.04.13.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 13:25:43 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: 
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2] dt-bindings: net: renesas,rzv2h-gbeth: Document Renesas RZ/G3L RMII{tx,rx} clocks To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Date: Wed,  4 Feb 2026 21:25:38 +0000
Message-ID: <20260204212541.4870-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	LONG_SUBJ(3.00)[525];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_TO(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com,microchip.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27923-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,davemloft.net:email,bp.renesas.com:mid,lunn.ch:email,renesas.com:email]
X-Rspamd-Queue-Id: 4EBFEECB9D
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
 * Fixed typo {tx.rx}->{tx, rx} in xommit description.
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


