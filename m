Return-Path: <linux-renesas-soc+bounces-28153-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPnnIrh3jGktpAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28153-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Feb 2026 13:36:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1337B1245BC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Feb 2026 13:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF0DD300CCB8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Feb 2026 12:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4F5350A03;
	Wed, 11 Feb 2026 12:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="OOKK5Q3r"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx-relay95-hz2.antispameurope.com (mx-relay95-hz2.antispameurope.com [94.100.136.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF6D306480
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Feb 2026 12:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813365; cv=pass; b=Dbe8ArGxUDMafQsDEfXl8malpymCDj1JbQX5A9EK3mRJ0D/G49BTJJjp/FK4nHnG6awyf2YQR1EJuTo1iOxOaTnxXfdmy8anvdJIrO1b2z1OnSIlRL2iDIjGsA0sSL6VeLc63WT83jzGRU5xvwzQHTT6d96iDSu6geDBSk7VtVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813365; c=relaxed/simple;
	bh=wJazHtN9709bx5vXU3VSNca9S8moIeQOsgpt1xQauOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z3mnOrp6D5WIjlv3hd8oSnMjZ+FaurwKA/iVQnzUlnq8SBVy3fj2NlRjYUxHH1Xzr3qYQsh/5jorAUbEDVOP2CJI/Cd8dJXWuJAqhNkhdX7sqeKxVzUX5g+x/CIxiYjCmrAKMBLW64sZZhpKCE8/HSwPaw4LHYbykTKK+QPl1EU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=OOKK5Q3r; arc=pass smtp.client-ip=94.100.136.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate95-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ls/S0m9WGUgqWCy8vJncgSdsx/isbkuq3kh3sRBurJc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770813307;
 b=Lk/RMYI1VegKUluixKhcJrX0XqRgZlH7a44+uo2CE0mSBcf7AsoNSMoQWIU8VCL69ggnxOEj
 ERE149Gwp2WQKvGwLFE7UFusYgNxehrDS8aAbbYSb5NUHjeXlMkL5jttbu++nyDpcZabfIbL0w4
 HzFVB5J27T4fyYYhh/U4p6/LxrnP6uuHd1gMsXS2pYL1NXv2M0OPSgGW36lKeDTtNFny3EuVbko
 Bx+qmZ6GlIlzjCtHLH0CpkK2HYI8JrQ04jnKjSKMy4tZ2zmnpySUOiFYoccUR1lUsDGWbreEG3k
 61SjBOI3z25gHtQJeQRmkXdgq8sRC/qTd8yUB+YOfbv2w==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770813307;
 b=j3O+g28xR1yBUFrYFb0GcslTKIWAmnBueuvUk5/AlyNM5JmT+0KkjGeuvn0v+PThjqOC9usr
 0fZPh621AsK4f0FsT7uEu6CWmnMOdwHwLlDVKpW6ogJYuLkdMScDRNWJsjCRHFiaX7EOnzqVOkP
 6CKXwRs2C6ZcTX/RBkUrGNlpOZ1pZo/A4nd6IuYqdqVt46eLWzO8UrCGPVhCu8Ld05cDtP+mRNe
 7q2rtXdsoyb6hxz/fccZAjEysHfcAz/+2ZkwXLBFR2jjoUUq7xiWwaQtDBVxGXOPy1FB7M4vOIi
 T9+0HPS4xtcFtVyQ3OUZiCW4rqalxOnmlpMv3Lci8QzPA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay95-hz2.antispameurope.com;
 Wed, 11 Feb 2026 13:35:07 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 9C0BC5A0F22;
	Wed, 11 Feb 2026 13:34:46 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Markus Niebel <Markus.Niebel@tq-group.com>
Subject: [PATCH v2 3/5] dt-bindings: arm: fsl: add bindings for TQMa8x
Date: Wed, 11 Feb 2026 13:34:30 +0100
Message-ID: <20260211123436.1077513-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
References: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-renesas-soc@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay95-hz2.antispameurope.com with 4f9yYg6lFBz2F1Th
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:ddedd737b3f16a1ef86df4ac688a2a62
X-cloud-security:scantime:1.584
DKIM-Signature: a=rsa-sha256;
 bh=ls/S0m9WGUgqWCy8vJncgSdsx/isbkuq3kh3sRBurJc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770813306; v=1;
 b=OOKK5Q3reXtBbRoVG5mak8Q+A6A713D4fSa/Jn06X/NGHEkEPAR8Byt7u0c1/vwI95TIGUZj
 O8WpvUrLcTC7PgTh8bEDlNyum3s0sLTS+peqp3fnbeU9TaLePqsFRieqfXx4cIxjsewSpRXps2x
 Ba+Bd3Q0eRjEKDg0grVLeEslPfZ88h3gCB1u80PAvK4is+eqB2jOIE+rBlzwlYhXhByLUmb9rKb
 AxAocED1dCNCS3QEbBV202ijkMKksklaGM2ZWPMluDqlBw5V/v9kM0c47W9zC0MSg6p7Svdqw1d
 Ng1s9perliMLasF3u78A31KJsEZ4269ewmW9YA1ppixow==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,reject];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=hse1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,baylibre.com,cadence.com,linuxfoundation.org,pengutronix.de,gmail.com,denx.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28153-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ew.tq-group.com:mid,ew.tq-group.com:dkim,tq-group.com:email]
X-Rspamd-Queue-Id: 1337B1245BC
X-Rspamd-Action: no action

TQMa8x is a SOM family using NXP i.MX8QM CPU family
MBa8x is an evaluation mainboard for this SOM.

Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v2:
* Collected Rob's R-b

 Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292cf..ad6edd75c4ff7 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1420,6 +1420,16 @@ properties:
               - const: tq,imx8dxp-tqma8xdps         # TQ-Systems GmbH TQMa8XDPS SOM
               - const: fsl,imx8dxp
 
+      - description:
+          TQMa8x is a series of SOM featuring NXP i.MX8 system-on-chip
+          variants. It is designed to be clicked on different carrier boards
+          MBa8x is the starterkit
+        items:
+          - enum:
+              - tq,imx8qm-tqma8qm-mba8x   # TQ-Systems GmbH TQMa8QM SOM on MBa8x
+          - const: tq,imx8qm-tqma8qm      # TQ-Systems GmbH TQMa8QM SOM
+          - const: fsl,imx8qm
+
       - description: i.MX8ULP based Boards
         items:
           - enum:
-- 
2.43.0


