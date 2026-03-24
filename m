Return-Path: <linux-renesas-soc+bounces-30174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNK8Btugwmm3fQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30174-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 15:34:03 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCEB30A36A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 15:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B37433038EA6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Mar 2026 14:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9063FADFB;
	Tue, 24 Mar 2026 14:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mbecJxAu";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="owug9S5k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BA0370D71;
	Tue, 24 Mar 2026 14:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774362840; cv=none; b=hOo+RSMJ/cSnUhnkuv0W3tjiBA4hL1ggVp5jRiJyDvnmMN24MOa02WFITTL7ZAjoev20V4Eu2aTD9jFdg4wdnfE14CEnW2N5puYZXANo1LOj1ocBq2ucaJwym8QYEOZJpe2HkLYCWZWwUlZxo5r30I+BfFFZs4gdSNiwXayMVSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774362840; c=relaxed/simple;
	bh=Sfm03RBcqzghHfJuiqYjZmL9+CWFB0+6xctSSsfbLWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PxsEsarnWPFFnx5mNk51KoZS6LYtziEK59JbDF7MWCXG8F925d3fZ7WJ2xFl2PUZEX97YJXM4bjTAXd/ItXcW2cJNg+SllaJBu1CNaYd6nk6jFLp3ZjAhvLQKY2/TW6NBuXw2Z724fgJ+iboUb5jnhjqhwg9zlqkxKOmNgI0xr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mbecJxAu; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=owug9S5k; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fgCGC2h1Sz9vHX;
	Tue, 24 Mar 2026 15:33:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774362835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mqk3zd0vAxbDi/5mlXVc3BFXCT+o69PX3fU4fgQH7Sw=;
	b=mbecJxAuIMIH3Ch9AtQeri0jWVvMkP8I8dllYEyBXUhy0Mv8eARsRLOMPudWNPBoXr6IsS
	Zpsvm8e9+oWUvWFcGsGnVwyecOZVfqPuR0zjB3Z3Fw8HeUf66kUcykwp3LBVmnm8+vYs8Q
	qV3McdI7wGKb/ira5JZoF2K9AXSxg0JCpR9YqeId+9JIxxR8cHiadeUfGfKN8mcAUxjnL2
	5ZiOdeH4NTiZyvTHkB6zTg52AV61PpAiiQs8g6Nug7ojg1EP8YDtoVHJOGXorrNQ6uQjbF
	nRfbel4nvYYH0GatdWuFxpeuIo/Q/xHLdxtDWrEivgoB2q+n5cYANOVnCc9WhA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774362833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mqk3zd0vAxbDi/5mlXVc3BFXCT+o69PX3fU4fgQH7Sw=;
	b=owug9S5k4ghRHnxaYSYBgR7qRRdEqLHEse0Ha6chP+8nf37arN4MSAxcEDF+UOiL+FxYy8
	DUpS/FlIFPCsUVyZpe3VTNlY8fLX/b1lTDfJawa6gI/GykOyh0LglxGUYCHxxVdY9rrB4c
	dEmIeNOXyc0QSaXn9HHAnuoN5S2LfHSgtcBpnP3GWxY6PpSEkfnFKLChfqom1UTyHn5jPF
	9COwCjWo9piE30x2tk1AowM0NYjSxSdHlciibwOqvuPw6od0ATm/cYaA5DZdrGP12hSFOw
	f326nTKaXTv9MYsRR6Luh73gtLqifQb++S15t3vj5+WH3gORulwYPEhpM6dCPA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	stable@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: sparrow-hawk: Reserve first 128 MiB of DRAM
Date: Tue, 24 Mar 2026 15:33:28 +0100
Message-ID: <20260324143342.17872-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: ff339114a086be2d558
X-MBO-RS-META: bdah8foftyj3w1iz9kz7webosjn7f446
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30174-lists,linux-renesas-soc=lfdr.de,renesas];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,vger.kernel.org,kernel.org,glider.be,gmail.com];
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
	DBL_PROHIBIT(0.00)[2.98.90.0:email,35.195.70.0:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5CCEB30A36A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mark the first 128 MiB of DRAM as reserved. The first 128 MiB of DRAM
may optionally be used by TFA and other firmware for its own purposes,
and in such case, Linux must not use this memory.

On this platform, U-Boot runs in EL3 and starts TFA BL31 and Linux from
a single combined fitImage. U-Boot has full access to all memory in the
0x40000000..0xbfffffff range, as well memory in the memory banks in the
64-bit address ranges, and therefore U-Boot patches this full complete
view of platform memory layout into the DT that is passed to the next
stage.

The next stage is TFA BL31 and then the Linux kernel. The TFA BL31 does
not modify the DT passed from U-Boot to TFA BL31 and then to Linux with
any new reserved-memory {} node to reserve memory areas used by the TFA
BL31 to prevent the next stage from using those areas, which lets Linux
to use all of the available DRAM as described in the DT that was passed
in by U-Boot, including the areas that are newly utilized by TFA BL31.

In case of high DRAM utilization, for example in case of four instances
of "memtester 3900M" running in parallel, unless the memory used by TFA
BL31 is properly reserved, Linux may use and corrupt the memory used by
TFA BL31, which would often lead to system becoming unresponsive.

Until TFA BL31 can properly fill its own reserved-memory node into the
DT, and to assure older versions of TFA BL31 do not cause problems, add
explicitly reserved-memory {} node which prevents Linux from using the
first 128 MiB of DRAM.

Note that TFA BL31 can be adjusted to use different memory areas, this
newly added reserved-memory {} node follows longer-term practice on the
R-Car SoCs where the first 128 MiB of DRAM is reserved for firmware use.
In case user does modify TFA BL31 to use different memory ranges, they
must either use a future version of TFA BL31 which properly patches a
reserved-memory {} node into the DT, or they must adjust the address
ranges of this reserved-memory {} node accordingly.

Fixes: a719915e76f2 ("arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support")
Cc: stable@vger.kernel.org
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
 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index bcf8270a3ed9a..714fcaf8a846e 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -118,6 +118,17 @@ memory@600000000 {
 		reg = <0x6 0x00000000 0x1 0x00000000>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		tfa@40000000 {
+			reg = <0x0 0x40000000 0x0 0x8000000>;
+			no-map;
+		};
+	};
+
 	/* Page 27 / DSI to Display */
 	dp-con {
 		compatible = "dp-connector";
-- 
2.53.0


