Return-Path: <linux-renesas-soc+bounces-34649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /axbIg5bRmo0RgsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 14:35:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EB32F6F7AE5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 14:35:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=O1cUvoBQ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 311E930B2246
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2026 12:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE5F48BD3B;
	Thu,  2 Jul 2026 12:31:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C22480969
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jul 2026 12:31:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995498; cv=none; b=EM0hAnuqdq+MAvuuEw0h8HteI3BtWdaNBdw6JmJY98dMC8s95GLj6j/Zxakwkvjgs2SKBEwpv00DrWPPj0AJLAVPvVzgzpZwcsOJ/1i1U5Dd6EIfrsFoOXWpq5MHbpnkRLPVO+PM8ZFUx7sJUComI89PALIt0Yx75enqXqDHceg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995498; c=relaxed/simple;
	bh=UzE1TRKwehJAZlNkapkZ7z4b5Yc503wNlGsoLYPnPAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fZSQiKMr6lgsIHcOFgFMWgng5s8SEOdUl69w1/fbDVWzJsIk5NLTMQUjj2kQA49RE/pw4ljdNICeEosuilwMx+w7VYpUQDeTn4N9KX/U3P6x50O1daI8oniWMseQ8X6qS8nUDsjczed86i3JyuXooikDkXMg1lyd7RdabFbyAs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O1cUvoBQ; arc=none smtp.client-ip=209.85.221.48
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47488efcf30so1075582f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Jul 2026 05:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782995489; x=1783600289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PW0IVejhflePMMHQrOFWvkpZ6B6V9/DHbdAKT2t+clM=;
        b=O1cUvoBQ7xh3i6A7eZKns/c68nvlClmPmIOs4i8Ua59MJHnIiHldLR29xbXmLf81y2
         qGpKsxDexBQ75U192gLsOuwCdDvhIzFOMGRdshVzQMKW6Gb4PJvBmwzsDHzkpreKArg3
         5YZ3Wcn/bA6Erj0gpTZq5BJrqDZm7jsbAYG1aB/DUvWJlo3saBgfpYH2OXSo5mh+PQCA
         5sdNSlIFyzBk9kzb92O7rmDAzESbkLGnFf9pN2YyOnLpeNG/Op9VdF2KLr7So4d3ILSX
         y8S3LXg2tOp4mpafuZGgSiQ4SMDstR1k4Ulrm/HXnwjqOU9du/sP7bKOhvuS77lALdAT
         mN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995489; x=1783600289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PW0IVejhflePMMHQrOFWvkpZ6B6V9/DHbdAKT2t+clM=;
        b=rbOvEfQhwprlSLcEl1TqaHA6ySV7h5YpMsIjmyUFT8cwNYxZtUk9fhxa+g1WWigTjm
         dg/9Cc4oIHjKmM3tocGqIAG+aroPOcDY6Voaxi+Zh7SbD7gN2oQGY7tvsL+8u84sfN0g
         KCtzifrTDvirIY53+eJ3cj+V1GSOIQMUu5jdIerGvKf5JiTAkmFkA+57LBEiaY/SSYyo
         AUp+dMlm+I5lVF3i01aThfTieGXfmF0XUFxYtmqVPl6HjHbqM727Syzg0b3jcdUB+9hv
         awEJrvBm8k/yLgb3Xl9aZOBEj43Ev6kMylBGvzfvUljMZgvKiUn5BBRAJr35SPd94xSE
         hndQ==
X-Gm-Message-State: AOJu0YzER0T/YZKyv5FZ4MAlu560Srm6YFVAKZVEwsrtApszzXmJBq+C
	q6iTPqG/2EdpeveCKnoYnVIIHNXuDIjJVBc33PI8z18k1gCzO9wRUSUR
X-Gm-Gg: AfdE7ckJ+u20b8MIgKS7hyd9+25vuknb93S7nq5duThrsBCHdZb9cZFhB3T3M6knklq
	JSAoUsyqOZ+QE9XBmjusLazGhVlFnmlZxWkaa9IKKmcqUoySAhQyAMQmrdaQbKboRl8R3PO92mz
	OMVC0UvkLU/lFXIqzCv30Y+Zy7MqmmnFRnEVyrgxXhRxjeRV5cLzyVm+WVJd6js/2qm+H3kTK+q
	Gj9qOIDOhqerr9bFVjPJVUBVikhVZ3bLyscwzv6UsZlZeJQxcY4H87PYfzRPKLxtvsIesP7kZzA
	F3TbMI5x1LWJ257SidcXH3dX19Hkpx+8hvS93Hm8VwvaammZ21C962/wKplMLV2z63hstS4EfJ8
	FLlDpb0NfGfS9YzhyQbHvERBojb5xMfK3sC0ovbgtBCUq+L2roUDp5ukjgoltWRfCHQQPkjD3oC
	ryfMPMHFqnywIdccXpfLGtsttZ6PGYnKLdEdeGpltxDfikkVasK3OEPoOR1t+MUrKp3vTRuruNn
	UGNFrfIKpQLk0v2EzZXafcX3jIDAJ9hweAOYg==
X-Received: by 2002:a5d:5d82:0:b0:475:f0f0:9ef8 with SMTP id ffacd0b85a97d-4775b930513mr9177821f8f.61.1782995488349;
        Thu, 02 Jul 2026 05:31:28 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7a4b:58b4:175e:8c2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477ddf0f433sm9772923f8f.32.2026.07.02.05.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:31:28 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC v2 4/9] arm64: dts: renesas: r9a09g087: Add system controller child nodes
Date: Thu,  2 Jul 2026 13:31:07 +0100
Message-ID: <20260702123112.161160-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34649-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:magnus.damm@gmail.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,linux-watchdog.org,roeck-us.net,gmail.com,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EB32F6F7AE5

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/N2H SoC contains system controller (SYSC) blocks for low-power
management and access control within the CPG/MSSR address space.

Represent these SYSC blocks as child nodes of the CPG/MSSR controller.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change.
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 1f995d636dc3..165c404dfd36 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -1058,6 +1058,20 @@ cpg: clock-controller@80280000 {
 			#clock-cells = <2>;
 			#reset-cells = <1>;
 			#power-domain-cells = <0>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			sys0: system-controller@80290000 {
+				reg = <0 0x80290000 0 0x10000>;
+				renesas,sys-block = <0>;
+			};
+
+			sys1: system-controller@81290000 {
+				reg = <0 0x81290000 0 0x10000>;
+				renesas,sys-block = <1>;
+			};
 		};
 
 		icu: interrupt-controller@802a0000 {
-- 
2.54.0


