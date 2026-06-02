Return-Path: <linux-renesas-soc+bounces-33459-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ybByFvBCH2pBjQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33459-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 22:54:08 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E7D631EA4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 22:54:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Ox3M+Ii6;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33459-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33459-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 68A2B30C4AB7
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 20:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFB823905E6;
	Tue,  2 Jun 2026 20:47:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87390388E43
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 20:47:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433233; cv=none; b=g4c4jU7Vm7OWNhicURhG9WRKPt+0jOcxhLy4pEY2pjvWASKoCgInkQQzy80t39FQFShtqPrqx2EwqN6xaljmZI5gifHvu085kdF7tnP9K5dA5gn1V8YawP+TZoEz/1WkQNUHjqe0mkBmRUUxs4DDZT1fASnch3a1rOqQD8jKWy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433233; c=relaxed/simple;
	bh=SOr6O4xSaXM4KfjlKy4Evd16KT99st90FshSs3gjETs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nW3dahlqqY6qv/fgcdHwltFRauRwADH99sscxRe/ISNYzPoXnRkugouqp+e1cr6psUIz/tXXctJfKSzQ5WpMTcCqGHiE3fgFiv1VO/LZ9Hkxolg468lZbA94tScEJBW4+zu/u5zSM44H3XL+FpQHSyffCn0fxXwXJXJmPW+O1dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ox3M+Ii6; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso20264925e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 13:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780433231; x=1781038031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZki+ZcGxGctaJUCQBxlsDna0NvBdpTmq8z0j3InJ6M=;
        b=Ox3M+Ii6xRYbAY04aiuii4xDiBuiCdbZa6bxcE/IINy0t1AGUtesKjNw63UZ7RXHJG
         h63FLD6Ra1JJyvtyvJBSlAxpSw+QIfx/gwhA01d/lqpAgnGqmvDc8BZMOtY5L43md1UA
         J0grRG7NoirOIN5HJtIepFnvZgwFjK54zevfZJGIYHspX2WsyTITdWf8v/yU8X7CXCQw
         eCCA7SVPsUg8oqYmdDMntxm7F78YAmVKkCkgWOdYUYHm505l8ds3hHJh9ReUnwwXFPBe
         Jo2xwtr106JapyUAQqwokbCgYUEDfhuLfG7bRUO99+Ez71PJxyhtjmB1GNVWxzG658+o
         azzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780433231; x=1781038031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HZki+ZcGxGctaJUCQBxlsDna0NvBdpTmq8z0j3InJ6M=;
        b=Wm0BXXUuOwxED+PMy3ZWCy9EnJmbnSRZDGrhkKYXGUCP5rt7awyIYgX+PR7CiJTE/7
         sIHEcWAXkqoi6pKgPRuaz5+jLBWWW3djsrzODYpKkKW0HpobpUYV/zEaCC/tl2u1gBBI
         c38O4pDXXASkhJuOjclXW6OFp21d6J0OmRNzsE26IHLcJ67Ww6EuDwsOumsNarLeYFV2
         HWXW22hLluyl0wvKfXMNOZ6fDm5sZTxV5ZNVXoKIUFME1OlaEvy5GNjCbbGyCJsDLdse
         XzadhOt6/e6IQBsJrBBTB593Q7xxvDNw4DtETMX6x2eG4dl68okHA1w3ZzNtGRRZTaGs
         FWzA==
X-Forwarded-Encrypted: i=1; AFNElJ92n4kITjCZ3J9TPYB68wQGF5HBs1CtMzSUYJZrvq3U8O5+Er1QdMazTyPm9Bk2UhrFMdCFIiRARSpbqcv0tNCWvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE0iX3vE8nlA1WQWljZ9bocTabxMH3SC81SF2MwBdGF8rQaTqx
	8GOBTkNh0NJtuwajXex4JEEYpJkzIl6u1964NK0jpZUHVdurZUF81mBD
X-Gm-Gg: Acq92OEAnFzUF559mNEYMf+yNJrK0FIYdtso9V67FdbYj39oucQCDW8QX6WmLFOBKMJ
	7yBAHNd/UXlEtytRO2m0nDo9E6wa9Urn+yRFyzd/vwhQhZbiIEKcHWn3jMm4+IbYkPLTIh5we98
	+nJqHQVcahSTuM+NnIctyiKWz7EtVsgpUxam5zgBzIDEctG0kLNg6serpDXLv4fEiNNQQqcqwvI
	tr8UMCCUcjDLYsde/lqVmNg373jT9kwAJUKFMRpOo9SYL51a4+i7Sf3ygqAVV038JKJCCrF1qKT
	gwa/KQneCjBw4rdZ4ORPqE6tgGRdaBfaezm7gRAjPeFE8Yd/K+W5isSW8oa9xWEzF0qBbAjqYjR
	hiPpXOffaV1n4X5IVChebY3IBq77Sbjbw0XxSayucryddwg1xGqfH1oQdoqaWmpkRazgPNVAWOC
	lFpo4+Qa+qieXBaip52Dvek7o+XrnZEkkzul6g/ezxPxtoO8m5N353zqZ+eFg9x8olzON8J/kQ9
	76qU8j5DmOZK0onx6dUvkli8YJpNm5IOdYrTnYL7duTFe9g5VoAerrh
X-Received: by 2002:a05:600c:888b:b0:48a:7aad:4425 with SMTP id 5b1f17b1804b1-490b5ea10c9mr4863735e9.3.1780433231084;
        Tue, 02 Jun 2026 13:47:11 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:5ef:9913:4a77:3bcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351d40sm1957833f8f.26.2026.06.02.13.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 13:47:10 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable PCIe
Date: Tue,  2 Jun 2026 21:47:07 +0100
Message-ID: <20260602204707.1920839-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602204707.1920839-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260602204707.1920839-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33459-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9E7D631EA4

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the PCIE1 slot which is connected to PCIe0 channel.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 3c1ddacc0944..a8447703ab71 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -384,6 +384,18 @@ &ostm7 {
 	status = "okay";
 };
 
+&pcie0 {
+	pinctrl-0 = <&pcie0_pins>;
+	pinctrl-names = "default";
+	num-lanes = <4>;
+	status = "okay";
+};
+
+&pcie_port0 {
+	clocks = <&versa3 5>;
+	clock-names = "ref";
+};
+
 &pinctrl {
 	eth0_pins: eth0 {
 		pins = "ET0_TXC_TXCLK";
@@ -430,6 +442,12 @@ i2c8_pins: i2c8 {
 			 <RZV2H_PORT_PINMUX(0, 7, 1)>; /* I2C8_SCL */
 	};
 
+	pcie0_pins: pcie {
+		pins = "PCIE0_RSTOUTB";
+		slew-rate = <0>;
+		renesas,output-impedance = <2>;
+	};
+
 	scif_pins: scif {
 		pins = "SCIF_TXD", "SCIF_RXD";
 		renesas,output-impedance = <1>;
-- 
2.54.0


