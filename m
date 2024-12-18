Return-Path: <linux-renesas-soc+bounces-11544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 507DA9F682D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 15:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6608F1892776
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 14:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009DA1D5AB7;
	Wed, 18 Dec 2024 14:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUNkSP40"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD6D1C548A;
	Wed, 18 Dec 2024 14:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734531659; cv=none; b=HT3XdlWExQAnXDr9h9gYj/zs8vzXJnhliMsSiGp0EkKZQuqWDHMhDz7o5xGZG16cpOGEhm8NbuQwm2ftWhyihDe4Wiv+/Y0WCevvx6ux+qNAMtLym/r5ruzhGp9iIwlZXk+6bIQal1Lz7LaHQfLMOzQVhtKcGaEgebxZzJHKNtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734531659; c=relaxed/simple;
	bh=G0VcbygjrcIvSCsXXo7R+ukCzSn8AMxD8kp172+o8eY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l1Zfrp3Qn9r13UciCQkDVgc/8RFvhiMJjYqGHWS0FOdOFhFHWPyUvcCoKD46FoC//ix1JruZRoUz13y9NDnmW52EzFpHMh00p5OVUu7rMOzu0IrqnGCH53uY44LdFr2NlQMO2468sP5DLxObT7L5OTcMe15DIPqnlJM3NRIvBh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUNkSP40; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso47412415e9.2;
        Wed, 18 Dec 2024 06:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734531656; x=1735136456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IQX8JtRRxJc8M4IW22Ze/9Y9MdVzCSkoKVYjbAlY6o=;
        b=dUNkSP404cI/fP0nE4bStF9l3zrqDJWs5FK4g6kaiyyaQI388JZnlsHIG/MidShWpv
         qGD6KSmvVY44PzhgRKmaBKSkOkYEQPU6VvJ8N84N8JbfCugRO715sjbbt7ZYTC/MFkpH
         owhEYRKvbUZjwB3M5OfhgV1fcMkHMuDJJGLM6fGTBWB6Ui4kNcRQBzKGaFjpOJZ3T/1y
         RLDvaDQv5C0xRu3m6ngFZ3OX+a2xld5YEmEWWxNTbmIHKI4pLP0vnUYwlhdOTxXk0xZO
         TIbM2o+J9gsFGizHdlRqAjWyQK3erjLmv/hQJ+htfK5fOux18V8bPhSGn7ZyJydfkzje
         zX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734531656; x=1735136456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9IQX8JtRRxJc8M4IW22Ze/9Y9MdVzCSkoKVYjbAlY6o=;
        b=PzU7p7X8jF32GshoZaC8Ukv0CednIVpIyl0tdWdgmnB9UhdHTKjgBA7qnex+GBuapz
         +ScqgEvjDn4BTjhNbuYZUntpIEVfz1g60Ek3vlZQwpqtz3UF9jzx7ZcfhKM7pG9W6M65
         faeQMTSTzJNQels4o4XnRchur1W4nJaddB9wMEFk9lZfFVUlbukWz06jsnay1Hp1pB5p
         AMY/skDNM+xyoUsqiQtX+ea5N4fkzH9oe6VNFXwSIkfVam3oFBI2Pw4PWSTd/UErOS1H
         FCAQ/DqFzAaXSoqPr0onchWxqLQmN6ZrvHN9HbSoqVNblxbWeArJWkXk/21w2HK8scPa
         cNJg==
X-Forwarded-Encrypted: i=1; AJvYcCUpeSBT0JNKU2FwrZgVIdAFqvsgszBt4bYlO9W0KQB6AVPTsVZCBNVKE19jIRvKowHUnwlbGiPeJg4=@vger.kernel.org, AJvYcCVWwL996bCum9OcuuxNIy45NSpbCC6j2ZZ0svbp8bAPG1iC3V+UArTHrJCfIY1cOv4aOp2fplPwyf4ge8ik@vger.kernel.org
X-Gm-Message-State: AOJu0YwKRv4sG1mJ5gKV8fd8LwPxWIIaWGzIPMIHJWwUeTyY+2P2rhGV
	rEy2Lque3QZO7gHvk3PwMwRWQSz0qMCzcrhzsUVMXJAshYr4vdlr
X-Gm-Gg: ASbGncs7KZnRTthcaxywQ3FUv3Cwnh4VMZM3tLnQPouX1B5YUUfIzVfqHlAc4BZqVUg
	vNnewFxHC6YToiob/tlFx+QrFc5ygLpZUoZMNcDwEdReI2lcIyf9DoeMlQlCzaKn0VXJFPOLGOP
	NusD0eTQfy4I+/S4nMnOy6jzVUtT7wYbe0fTnvG/bh+ZUYrfAXvCRuy630U6sOsdGR1XWcvHbES
	IRqY1mn8OiPYmQKSEVnyLmsCrIQ6/w0AGYTvhUyvH3CUK6/2sPOVOg+9ogGIi0Rs3uOaDfhgDEp
	saKNliLRjQ==
X-Google-Smtp-Source: AGHT+IEQgaEiwxhKe/AuG12I/7pbppaenI9ZtWHivFdKeBv4lMOeYTSeg46XFOWVw8KMhDHxgagGLA==
X-Received: by 2002:a5d:64a9:0:b0:385:ef8e:a641 with SMTP id ffacd0b85a97d-388e4d5864fmr2884139f8f.28.1734531656388;
        Wed, 18 Dec 2024 06:20:56 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:9516:68be:c7cd:69f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801ac68sm14107033f8f.51.2024.12.18.06.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 06:20:55 -0800 (PST)
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
Subject: [PATCH 4/5] clk: renesas: r9a09g057: Add reset entry for SYS
Date: Wed, 18 Dec 2024 14:20:44 +0000
Message-ID: <20241218142045.77269-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add the missing reset entry for the `SYS` module in the clock driver. The
corresponding core clock entry for `SYS` is already present.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g057-cpg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 59dadedb2217..856a02ac7ac5 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -220,6 +220,7 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 };
 
 static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
+	DEF_RST(3, 0, 1, 1),		/* SYS_0_PRESETN */
 	DEF_RST(3, 6, 1, 7),		/* ICU_0_PRESETN_I */
 	DEF_RST(6, 13, 2, 30),		/* GTM_0_PRESETZ */
 	DEF_RST(6, 14, 2, 31),		/* GTM_1_PRESETZ */
-- 
2.43.0


