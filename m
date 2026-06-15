Return-Path: <linux-renesas-soc+bounces-34013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1REbAi3oL2pUIwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 13:55:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EDF685DDE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 13:55:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UNtUYkkd;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34013-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8FAD30285D2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 11:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54DC43E5599;
	Mon, 15 Jun 2026 11:55:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611833E557C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 11:55:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524504; cv=none; b=rTJYrxTaf0td7LzhAI3di3Q5UxCqseWc+h7KY/UwDcD5PwhVm62uevawG8RRU442DheG9hM50IXMYdYpkJcuq8DQEUpIlTFUAPQoQKelE+7UmWgrdxKeX7s03mjF9E7PHeGfx9q/eOuINUcUVb0FOrjHqzzNwUdM+RKG38Gk1OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524504; c=relaxed/simple;
	bh=CAqf5MAhtuSR9/qho2Pm3TPruwPFe8x3Q4OewUbagt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UAJ9plxfO3f6RIHpjUJPIH4/3qm76sZBc65L32n6EGrYvdwEx093+I9bQKFIIAGGUUNPalxp5sW6GV2JJzeUALqQGRtuhv3cQ9eLV1DMUT9o3awPu+bbtXqBcw7vlHRDet2wXyLU8JUkP0VNdrvAhkp9K6Sf1YaS+TmhTSl62aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNtUYkkd; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-491609cdd8fso15333015e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 04:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781524501; x=1782129301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGDe5LgTfC/lO3z2JZe0ong7tYBmEptG67RUGytDybc=;
        b=UNtUYkkdlcHdJ3sWzkGnia2hGMJ8HV+yITRMP/4qnFKmrvJWcPbBywEqmPhuWYkZ/M
         CtGD9zNT/HAFBgXTDXwgrsSyPgdMaV8B3h2Biy97HNu+u7ol4YbdD8crq3SYchT9gU7Y
         QqUzqaHoJ1KHeYLv747C1n+7dZYLxnpo51PDPJ1qeR7j+TSjGcVNVtSvnqfoiZ77NoEE
         O5MEIMXltaBfo5RF2Rz2W3KJQJEp3Z1z95QSlBWs3QBd1CZnBre0zBb+0dPs78F9p97R
         HuuNDfnyrjsa1lspmpfCPl7wFTnz7Fm7NrKHhbD8cqBGqyptSy2nInc0naLU5YMv+ZRu
         X64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524501; x=1782129301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SGDe5LgTfC/lO3z2JZe0ong7tYBmEptG67RUGytDybc=;
        b=AWx0uhAvUeV4Q8KSwKgnLYHna3d+2nrhCpqdRv33eFj6qmNERY7Zsz5ULftIz0Y3g0
         Xv4p8y5dfF8zj9PbRDlJiNKDPYshOKd2v6jJSxvzSTF99TWg41PA3jQRop8Zlva3ZTbW
         Njkf0LRO1A2BFj8KVzyYJHHfx5RpgXfJO6vlcNj6DguTS56Gv/H8ZMW29U7CiphtmkMZ
         fgA1GmttK3bDM06uZ1Vn4cZelO4GCmp3gcF95I+mRvHFGeCJQU829TIU3kYXX0c7nk+4
         FPiifC/3QY8sM/Ksdt1sJAFa2ZmmTQPoiX2lNdM/ZqkSnt6gyi5kvlo0YMoKcLgbednU
         5oag==
X-Gm-Message-State: AOJu0Yz6Ius5FDnkFGb11adqKfGlf2kKFwZl8XGxHW8JXNU075jUtWfB
	sGE0MzzkvPu0jaPSt7k33/pAZZNMaKPnm6q5DLqSxisrifugI1azq6uT
X-Gm-Gg: Acq92OHMF09UbFtFzHCYE5gTqw7UlcXPomZw6WR4PVDvB6aBlq/5t6w2c6DIRscCZU/
	hmguLXwMYCE3ALjt23sYi4VMORI4ccwLfyyFE9/HpYbfAGhRpftA4IvCfOfiWZkn9ktbi59GYyv
	96XDVDSqG9+q1hqtaaKQ0ek0M4/Cq0PEBj9deBFqgPft4y05eHXDKS9H+uQVE3QeuaJYsIzvZrb
	96KaW5f4P+YwUTFDbmTIz4IAVto2ySRuHZilEBoFZrQ8P+esjcvFDp2E5/t/7oXyi9g0x623GSD
	cTovT37tfNeYD981GbA8QG5X5Z3RcH4p0YMDVSaItW9nQmudSGxzAH2TlVWQNqbiTmF9FOZozxY
	39O/iIRhlYtX8MK7ekHTxSfGvnRe6hez80Sd7bZqvOm70M2qZ2yaKvcg97KW1wLetvZwe/8O85d
	Yxo1pdXKwuzK+PSurSye9aTKjusYxAQbCo0Ir8cnPdPGvtnYzxHx+wiHMLRZlH9qjdO9kCZtstb
	I78Bhp1YmtsY+QXJCUKv8T/X41TbxSno9fI
X-Received: by 2002:a05:600c:4f94:b0:490:bd66:e522 with SMTP id 5b1f17b1804b1-490ec50075fmr173214955e9.29.1781524500720;
        Mon, 15 Jun 2026 04:55:00 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203dd0b9sm240455485e9.15.2026.06.15.04.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 04:55:00 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/5] arm64: dts: renesas: r9a09g077: Add VSPD and FCPVD nodes
Date: Mon, 15 Jun 2026 12:54:51 +0100
Message-ID: <20260615115455.1412098-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615115455.1412098-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34013-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B2EDF685DDE

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add VSPD and FCPVD nodes to RZ/T2H SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 40494159831d..dda7008acdd9 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -1376,6 +1376,28 @@ sdhi1_vqmmc: vqmmc-regulator {
 				status = "disabled";
 			};
 		};
+
+		fcpvd: fcp@920d0000 {
+			compatible = "renesas,r9a09g077-fcpvd", "renesas,fcpv";
+			reg = <0 0x920d0000 0 0x10000>;
+			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKAH>,
+				 <&cpg CPG_MOD 1204>,
+				 <&cpg CPG_CORE R9A09G077_LCDC_CLKD>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+		};
+
+		vspd: vsp@920e0000 {
+			compatible = "renesas,r9a09g077-vsp2", "renesas,r9a07g044-vsp2";
+			reg = <0 0x920e0000 0 0x8000>;
+			interrupts = <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKAH>,
+				 <&cpg CPG_MOD 1204>,
+				 <&cpg CPG_CORE R9A09G077_LCDC_CLKD>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd>;
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.54.0


