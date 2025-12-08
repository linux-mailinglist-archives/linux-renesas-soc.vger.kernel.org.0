Return-Path: <linux-renesas-soc+bounces-25645-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A529CACD57
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 11:15:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3E37301E1BF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 10:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32A362264DB;
	Mon,  8 Dec 2025 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZoAW8JSD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D44248896
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Dec 2025 10:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765188846; cv=none; b=ADS/qaERXmWsK0XbXKuN7nxek5QJzGPNm/nD2eHK2HNSh4/58jhPgzcBgqgfO9m9D8VTG1kVppcTG6KxP3oC3fIEyKmhFFXl0iGix+vPvRYbqdfitDoD9h6Wdvp8v/6VY+YprmEvjLEirSS5qGqxlVNPNRot4akVhc4BhkiLOKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765188846; c=relaxed/simple;
	bh=VApnJKeoRx1+pgCVPSPhVkgRhXFoV21X243vnE5l6cM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IolHTX3+oCe9o5V9JBEizIPFaR7/EhqEOL4rDIaP/4UcTLdqUSw/TzKeUu0/IdkDhBo/DjgiLwFbBqha+j/mQYwYm+s7vgg2WOtgS32Crnitsz8vEZIdvx+jntAswyfPxrdJUd027qsMTuhsq7UhnI2VO+nTAT3lYeJjE3YsHMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZoAW8JSD; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6431b0a1948so7337328a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Dec 2025 02:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765188840; x=1765793640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VmF5A7A0YltvuLrpjk1h5ILIFxDk13KqteZYqwtd4IE=;
        b=ZoAW8JSDlmMNk7f8TjCjr6c1X3dG2WjjvQXLJ5MJyA9/2fGog3Gr1bWWhXsPcbLyiS
         MJ9u6ka1AO8hRfhBtt3Q13xC73C8ZW5WWJ+jPwCRY9JLCf8+KKUn49t+5MReIXptX385
         EfzdbiI8oL1cJpF3V4ciquOmCmTaq0sjBoefY7KY/2tYfERwmRajU3uT+IDrhLwhvdHD
         OgHdZjLPQtYdktHMSP9c46+LYJkoKpjLw89nSaeOB+YtdbJnr8IGYOrv1iQr7Qq5QvrU
         fDKDZ1feTwSCr+sBh59RVj79fXy5r9HI7LImBrIDzOcFjSWX4kgIRQ9rXzhCtzv3iVJA
         5LQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765188840; x=1765793640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VmF5A7A0YltvuLrpjk1h5ILIFxDk13KqteZYqwtd4IE=;
        b=QjnWm8O0DI1sMqAmqsFrrkX6Qa44f3N1bgrS26/M+i/MVwKm+EAS8MxBfnh8MKXTO8
         Qd7DgO8THUBqskOpRRsBtCckraLWRTMEkTpgNzEOH3+pBYU9uSlCMnxgvrDVKmyk427u
         z2JH4Eq4F8HPLa2+4ssuWneBxbVfG+Wj3Iwluex7ENTGDok44y/W2//aUrW7VfgKrVXS
         TDPhK42mM4NJbyWKgS+XgtcWmlzUYatBw7sy16TwNr06mW9LX9nfeUme81J9IaUP8bWJ
         PJmOTTQqtoOXt5Q7GoJRu1KzRyqg9bHk5ppEjkdfkxOrRfrVnSsoyxEuwIbEbGDs6DVR
         J6zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsFD9n59gq5prvVXk7I8PCrdtTovouyrsLVat43M24vHIXcsvsOpxlqkRbPqcIBqobHofaHvnxUoeDBTc6UgIgWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzW3TkNU/j+GKR7lnPgN+I82pGKayNefGUN8zliQLNck9VuuPkl
	HEC/HoTMu6SnTpWhvc3C6naCMQLnmwN7kCdrrJczLyXavN3GYhdhSl3B
X-Gm-Gg: ASbGncsJpRGDcRI3SFxikwIHjZb0Ks1hYZm8hFYetWR9EuppRsnHrHDqhiuxy5ujaol
	WHagx3ZM2kTfXHhLvB9MgYfjhv8zAtf6Rt2ZLjviab8CGcdZlRRAUxJJHGAOXpuQfPzD6XA2j+v
	LnqRPjUFW34f2Drc1UAc4iTt4XXcDYlblmgfA6ekQaTcT1uzpEH72dqxmHusKpgz3pzs1cTzEvR
	iVcSnlN3+iKXHE2KbBiYO2Hdf4/nGrzGwNehRuwskZVx/AxPV6DJf1aUVA2GgwFXTbp40qM+ZsL
	gubiD5XSQe8Ghcgaf3t38Uz0ChxFPWVdXzdE65AX3Ek9xSblkkUmy4lr/ko3sk90OSr7T4Ee+kX
	DSJIqxviV44+JsGOrdGJFUTuRj7CQiTN9d5Cm4X1ZTfOUFR7PrrgV2fRh2SBzQcmhXXUhj8NudG
	QZodL8PEMtbD1hKTrXX6vpLaJI104wq6W4HGTBCsvrzJumGZXpfTBWD8eIN0bLya2ZwuixDBm22
	Wv2pF1++AjE7rzj
X-Google-Smtp-Source: AGHT+IHfKNBJd7WYE5ww06zmjwy+uoWXAkK5CmkwoKrK9UdMs9RYmupnX3+LnuHL0pQUfqTMASo/Iw==
X-Received: by 2002:a05:6402:1ecd:b0:647:5c87:8668 with SMTP id 4fb4d7f45d1cf-64919c1d230mr5735915a12.14.1765188839898;
        Mon, 08 Dec 2025 02:13:59 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b413b590sm10547083a12.35.2025.12.08.02.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 02:13:59 -0800 (PST)
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
Subject: [PATCH 1/2] clk: renesas: rzg2l: Deassert reset on assert timeout
Date: Mon,  8 Dec 2025 10:13:33 +0000
Message-ID: <20251208101356.101379-2-biju.das.jz@bp.renesas.com>
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
 drivers/clk/renesas/rzg2l-cpg.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 64d1ef6e4c94..751f0340854f 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1669,8 +1669,11 @@ static int __rzg2l_cpg_assert(struct reset_controller_dev *rcdev,
 
 	ret = readl_poll_timeout_atomic(priv->base + reg, value,
 					assert == !!(value & mask), 10, 200);
-	if (ret && !assert) {
+	if (ret) {
 		value = mask << 16;
+		if (assert)
+			value |= mask;
+
 		writel(value, priv->base + CLK_RST_R(info->resets[id].off));
 	}
 
-- 
2.43.0


