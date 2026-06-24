Return-Path: <linux-renesas-soc+bounces-34402-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BOVOGpP0O2qegQgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34402-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 17:15:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B57F46BF8A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 17:15:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KDk659yU;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34402-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34402-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0314631186FD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 15:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110E93DA5DB;
	Wed, 24 Jun 2026 15:03:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F354316F27F;
	Wed, 24 Jun 2026 15:03:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782313402; cv=none; b=YVidABfMlI6QOKYb9pvYKUKcRojemFaadZmJ3IslVnDRONW1zF6Btp+m7z/pLPWpYsEPDzLxVJMezptfy+9s2/l6ApV4pSsJTB1sdLbDogNKI7jhXFajFp210vJCQOc4bSlWTZKauQLfUHtCu4+MFt6OsqfHnL2qQhvufIzkdPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782313402; c=relaxed/simple;
	bh=EgeMv3LeUurApowpd/AA+HwFECgYzVaHejtU6nS2KPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ajlXmaohAIu6MbcEkE3caWsKAnMGQQ6mAWEPK7EP70rZH25JCV9Ya0txV4zyVF1LKkJeRXIZV3pdEqHw+hTgOXH3it4rh9iiHRysbWixI0iMuIDr8m1g7PB927Lwy6p4Yfq8nb/+40SitjEzJdxbuRtcIzn7E+cj/+tr8CZCZJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDk659yU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF491F000E9;
	Wed, 24 Jun 2026 15:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782313400;
	bh=8unGs6rbGg9eZccPCqQKdo02LVUJ1cmOkH4JAvhO2s4=;
	h=From:To:Cc:Subject:Date;
	b=KDk659yUXsZ1T1YM9gK0zBqyv1q0UuxepuHjtUsBiEmdZlwZzeyqG1Cyzn5oC5FRu
	 PyeuILawOEY7SALc/WG/s1JocO07eh8ZxeftRXwyrX5QYD3uC356b/9FbS9DEW1RLS
	 ovzzKMHbfWaaPeGapbvF3tDI4lJZAZXFAlFElRJV/JxkAmboUqY98my6yioZiq7xg5
	 WGzdIHLc9ENlLUg6gjxebQ2aafUmlZ7twpBpqpz/059ZLgKa8O8NC+ZxELn85+c8eS
	 40mr9x3hxprza+i5CrLPT1970IEsmicTS4kHCPcmXUk9Wrj0WqwPUWNtnlMrJjzzQY
	 JBmVfE5sCE7IA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] dt-bindings: net: renesas,ether: Drop example "ethernet-phy-ieee802.3-c22" fallback
Date: Wed, 24 Jun 2026 10:02:50 -0500
Message-ID: <20260624150250.131966-2-robh@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[ragnatech.se,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,glider.be,gmail.com];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund@ragnatech.se,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:sergei.shtylyov@gmail.com,m:netdev@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:sergeishtylyov@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34402-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B57F46BF8A8

Fix the Micrel PHY in the example which shouldn't have the
fallback "ethernet-phy-ieee802.3-c22" compatible:

Documentation/devicetree/bindings/net/renesas,ether.example.dtb: ethernet-phy@1 \
  (ethernet-phy-id0022.1537): compatible: ['ethernet-phy-id0022.1537', 'ethernet-phy-ieee802.3-c22'] is too long
        from schema $id: http://devicetree.org/schemas/net/micrel.yaml

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/net/renesas,ether.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/renesas,ether.yaml b/Documentation/devicetree/bindings/net/renesas,ether.yaml
index f0a52f47f95a..dd7187f12a67 100644
--- a/Documentation/devicetree/bindings/net/renesas,ether.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,ether.yaml
@@ -121,8 +121,7 @@ examples:
         #size-cells = <0>;
 
         phy1: ethernet-phy@1 {
-            compatible = "ethernet-phy-id0022.1537",
-                         "ethernet-phy-ieee802.3-c22";
+            compatible = "ethernet-phy-id0022.1537";
             reg = <1>;
             interrupt-parent = <&irqc0>;
             interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
-- 
2.53.0


