Return-Path: <linux-renesas-soc+bounces-26296-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC7CCF40BE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 15:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57ACB301B490
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 14:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 941B419E968;
	Mon,  5 Jan 2026 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfY0BrIT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAFE261B8C
	for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Jan 2026 14:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767621992; cv=none; b=pdu50FTE9pODdJbxoJlnSN35MucZZlxEiAV2oySGKI7HzqoMlr75a27W1sFfSQHfrOFgu3iKNVhYKocKvS9O4jvQ80Rpb3c1snDpjdpNs5enAiHhpTIpVrhIF1jaFjsGGXXEDtCPQmKsk4ZA8ue712tY4OJBPjWSf9rhTRxmYOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767621992; c=relaxed/simple;
	bh=YDm68YWhw+GEjf0gozJmWl/ojKKZcva9ZQA+L2+6sjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=myZEI8HEu1o6VHyGd0CBL796v0E6pPIFMVHsJoYRCezu67QhZcAYk3t+WIaw920FiP3hkFY0OXeFNyrstNWpA+YShSlJ8m55gaGKSy1e6TyqPTMjJ+OfQJhIenLexYYBvSHHprW5KBxDBtHaofMyHl6Uer1MrAx48jFVjFfIDVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfY0BrIT; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-432755545fcso4569535f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Jan 2026 06:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767621989; x=1768226789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hOJglpam6Y6tV/ZKx1vMYagmOMEwuqgdfcTZ8FECwao=;
        b=bfY0BrITyJmlzAuK4dl2gKORFURQMa5qUWtsIk1z7hdhyxnaSoukrin8kyedcEBDog
         DwjWDOeXM8bTDQGKrCfKT6PLUidxANICUHqOiOnaCXgUBaPmh/Kqh5BZ2xdsmFB3MvFi
         DFR3MQwICb4rdWiCEbwODtRrocGF7TN9uNhsIliRaWDftwzg4bQFq10RHI2kRgJVcsYg
         2x2IATe/ERh9rTpMULI01HwuMhm/NEE6gKQbjMvDvgrbrJ2sj50d/Ie5Zkfmrsc4qo2m
         G7cbyoc/RtlHehdp+G8Kg9Xq8GFdCI1Br6sB5gUCfXgaPcsVW0OU4q4s4v7YLVMTgiuC
         jelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767621989; x=1768226789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOJglpam6Y6tV/ZKx1vMYagmOMEwuqgdfcTZ8FECwao=;
        b=R1c+pFiZbi8hSePgio4AHQVxdX1ZNQTHAlXn7yE32F2bNNEs6ekvqM/RYqHGuoYsbG
         H33eFOzWOrFAxtlVspeDjOwt/HP1BsQnGAhY+8oZM4ZogGurDtN5BqYPyx/Xq+mxd/t9
         GfNLwlnd15UO5WlyyP/sl3JgLyYZpbkpmWV/5IBP74/Ajn+6ucKgCS3zNqaoEdbhNBap
         jlrnyeEcG2JLge+046zo1OAOCjPJGrJHVULddygVSUk3x/kXHtnVPi6naElZZzLNN9KP
         jP2DYr3KoGe5uO/32jBL/94GjmWXefuYgay0bxU9tPj3VWUwHjG0lFxISMAPti4E023p
         YnlA==
X-Gm-Message-State: AOJu0YwGUsg9d3c5p4rA9JZu97dM/EPN351kGMaI9BFQhkz20pRBkPIS
	0droJP+7iyfuE1aiyvf760BbtQ2e0vVHshGvJ4D8B35S8T08uyaV15Qa
X-Gm-Gg: AY/fxX5cMJVKy7N0jLy75lqPFfMYeLYS8PDcp4up9YNw6b12mR9Bb6B+wf7aXhQk0ZK
	F4ZJXyqt3JZDeZ9gQegh0VYBk3E8wrs5f+qA4Ya1Z4Qi3gbg30Sg6nz6LG/kTllusvDi7R88J/O
	0Wv1l/79iIk5c0glj43haN81vRW0uqPMaLaD7rkdy3d284dC5MHYI21fUahJ9QMQxHY00FZsj7v
	mgpn66WtPvktqWsQKuvSqA/b7zLz8wEXJq9TBrpaUMwNkLaaDgm1zRR4hA7aunx7jDwZc2PNku9
	rBdePI+0YXpPjfj6GmeMy4rUCq2g84ekDW8msQaSk2Psfmi5rpulZU2d7QZuLiEqPgMnbHaEGVE
	fSQnZtK4NyqWm+ZONl0JjL3xbksLMzMAYaQ4ESBedqnbRjoVej/BP8ufJ5J4odJfkOU/Vk+5mg8
	APZcV4vi3WaNBzzI79+8StBaZ+VioEeN4vR1LDwP/lMnZqBcbIq4NOrdysaNwWIc4nDn2jxMtRM
	w53HEtrqwnnCC2QyoNJjjM54rw1GF/PnpflfmNTn0BC
X-Google-Smtp-Source: AGHT+IHYjz/XhcS6cgCdmHSfRfjnK952JHLNhqtvsHW++gGz2atIPw5gFfbGYXmxHJxJ2yyaYDBXJA==
X-Received: by 2002:adf:f18c:0:b0:432:8036:4a0e with SMTP id ffacd0b85a97d-43280364b6dmr31538076f8f.35.1767621988981;
        Mon, 05 Jan 2026 06:06:28 -0800 (PST)
Received: from iku.example.org ([2a06:5906:61b:2d00:b8c0:9e58:2df0:631f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aee5sm102452753f8f.4.2026.01.05.06.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:06:28 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Pavel Machek <pavel@nabladev.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: renesas: cpg-mssr: Unlock before reset verification
Date: Mon,  5 Jan 2026 14:06:25 +0000
Message-ID: <20260105140625.2590685-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Move spin_unlock_irqrestore() before verifying the reset result and
printing errors. The verification condition only uses local variables
and does not require locking.

Reported-by: Pavel Machek <pavel@nabladev.com>
Closes: https://lore.kernel.org/all/aVujAQJSDn6WyORK@duo.ucw.cz/
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 35cb49763014..a6df0d2538c7 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -806,14 +806,12 @@ static int cpg_mrcr_set_reset_state(struct reset_controller_dev *rcdev,
 
 	/* Verify the operation */
 	val = readl(reg_addr);
+	spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
 	if (set == !(bitmask & val)) {
 		dev_err(priv->dev, "Reset register %u%02u operation failed\n", reg, bit);
-		spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
 		return -EIO;
 	}
 
-	spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
-
 	return 0;
 }
 
-- 
2.52.0


