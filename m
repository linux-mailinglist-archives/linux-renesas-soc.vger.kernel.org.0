Return-Path: <linux-renesas-soc+bounces-34696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id W4Y5KqvUSGpXuQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:38:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC25C7074C2
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 04 Jul 2026 11:38:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=s9gEeHmF;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34696-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D52A9304DE98
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2026 09:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C0D3AA4F9;
	Sat,  4 Jul 2026 09:34:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB333A961A
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jul 2026 09:34:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783157686; cv=none; b=NsN8JMSUAu2uVmwIrL0824/S8q/iWDgxZR3QWAcdhV8LS9UwRyQPKgN3rXtXyeqwm91DuGAdVJxhlS4gJnPGEB/NTSSGkOUQ1L9NxepUGTO3t2nWlMKm3i9KTAKrBSu2hwFJ1ejrT0XD3G4HRbi13wqHTxDvtUmDt1xtbgvoB4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783157686; c=relaxed/simple;
	bh=E5Nsrst8R+oWlSFlU1iIAepfqVJ1BQpt7J6US+qhGWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZorW1P4j/AfLl39zz++4XQD2HruPmTV0PAWGqCZrVakjHBypWGNlrqpfU+3yvtIG8kG9OyecPbSkkfCJbnqpYsAup+F49MJn4qtC6lAB8oeZuv9rvTpRvpV3PO1yC1dHArFPkyyg1DVH+qqIf/uVWi9e+DVT2HpXseocE7EkzMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s9gEeHmF; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b27c7451so22201645e9.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Jul 2026 02:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783157683; x=1783762483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkmJo/lAo5m4HMZk5yNl+7qepl+QkxWKO01Rkm0bkTk=;
        b=s9gEeHmFfhgDlyt0mVXV2zsFXSdfRvetztgdMHASJSckR7gfi+rgdcWYu9Yz2TCOoB
         DXPmsAGAg6GsusM2XLL1aSR9yre3w3kK+gzIAUXZEXtaU26TiaPzAJvjD3c9LP/ZRucz
         iIljEHEK2/k1oTkqsuw2JNTHdq77VD8vXaLCIjvQalAAqA0BbslWykUQra28sg/BbSuM
         8WRZ3bo/I52U/YvuEp1oNVQIz1PHkjDDKg0JmWhoV6rh/4FZ8Y3JPZie5U+p3lq3iVeU
         DjfFOaMbNJkaplI+7pJZmP7ZVPTiknLVw8UcaBoHNk2274Usi0KcAJLgmxEsCxEV7+Vr
         gVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783157683; x=1783762483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qkmJo/lAo5m4HMZk5yNl+7qepl+QkxWKO01Rkm0bkTk=;
        b=n51svh1Y4FYene4+PgPvbLF8m6zU9+EdQ3tGGxsMdFvidaoMMew5SwnQ2CiIhBDR2y
         eL5n3r0PlFWKhsGFjbOlsuO10ZqbSxli+8qj8uONVrRwAw9syBMF/5c9l7aw5NMq3PS/
         XPyXRMkrhQLB8gZK71NBUOq3pUkgASOs2NNjsdp0HkBiqMhVkz/HbsTO6RG0sw5uGICj
         bIHJm3J1RJjJ2NwhRmgWncAEfmNUj6YSdYSvUM96qqpw+emnA5pKoky8OnICbTPI6inB
         Xw+4Fx/WqspbThCcSRA13iSHJz2RGTwtpcoPlEmFMTv4D3ABw61D6uYmOQ1aBFNdY80u
         4mYw==
X-Forwarded-Encrypted: i=1; AFNElJ+JmKvwQUJ7KpL8Vn/WCTOwaUTg63gPbjNBp++G9Tfd1J6XJlVC/oSYqPgWGpDX7at3JkaITEhs6zPbU8926Yo6bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzikAgDNXYOOTHulG8JrZQpvplKcsRguYRUJpryvAXsL/8kkSak
	lG1geDsOAbrnS0T1J3xUZIl1BOE6lT738KwlXj51RI4kbLZMlQlYXbEQ
X-Gm-Gg: AfdE7ck1xLmYJT3pDg3KiZxx2bEUHWDP87pd/j0najteW5nACCIKpeNL5oen6Ga373w
	Y0m12r/ZlipuxnFMgEBldnyDWTSJ7Q8p9oQFlx9PWtiJQyUZ4UBYdgObUiOdZL8bQTndb29mRVw
	Ko1Zl3HbLfpJClWgKpdlFhIZME/iXfhd4OIUgTV/ctbcle21kTObPzgMYV9wn+f4+jIl71Loi/s
	VIRwUjre9SfzfNkqvlhff5J4AY71jPhD8KuwemG6Xv9r9g1vTLFL2qFx4qUrlhpTZdyFshmG3yP
	gdh+AWxECgMyhrLyqKGW8U7lnPUwNFqcMh/VAl+R8+xEFpyJbSwolOgNADb1LI8VKM1tgfP0j6h
	A5WhapVk3XoSdeIiaPpIxvKyuTSb9v53K7tpK0PEhxr/djQEj+ySGOMSVWoFyQQyuI5ZsruT79h
	ZUiRPOwyGy7JeRWusxW93q
X-Received: by 2002:a05:600c:8a1a:10b0:493:d117:18a8 with SMTP id 5b1f17b1804b1-493d149a38amr16345305e9.9.1783157682608;
        Sat, 04 Jul 2026 02:34:42 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8c5b:5b11:f6a5:9bc9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm153180235e9.10.2026.07.04.02.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 02:34:42 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 11/16] arm64: dts: renesas: r9a08g046: Add fcpvd node
Date: Sat,  4 Jul 2026 10:34:21 +0100
Message-ID: <20260704093433.273672-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34696-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC25C7074C2

From: Biju Das <biju.das.jz@bp.renesas.com>

Add fcpvd node to RZ/G3L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 85e409ac8d5c..eb5604b84287 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -696,6 +696,17 @@ ssi3: ssi@100e4c00 {
 			status = "disabled";
 		};
 
+		fcpvd: fcp@10880000 {
+			compatible = "renesas,r9a08g046-fcpvd", "renesas,fcpv";
+			reg = <0 0x10880000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_LCDC_CLK_A>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_P>,
+				 <&cpg CPG_MOD R9A08G046_LCDC_CLK_D>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg R9A08G046_LCDC_RESET_N>;
+			power-domains = <&cpg>;
+		};
+
 		gpu: gpu@108b0000 {
 			compatible = "renesas,r9a08g046-mali",
 				     "arm,mali-bifrost";
-- 
2.43.0


