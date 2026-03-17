Return-Path: <linux-renesas-soc+bounces-29546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8I6NGzgLuWk/ngEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29546-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:05:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5EF2A5451
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:05:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FFF3306B164
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 08:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F23393DC8;
	Tue, 17 Mar 2026 08:02:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1E5192D97;
	Tue, 17 Mar 2026 08:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773734577; cv=none; b=McvUrhSCoPRStmKudZwR6mk/YRe0UknZrqCGSsqOTk+CPjsol00StI+G2oQ+92j+J3zAjDF6cZjtD7vAU3QXWHRzi0FalMgupt8Hc7YYmAd01r1a4oxX+dLCqKFaMyTm4fa9BWcjDvFjB/CKXd5JoQoajYxPifnCW99tQLQ4EMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773734577; c=relaxed/simple;
	bh=Fs6kGPlYcuRPzQ4A1YkvjL1EjGLW9fewcz/aUiikuys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F5N0+WUuwtqzMZ4Lo+SlCmFL/9kT0r/xgmwHB6JipSskCGdu2xuoEpmXy8ZgA9J8xGFxCR9Qv2Uih+cznRN+y+YU92tbdGT73QYQ4I8h29uHrlukp2DwmWY/7m7wXjHZ6hXJCFudYGF2lsmq0rlNJLlmErz+w4WDV4MoBRTKlhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D613FC2BCAF;
	Tue, 17 Mar 2026 08:02:54 +0000 (UTC)
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
Subject: [PATCH v2 2/2] dt-bindings: net: micrel: KSZ8041RNLI supports LED mode
Date: Tue, 17 Mar 2026 09:02:46 +0100
Message-ID: <efad6c7e024b3a9aa2882db65909ee5bbbcbdc45.1773734298.git.geert+renesas@glider.be>
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
	TAGGED_FROM(0.00)[bounces-29546-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[gmail.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.967];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email,devicetree.org:url,glider.be:email,glider.be:mid]
X-Rspamd-Queue-Id: 0D5EF2A5451
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Micrel KSZ8041RNLI supports LED mode, just like KSZ8041.

This fixes (a.o.) the following "make dtbs_check" warning:

    arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: ethernet-phy@1 (ethernet-phy-id0022.1537): False schema does not allow 1
	    from schema $id: http://devicetree.org/schemas/net/micrel.yaml

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Stefan Eichenberger <eichest@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v2:
  - Add Reviewed-by, Acked-by,
  - Fix KSZ8041RLNI typo.
---
 Documentation/devicetree/bindings/net/micrel.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/micrel.yaml b/Documentation/devicetree/bindings/net/micrel.yaml
index 5d25f0d0a508a6df..6fa568057b927182 100644
--- a/Documentation/devicetree/bindings/net/micrel.yaml
+++ b/Documentation/devicetree/bindings/net/micrel.yaml
@@ -54,6 +54,7 @@ properties:
       KSZ8021: register 0x1f, bits 5..4
       KSZ8031: register 0x1f, bits 5..4
       KSZ8041: register 0x1e, bits 15..14
+      KSZ8041RNLI: register 0x1e, bits 15..14
       KSZ8051: register 0x1f, bits 5..4
       KSZ8081: register 0x1f, bits 5..4
       KSZ8091: register 0x1f, bits 5..4
@@ -80,6 +81,7 @@ allOf:
             contains:
               enum:
                 - ethernet-phy-id0022.1510
+                - ethernet-phy-id0022.1537
                 - ethernet-phy-id0022.1550
                 - ethernet-phy-id0022.1555
                 - ethernet-phy-id0022.1556
-- 
2.43.0


