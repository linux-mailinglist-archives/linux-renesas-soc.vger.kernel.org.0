Return-Path: <linux-renesas-soc+bounces-29545-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GdlHSULuWk/ngEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29545-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:04:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A35732A543B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 398883039CAB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84583932F8;
	Tue, 17 Mar 2026 08:02:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8AF388E54;
	Tue, 17 Mar 2026 08:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773734574; cv=none; b=Y9YiIsx4zfIpmE3EvGvXifTttM9BAOi/ifE91z+g1j8S/V1ZloinXdBI5Cc0YAEU55HuPLnNt/z+tgftjAsExVY51sU7GkfFlF3rS9EOKU+fQPv22F12FlK3OtpGQFBMMdOPE4scVdpkLZTp7Nx/HprW51lRJ4o1mLCavNurJWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773734574; c=relaxed/simple;
	bh=3bl5Affi01NWqveDmmJoSGgc9Vh02e/0AnRT23/n0rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TDX73TZY/gY5jWxTVckMPwemaq3XSWG3sqi6G0lomYjezjQxPR6ygJOde/VdRAuD8i1gZU+M3ewa1WJSN8lOMrsrZ4lnWvfbPQgE9YTJtMm5/VilpCoXR3DGSpY0Xo43uNTekPxuQGUOImNLPKY4Q6n/eIoMExcerjVT/1NYYQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF87C4CEF7;
	Tue, 17 Mar 2026 08:02:51 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Stefan Eichenberger <eichest@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: net: micrel: Sort lists
Date: Tue, 17 Mar 2026 09:02:45 +0100
Message-ID: <3877a8bca7e4c13119387870d10b0758274fa6a0.1773734298.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773734298.git.geert+renesas@glider.be>
References: <cover.1773734298.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29545-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,glider.be:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A35732A543B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sort lists of PHY models and compatible values alphabetically.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Stefan Eichenberger <eichest@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v2:
  - Add Reviewed-by, Acked-by.
---
 Documentation/devicetree/bindings/net/micrel.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/micrel.yaml b/Documentation/devicetree/bindings/net/micrel.yaml
index ecc00169ef805dc2..5d25f0d0a508a6df 100644
--- a/Documentation/devicetree/bindings/net/micrel.yaml
+++ b/Documentation/devicetree/bindings/net/micrel.yaml
@@ -51,9 +51,9 @@ properties:
       bits that are currently supported:
 
       KSZ8001: register 0x1e, bits 15..14
-      KSZ8041: register 0x1e, bits 15..14
       KSZ8021: register 0x1f, bits 5..4
       KSZ8031: register 0x1f, bits 5..4
+      KSZ8041: register 0x1e, bits 15..14
       KSZ8051: register 0x1f, bits 5..4
       KSZ8081: register 0x1f, bits 5..4
       KSZ8091: register 0x1f, bits 5..4
@@ -80,9 +80,9 @@ allOf:
             contains:
               enum:
                 - ethernet-phy-id0022.1510
+                - ethernet-phy-id0022.1550
                 - ethernet-phy-id0022.1555
                 - ethernet-phy-id0022.1556
-                - ethernet-phy-id0022.1550
                 - ethernet-phy-id0022.1560
                 - ethernet-phy-id0022.161a
     then:
-- 
2.43.0


