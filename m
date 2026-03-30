Return-Path: <linux-renesas-soc+bounces-30588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHKiCXt7ymnk9AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 15:32:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B5CF035C03C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 15:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55F37307A55C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 13:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F1093D646A;
	Mon, 30 Mar 2026 13:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oaDO0iDv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4123D5234
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 13:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774877038; cv=none; b=I12gC/skBbc8Y0qFE3YQAQtLIEllSidYAVQHqNE3mnES2dHJPjXyvsxsODVSybL/ss8YH53ubLiH31D+ppRNJCiKF4RjZLrjivzB6PYyYTgAWXljXjrM07eWHHlScg6YzweoZn7MB+modFUO3+ZTLs4OQrRGUXuX0GnFhzXi8H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774877038; c=relaxed/simple;
	bh=22Wj3PL59w7WQlU7uZqeJvafxD1ELLda18RL46qv9Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=leovdAbW3c2Qjh1xM98nfOe23ynsHvqFOXe3Vk9CeuXUDtyVD2AS9PJFt/0DtivnfpExZN0aS60qMqgzrj+9qcfQwodn+c/VwU8bujotCofkL5sSEQJci7FX9IXaS38ttShlcfM0GwhP20w9OHZdNnjG5lX72n+xSSECLN151Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oaDO0iDv; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d03db7f87so376102f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 06:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774877035; x=1775481835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAOuvFX8TFjsxOubezK4NKoeU7tZyw6BQVfZ55MuGkE=;
        b=oaDO0iDvaIzCnfbJyjR+Mudvg9z8nUmFuV+gRm56II1bDbgOesodg5VrQqY4oE7fb5
         xT8yir8peBSmYZ5i/Me8nLUceaDL9C7KzeUNFKCCD8JhenXL2qB21PRSPAa3ZWoSMrT4
         GDdZA0L4eHh4w28a6J2HVgLftXsvmhvL8O7P0qOD85xem+4NZe9/euwvbdICIY+gxiku
         8MFDnx5zijYy7XDSqAsD4VhycR86IzfZrXS/W4q4oZXIMFe1oZyhjyv0rhnR8ti9ueWV
         8Rcp5eehSZAxTalm+t5Kk8HEAsGdB8b4EgfPC6xFrx1jKvnijhxWxBKBqCbe+zBivE4b
         M3Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774877035; x=1775481835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZAOuvFX8TFjsxOubezK4NKoeU7tZyw6BQVfZ55MuGkE=;
        b=obdQk1qZ0e9CzNo2Y/43Gtwwh5a5oekSwgZuOZebU+I3PdMlDuAjl5oKcO+jLwkpsy
         r/9IR+rxJ2G+5A3EkUaSv1cOv3Rjw42t38JxyJP0/o9q9cl4asDvEN/ShbM3y0COMsaL
         USYQx3p35F9izQp0qTNgK9zmv3zItulFWEjan6Ug7sHaFmcE/WqoYZ3O8NVqtv65Jwq0
         LWlIYh7d7h2sCqi3sw+X9QhNfj7nECHrcXbPpnabtVnozTklXMhexpdLqY7VCoIUbNzb
         lquGNJ7wX6vFy1Oj2fYNFRLHmksAaeyV7uXWy8VPJ1iyzQZehQZBuUJBoDNWR5Wf0EIX
         bFpg==
X-Forwarded-Encrypted: i=1; AJvYcCWDw8WpPonUMmqKtmoTIxcKlzoD5AobzUMKqQGqK58VbPgLs0D8SA0sA6wBZbP7GejjlScZxVbJQbLmHIU0el5k8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKjjT1GRCTVstYK6dbBGgMFyUzy16zgheZGr2m04yxlqhdSgAw
	R6v9j6QztRXMfG4GnKuXnf9Psr/cUgwOIBq0wWvHfj8kdn9Nqot3Z2IJ
