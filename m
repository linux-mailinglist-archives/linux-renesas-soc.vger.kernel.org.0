Return-Path: <linux-renesas-soc+bounces-33719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XK5hNmZtJ2oawgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 03:33:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C67A65BA58
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 03:33:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mXSzfxzJ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 531DF30297B0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 01:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66B8733B6D9;
	Tue,  9 Jun 2026 01:31:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B3E32C937
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 01:31:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780968701; cv=none; b=QOp51hlcVVWH4mjd2nrgde5hudyqPG5cGpaQYb/vuNu6tGG1IQVoxSU+eaxiA9OFJn8D/+VUe/R6FYRqgM6JOMxibo0/Unfl/eVd+uj1g6q2oYN639gFxfbiX9aFFxiJXH6xBywVZlBhxqd7rKX72K2JMfCi84yT8c1Wqp9j9Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780968701; c=relaxed/simple;
	bh=fTbdpRCyfFLaOtbYVQuXBTeh5e2Blvm9k0H83//ETNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NwTVp5fvLmR3MWBPwdAq3Z58YYv4CIdArNDAYd+KHU+WkO3pxwBRFPuE3w0uz82ilZ8lOz+Yxg89d+cOeHWWvUTYcILjh+vbEWF7jEDwC7eF6lyZL5JkbncA7FaBSMhvDyTFXH4KFMrFtE8qky5JkzTmr/sZPQnrhfHX+zWlvmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXSzfxzJ; arc=none smtp.client-ip=209.85.214.174
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0c35980fdso50315705ad.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jun 2026 18:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780968695; x=1781573495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwW5NMDZEbB74SUEwI6Q2ihuAyLFKsCwR8MKDpGPFxY=;
        b=mXSzfxzJJUjTC+Ud3E+iBxBseQjM7nv8ALErbgpnmHbTPtAExDLGzTnrm/a5mDTdUs
         vt2VQegvXoyuVvUIW9bWaIAnxCfi3encV2vLZyOq5CspH1avxUPUppQnSP0a5dxUFSiK
         zZJpc6RKM+O6L5t/lCE3S5XJr7FRx4+Hy6JS1Y9n1Gl7Ww7lAkslYXdDZfJev93ChxyN
         SvUsabMmC0+YTzbKt+NKCIiaqlApEtw/CjDb1P/66qteQkWrmjzc3h3OUNZ7SHyn1bQW
         xXa5LKrFu0xVx93mBfZBVE6Xu9aaUZtNgDBlfjWD52H2lW9FhAivjsZ4RumUo+mWtTeQ
         w9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780968695; x=1781573495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JwW5NMDZEbB74SUEwI6Q2ihuAyLFKsCwR8MKDpGPFxY=;
        b=YDPeKBBanR/7LibucXpToGSZpC+nv7L/+tq6CfJRRpl+48QyHYAfSvrXEd0fvxQJSd
         Zxy1qost2mrEb6qGnPo085cmQLnmyfgEiFR+hS5Kop34s4tCEia7hRbj1VNe0L3en2Yd
         fcCejo0fBpBKfLB06qfaAyMnGFypVuuvkKizQt6x5EdJJCb/BzI5gRcLoR/5130RNOvT
         GscRFNUJ8+p4FhlO0hV3vnhsPE5mcI39qQgxHWeMILOLvm6JTpPGCExuRtLB7ztHXNbY
         M+sdnBfxR7sjiG05opeNKT2q85Z07Hfn9MPJIvsyxxgJQZ8y8f4MitzHnvA7gQwqc8k6
         QJ1g==
X-Forwarded-Encrypted: i=1; AFNElJ9Q0zEdxVeUl71q8IX2M94hd9GIkqUY/UaWAt3iHnoT+wKoZ6c9w1O8CWXx88wnKcmgD2x5YEYyhZ3l9PseZvoqgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ2unNzHE4rfjv7Ckwp6IChnB1MN+GG94E/lUVdQg2bbJ6MqOO
	395lRUNNYnr28ovgi4oUMngYAmwitpcTxSuby7JQ9kKaZPMjJBk4E4nx
