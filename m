Return-Path: <linux-renesas-soc+bounces-31476-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPVaF2+/52l6AQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31476-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 20:18:23 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A7E43E970
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 20:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C6420305121B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 18:13:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7E33DA5B5;
	Tue, 21 Apr 2026 18:13:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44D23DA5A5;
	Tue, 21 Apr 2026 18:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776795189; cv=none; b=ALB8b2cJMY7FTh9tCoTi+Rqvfw3Qa1p8nSc+rpujQtK0FeOWp3nWbTkcoPLBs+MwiFIrI7i4Zz1BraCYlH+sjLxj6APnvXvoiQOL2gI+4ouxTN0KCZN7HT4Jgo5Y8M7eOSEjouXrs9FqdYWNhEoSLDeopX5j2rPbfJ2lgVPeMug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776795189; c=relaxed/simple;
	bh=5aEgK8XJ1yvOkRaOquOvl9TQhJ+t78QHDJ+2/j38IY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eMzd77lxhr3Xxt+pGs03H++zUXqh9UW7aR75Dg3l24krJ51JLeBXYr1Rwluxzuj9yXCQFDJDX7dCpb+zB2wr19IFmfp3bYN0jBfWvwhT3uHZzhqIWf18EZs4Wbks75H/GtuY+2oleck56M1QVoj2vZAv1bFdhXvzCrr30jloReQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50330C2BCB4;
	Tue, 21 Apr 2026 18:13:04 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 14/14] arm64: dts: renesas: ironhide: Add CPG/MDLC firmware properties
Date: Tue, 21 Apr 2026 20:11:47 +0200
Message-ID: <258e1985bfa75ca0b3c98bd083628f9b6c7887fc.1776793163.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1776793163.git.geert+renesas@glider.be>
References: <cover.1776793163.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31476-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1e00000000:email,glider.be:mid,glider.be:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A7A7E43E970
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Link the various Clock Pulse Generator (CPG) and Module Controller
(MDLC) device nodes to their SCMI provider.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../boot/dts/renesas/r8a78000-ironhide.dts    | 116 ++++++++++++++++++
 1 file changed, 116 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
index 2fb9557a7eb9dbb7..c6d1a9b5ba433c54 100644
--- a/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
+++ b/arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
@@ -99,6 +99,10 @@ memory@1e00000000 {
 	};
 };
 
+&cpg {
+	firmware = <&scmi>;
+};
+
 &extal_clk {
 	clock-frequency = <16666600>;
 };
@@ -112,6 +116,118 @@ &hscif0 {
 	status = "okay";
 };
 
+&mdlc_aon {
+	firmware = <&scmi>;
+};
+
+&mdlc_cmnn {
+	firmware = <&scmi>;
+};
+
+&mdlc_cmns {
+	firmware = <&scmi>;
+};
+
+&mdlc_ddr0 {
+	firmware = <&scmi>;
+};
+
+&mdlc_ddr1 {
+	firmware = <&scmi>;
+};
+
+&mdlc_ddr2 {
+	firmware = <&scmi>;
+};
+
+&mdlc_ddr3 {
+	firmware = <&scmi>;
+};
+
+&mdlc_ddr4 {
+	firmware = <&scmi>;
+};
+
+&mdlc_ddr5 {
+	firmware = <&scmi>;
+};
+
+&mdlc_ddr6 {
+	firmware = <&scmi>;
+};
+
+&mdlc_ddr7 {
+	firmware = <&scmi>;
+};
+
+&mdlc_dsp {
+	firmware = <&scmi>;
+};
+
+&mdlc_gpc {
+	firmware = <&scmi>;
+};
+
+&mdlc_hscn {
+	firmware = <&scmi>;
+};
+
+&mdlc_hscs {
+	firmware = <&scmi>;
+};
+
+&mdlc_imn {
+	firmware = <&scmi>;
+};
+
+&mdlc_ims {
+	firmware = <&scmi>;
+};
+
+&mdlc_mm {
+	firmware = <&scmi>;
+};
+
+&mdlc_npu0 {
+	firmware = <&scmi>;
+};
+
+&mdlc_npu1 {
+	firmware = <&scmi>;
+};
+
+&mdlc_pere {
+	firmware = <&scmi>;
+};
+
+&mdlc_perw {
+	firmware = <&scmi>;
+};
+
+&mdlc_rt {
+	firmware = <&scmi>;
+};
+
+&mdlc_scp {
+	firmware = <&scmi>;
+};
+
+&mdlc_top {
+	firmware = <&scmi>;
+};
+
+&mdlc_vio {
+	firmware = <&scmi>;
+};
+
+&mdlc_vipn {
+	firmware = <&scmi>;
+};
+
+&mdlc_vips {
+	firmware = <&scmi>;
+};
+
 &mfis_scp {
 	status = "okay";
 };
-- 
2.43.0


