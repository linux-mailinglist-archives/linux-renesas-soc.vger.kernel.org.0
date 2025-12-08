Return-Path: <linux-renesas-soc+bounces-25646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1E1CACD5A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 11:15:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5966A30443F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 10:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E01A248896;
	Mon,  8 Dec 2025 10:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnUs/ipr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02AE30FC10
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Dec 2025 10:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765188849; cv=none; b=Fv5TYR4zSMp0BUeteWybSwOx4gp+5no7D4C7P2RhFqA4WMH+lamZRsnXX4icygbbd9f0XEL61bvwu+qR0lMGeWP91ce+qTCEHm8Kuz5ckyHdivjSzlWHE9ZblIK/tnRbgM9mmiRhS4A3QGlgtXy09x6j4u9O+ibRGHwfuHR+upI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765188849; c=relaxed/simple;
	bh=Nsu5QdW7cglXKeNt1XJm+blUp6u8z3o6UblL9XQIWVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OJLl5KeBrbqaVn1OvTWR1Fqp3Tb/+fbyBjB6+vkjZ+tHMkZbnIOtaO+GyI6hvfNPWys9HhJ5/VZ2XoRxbVJ7VLJvwz5BLxw8dqFkPP/wiV4u/a6aTqdrm44xjZZIXD1M6GTlV6yCKC68CeIPU81fxmfJKCSeOTueFD6w6WL/nMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnUs/ipr; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6492e7925d2so1147821a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Dec 2025 02:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765188840; x=1765793640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2LtzNmN/fAQqQtdMXR9bXRDrRVttkDlCELa4V9ktnFs=;
        b=bnUs/iprrqfAIz6yDZTJT4oHwevh8hO4OSt9qH6FLMRR/B6vWeC8AYjTxP18s3gBQ/
         LspnWiehkLY7UerOKl51FXwaPCfTKPMjyPjJGsVSJik9LcWQ828YHpp83ONpwHopvWzU
         y32yqXXNoeHGa4rBgHkc+n5HVtZ/nyphNtW+aS0EadDIAiE+z2LduGmnXwhawwqZSajj
         al8MnAWYs0GdWZv9x9cFVY82in7hvTxn9Ur95XXSJdPPGj0fz3cGTbja5cSv5xfi/AAn
         clMAA/mbSGV7GNpJA5Hg7MMNXTiSIL6yC5KhxjzdneuZtRyVjQXU+DvCW8DNZFABt9aH
         AywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765188840; x=1765793640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2LtzNmN/fAQqQtdMXR9bXRDrRVttkDlCELa4V9ktnFs=;
        b=UaUFA7+f84fjvB8tgnVevh6fPxrVhrSe/PtsUFu2lUr97zoafd2c4mdpi4gXgQ/k6D
         st+WAdV3COB1NTCUDnqmIpBv5YquS8julWV3pu45o/Xf73XhkXu3YEoRXraboGEYQGh3
         NZlS9rvtrBlE0YGvANy8omMxetGFsCxThKIDzOYV0enLCl/f5VWK3o37AdxLTWVM1Kv0
         NXIcIOCKFct+snDQBTG5I49LnJoFctiEzm2HIPzcZmGOo5U3ntpfYb8E/j9U9ipHvZDr
         6N+z88N7MSn8Iiyq6Pc7QWesuDW+z8Sr/p4noL1fHFnE8nVL+1sKoIh6YZCGTO38EKhu
         Sy8w==
X-Forwarded-Encrypted: i=1; AJvYcCXbkssQKGXpnqT80MlmD8E2mgKgsnebu6p/DctEIVbWLBxGugBDcnlVmRaDrWK0Xl0JELDjEGx7fTN79SfR2G/dLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRgh4Pvvw6SdHBViW92Pl068O6nmzl6K0ikzH6aiNrsV9Lu8SP
	y/Z55Ot3ouSPd+uPiYLvyNylHbD69wvbzCXNTp35Vv1E4HMOATCTcrnZ
X-Gm-Gg: ASbGncumjbPhHvRs6kfOPeHmyZ7MrBRiPfaOHw32Lg0Cjc9JGl8+S3fjKlv5Vy8K/+C
	LXzePmOKTpHBV9R4Of/T92ywKYK4JKNzPg/XHwZQresZTR0bxuXtK76Q1Z02CnzV8TM6Bb5sP8R
	OLcNN9e10vKUF5Uo5EpmW4lNJ78R2ivjMMiUqZlUdn81YxWJw/S76KQkSFRwxCgtIgj8apT7s4F
	X6B19j1RdNgf9hj6fwjzeUnJX7cfcn5XyQ4Tz4UaZQlIj4JrCy9ZY7hlNzkJ11mLVAND2SsRAA7
	i7EMFIptgnuY0iu4ZIUux/L2ozakpbvHOqbHGtFot4cLtroEz7NSrKhrJb6uHFcEdU8zdJFlwxM
	y77bBcetxrpb7mKIXhu+UVuS0o0sFBemtdB/s/fQZYTSsN2dBkq6+Poa1ogBZ4AgyKG5U7OD4Ts
	Tuthtt+bmBwnPQsobpCqIl/OTgfS2XsvgUuE80bWMMDiPNjcxOuagPExk5rTvMQB2rsXglc+cif
	hInSZ3zJlSyH5hg
X-Google-Smtp-Source: AGHT+IEa7L5JbkY2oQmOETZ5gNSOiGp1Oc0yNIY/+pJO97qukyoubXHoVtql9Ceh0rQQXsT/WdPkAA==
X-Received: by 2002:a05:6402:27c6:b0:640:9e7f:675c with SMTP id 4fb4d7f45d1cf-64919c1fd89mr5914938a12.10.1765188840426;
        Mon, 08 Dec 2025 02:14:00 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b413b590sm10547083a12.35.2025.12.08.02.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 02:14:00 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 2/2] clk: renesas: rzv2h: Deassert reset on assert timeout
Date: Mon,  8 Dec 2025 10:13:34 +0000
Message-ID: <20251208101356.101379-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251208101356.101379-1-biju.das.jz@bp.renesas.com>
References: <20251208101356.101379-1-biju.das.jz@bp.renesas.com>
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
---
 drivers/clk/renesas/rzv2h-cpg.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 3f6299b9fec0..c0ee2dcc858c 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -1366,8 +1366,11 @@ static int __rzv2h_cpg_assert(struct reset_controller_dev *rcdev,
 
 	ret = readl_poll_timeout_atomic(priv->base + reg, value,
 					assert == !!(value & mask), 10, 200);
-	if (ret && !assert) {
+	if (ret) {
 		value = mask << 16;
+		if (assert)
+			value |= mask;
+
 		writel(value, priv->base + GET_RST_OFFSET(priv->resets[id].reset_index));
 	}
 
-- 
2.43.0


