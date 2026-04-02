Return-Path: <linux-renesas-soc+bounces-30792-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNqmL/mbzmnfowYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30792-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:40:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC1B38C0DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Apr 2026 18:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EC543309842F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2026 16:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB933F7892;
	Thu,  2 Apr 2026 16:32:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94B5E3F1665;
	Thu,  2 Apr 2026 16:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147574; cv=none; b=DknPQd6KW582JmPOZZfLM2K2NeZJwJQPCJa0cU3jSy6Z1tmD9G+Kqo9NHYWcSYQru1JpyI1NdQSmPOEs73q4fBVjkCnmVT3C+SIlsEQiD7XRY3vDq59ZSqImXtp2jNXpYPRIBfz+Fk8zhrPUhxPj7qRlcSlEtXjBk2pqDhNdEos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147574; c=relaxed/simple;
	bh=fE1StIyC+9RQx4VOXzJYI+ix8JGlW3+LFC2fh9goOSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uwIKGn/kEEJsVabm3KOhcC6bC4QrW9Vc59wyaTG9tqjNtPEvHqQy0bBU9gYnEC0ejikha4k9mvMoN1RIH/aq50ok7b04fYgPDh7conGIJIN1TqSN1v/UZZ6Yu2efoP1vKg8221k6M+Y8lgwAS0NDY54sF2+asah7Dz9YaJ7yEbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: FIPvZWcwRFaz3ffn2JynIA==
X-CSE-MsgGUID: WmBLw7Q7QyG36IQClNFzqA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Apr 2026 01:32:51 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.38])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9D50F4009A30;
	Fri,  3 Apr 2026 01:32:47 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	john.madieu@gmail.com,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCh v3 6/8] arm64: dts: renesas: rzg3e-smarc-som: Add I2C1 support
Date: Thu,  2 Apr 2026 18:31:24 +0200
Message-ID: <20260402163126.12135-7-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402163126.12135-1-john.madieu.xa@bp.renesas.com>
References: <20260402163126.12135-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.14 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-30792-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,bp.renesas.com,gmail.com,vger.kernel.org];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.962];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 6EC1B38C0DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add and enable I2C1 controller support with pin configuration.
The I2C1 bus is routed to the carrier board and used for peripherals
such as the audio codec.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v3: No changes
v2: No changes

 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 89428c804efb..493f6783d583 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -32,6 +32,7 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
+		i2c1 = &i2c1;
 		i2c2 = &i2c2;
 		mmc0 = &sdhi0;
 		mmc2 = &sdhi2;
@@ -118,6 +119,12 @@ &gpu {
 	mali-supply = <&reg_vdd0p8v_others>;
 };
 
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
@@ -255,6 +262,11 @@ ctrl {
 		};
 	};
 
+	i2c1_pins: i2c1 {
+		pinmux = <RZG3E_PORT_PINMUX(3, 2, 1)>, /* SCL1 */
+			 <RZG3E_PORT_PINMUX(3, 3, 1)>; /* SDA1 */
+	};
+
 	i2c2_pins: i2c {
 		pinmux = <RZG3E_PORT_PINMUX(3, 4, 1)>, /* SCL2 */
 			 <RZG3E_PORT_PINMUX(3, 5, 1)>; /* SDA2 */
-- 
2.25.1


