Return-Path: <linux-renesas-soc+bounces-31518-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IpeHJdc6WliYAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31518-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 01:41:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0A544BD5C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Apr 2026 01:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77D9930E7E6B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 23:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0283A451E;
	Wed, 22 Apr 2026 23:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="irYhV7O4";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GDAEnF0P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B7933B6E3;
	Wed, 22 Apr 2026 23:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776901092; cv=none; b=hk7oITlzGfkiWqrzf3tPnnmaQBgpUAshjrnsA5E+pdV5dLo/Vl9gk4OPG8Mu2X9p3rtJnrQTllLpfJgtjs0Dvs4T6EKUSsAASh6Gl9hdy1nFeGuyvwPUpAW/tfogpVJOJT2zb+dLAgzKMKYK8Ue1LyqlNYoN+CiUQAG5zSGaf44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776901092; c=relaxed/simple;
	bh=WRrGpG3fFjUQZzX46yD2A4NN0kOM6SETOBIyPVBKLpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iVh8Lv+jg2w1JXiVfrzMyUkE9ymFRJzUJjWJ1QhnWOQa8YKWxbDStjvhaxDHSv87sP6Dgld1J57updp/qh/48aDZ/ywNUYF9hAVzDQanP+oJsiV51PX3HOOf4J/XhSB8U6tWWn3nNF8eveJqYQC2iJw61ZxABTfa/LZ6Xie6wGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=irYhV7O4; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=GDAEnF0P; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g1Fyk4TGLz9tcZ;
	Thu, 23 Apr 2026 01:38:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776901086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mts42kPKVM2lS4X3eG+RjFs2PE9Q46t2mdDzvWeiDWs=;
	b=irYhV7O4QUUgWdQngcXgkuy+aH97xV3KahMrOFN9zmRH3UasVbfRchfe9BTbPEpFVeh5LA
	geHeGdsFvitWECcuGv/aggrTrG/Pi2dxEQNT4KLBu07GXdhN/UtAIKXK/Ig3VESqDyT0Pk
	iBDBl9juvFzCMfRjLXurp7EVPVpHTWrIzaQoPl5QsrfWmqFQi60j6MXWXhJtPilbnjdP2o
	VPwg+X5JZGG8lH8uKSBDiGiDO6LkpAx6/KUj7frCwTnk5DdOlO/VZ86wLIDq2jAuaRditt
	MDE/awcdZCDDXxmCaKh0rQ4BOoKQn4TSAywdDr5JaborPVnjqKkGK/TLQrnY6A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=GDAEnF0P;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776901084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mts42kPKVM2lS4X3eG+RjFs2PE9Q46t2mdDzvWeiDWs=;
	b=GDAEnF0PoGDhsHzd76ld7FlY3F0S3G9ZdI7pAfFgExh4dbAL28t32qyZa7qUK+DCBAhCZK
	KyjAeaTuSxPwett3iNg4feh5rgXxk9GoTg49qUTSSdkPbmxayGoQK7Img/sCsaPYfPhrmo
	pLPKyqoYOHeqWWmj1mFytJq3JQgJk8fiagQWrmP1HMTH2It4uigJgbRBnCDCEez3Yw4n4+
	edlDSuHKgNa+y7C1UjfqDusFrKZRXe3Zx8TdXQTrPgRpzO67OT2xc0bpBm5s1pZtHfZU7G
	jU8X3bd9YioPZVNJriEP+/vNYSfL8JoFpZGL9nk+SVpCabZ9h1Gts35ZFa7sSA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 4/4] ARM: dts: renesas: r8a7740: Describe coresight on R-Mobile A1
