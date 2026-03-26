Return-Path: <linux-renesas-soc+bounces-30297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PXQMYy1xGn02gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 05:26:52 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A93732F039
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 05:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80EFD3053A62
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 04:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11A539C64E;
	Thu, 26 Mar 2026 04:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="weFuP+PH";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ZnwIR4Fp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD1A2E8DFC;
	Thu, 26 Mar 2026 04:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499068; cv=none; b=sQVAOOjiluFk6NTygzUXbGI51QYW1tLVx+XvhrsXM7LbNdXpJQuIj3y1lAqIEvQOr48f9x7AbWsQsXZKujvTEq0wka3+dIiNH+EIbSLJJ0Xds1EjNutbgjn43Xry7mujtTdWBOlimBYc//JS68PBu4XHSKpNzzn3iRVMtklDLT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499068; c=relaxed/simple;
	bh=XifOdRHfrTQa/PPI9k5s6KHTQM64nGcSzwMRTITYb6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WRDAijAbYFcivF3jZj7tUxIMnRbddLfr0DVjE7F4d57scV4W3GC/TzjzqAcb/QY0eYSn/gfuPN3JEHe89gdsac+tdh2L+Eg3DPxXcJIBb5d4rOF945hYpp0sJ96zJVgVzKyAwINi4L7Q3CPZjMe0J8UJq7FodBn+p6Hv807Wwyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=weFuP+PH; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ZnwIR4Fp; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fh9f101CCz9tSk;
	Thu, 26 Mar 2026 05:24:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774499065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Yjg699K1guUCSil6ihgIitUGHtPaDTqoF3Mueo+/+Q=;
	b=weFuP+PHNSeuZk4Z99AEBsWnE1KLjin1uPeE94rpz85KUqqE670Iz0puCjdh1F5MBTeSnT
	EtMqZk2QgrFzGCfCW+JkuDBjmzt7guXLzW55N+mvmhh8ks6JiF304BFab3Uqok6w3MuXuQ
	9WSnOv6sp3XaT+X2L+6BQuFhZMnTxJC7IH+sDijp9oQYlP6PwCOoRValPXVWv4SAOFjgJw
	quRrZfGAVG4vROOmx6q6VWdzHNaLT+qQuBB1iRDQCsDKUVv3WIjiiUF0fSgtJ2zQQq97IB
	yQqiyO/KswRdyx7pJ2OcsG4u9Bety16d3Dzi5QEgGw5weMoigaEwr8D0HiyCVw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=ZnwIR4Fp;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774499063;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Yjg699K1guUCSil6ihgIitUGHtPaDTqoF3Mueo+/+Q=;
	b=ZnwIR4Fpq1ARCLO51BFuLsW27v5pKmwXW7P22hwspsjS3xvOWtqepXTKgWEodUO4yKt+dw
	d/xbidZ5HL/54LGYcAReumVGIavwypoP0ypjIQJUYnvIp4VhglNyMHvPa5uKtaMMgI4r46
	2y2/DeEfpMJJcKDiGtvSL4mqKGBRbW5SSG4Zn9Y3zcp91hsd94EaWpdzDlllwqMFOgaVlB
	yZR31Em0kcUWne46oX5PTT/E6Jv/79ri3uhGJouxcRc+G0P30H1QycO7dhfB8VKrWYyKSA
	BR3lOWuQuQAFYcFn9mDY27xdolhpv00QcKXEWg4bFTaw58RJvF2iRW75eUMTgQ==
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
Subject: [PATCH 2/4] arm64: dts: renesas: Fix missing cells and reg in Salvator-X panel DTO
Date: Thu, 26 Mar 2026 05:23:59 +0100
Message-ID: <20260326042411.215241-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: iyhmj9nocri5atxhy5ehfp61iek7ad3f
X-MBO-RS-ID: 09bc90222f0c3f5806e
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30297-lists,linux-renesas-soc=lfdr.de,renesas];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.2:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,0.0.0.1:email]
X-Rspamd-Queue-Id: 8A93732F039
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing cells and reg DT property into Salvator-X panel DTO to fix
the following warning:

"
arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso:30.10-34.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@1: node has a unit name, but no reg or ranges property
"

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
 arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso b/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso
index c83a30adc6adf..7807c3f80409a 100644
--- a/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso
+++ b/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dtso
@@ -27,7 +27,12 @@ &lvds0 {
 	status = "okay";
 
 	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		port@1 {
+			reg = <1>;
+
 			lvds0_out: endpoint {
 				remote-endpoint = <&panel_in>;
 			};
-- 
2.53.0


