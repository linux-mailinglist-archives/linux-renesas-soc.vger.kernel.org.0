Return-Path: <linux-renesas-soc+bounces-31755-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDIoKCbx8WkOlwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31755-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 13:53:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 328C7493C1D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 13:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2987302C907
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 11:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C593E8C49;
	Wed, 29 Apr 2026 11:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Zdg5iybp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F61A3F2107
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 11:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777463476; cv=none; b=Zs2cEQEZ+s4v7GzrhICbqNjQzGOVdVdCdl3kCrtW2XNf77rGkwGvwNQOsAkLge7l1Mp/45qN3gbwOVHolUAxw6UKDPBan9h/k4vrMiwXCbz+qpEAP2Z7ltFZMEq6Yxz7qhbY3sURU7HREiAynvH4mVWHm/D3gc8HawiQiIpq1R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777463476; c=relaxed/simple;
	bh=VAJSA2xgO3c4cQcXZQBkqY65yBvsEuuS1NjB7gElWtY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D2ijaQ7AYJhnzYOeq0s8XuGfc85PqsTgLIvlODmH4RAalfnk6cXuOtkbTQvQUXISh+Xa3gEOONBJABgc0E+SNtXu7u+YRpsUef83WAe++Ooxc9Mf9rYFgct0IB2kmvrLIKrcN/bLjDbqwNd88VBvP7b9szpBL6stMpBVGHLWYIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Zdg5iybp; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D702B1A33E7;
	Wed, 29 Apr 2026 11:51:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD0E2601DF;
	Wed, 29 Apr 2026 11:51:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA08010729012;
	Wed, 29 Apr 2026 13:51:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777463469; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=kYgU7p+5G7jRn2Lu2neiA6JjUceaSNvUkJDhIyk539E=;
	b=Zdg5iybpl50u7W6h5DFjstn0a8BWQtxfafcPB2bcM9TYKLAvWFqs66pfSKmtm7P3pzmiqY
	O4WyrW3q4ovV9HRkBsU7KGUrazY3Hv5xZJV4lfgii7qacpTpqhqYlhCNL8+WJpiIqxf+9x
	PRW9xiL9vfk4trACNdFQMDv5dpDmfeXS1SsBKWyS6/TC9CCk0imLEM8J93s1g3a3BzeKDB
	IvjHZMonKaTiTtI3Ju11c8tUo2DkQ2JMX2wGC+4QNUxOHwfcgia+IgEMW0KWxX5rF3lx7o
	PD4Mfhy6bFzkLe93GkxdIVFgiNhKy9a64V6mSKul9vQno28eozIPS+fEdWHErQ==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 4/4] MAINTAINERS: Add the Renesas RZ/N1 timers driver entry
Date: Wed, 29 Apr 2026 13:50:23 +0200
Message-ID: <20260429115054.158160-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429115054.158160-1-herve.codina@bootlin.com>
References: <20260429115054.158160-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 328C7493C1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-31755-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[sang-engineering.com,bootlin.com,kernel.org,glider.be,gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

After contributing the driver, add myself as the maintainer for the
Renesas RZ/N1 timers driver.

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb1c75afd16..6f0bc793d657 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22708,6 +22708,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/rtc/renesas,rzn1-rtc.yaml
 F:	drivers/rtc/rtc-rzn1.c
 
+RENESAS RZ/N1 TIMERS DRIVER
+M:	Herve Codina <herve.codina@bootlin.com>
+L:	linux-renesas-soc@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml
+F:	drivers/clocksource/timer-rzn1.c
+
 RENESAS RZ/N1 USBF CONTROLLER DRIVER
 M:	Herve Codina <herve.codina@bootlin.com>
 L:	linux-renesas-soc@vger.kernel.org
-- 
2.53.0


