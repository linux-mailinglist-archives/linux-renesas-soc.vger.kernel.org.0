Return-Path: <linux-renesas-soc+bounces-34047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dw5tMU8gMGrXOQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 17:54:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A90B687F3B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 17:54:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=r1ih7L1+;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CD7BB3104277
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jun 2026 15:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8968D40B6F8;
	Mon, 15 Jun 2026 15:48:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F19C409628
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 15:48:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538515; cv=none; b=lYkuZY9H+QdZP5hF0yDx9h7+TCv0RE1U4ZiYn/ZslROEAhfybzTQJ0OJ5RsnkKSy7noVIJyF+Bdr8LluiwvUJ6Fs5i1ypgDK1VjCwob0VbmGKL0mkWUeE9+QMZxM/L38RpCHYRvNqP/iRJp3uUrj2sDgaf6l4YZqvi8VJqyiGQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538515; c=relaxed/simple;
	bh=KjAInLhi0v3E646PjFPpNWMeDadi9UVfbjjl8YmdQKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZRXfrc7qnBVewOL5zUeng+WM/v+065YmgC56LFU3XO0x4TZ3d3jPsYzV6098fxuXjOcGWlteVcM/BU7UGHKW8wnnL96ps7lg5gatnaGmlk+SfwimAO0ElcdkgXq8HjZTp9PWGmcG7/T1PIsoaTDb7XpUOo6OrAlvI8o1jVJNhGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r1ih7L1+; arc=none smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45eee266c6cso3143455f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jun 2026 08:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781538512; x=1782143312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJYCTCnUV7LmgErz0K2H3aKpxxKl/1uFoMPWmbigq6I=;
        b=r1ih7L1+GmodUONyenUhHVQMd5IVlMTTHLKcChGYJlFfZYgEOe+j/2dknG3CbWpj/+
         Q3xuYh8w3FUFXXF88cdQ11L8nVutEf+gQN0QMHMrzKQJnmsLdIVsiAkFfYMtx3f5QVxy
         ChRbKCtXsYnh7efJMz0vW/+LY3MPKQsgvM98TeuICuQcItQWl/D0Mu+cLEXXsHlWVehy
         ogfbP5lnIYnUvKRSHzMeAD6Y/lwHvIRPiF0fGeUhlHeeL5ZCKzoV7/HNagISEIbpcKSi
         AN2ZF14tEy2SzhZ3DNeWJu7e1frbA+kb/dsQuE4T44rW5kpwDEEDRgjMRByLQb+bsE5L
         rbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781538512; x=1782143312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KJYCTCnUV7LmgErz0K2H3aKpxxKl/1uFoMPWmbigq6I=;
        b=rc+BtJNwWhzcIluyBHk0shhGK8UZWJA8UXUEYDSBakpe0k/0wI6QoD/dPxwapzI8f3
         +RokL+Eb0zaDScra1VU4YoSRH2eKL94iwr/OW/9TdgpeUxBqh91Pidd9bnUec1Lh6gka
         IDrdLvOEFBikXuzYBDbWzxWMvkuYg5iNzIoMZTrL28NDKlJjnEXgNz+hkvTRNvC35+FC
         MbnbXcvGL4dIo8iPEyZxpdsmsHi42YhLJWyAkizaMm67zdfojzhCVKjGNSeyzqnCYaP4
         DIUiaZweEqn9jeWGGMX2vZi/GhTBI4NQpmQxKAFVpntOzPRWVupNlKNKeGBZlwcHjkKx
         N/HA==
X-Forwarded-Encrypted: i=1; AFNElJ+q2IPSaZGLeNE7TxoK1T/KMe9PhmH0IkMvfofOsGZyTRhH5T/WafU90fccRKgpkjhrLQ1dTxmU+vG1nZGPRsb8tQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw56J2T16WBNJmkHznosLOl+k4aAkuq9/MvX/KK+6hdn+7nerVO
	a4deGvM1Kd6omZaEe6Lq3Kp/EFkU8yV0S9//Jq+rN2ijoSEhPUFRPjAa
X-Gm-Gg: Acq92OFeUoVDhX5p2k5Tq+PUIQsnbnGoI9QbVq7riSw+41w2msGCKDQjMB00qVkj55Q
	x/rn2leMxu17X8vW+xa7RRVWo0y1Db98+iqpMbnl+A4VD/4Ojobqcd0zyIYA4YyY7kj07XdBAEN
	D+OYOOE88fYHFMOqJw96sPg1YdKaWdwm8pchZSYN1MJ6P0dPfPVdnQb5bsHEt8IsoDdhPiAjg5F
	VGVU7WIdK6fnVAcVmnRz4v6hbXYMJV7YwMctNCsLo8Vuqwu2UUO+1LAxvOcnKu0rESv+zj3axq/
	AGQBtPWlwHEAw9fSvmf39NODxsQH6E400AhP42oNq4n5OTvFQOQRfcIkXLN1kkbUc/G4ViXGa/X
	oZq9YvCp+lmLv+zGOjU9GPoxj6Egnrmc8txOoqMzb9YyfBxqMZhXwvAujcs/MfboyKnPc3PNC7B
	EYAQ7AL60nXOlO4CrXSoj56FF2Zv51FnoO+wCoW4IimYS3+p0whOs/bTwdnTdD67Fa2OsY0iZng
	5RQTwVXV6d3skrjTCK2nMauxHmmcwLadKLY
X-Received: by 2002:a05:600c:2d87:b0:490:e18f:d0db with SMTP id 5b1f17b1804b1-49220104dc1mr93190035e9.26.1781538511922;
        Mon, 15 Jun 2026 08:48:31 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1e4:992f:3ad2:4f2b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm36010995f8f.1.2026.06.15.08.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 08:48:31 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 12/12] rtc: rzn1: Add support for Renesas RZ/T2H and RZ/N2H SoCs
Date: Mon, 15 Jun 2026 16:48:05 +0100
Message-ID: <20260615154805.1619693-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34047-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:wsa+renesas@sang-engineering.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.csengg@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3A90B687F3B

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a new compatible string "renesas,r9a09g077-rtc" to the OF match table
to support the RTC IP variant found on the RZ/T2H and RZ/N2H SoCs.

These newer SoCs integrate a closely related variant of the RZ/N1 RTC IP.
The RZ/T2H and RZ/N2H variants lack the RTCA0SUBU and RTCA0TCR  registers,
those registers are not accessed or used when operating under the
rzn1_rtc_ops_scmp configurations, making the current infrastructure
compatible.

The RZ/T2H RTC variant also supports a 1 Hz output signal on the
RTCAT1HZ pin, controlled by the RTCA0CTL1[RTCA01HZE] bit. This bit is
marked as reserved in the RZ/N1 hardware manual, making RZ/T2H a
distinct RTC variant despite its overall compatibility with the RZ/N1
implementation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-rzn1.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 9f9cf9882fc4..dfff8dc8c321 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -597,6 +597,7 @@ static int rzn1_rtc_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(rzn1_rtc_pm_ops, rzn1_rtc_suspend, rzn1_rtc_resume);
 
 static const struct of_device_id rzn1_rtc_of_match[] = {
+	{ .compatible	= "renesas,r9a09g077-rtc" },
 	{ .compatible	= "renesas,rzn1-rtc" },
 	{},
 };
-- 
2.54.0


