Return-Path: <linux-renesas-soc+bounces-22997-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC54BD8D1A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 12:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 81BA24E1941
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 10:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44DA2FB982;
	Tue, 14 Oct 2025 10:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8IiQ3HP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456BF2EC0AB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 10:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760439246; cv=none; b=iZjvXzGz6kZJj0ZE4mcbwn7ZWT9o6JZhi2zP4n0Ra252InI/R7vBvyAGKSgCDRzQwDvHT75X3JaVEiISdYPQjuBOfly4zYhchUx2xlOpjueuj2jlxdr0ZdCCjQxsIlV6lq6Iui+x4kGoVQlxgMMQ2lhvV6rOR+f0uJ466oxBKjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760439246; c=relaxed/simple;
	bh=Mr8tfZLBlB8aFgod6sfW7x6gPlPlXWbUdZCIVbKO4Es=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QnCdrDVWDNzKx8A3jFc6BWy7bOD8GrtcWxR9sXZMoS2rj8gg+ooRrCz/W4gcnuyWgSC4BmmTPQvAnVn4YWh4Aif9S8HIDg1N/KlxwdlZNtHnRjCNdWbXRu9ksWNP/uKS0f0EaVHhpvg4By/DvquBtLWXEKEO/jmpZptLw3kk5Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8IiQ3HP; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7841da939deso4539044b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 03:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760439244; x=1761044044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JCcGuEZSgrij4aPzZeBxOmzwZd89EZQp1SLrIiFb3XQ=;
        b=Y8IiQ3HPqfjjAltwdpksk+eCEN5E5X+Pw5iGK5HtG5Vp/kFbruXuX13ckEwFr8ppPt
         5JI3EoclvQOis2eaRwMsrsXGcnyfVdQRtyY1hvEmzI6eLTNp3TzwHPOCehDj5Lac2z6N
         T0bZa0nT4g68RLttEKDdBbgXo6KFCUiSKTIpEqONiaI398l088N728hhCUvnThd/jiqf
         DE0ZmtrUW+TjNGmgYVOzXKXljuKxINEgxaBC4LHHnA+r/Olm42vesorlz9hqBLqwWfqC
         DlOsZWB+trXc6FCwNoYEc3nV81mi9nWIfdhbmIKDWdCT8mNv3lwFQsFfvoZhBoFMTKDr
         cRLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760439244; x=1761044044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JCcGuEZSgrij4aPzZeBxOmzwZd89EZQp1SLrIiFb3XQ=;
        b=ShCmgNtVnZ5sxgjgLFklR/Vzf4iUBGUJ+sC+7V48q05nBRd16h1O/CH3W+/teuo0iM
         hXqtAD/wI4Md/5fiUp1eyhpziApJFpkBk5VQBoubTp4yED9lpQA3VeF7qD4E3HmDJt1z
         gcDzKTJpxws7EXK/cJlgaouOzE/eS0EbEsNl2DcX67y5qUxNbwLXzO8d7J6eFvj4BKjD
         GfsfTo6ksqHVKC/6BIeQIzTMlAeEZIJimfiJms90Ohke9/C4yoqekq8Ol4YbKkKD6Oe1
         sZoBckDDCy9bQJztuTyo6gL+eje+VA0OJX/+qZoM05GXPCGdSjKiMKFRcYimKnRWcr34
         XE3Q==
X-Gm-Message-State: AOJu0Yyr1MutP22O3jmTeTq0PerAlht5IzcXw1Fb7dZCjoIoct76T81j
	0aEGN/X9UNeTR96gaBDGRiWyL0zW7gGj/PP/6qh34afB3z1M5BRdmwIt
X-Gm-Gg: ASbGnctRjVl/3Qmvdqh1o8MFXPEsHbzPGb4oRcHF+3I4u5KBP+D9rXiIFjTs22D5xKb
	qTu8ZRFuC9VMQBysUjpIpWufSewwcitPUTFiQE+df+iXwMyIvBtOyjejbYON0sGbQ3No9+Lm5+t
	YvqKKuQGdkurx93wfZPbBjyTxAtx9VrwNkg2hnBe6WSHfIfbQHvcpd89ydsdHamsv1l0s8GN3uz
	Ntt7UjpKW5GtyjULN+0I7E5NljioaFs6s0La+qnlEj2npAw1Nk1Gcq60UT8djWb2/RucbcbewU0
	xZfjPT9VycqNzgTyuRo0VIFYT3FyffJEu8xAtgupCiNahC0KpzQyESnrwC7WCaKtCln5jKLapKZ
	uLU6tIxDT8kshZLeWv1DxJEbUq0tnoazwzk6hK2Re57IY+qhwOxDQ/CkmPo1EnMSwHD9WJZbIqg
	==
