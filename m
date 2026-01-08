Return-Path: <linux-renesas-soc+bounces-26415-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F1FD04439
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 17:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4558F3132AD0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 15:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C518D4F2F9A;
	Thu,  8 Jan 2026 12:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ReWMVGkw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42444F29BA
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 12:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767875680; cv=none; b=hvhqw4lynZsbrQfp4zSfZagXlJmNGANv9by7xHTAOznC+9gWoiHN5CAByczdCr8AvgznjpPe2Bp7pgXOoOCaF6hlCcDtw+rJeTMRGB2rRUHXRqKO4dcH5Eg035tQ4e8+qCujnUuvZDVfALa91cK/M6W1X5Kt+tQw1aAUX4V1FYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767875680; c=relaxed/simple;
	bh=Ioajz0UfzyMamdYJMsWHGOMP6hlG5hxvK7C56mnrUXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DNRlv18QywkoyeRCNM6AQTmtlqk40Q7MtQMbpdSJUjXHYZuqFUOdJH4CwlMlo2bTQfAKcc9lVfztTxAnSI2O5KTj8udH4b1AQ/68duKXMt/Cjl+xPOpOn8tZwtu2waKqaKLItzGtU5yW0o7T9X702yE6w3KVzgfB0B4YJAwrmnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ReWMVGkw; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-b73161849e1so568504866b.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 04:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767875677; x=1768480477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhjDM5J9WtkcsFGiabldnnczAfLvQzWxkQENcLrorPE=;
        b=ReWMVGkwoEm9XZOgNXoONJ2xS4fUzmYZuQ1qMWmGlrcJV/VaMmDmw3IP2natOxh6vy
         iaYVT2M4pJbH3/Aa4hsZkKMLLo83vPX3ePU6GsStgWZVbTA5UjloD2CIZV2LI9+cdMjv
         6V7rfx48q408eH29TBZF1wb1CZ+06QrsJD72/Rhaz2NOlnjZaM+AiF8CYbMaQAj1cDLy
         w5AacnLfWoz1SM8S12bQx1Jj3b15X4h06moyQeZpMhov8Cyy9y5egD9Ersm6ic4tt/3b
         5BKYInqMx+BWCbiozCi69MdxNIC5LR8wWioTuctN/Kn5YYFrhhcZnbaE03rWPuVl0dj6
         qZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767875677; x=1768480477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hhjDM5J9WtkcsFGiabldnnczAfLvQzWxkQENcLrorPE=;
        b=en4xm7DOd+XtrEv8UfhhWqNFjRFuNxONhOoN36U7oIsfRy5ozUYBewnrszphV5u3NQ
         vZuUqFohvgGrfw9pk+gj/fu1+knxpMxwSInJtNJgNFdZpVM+QJKw53iFvXIfR4SUW9Jf
         ETsIT80XeQwCDp0vOU59fZHG6Cv/m8KGLvlHOl9wP5h7UghSt0/fAnaSuoUgSWssKz4w
         iVEYLvRFtt1njHYXNX2uMZqECFWULHi/auSD9AZHqmaEmEgvZgDcqBreYebYPAHEKSKN
         YL6/F6WB3gwX6o/kacnbQ99R5vT1M4VfAlsdD0Z9tBNn1OXJj14yq6ugYV3Off92dhpw
         D9BA==
X-Forwarded-Encrypted: i=1; AJvYcCXt8Xn8tS6FRnzhsHYvZzUePpzjOpsRqQHnMIogDTJjzpl8QEAXRlYcN5EqDwvyXRLe1fOo7f/0itzhW588IC4M1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqvMb2Z2CXJBOJjFlrfgt2rObR7ydzYyvp9K6RHpIXVNo1U6sy
	fgXF4w4mONr6ONBoDPSrHrwRnp30xtU4Eex3+pgua3bBLuvSu+uHYDSV
X-Gm-Gg: AY/fxX7f2I99r6jdLcGYGdN2FVp5QY/8Du4k+IzCvok/5QHDehg/gaB/i+zBkumLOjo
	vbE1kmpOz6HDTMb62ohkvOwmhf1k4U2GA1fAPc3yCmdEVo7e4VMYd8Usxydqm9ZEuzovQAc7ToB
	tpDJYS0kX8FEp3ObTT/RUmOBtTdpf3kgyrLydFZKAoEv+rqCtBz1aALc4dzMFwhAXnAUFZj+QOp
	hF+VgwU9rX/8CK8pRYlzAozt3V4lJyFwDt9iZCCf5cmzXwMx4ifTwKvKv3+mBlWTfeyGUaae7yD
	cwg1I55GV/miUlf8/AiJkFS/SLC2pLMy+56eYqBkpphrmdublbyO8ktaN0OmVK/qQFNFjxYAZoj
	1EpsTGW2xJl7FIb8f+tfCz/8zhRRwIDFwMdnOc8g0LVOKdVzoROJRKDMtO+xWq/6sRMSdq6KB2R
	ectX61AJmwcaCzx7xNvGhU0dcJDnf6OA2MGNs=
X-Google-Smtp-Source: AGHT+IGV94ZZWtEsZ+nNCYBHcBqalCfUktYzxRB3VE3PNmsJCx4jKaDOxGHdlbz9Ti7ZNTrOwN3Mcg==
X-Received: by 2002:a17:907:a4a:b0:b76:f090:777b with SMTP id a640c23a62f3a-b84451dd535mr514444066b.22.1767875676615;
        Thu, 08 Jan 2026 04:34:36 -0800 (PST)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:a172:15fe:21c8:edf5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a56db21sm780412166b.71.2026.01.08.04.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 04:34:36 -0800 (PST)
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
Subject: [PATCH v2 2/2] clk: renesas: rzv2h: Deassert reset on assert timeout
Date: Thu,  8 Jan 2026 12:34:28 +0000
Message-ID: <20260108123433.104464-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108123433.104464-1-biju.das.jz@bp.renesas.com>
References: <20260108123433.104464-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

If the assert() fails due to timeout error, set the reset register bit
back to deasserted state. This change is needed especially for handling
assert error in suspend() callback that expect the device to be in
operational state in case of failure.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
 * Added the variable "mon" in __rzv2h_cpg_assert() and used in
   readl_poll_timeout_atomic() instead of reusing "value".
 * Dropped the assert check in error path and simplified value using xor.
 * Added Rb tag from Geert.
---
 drivers/clk/renesas/rzv2h-cpg.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 3f6299b9fec0..1db92284025e 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -1352,6 +1352,7 @@ static int __rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
 	u32 mask = BIT(priv->resets[id].reset_bit);
 	u8 monbit = priv->resets[id].mon_bit;
 	u32 value = mask << 16;
+	u32 mon;
 	int ret;
 
 	dev_dbg(rcdev->dev, "%s id:%ld offset:0x%x\n",
@@ -1364,10 +1365,10 @@ static int __rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
 	reg = GET_RST_MON_OFFSET(priv->resets[id].mon_index);
 	mask = BIT(monbit);
 
-	ret = readl_poll_timeout_atomic(priv->base + reg, value,
-					assert == !!(value & mask), 10, 200);
-	if (ret && !assert) {
-		value = mask << 16;
+	ret = readl_poll_timeout_atomic(priv->base + reg, mon,
+					assert == !!(mon & mask), 10, 200);
+	if (ret) {
+		value ^= mask;
 		writel(value, priv->base + GET_RST_OFFSET(priv->resets[id].reset_index));
 	}
 
-- 
2.43.0


