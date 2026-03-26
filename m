Return-Path: <linux-renesas-soc+bounces-30300-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDcBNKO1xGn02gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30300-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 05:27:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EFF32F066
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 05:27:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 357C6303C121
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 04:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC56B39D6C3;
	Thu, 26 Mar 2026 04:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BrjI85Uc";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="AFRLrZta"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8560D391501;
	Thu, 26 Mar 2026 04:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499080; cv=none; b=GK3jR+90nA41bhpi+zdikMX0w9GbemnvHoInub62UtSURcd1aZxvf/03Fi5ZVtlhgrOSlWYbg57IhBwgrqV+nIFFBlJWy5R9Uw/fDe1uJoB0JnKWReEXx5sWL0H5XasWdQBVhjg4IqgznSZaBP8tpjmwngeh1zXg5TZZLIUvpuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499080; c=relaxed/simple;
	bh=AJdJjCQipZ/3vXI3YxYY1ujWiRdZlx2miqftSqttx6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rnev1rvn316X+Hd1mAF/f3oMln2Fn/qy43l8KfaMVD9tbKm5MiAySzu5FiJAq7eBp9ZVXmefEbLrrItrWOY21hPFN1JhxSKy5YiFxQPEkumcghlYZaohvA+rHeDZlt+2B7CU9uImZkv83tzcEp04clN0EHm7pOe8jQ12xLpBTu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BrjI85Uc; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AFRLrZta; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fh9f60H5pz9v01;
	Thu, 26 Mar 2026 05:24:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774499070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mjJ47iz69kffMqjrmrab+FRigiZP+JvFCki4MhCjrAw=;
	b=BrjI85Uca/IG5hHM/bNDRYDl7BITyI5UD2zAIVB1CD6FOowWah1bDPkkfnaHJgkIenvU0Y
	CDCMppcq/vPmHRxRF8V8pcCM03mA7S4YgGpT+DSdfjMyYkQ8JyOWLGk1H8qLMtH8jwRfo0
	1Df+w6Ybz+KNvv77TSgrinr3L/vxwp9ovmIQig4fpQiPt1fpcDZnoyE7EJoG8g0pNKKn9c
	0IL4Jp/OJkFvdzUDUMyxOl++8eistHyzM+MQw8syVkXVKijm7JZ4v16Mqmavj56x65h/xb
	3zKteFV5JwgCBWPAU/z2P5PdzO/VgRjqzB1MFSjMYdDDjlujba1De87R/hku0g==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774499068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mjJ47iz69kffMqjrmrab+FRigiZP+JvFCki4MhCjrAw=;
	b=AFRLrZtadueE6nkaAXnOCPfuKtPNXnYDuoYrUydn1G1D4F3lHp5sUBMDf30oa5obA4TpuG
	ERzyRzPwYmPk/DFk4QRC4+ZInFG9tQtkgFKvjuMCvU3Fn5UFXZ2YKTL7zu72QaZFIUt6hy
	4OJMopvqNNdQi5VK5DiHr82a8z9KNb82ydORFnlBH7WC0mLdb0WnfQu8X0kjzlRLMgkPCf
	xIZfa3crTftonRaxWKfjwWJ67f/DB2Vx45pwqYqqLavcOD+zH54ka3rmA6ezuzg1yBp0RU
	2Ih9T+txicJmuNWyOSKpTg02ArMxMCHLEaENdSgq/lxUZqgBDLpf4O9hFxo8nw==
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
Subject: [PATCH 4/4] arm64: dts: renesas: rzg2l-smarc: Fix missing cells and reg into DU subnode
Date: Thu, 26 Mar 2026 05:24:01 +0100
Message-ID: <20260326042411.215241-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
References: <20260326042411.215241-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 8195f495464a61884c3
X-MBO-RS-META: 4os6sgow5fx197emqeseecb1h9nh57cc
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30300-lists,linux-renesas-soc=lfdr.de,renesas];
	DKIM_TRACE(0.00)[mailbox.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.1:email,glider.be:email,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D4EFF32F066
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing cells and reg DT property into DU subnode to fix
the following warning:

"
arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi:29.10-33.5: Warning (unit_address_vs_reg): /fragment@1/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property
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
 arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi b/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
index 36707576030d4..f5412578ee65f 100644
--- a/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
+++ b/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
@@ -26,7 +26,12 @@ &du {
 	status = "okay";
 
 	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		port@0 {
+			reg = <0>;
+
 			du_out_rgb: endpoint {
 				remote-endpoint = <&adv7513_in>;
 			};
-- 
2.53.0


