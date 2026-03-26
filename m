Return-Path: <linux-renesas-soc+bounces-30302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIrQCUG8xGk23AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30302-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 05:55:29 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F0D32F2A2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 05:55:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 847DC301AF42
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 04:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1766B332610;
	Thu, 26 Mar 2026 04:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="s/HHD9Qd";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cTWgs7hb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C5319B5B1;
	Thu, 26 Mar 2026 04:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774500865; cv=none; b=OmLAIIqX7V6mr+w79E2BakmE9IDQ0Sb/K/yx42qgyeFpTr97zHicAA5ClDS1QEH1WbEKd+sCw5ia+rJ0cYtBkJaah7nB3//LiO/dk9mNywmUzoIXynhBgsGNI5cXoWbcFcMLltxxOesFIe5fa3Aj1XY9SrjyRIOL2lYcHLJkjLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774500865; c=relaxed/simple;
	bh=soJ4XS9c4IqHMN2ob8qWi2RLYSuwdXFlO6Pe0mCkzRU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iLoN0cmH7YCyULWOZnvaVyDEtcpL2QxTuiD8NWJaUnqDALwik7fFi33xLEu6JzsRJx8LZczpASgFgAUMtg34mfnNOR1xmUtvKp9Jbcdclw96UQYvPib5vA1BY6izh1r4hayTzrKraoZ3CLnPnpNPmw9vaPRrAqJANzX531o94RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=s/HHD9Qd; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cTWgs7hb; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fhBJY1Hfzz9tgM;
	Thu, 26 Mar 2026 05:54:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774500861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AeTmnbZnY83CQhVxys4j7mRj2b/QcjBLaLjDxEFvpaQ=;
	b=s/HHD9QdG1VFCRBxaK+6fmWwyTYzNkVBQ1cHwhKlujcHAwlgSQB1CUJBRwNMIR+7+9W0sn
	OFkWo0t2WRnBbn8NqHeWHglhJSIY0d2tc1BLfRx7fvX3reZICnM+DgKqDeO4PKDrf7FvfI
	/JvgrEDRBiE2EKuLGXMB1ezKfv4Hb1kCsRZQyYB8Nod9aKwmnCubHYy8Y93iAtfnYiT34d
	7zJYAyWdXE+RfXJHljz543OoZjO/lH0xdW/uArcyOzjwD6qtvN3wofSNaPNQhGA9HmszDL
	SNzHK6acdRWql1UxiE7neKQXWtvO5f1aPpHIoLxj2DLRg/RI6+hWf8Ff7xf5HA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774500860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AeTmnbZnY83CQhVxys4j7mRj2b/QcjBLaLjDxEFvpaQ=;
	b=cTWgs7hbPmiN7WBU9ndHjWgnCVVevnG39bqyJ/7vHxkO7P4H+kUvkyUElBMuz0nrwwlfaJ
	wwiV0Od0hA3CvO/OcUs7F0A+mpufn+sEtRLUA+apc0Fg7/SW3sn/r0X5WoU8wQlzPojpaA
	lD6Y855l7awAaxCcaE6OGFNLa4zoXTlFSzNzVbxC30D/ckSXlS0Z74fKY3Oi2HPO+uBVTf
	fHeIN+1wyQQ+mmevJ1jgjl7YE9Kgdol+2VmZbOLQPeYkBzLOMjSj45UopUaQtrQYDWi3Ss
	iK8oXdVybJj6COMQvLjkT4xJeMa7hc2eXBv2/clg4kMToK3cb7AzuYhZi7N6Cw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] ARM: dts: renesas: rza2mevb: Drop RTL8211F PHY C22 compatible string
Date: Thu, 26 Mar 2026 05:54:01 +0100
Message-ID: <20260326045416.223556-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: cf84ed23d9f6cae60bd
X-MBO-RS-META: ox3s6d789fioidcop7xtrpwof3d35sgm
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30302-lists,linux-renesas-soc=lfdr.de,renesas];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.1:email]
X-Rspamd-Queue-Id: 76F0D32F2A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Realtek RTL8211F PHY schema indicates that compatible string
"ethernet-phy-id001c.c916" must not be followed by any other
compatible string. Drop trailing "ethernet-phy-ieee802.3-c22"
to match the schema.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts b/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
index f69a7fe56b6e7..55221c82ef642 100644
--- a/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
+++ b/arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts
@@ -94,8 +94,7 @@ &ether1 {
 	renesas,no-ether-link;
 	phy-handle = <&phy1>;
 	phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id001c.c816",
-			     "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id001c.c816";
 		reg = <0>;
 	};
 };
-- 
2.53.0


