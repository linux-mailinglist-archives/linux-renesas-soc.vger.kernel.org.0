Return-Path: <linux-renesas-soc+bounces-35019-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kOvXHCa4UGrs3wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35019-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 11:15:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6462D738EBE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 11:15:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=CnU5jstr;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=TNTWjDVF;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35019-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35019-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E16533007A6C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 08:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1513B3D6CBA;
	Fri, 10 Jul 2026 08:58:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6662844999A;
	Fri, 10 Jul 2026 08:58:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673908; cv=none; b=niFhtkDhffgV9NPnygSMcMkRYyPmehXBArOvqfrTQcw7aJmyc77wsiEx6ORaT8kfjZwLu6OxHX5JouRCkvg9uP2txh0Cf9stAoo5yPF+mq8lIqvCoVUWKuOjqr0cuSybO7L/EjVX/jEm0J7zgMO7zQU5JTMXC96UFwlCL4YzRdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673908; c=relaxed/simple;
	bh=eLAgAANN0P69+E8Skm+XXXXG6bVfOHOixZkNGzGfrKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XBDuRzB0MEfFeDLXHnMrh1YH6ZCiFLp4381+S90Bw4ASBTTGRlWz8urB/0RmsISZhSP8M8mEJsFhxn78bX+nJA8DY2DEdeR+Ab4NtKCPGy6x3tYOfRlQay68kslOTZZgSsZXgF3yBIEwIZNz0648X5Sf4dPRmF+1aO8aDp8uWPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CnU5jstr; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=TNTWjDVF; arc=none smtp.client-ip=80.241.56.151
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gxQjC1rStz8v2j;
	Fri, 10 Jul 2026 10:58:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783673903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4/HdArdtBTOLZopTsp6zg00kQq5JIv25vlS+uIDaqh4=;
	b=CnU5jstrID6mTzlFWMsnOvnvRtP4dTcnLqqLJ2sh2YH/4l4XxPyHVrdHrLtv2gxjFx3CxA
	SbB38wX+zvPPNfR/RqFHA2y4F7Mg2+5mcMD0PGZcXMAcGtI5GlmLv1xkAndotWxqCM8lWx
	8WgAtcXijMpEizB8vNfol4LPDSii8k6fkO4W/eEP4jm6nw4vWbwnQ/aDt9dUG6ll8Fttfk
	RWhj47C0E6cB4XNjJnfIQHxfzah64XnyE/XmRlDrRi2LebxusVkXnStRjCth55VJB5eAC6
	qbW6YsJMoJ7k4LyJKoTCkXeOtG7svUiHOP9NDorlwFPqx/kL6vi8+LKFAzCsYQ==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783673902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4/HdArdtBTOLZopTsp6zg00kQq5JIv25vlS+uIDaqh4=;
	b=TNTWjDVFy+Zf/Ca9CaO/FkJR7riFNOpdpOtGlc5oz5YVLCNv4JSMzwNS7/6yOedcoPMgKF
	IQLXcLVG/fy+0kNJv8ZM1WP3Od5U7/Kvey61UeWN2Nd9N3NbVzwJtRtfbgwgZtGGPo0pOb
	PSsXrepTlUWHBsEu/xqEZHhEtxmUxuUgxcpM5YSXhVgmT9PJuf8GUo875bP8Vis3vfwPuy
	YVyHzxrALf2LsGk8h0s5qQpjGsC0PTE026t/x2j4hBPP6U0ZITmEz1J9mdYz7cBbpFFwh0
	860+P1mI8+U2tcfJNMAWRrAkqj4IpZIpCryMqTyyY8NGNIeAco8Cr1eXb5eSWg==
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: qcom,coresight-tpdm: fix bracket
Date: Fri, 10 Jul 2026 10:57:44 +0200
Message-ID: <20260710085744.430340-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9177eea2e3f8d0512d0
X-MBO-RS-META: mxshgzspygbute4md3haj5rceje5cm64
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35019-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:yoshihiro.shimoda.uh@renesas.com,m:manuelebner@mailbox.org,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[manuelebner@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,gmail.com,renesas.com];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mailbox.org:from_mime,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6462D738EBE

Add ')' and fix sentence structure.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 .../bindings/clock/renesas,rcar-usb2-clock-sel.yaml           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
index c84f29f1810f..a14be249fa33 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.yaml
@@ -13,8 +13,8 @@ description: |
   If you connect an external clock to the USB_EXTAL pin only, you should set
   the clock rate to "usb_extal" node only.
   If you connect an oscillator to both the USB_XTAL and USB_EXTAL, this module
-  is not needed because this is default setting. (Of course, you can set the
-  clock rates to both "usb_extal" and "usb_xtal" nodes.
+  is not needed because this is default setting (Of course, you can set the
+  clock rates to both "usb_extal" and "usb_xtal" nodes).
 
   Case 1: An external clock connects to R-Car SoC
     +----------+   +--- R-Car ---------------------+
-- 
2.54.0