X-Gm-Gg: ATEYQzy23RsUlhiTb8kIUT+lpxcM+vAwL/v5RTvxzT7+oyP4realvWQLETzMRZP6hBG
	8FbpOw2wkSEweRfgLNUq6fVLaVPQ/MYFRi5GlZ2BWTR2fofnJOeBNvNX9hKg435EBArG9TserNk
	O4IJFDztWj7PhC1uDQ04rD2B9pINAbySHieuwRpnsHxEc/xu3NDrIH8aAFZAq+h/m8HV9/kSMwF
	zU1dizupr2BmNmu+Z3TIazWqhxIQuBvXJ8lWBh0pbaF31fvBcQuwBia/zo/mKnoY/cxaxXGOkx6
	nn/1YUw4XEWD8Vsxw8OlK/nMqy+mopycqn1JrLRqmasU0fTXji0VG7bsK3qEHMfyrmIqapIVpME
	xlpvGk9dJcQU2IURU1+T3RNTc1crft2Es8g6jX/ClXQqKjKWnYeYrDdsSePnIgaOOi4AtIXcx2n
	Wnlfyu2GXqYsQ5hrIc0EqWxHBbpizcLQ==
X-Received: by 2002:a05:6000:188e:b0:43c:ffee:ee9b with SMTP id ffacd0b85a97d-43cffeef22emr5747643f8f.15.1774877034878;
        Mon, 30 Mar 2026 06:23:54 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:e60:2c8a:54bb:d692])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e2628sm20825906f8f.6.2026.03.30.06.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 06:23:54 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 5/5] clk: renesas: r9a08g046: Add I2C clocks/reset
Date: Mon, 30 Mar 2026 14:23:42 +0100
Message-ID: <20260330132349.149391-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-30588-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B5CF035C03C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

Add I2C{0..3} clock and reset entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g046-cpg.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g046-cpg.c b/drivers/clk/renesas/r9a08g046-cpg.c
index 13c158bb9215..a962b5ec6977 100644
--- a/drivers/clk/renesas/r9a08g046-cpg.c
+++ b/drivers/clk/renesas/r9a08g046-cpg.c
@@ -267,6 +267,14 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
 	DEF_COUPLED("eth1_rx_i_rmii",
 				R9A08G046_ETH1_CLK_RX_I_RMII, R9A08G046_CLK_ETHRX11, 0x57c, 13,
 					MSTOP(BUS_PERI_COM, BIT(3))),
+	DEF_MOD("i2c0_pclk",		R9A08G046_I2C0_PCLK, R9A08G046_CLK_P0, 0x580, 0,
+					MSTOP(BUS_MCPU2, BIT(10))),
+	DEF_MOD("i2c1_pclk",		R9A08G046_I2C1_PCLK, R9A08G046_CLK_P0, 0x580, 1,
+					MSTOP(BUS_MCPU2, BIT(11))),
+	DEF_MOD("i2c2_pclk",		R9A08G046_I2C2_PCLK, R9A08G046_CLK_P0, 0x580, 2,
+					MSTOP(BUS_MCPU2, BIT(12))),
+	DEF_MOD("i2c3_pclk",		R9A08G046_I2C3_PCLK, R9A08G046_CLK_P0, 0x580, 3,
+					MSTOP(BUS_MCPU2, BIT(13))),
 	DEF_MOD("scif0_clk_pck",	R9A08G046_SCIF0_CLK_PCK, R9A08G046_CLK_P0, 0x584, 0,
 					MSTOP(BUS_MCPU2, BIT(1))),
 	DEF_MOD("scif1_clk_pck",	R9A08G046_SCIF1_CLK_PCK, R9A08G046_CLK_P0, 0x584, 1,
@@ -292,6 +300,10 @@ static const struct rzg2l_reset r9a08g046_resets[] = {
 	DEF_RST(R9A08G046_WDT0_PRESETN, 0x848, 0),
 	DEF_RST(R9A08G046_ETH0_ARESET_N, 0x87c, 0),
 	DEF_RST(R9A08G046_ETH1_ARESET_N, 0x87c, 1),
+	DEF_RST(R9A08G046_I2C0_MRST, 0x880, 0),
+	DEF_RST(R9A08G046_I2C1_MRST, 0x880, 1),
+	DEF_RST(R9A08G046_I2C2_MRST, 0x880, 2),
+	DEF_RST(R9A08G046_I2C3_MRST, 0x880, 3),
 	DEF_RST(R9A08G046_SCIF0_RST_SYSTEM_N, 0x884, 0),
 	DEF_RST(R9A08G046_SCIF1_RST_SYSTEM_N, 0x884, 1),
 	DEF_RST(R9A08G046_SCIF2_RST_SYSTEM_N, 0x884, 2),
-- 
2.43.0