X-Gm-Gg: Acq92OEhsTKteReUXyD77wvPxA5WW4qODHnufxY3Lg+V04I4z+WVmckBVGuJdJlGhwu
	7BPoz0GzdPrgQMMzm2ZUTCB1dL5WOpYIp+ry85n8oTuWwklN1UUfylrfqfjNq97XexHW+XfCelb
	9xBgxr5pcVZx6Ua1NzgSpbtkmHGRd+9hDr9OMygCgkzStyo4ttV0w70lNz0idZu1gicLQ+JSLVI
	7HUPd204tvfaz+bXWtoYhxsA2xasH8y+BQX4lRBDI1zgv0FoxUTcb0qaRk0tOulzYEKD/4nKNHt
	0fWbTGl7FXjrfKwrU44Fr/huZaFeutH1RcoUt12VhB5JO5uNKfQkZi0DCYMqfxZCP0+CcTahNcD
	GGP7YTPItPK1WQQrREEEXfghb2X4SnwYPn1tsRI7NUbO9BipAmBs91DvNCDIZFaepXwiYWN4Kei
	sk4cVTAuj+fDDuyFPx6U6fP5XbcFJ/RQo9N6yfNCl6ELtnjz7r4GtNR+/JDmJzRNCHmcRE
X-Received: by 2002:a17:902:fc46:b0:2bf:2188:a90f with SMTP id d9443c01a7336-2c1e85c5ae8mr196563145ad.32.1780968695349;
        Mon, 08 Jun 2026 18:31:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e627sm198765335ad.52.2026.06.08.18.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:31:35 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v5 02/11] ARM: dts: renesas: r8a7740: Add clocks for FSI
Date: Tue,  9 Jun 2026 08:30:58 +0700
Message-ID: <20260609013107.5995-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609013107.5995-1-phucduc.bui@gmail.com>
References: <20260609013107.5995-1-phucduc.bui@gmail.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-33719-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:geert+renesas@glider.be,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucduc.bui@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,vger.kernel.org];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3C67A65BA58

From: bui duc phuc <phucduc.bui@gmail.com>

Add the SPU bus clock, icka/b functional clocks, and xcka/b external
clock inputs to the FSI device node.
This prepares for subsequent driver changes that explicitly manage the
SPU clock required for FSI register access on the r8a7740.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 arch/arm/boot/dts/renesas/r8a7740.dtsi | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7740.dtsi b/arch/arm/boot/dts/renesas/r8a7740.dtsi
index d13ab86c3ab4..6f9d9bbfd159 100644
--- a/arch/arm/boot/dts/renesas/r8a7740.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7740.dtsi
@@ -393,7 +393,11 @@ sh_fsi2: sound@fe1f0000 {
 		compatible = "renesas,fsi2-r8a7740", "renesas,sh_fsi2";
 		reg = <0xfe1f0000 0x400>;
 		interrupts = <GIC_SPI 9 0x4>;
-		clocks = <&mstp3_clks R8A7740_CLK_FSI>;
+		clocks = <&mstp3_clks R8A7740_CLK_FSI>, <&spu_clk>,
+			<&fsia_clk>, <&fsib_clk>, <&fsiack_clk>,
+			<&fsibck_clk>;
+		clock-names = "fck", "spu", "icka", "ickb", "xcka",
+				"xckb";
 		power-domains = <&pd_a4mp>;
 		status = "disabled";
 	};
@@ -614,6 +618,12 @@ vou_clk: vou@e6150088 {
 				 <0>;
 			#clock-cells = <0>;
 		};
+		fsib_clk: fsib@e6150090 {
+			compatible = "renesas,r8a7740-div6-clock", "renesas,cpg-div6-clock";
+			reg = <0xe6150090 4>;
+			clocks = <&pllc1_div2_clk>, <&fsibck_clk>, <0>, <0>;
+			#clock-cells = <0>;
+		};
 		stpro_clk: stpro@e615009c {
 			compatible = "renesas,r8a7740-div6-clock", "renesas,cpg-div6-clock";
 			reg = <0xe615009c 4>;
-- 
2.43.0


