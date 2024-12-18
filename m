Return-Path: <linux-renesas-soc+bounces-11543-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 388B29F6829
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 15:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 874DB16CC6C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 14:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADAD1C5CA6;
	Wed, 18 Dec 2024 14:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxbQ/Wx5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB801BEF7A;
	Wed, 18 Dec 2024 14:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734531658; cv=none; b=gXTT2Z0S6+VM/4GhqYM1vbs/wazr58upN7qCow82UorOiZ2oS4DmnIafMvyXUUpT0dZwS5O9lBXw6W6fQ8Zq3urMyDFLAAWy9ukiNuJRHw5XnUjbIy5ALjhMLUgII4vsA/W2NKNKQ7bzvSAUYGw+56Yf1sa7gmVEDiRxHhw4Ux4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734531658; c=relaxed/simple;
	bh=SrBM4xqAfZOzEOBXFD+pJDwrNKD6dUCsFCv8SJQ/TQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YhdC55pnVQnXb+ETA7TAqPgqpx22llDCUUwNsJU3NozGcm7Cl4YhwtVb2l4KLZh5Vwbw03sx5WrEo5u8u+r+GTeBsJZaomb2aAX15ooAGS/gNbrtxCjPZz/FphLVUQ2jL6gb+n4QSZiuo7ifbqNHlIR5xQFPABkGMIcvPzJYo8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxbQ/Wx5; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385e06af753so3393759f8f.2;
        Wed, 18 Dec 2024 06:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734531655; x=1735136455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2JLKkZD/mqACjYyo1Roz1R7qdTK6jveAjWy7QXVt610=;
        b=bxbQ/Wx5Cqwdj78TubQp+gi0qxX7cfZSCvgZFMHwrVfFNZvy9rCIroDpwS+N25yZgE
         FlMyEoiifAgrJMho7VaXvDJ7YK7gx6ya7tuppVjXkftPzco6sWcoxt0+kY83/Kr+JUjg
         AA5qqfvYFlGZxg6NGxN1xHmTTwH/Hffk9VZe5zelbYtzklxBi7HYICZW48uqgoIojYS9
         /mXrmfea+4mNovboAtNztNQbOYM7qUuW59OJaqqTcE4cuoKcONPsWPITDlRf8d9rTuup
         ZcJfhpgXXn+6tSwZC/8d+oCvLOViRL78kLb3O/J1uceC5tW2+hvucyLXsyuxXK0aPA0H
         tytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734531655; x=1735136455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2JLKkZD/mqACjYyo1Roz1R7qdTK6jveAjWy7QXVt610=;
        b=KWxsPm5jXl0Ctd5KqJkVijMuu1QVCYiTelReF7XbKbCEL+IEsa98kY2ieLL+IP3oG8
         AKfzd8z2QebCIZUFWMX2s2WbwdJPmME7qtaW/Ml4CvcPEd/iRojrQ1EVvebRpvDV3zaT
         mH/6kjC7skpW3vgU6KuOlmwh2YtZAVYyG0MA5wITJMgAhdpDO9ltipjyVg9re1a9ImIP
         UIVZ2E9nmniVH2VXLLEU7pQJYW3KXLmss+/7ytN14UWit1lD89xgjSqP/JJXXliH6Gn0
         SeyjZXTphPPyuGimPoiqev1BjhYifeLqbvoE7/4vH8mbpJw5Rj4AFfO3cG/hTFXX2CTN
         k2zQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEnjPJowEJctqSGNtdqeD5411IZctgo2PruEN17OyyjEPmClk/VQ63DZKCHU0xEeHWvhvfgTIJJz8=@vger.kernel.org, AJvYcCXwpKfXTtkdJuSeaS9d48Yy82kNkzUaRYxYO7RTw6KTJN+YEPx/W6u+5NNw+YUAIz+7ApcG8LzCVCs7yFcl@vger.kernel.org
