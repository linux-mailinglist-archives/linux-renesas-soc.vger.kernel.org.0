Return-Path: <linux-renesas-soc+bounces-30516-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFceB+YWx2mWSgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30516-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 00:46:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BED134C862
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 00:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 91B5D3046D99
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 23:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34383392C5A;
	Fri, 27 Mar 2026 23:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="dokoWRF0";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="T1a2DREo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AA839901C;
	Fri, 27 Mar 2026 23:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654988; cv=none; b=sW/lcVdWBrsOZdXXr3OpwOfR4Jk/B1bnuxdl3aZsrW0xtmFnSmfV8wVxcYqNtAk38lf/+rPBCLkSjxm8i5+XUhrCUDY3MxKGqZrOg3L1hy4l0+hWKMAlm1VyvWg5jUbLk9vq+PI9L7zbIWh6TRaddK9y7S1WuqksjggW5ssqteY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654988; c=relaxed/simple;
	bh=h9v6GBgjsMHYHuEMYWb26dM93O2Lgilq1c339P90k5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BnqJgf1XUruwUcYHcjcWozMVMnKRELTdhJY8AEfgkfuHd4ubG8IPPLM6J60j5KWUwezUmBzRlDoOv1dbjmmfjT82Qx+OJtRuD6z8C2BGtMou9sFsKccjPa4cGAWu85pCEGvw/Gty/RGAaNe5eI0SFOOEahxyNruFWJJTXGjQk1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=dokoWRF0; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=T1a2DREo; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4fjHJL1tfJz9tKt;
	Sat, 28 Mar 2026 00:42:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QUBCuiFj2jQH/vG/0JiEgrYYd4IkCs61DMQaiB7hWBs=;
	b=dokoWRF0T3TZnLtg6qSMh3TdwrLgiI93tpllmobUTrJP7HGOZA/4OjQzVZ55kh/FkEL0yZ
	7m/KSwp2H3HfopxWj6tf3aWYv90kLWlDJOHbvglqTSzUXXhl7k6XNRLh6i5ixw59zNWJJb
	HTHGNvTot9XVqHsofupYyNTTqzTNKbF6wmGNRDpDiWZQkSEQ6EVeuoLuXXC3iRhdASLqXd
	dgueUbdfitgBwaI9zc3Z3fIO8D7Tmn0PuejEWnCY4yX/rnH7QWeqVCVhFeEZBDP1fo59D2
	dX1EV15ACYsjsb47Y/y3O2hLBhvS+0Tu7NqYIKQ1lz4T6LtgwaSL0ISUtP5lxA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=T1a2DREo;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1774654977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QUBCuiFj2jQH/vG/0JiEgrYYd4IkCs61DMQaiB7hWBs=;
	b=T1a2DREohxpg08+jjeGqcNCp+e/p5hCvN7+22waD8Bbpn8itdbbReysoMpQ5nKPAQAyHl/
	NOShw5NFta/w3cTiOfGDi1pZX7FWzqO+7iMDnSkey3IBQZiwMUJ7JKlNBmVNokdRpyhf01
	acw4pan5WN2T+LhWl/+AtmUGzVjR/Fh/sXaR15o1YT6CwWJyoaYZ4dn8RzTluJ0s+Qs8QO
	y6BsQVyNYEHfRmq06w/WhzsoumbKIb1zIC8LSMTXtL1ILgZRC9tC+K40IMDEPoMGJPA2ph
	BQQ7V4YsgVKL50so0Rv1lAXg6FOG1p8SP7omnhCSQNmdtmrwtOPgq7L/l3AiEQ==
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
Subject: [PATCH 2/6] ARM: dts: renesas: r8a7779: Add missing unit to bus node
Date: Sat, 28 Mar 2026 00:42:07 +0100
Message-ID: <20260327234244.91707-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: b2c540faec03bcd9413
X-MBO-RS-META: qq75x81bpe9i1tbfcrxtzq5qhnm9a5jq
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,glider.be,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30516-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 1BED134C862
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing unit to bus node to fix the following DTC warning:
"
arch/arm/boot/dts/renesas/r8a7779.dtsi:707.12-712.4: Warning (unit_address_vs_reg): /bus: node has a reg or ranges property, but no unit name
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
 arch/arm/boot/dts/renesas/r8a7779.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7779.dtsi b/arch/arm/boot/dts/renesas/r8a7779.dtsi
index e437c22f452db..9e8a7e190c89a 100644
--- a/arch/arm/boot/dts/renesas/r8a7779.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7779.dtsi
@@ -704,7 +704,7 @@ R8A7779_CLK_MMC1 R8A7779_CLK_MMC0
 		};
 	};
 
-	lbsc: bus {
+	lbsc: bus@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.53.0


