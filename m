Return-Path: <linux-renesas-soc+bounces-30299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJrlNhq1xGn02gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30299-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 05:24:58 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF4632EFE5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 05:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 50D0C30356EA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 04:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A72D39E190;
	Thu, 26 Mar 2026 04:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Y4cXG5Wd";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="NL3QQmtK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C377339D6CA;
	Thu, 26 Mar 2026 04:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499071; cv=none; b=VX5f69hE1kf3DV+8FlNmojK5ur0Fx5UVJ/1CjzRtAKT/ShDuoMLt+bKWS5+MucRw78OVPUSCTLPN9+yi35dLK23p2/HMjoyo6yVwfFyY6pvRfYaxB/hEk0sVZlhOUdQMau3vfEXyP0GGxH6iJwcBxMMM0T4FF6I1Z2/skkGH4yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499071; c=relaxed/simple;
	bh=k6eshyG7cjlqn60jqa+2U6VClbc6SN/pqHd3IFFKzmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pnpt6eNn9Yxnk1HslmboYd/bvT6enLqv7fpmReQihF708SiQwYxHPjP5KHc0E9ffzw9sE1aamVQ4uI1VhJhL0gl8O3DIzbDi1Cb8cdZ2pxmFAifCApCJnpfLxmGgi2pnyzolYv5K7OW2S9ZTlKF+c90maEw0YuYVvSY89AF1NK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Y4cXG5Wd; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=NL3QQmtK; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fh9f30Yg0z9tWG;
	Thu, 26 Mar 2026 05:24:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774499067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kbx8jFx3M2eb7AnI2uKjWeapl9oX7jNVDSMqkUhIy8c=;
	b=Y4cXG5WdSj3nlnFqwgwGbwc9FL3Aq9l3X3oHWWMrknCphjcJGqS8/xswft6uvpVKLgvdvm
	IcO7ExHffo/Mmy0f62ojB8RjCPmAPpRqzDJ76r3pRszt+OwDdx0IMC4mMa3YqKt2VUZD0a
	wPXk4US7KOiMvvVxqxzSZX3rBuBqdRgWFOdOP9m1ibWbHAL6kfE5dw21/pcFfy/zZK4Ksg
	5qwVxlbLe1WdPE2Tx3QTWzv725Yv089ZaGKRd/oDq9oxAHhfiHpFurEBAdcIQckhmjQTGi
	MiDEwIzCQJoTggInmZWSN3FUTEqx34hUf3wbuBgKBO+TB+XKjKoGSAmeuGkMUA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=NL3QQmtK;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774499065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kbx8jFx3M2eb7AnI2uKjWeapl9oX7jNVDSMqkUhIy8c=;
	b=NL3QQmtKlM4pCvSy0WxilKLQN3uGHRhFlxQThpHHOBitOqqiD42bwn7iXNuNKexZBLsehK
	z42YtrGxIZYCHm87bHneWDDM7mFyRBD8RPnd42q7zjYhsFe6XaZqaRUJBpV47AsAjTlRoh
	Uf7AxjHdvuliL08Ti51nXkRH1msWtgNyCO2ijU81+MGo68Hf5v/UapfLH1bZqF5u9DEf7w
	uHTtu8EGCp1GVVpy2BO3cpFxM5fRc4GXea3kwWO0bap6y1P3OvvqJsUVSp3/hNYEr1bA9g
	Ww6Ws5PWdaoYaYW7qIzpXN8jnxU6+W3Ky15rRdVPGhcOFwaWY6QltFRyPgrtcw==
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
Subject: [PATCH 3/4] arm64: dts: renesas: rzg2l-smarc: Fix missing cells and reg into CSI2 subnode
Date: Thu, 26 Mar 2026 05:24:00 +0100
Message-ID: <20260326042411.215241-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e661c0dd2b16a8b0406
X-MBO-RS-META: dgjao7ukhtr53uru7qohhyj68ndc73jf
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30299-lists,linux-renesas-soc=lfdr.de,renesas];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 7DF4632EFE5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing cells and reg DT property into CSI2 subnode to fix
the following warning:

"
arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi:49.10-55.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property
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
 arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi b/arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi
index 4d2b0655859ab..3feffa4f16a9a 100644
--- a/arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi
+++ b/arch/arm64/boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi
@@ -46,7 +46,12 @@ &csi2 {
 	status = "okay";
 
 	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		port@0 {
+			reg = <0>;
+
 			csi2_in: endpoint {
 				clock-lanes = <0>;
 				data-lanes = <1 2>;
-- 
2.53.0