X-Google-Smtp-Source: AGHT+IHul9FYXPgeY0MtOe+ORzdsrXCIGeWmnOQdSxYt0ZHodvYGCUDDVSFP9FvoFR1UMaj3nEkjBg==
X-Received: by 2002:a05:6a20:7351:b0:2ff:1132:8c48 with SMTP id adf61e73a8af0-32da8164167mr34514969637.24.1760439244522;
        Tue, 14 Oct 2025 03:54:04 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:6d70:9e09:769b:2b4f:71ef])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b060962sm14901724b3a.1.2025.10.14.03.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 03:54:03 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: renesas: cpg-mssr: Add read-back and delay handling for RZ/T2H MSTP
Date: Tue, 14 Oct 2025 11:53:48 +0100
Message-ID: <20251014105348.93705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On the RZ/T2H SoC, a specific sequence is required when releasing a
module from the module stop state (i.e. when clearing the corresponding
bit in the MSTPCRm register to '0'). After writing to the MSTPCRm
register, a read-back of the same register must be performed, followed
by at least seven dummy reads of any register within the IP block that
is being released.

To avoid mapping device registers for this purpose, a short delay is
introduced after the read-back to ensure proper hardware stabilization
before the module becomes accessible.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Hi Geert,

I made use of the timed_read_poll_timeout_atomic() macro to print the
delay after the read operation. With first case I printed the value read
from the register and in the second case I just printed the number of
loops and time taken. So to be on the safe side I have added a udelay(10)
after the read operation. Please find below the output from both the cases.

#1 With value printed
[    1.468936] read_7times_init: poll OK after 0 loops 223 ticks, 10000 ns left of 10 us
[    1.477719] read_7times: read 0: ff002104
[    1.482358] read_7times_init: poll OK after 0 loops 126 ticks, 10000 ns left of 10 us
[    1.491331] read_7times: read 1: ff002104
[    1.495901] read_7times_init: poll OK after 0 loops 100 ticks, 10000 ns left of 10 us
[    1.504692] read_7times: read 2: ff002104
[    1.509261] read_7times_init: poll OK after 0 loops 103 ticks, 10000 ns left of 10 us
[    1.518052] read_7times: read 3: ff002104
[    1.522692] read_7times_init: poll OK after 0 loops 100 ticks, 10000 ns left of 10 us
[    1.531665] read_7times: read 4: ff002104
[    1.536209] read_7times_init: poll OK after 0 loops 102 ticks, 10000 ns left of 10 us
[    1.545183] read_7times: read 5: ff002104
[    1.549726] read_7times_init: poll OK after 0 loops 84 ticks, 10000 ns left of 10 us
[    1.558456] read_7times: read 6: ff002104

#2 Without values being printed
[    1.469581] read_7times_init: poll OK after 0 loops 255 ticks, 10000 ns left of 10 us
[    1.478668] read_7times_init: poll OK after 0 loops 130 ticks, 10000 ns left of 10 us
[    1.487650] read_7times_init: poll OK after 0 loops 101 ticks, 10000 ns left of 10 us
[    1.496527] read_7times_init: poll OK after 0 loops 99 ticks, 10000 ns left of 10 us
[    1.505231] read_7times_init: poll OK after 0 loops 96 ticks, 10000 ns left of 10 us
[    1.514109] read_7times_init: poll OK after 0 loops 97 ticks, 10000 ns left of 10 us
[    1.522883] read_7times_init: poll OK after 0 loops 99 ticks, 10000 ns left of 10 us

Cheers, Prabhakar
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index c9598fd1f8cd..4e9c1bcaf968 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -308,10 +308,21 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 
 	spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
 
-	if (!enable || priv->reg_layout == CLK_REG_LAYOUT_RZ_A ||
-	    priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)
+	if (!enable || priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
 		return 0;
 
+	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {
+		/*
+		 * For the RZ/T2H case, it is necessary to perform a read-back after
+		 * accessing the MSTPCRm register and to dummy-read any register of
+		 * the IP at least seven times. Instead of memory-mapping the IP
+		 * register, we simply add a delay after the read operation.
+		 */
+		cpg_rzt2h_mstp_read(hw, priv->control_regs[reg]);
+		udelay(10);
+		return 0;
+	}
+
 	error = readl_poll_timeout_atomic(priv->pub.base0 + priv->status_regs[reg],
 					  value, !(value & bitmask), 0, 10);
 	if (error)
-- 
2.43.0