X-Gm-Message-State: AOJu0YyBqQTwm5oRmehIJYW3tmVWf7F6dOb7UyDcb/LwRh6zrjrlLoj/
	iIpwEkF5jB4Hw08nW+9/iU+wWVKek996d7Dk10YuTOGOs4tDAY6KCz1XOQ==
X-Gm-Gg: ASbGncuLuJmt53+bN7udsCwaMn5bqe5OiUSGRFqJThmkx8mJJ7J9I5U1y4UfOwHNgMt
	HJc7jM+6m4E1804teL9IloRMxFrwE/Uu4AF0/2Tp3Yl9fnRARJ8GZGyeHlGZDUF6sy3dk5fc0b5
	09l44zrZB6qqzn7AvIDRozGT5Vv+pc9av1eUdFN6PSMqxOXk0FEye5D0/idSMfesUlCoeAcoata
	MAek1NBq4WNkdsGgk2PxxAS8reSk5priL4Kg16Rn296ClH2S1AbZU70+1qCw31C/vwfcvc/BLZx
	JpbiiQwhlA==
X-Google-Smtp-Source: AGHT+IGbYC5OOnjUzvLlXIbCkpWMp6vz2WcxhoipNrfrLtop3QJ+w8l2tV/ljUnvlf8Hn5zk89l4ng==
X-Received: by 2002:adf:e190:0:b0:386:3e3c:ef1 with SMTP id ffacd0b85a97d-388e4d9201cmr2867632f8f.35.1734531654923;
        Wed, 18 Dec 2024 06:20:54 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:9516:68be:c7cd:69f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801ac68sm14107033f8f.51.2024.12.18.06.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 06:20:53 -0800 (PST)
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
Subject: [PATCH 3/5] clk: renesas: rzv2h: Simplify BUS_MSTOP macros and field extraction
Date: Wed, 18 Dec 2024 14:20:43 +0000
Message-ID: <20241218142045.77269-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241218142045.77269-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218142045.77269-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace manual bit manipulation in `BUS_MSTOP` with `FIELD_PREP_CONST` and
`FIELD_GET` macros for better clarity and maintainability. Introduce
explicit masks (`BUS_MSTOP_IDX_MASK`, `BUS_MSTOP_BITS_MASK`) to improve
readability.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 4 ++--
 drivers/clk/renesas/rzv2h-cpg.h | 5 ++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 38edddfc42d9..29b1ce003370 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -582,8 +582,8 @@ static struct rzv2h_mstop
 	if (!mstop)
 		return NULL;
 
-	mstop->idx = (mstop_data >> 16) & 0xffff;
-	mstop->mask = mstop_data & 0xffff;
+	mstop->idx = FIELD_GET(BUS_MSTOP_IDX_MASK, (mstop_data));
+	mstop->mask = FIELD_GET(BUS_MSTOP_BITS_MASK, (mstop_data));
 	if (rzv2h_mod_clock_is_enabled(&clock->hw))
 		refcount_set(&mstop->ref_cnt, 1);
 	else
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 810275eba473..f918620c4650 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -46,7 +46,10 @@ struct ddiv {
 #define CDDIV4_DIVCTL1	DDIV_PACK(CPG_CDDIV4, 4, 1, 17)
 #define CDDIV4_DIVCTL2	DDIV_PACK(CPG_CDDIV4, 8, 1, 18)
 
-#define BUS_MSTOP(idx, mask)	(((idx) & 0xffff) << 16 | (mask))
+#define BUS_MSTOP_IDX_MASK	GENMASK(31, 16)
+#define BUS_MSTOP_BITS_MASK	GENMASK(15, 0)
+#define BUS_MSTOP(idx, mask)	(FIELD_PREP_CONST(BUS_MSTOP_IDX_MASK, (idx)) | \
+				 FIELD_PREP_CONST(BUS_MSTOP_BITS_MASK, (mask)))
 #define BUS_MSTOP_NONE		GENMASK(31, 0)
 
 /**
-- 
2.43.0


