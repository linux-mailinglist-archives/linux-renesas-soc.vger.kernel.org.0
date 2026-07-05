Return-Path: <linux-renesas-soc+bounces-34733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sm5MOEbOSmpjHwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Jul 2026 23:36:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C96ED70B7B5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Jul 2026 23:36:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=rX0bvdS8;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B36763002F64
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Jul 2026 21:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946C2305678;
	Sun,  5 Jul 2026 21:36:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BE02DC792;
	Sun,  5 Jul 2026 21:36:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783287361; cv=none; b=XdMvQ8bfNem/6cSt+ohA8RjpiEIiESoWW1wNice3EvDORxILO0l//zXUEy9fS+5b0JjuFgJLRfZOXdqIVVc42pdTrK36/l5EJevMcbSQMGewrpp5SIGFtTYiCW+xDA6q0fFP5mZpra6VAyWNA43JVvH79D0rf8rEOmFDwofG4VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783287361; c=relaxed/simple;
	bh=OVQquYq7XAws381xlfx8gj0kNbXXHUcl5HkUotC6DAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dpx4DgbRHDPzhgbhxG31oEJge514efB6ZtIp9pghgnsO4xxqc7P2ttUx+sX9QXoPPsVCdiHc9V1pvgODlocaEVfa/w/HwfSP90nb8n4Ihjhz1WccRu7dZA2FrMci4dP+sfBzQGQyjhLteQeRAlcuLmBk9zeV68kK8SNXmBM7xsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rX0bvdS8; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 931F0C77;
	Sun,  5 Jul 2026 23:35:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783287301;
	bh=OVQquYq7XAws381xlfx8gj0kNbXXHUcl5HkUotC6DAk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rX0bvdS889KGDUcsw0YE7Ggkf0hG17Sw8eBdFq0ZPynnOWk5+OY11AvBw3SFNK8FJ
	 GIL3q18SHAfyta6rUnfbLPH32SRQPOH6vP2EQN5DD60GYvnZiQQgHd62wrr4HlKKMG
	 6n0vVSRew02melLe0VUjUKMgxKjpBTHOB8gk29MY=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/4] [DNI] arm64: dts: renesas: salvator: Add overlay for Dell P1911 VGA display
Date: Mon,  6 Jul 2026 00:35:42 +0300
Message-ID: <20260705213542.28987-5-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34733-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:thuan.nguyen-hong@banvien.com.vn,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:linux-renesas-soc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[banvien.com.vn,linux.intel.com,kernel.org,suse.de,glider.be,gmail.com,intel.com,linaro.org,kwiboo.se,bootlin.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ideasonboard.com:from_mime,ideasonboard.com:email,ideasonboard.com:mid,ideasonboard.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C96ED70B7B5

Add an overlay that hardcodes the EDID of the Dell P1911 VGA display
connector to the VGA port of the Salvator board. This is meant to test
EDID hardcoding and should not be merged upstream.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 ++
 .../dts/renesas/salvator-vga-dell-p1911.dtso  | 21 +++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/salvator-vga-dell-p1911.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 8bf155badd11..f6a6fb959a6d 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -58,6 +58,8 @@ dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-x-panel-aa104xd12.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-xs.dtb
 r8a77965-salvator-xs-panel-aa104xd12-dtbs := r8a77965-salvator-xs.dtb salvator-panel-aa104xd12.dtbo
 dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-xs-panel-aa104xd12.dtb
+r8a77965-salvator-xs-vga-dell-p1911-dtbs := r8a77965-salvator-xs.dtb salvator-vga-dell-p1911.dtbo
+dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-xs-vga-dell-p1911.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a779md-geist.dtb
diff --git a/arch/arm64/boot/dts/renesas/salvator-vga-dell-p1911.dtso b/arch/arm64/boot/dts/renesas/salvator-vga-dell-p1911.dtso
new file mode 100644
index 000000000000..d963f5a65576
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/salvator-vga-dell-p1911.dtso
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device Tree overlay for the Dell P1911 monitor connected to VGA port of a
+ * Salvator-X or Salvator-XS board
+ *
+ * Copyright 2026 Ideas on Board Oy
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/vga} {
+	edid = [00 ff ff ff ff ff ff 00 10 ac 74 a0 55 4b 55 30
+		2b 14 01 03 80 29 1a 78 ee ee 95 a3 54 4c 99 26
+		0f 50 54 bf ef 80 95 00 71 4f 81 80 95 0f 81 00
+		01 01 01 01 01 01 9a 29 a0 d0 51 84 22 30 50 98
+		36 00 98 ff 10 00 00 1c 00 00 00 ff 00 31 57 4b
+		4a 56 30 41 4b 30 55 4b 55 0a 00 00 00 fc 00 44
+		45 4c 4c 20 50 31 39 31 31 0a 20 20 00 00 00 fd
+		00 38 4b 1e 53 0e 00 0a 20 20 20 20 20 20 00 ba];
+};
-- 
Regards,

Laurent Pinchart