Date: Thu, 23 Apr 2026 01:36:30 +0200
Message-ID: <20260422233744.149872-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org>
References: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: kpxmparrpo3rq84zbar47xch76sz94ee
X-MBO-RS-ID: 63da7d8256c29e81fc9
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,baylibre.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31518-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[e6fa1000:email,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,baylibre.com:email,e6fa3000:email,glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.0:email]
X-Rspamd-Queue-Id: CB0A544BD5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describe coresight topology on R-Mobile A1. Extend the current PTM node
with connection funnel, TPIU, ETB and replicator. The coresight on this
hardware is clocked from the ZT/ZTR trace clock.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: No change
V3: No change
---
 arch/arm/boot/dts/renesas/r8a7740.dtsi | 114 ++++++++++++++++++++++++-
 1 file changed, 111 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index f7136db7a2eae..c7056b96ec0b7 100644
--- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
@@ -18,7 +18,7 @@ / {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-		cpu@0 {
+		cpu0: cpu@0 {
 			compatible = "arm,cortex-a9";
 			device_type = "cpu";
 			reg = <0x0>;
@@ -59,9 +59,117 @@ pmu {
 		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
-	ptm {
-		compatible = "arm,coresight-etm3x";
+	replicator {
+		compatible = "arm,coresight-static-replicator";
+		clocks = <&cpg_clocks R8A7740_CLK_ZTR>;
+		clock-names = "atclk";
 		power-domains = <&pd_d4>;
+
+		out-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* replicator output ports */
+			port@0 {
+				reg = <0>;
+
+				replicator_out_port0: endpoint {
+					remote-endpoint = <&tpiu_in_port>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+
+				replicator_out_port1: endpoint {
+					remote-endpoint = <&etb_in_port>;
+				};
+			};
+		};
+
+		in-ports {
+			/* replicator input port */
+			port {
+				replicator_in_port0: endpoint {
+					remote-endpoint = <&funnel_out_port>;
+				};
+			};
+		};
+	};
+
+	etb@e6fa1000 {
+		compatible = "arm,coresight-etb10", "arm,primecell";
+		reg = <0xe6fa1000 0x1000>;
+		clocks = <&cpg_clocks R8A7740_CLK_ZT>, <&cpg_clocks R8A7740_CLK_ZTR>;
+		clock-names = "apb_pclk", "atclk";
+		power-domains = <&pd_d4>;
+
+		in-ports {
+			port {
+				etb_in_port: endpoint {
+					remote-endpoint = <&replicator_out_port1>;
+				};
+			};
+		};
+	};
+
+	tpiu@e6fa3000 {
+		compatible = "arm,coresight-tpiu", "arm,primecell";
+		reg = <0xe6fa3000 0x1000>;
+		clocks = <&cpg_clocks R8A7740_CLK_ZT>, <&cpg_clocks R8A7740_CLK_ZTR>;
+		clock-names = "apb_pclk", "atclk";
+		power-domains = <&pd_d4>;
+
+		in-ports {
+			port {
+				tpiu_in_port: endpoint {
+					remote-endpoint = <&replicator_out_port0>;
+				};
+			};
+		};
+	};
+
+	funnel {
+		compatible = "arm,coresight-static-funnel";
+
+		/* funnel output ports */
+		out-ports {
+			port {
+				funnel_out_port: endpoint {
+					remote-endpoint =
+						<&replicator_in_port0>;
+				};
+			};
+		};
+
+		in-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* funnel input ports */
+			port@0 {
+				reg = <0>;
+				funnel0_in_port0: endpoint {
+					remote-endpoint = <&ptm0_out_port>;
+				};
+			};
+		};
+	};
+
+	ptm@e6fbc000 {
+		compatible = "arm,coresight-etm3x", "arm,primecell";
+		reg = <0xe6fbc000 0x1000>;
+		clocks = <&cpg_clocks R8A7740_CLK_ZT>, <&cpg_clocks R8A7740_CLK_ZTR>;
+		clock-names = "apb_pclk", "atclk";
+		cpu = <&cpu0>;
+		power-domains = <&pd_d4>;
+
+		out-ports {
+			port {
+				ptm0_out_port: endpoint {
+					remote-endpoint = <&funnel0_in_port0>;
+				};
+			};
+		};
 	};
 
 	ceu0: ceu@fe910000 {
-- 
2.53.0


