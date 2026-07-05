Return-Path: <linux-renesas-soc+bounces-34729-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bXMxBUDOSmpcHwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34729-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Jul 2026 23:36:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FDF70B7A0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 05 Jul 2026 23:35:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=X814jWdJ;
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34729-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34729-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 234453006B40
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  5 Jul 2026 21:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065792DFA3A;
	Sun,  5 Jul 2026 21:35:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159AF78C9C;
	Sun,  5 Jul 2026 21:35:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783287355; cv=none; b=hQGvYUj8MA6yT+mVd3UYozlC7raXbNtfKnWZAxbDqx9CWElzx6lsEmB7XocLXy04yZrAwPcFzpq+kq9msyCNwncrp2knypjRobfYjwaRdw8hsnjIatQSS8jxoq0sLD2avP4j5zJHaOB8qYrP+rV5shokypbgwA7Niytmqn5fmcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783287355; c=relaxed/simple;
	bh=9Ys2LdiWk6aqBxpSgpVgyMXpSZ8BTD7IUi+YmaWkyIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GBZYaI4aDOZ59rPv6xODdFFh4kmJ8DaZKnkl3EbNFxooAx/4lN8tzTAe9Cu5eNidzzQiHJLpg9ZIvmb7uBKCNZJ+agxCmK71Gjix9s4FOByz5WY1SLXtjeUfKA/k9eAOfYkb3MlovT+4spAFpQqqlH0oEoBGlgYDRsxWVdDNpBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=X814jWdJ; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F2E034;
	Sun,  5 Jul 2026 23:34:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783287296;
	bh=9Ys2LdiWk6aqBxpSgpVgyMXpSZ8BTD7IUi+YmaWkyIs=;
	h=From:To:Cc:Subject:Date:From;
	b=X814jWdJhUUpE63XxgX8y9vpQAxAHYEzk67c00sJ6GPe693n0yAU5c7vleLKRJADx
	 UTRc9VB8GyJDXhBnrKo0aH0BlNd3RSxC7KVjTaQCpbqeYk2v6dm50yu/D2XX3tfrmJ
	 IEO0lF/7Xb1ZscX5GLSsvE73mfSolG0xkxhu/pyY=
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
Subject: [PATCH 0/4] drm: bridge: display-connector: Support hardcoding EDID for VGA
Date: Mon,  6 Jul 2026 00:35:38 +0300
Message-ID: <20260705213542.28987-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.54.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34729-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:from_mime,ideasonboard.com:dkim,ideasonboard.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 59FDF70B7A0

Hello,

In a normal use case, the VGA DDC lines are used to read EDID from the
display. On some systems where the connector is internal to the device
and the VGA display is always present, the DDC lines may not be
connected, making display detection and EDID retrieval impossible.

This patch series adds the ability to hardcode EDID in the device tree
for VGA connectors on such systems. Patch 1/4 extends the vga-connector
DT bindings with an "edid" property. Patch 2/4 is a drive-by fix for a
resource leak in the display-connector driver, and patch 3/4 implements
support for the "edid" property in the driver.

I have tested this on a Renesas Salvator-XS M3N development board. The
board has an external VGA connector, but does not conenct the DDC lines,
exhibiting the problem that this series addresses. Patch 4/4
demonstrates how to set EDID in the device tree, for the VGA monitor I
used in my test environment. It is not meant to be merged as the display
is not internal to the device in this case.

Laurent Pinchart (4):
  dt-bindings: display: vga-connector: Allow hardcoding EDID
  drm/bridge: display-connector: Fix I2C adapter resource leak
  drm/bridge: display-connector: Support hardcoded EDID for VGA
    connectors
  [DNI] arm64: dts: renesas: salvator: Add overlay for Dell P1911 VGA
    display

 .../display/connector/vga-connector.yaml      | 15 +++++++
 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 .../dts/renesas/salvator-vga-dell-p1911.dtso  | 21 ++++++++++
 drivers/gpu/drm/bridge/display-connector.c    | 42 ++++++++++++++++---
 4 files changed, 75 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/salvator-vga-dell-p1911.dtso


base-commit: 44d19b8a7548aa25cbc6ebd5f27e958f7142c36b
-- 
Regards,

Laurent Pinchart


