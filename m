Return-Path: <linux-renesas-soc+bounces-24909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1FCC780EF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 10:10:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6E198362840
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 09:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF4FE33CEBC;
	Fri, 21 Nov 2025 09:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxQKUmzn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C232DF151
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 09:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763716147; cv=none; b=btfV/iCrg/77TEAv6PXowZ8aNqFJORvsF4own+z5wkdtMtTUIzwi55F4zD6jRtwJxL7Bmcv35CHM5iyt3AvFvJGqoScgS5F41aox2FmrV2OeOjZEvVXfnLGjtLQMFqtbOAR0mDnH+OzKZNpSlP2x15jmuWU4phCMGYKiLkQmHFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763716147; c=relaxed/simple;
	bh=dfzQJVC7+HskfHckgversV6c18hzVgTv0Io5z+9VUjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cizEd//hf89eQHf1lMN7WWFN5ESyG/CVGHeL+3Tt85m8C4koh6WpVIzk6sj9hm1nOxtN1ze97FpsLGBNDpzbtT/E7Z/Hg/9ZDvE+4yUf7f0Vm3BjxcLIw460icPWYspyUSAZ7+b1ZPB8M2rc//WIsSEfushz71qQ7yFB7Zif9KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxQKUmzn; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b3c965ca9so1014748f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 01:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763716144; x=1764320944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1VNuYKYyYAXvFeu+2dsgCHW78TdE/IKv83bgjDFmd1M=;
        b=XxQKUmznuSVy27OHA/M6E89MaY9eL6sGlwTEi2na+tJjo1aYjpOgDTM/GdFG4LuI14
         NFdYDRt3Mlz+XAfmcM+3oiOO8qUZ+KJ80hGogfFX/c/3ZDanavnxdE4oo4xEmjb38uxe
         tpnAUVZAV9lDQrnSu1EWp2x5dQ8N337XHjTtYAJe3hQNmyh8E8oyLnk7RIup+tvJUOlM
         Cif3I0YfRvTetyTVn6qGpvAmUkH0uQOwDcB8+QO8tKRXmcE5IujBsSLGajED9GhSQFvn
         AuXN+RCFShfciDY1Wddsdb10+Md6LdnidyZbBcC7sZZg8N3ty3WQi4mp4YuXzaIUQbG5
         e7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763716144; x=1764320944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VNuYKYyYAXvFeu+2dsgCHW78TdE/IKv83bgjDFmd1M=;
        b=K1S10ymJMjCny3CGWz2yADBq6qOqNDqMau+hExuiKkysDUIo8Ha3vmJ4/s4d4Ae86U
         I2JYz+Q2QZm+U+fxGWTOlpKsFmEDuYcJgdkGfqV1jgBJnOAnCIU/yDShjhtTSUwBOR7e
         AFDjZkyGP8A3fGKZ7KtTfdSdy0dO+DwJH2WQHjbhxdMSMC7Jru3XxROOD5aAa0Zil5ne
         kXQdIdmPvJIk9f4m/ootR6cAee3I3xPgp93Fu0pEEpusTxX0TQZ9Nc323BRiVXHaHScR
         hsRvrNxM1fm6ByzUP0Hf8a3B2NzHUcW8Fzz2xNKReexEVdhbKsLKpSdJ8ORVVWhXyXbz
         FdrA==
X-Gm-Message-State: AOJu0Yy8oC8g4irjXr9YRj1QtRjA2oYxnjvInxU6/Z8eVR3y+VJ/aZX7
	zuMbi/FBvok6MeuTpGxCOjK5fmqEDoF520IOpjckxjbC6gFLENq6RHwG
X-Gm-Gg: ASbGnctM9ZjU2q38RumyXWrW2BKlWuXKORwgKrt9mCeUp5gupHpNCxc1bQmkJ/BaJDS
	qXdMsREktzfagJV24L5jLGzXXoV1rVV0su2iCNEbe6r9Yc+uFk6GnZn5L2DNsbq3dKjBxDacDDk
	jSXU31X2A3aWChwhNZrVJrTyWFjVEHfWbDQ8BjOyLIxGg/G5ixguRt8m5AdWrXs7cyqVd3vh6kg
	7w0d/TEwOJpDqYVEEpSnFityjxbsf1WXPQlFtvyDy9x2ucvcPyhtXvVfpwop2v4Lf//5gy7aDwU
	L/sw6+oCSahtcGNQ8dHYWaM8gRmqwb6YPWRJwWE7RBUVKwcztEnbwq5H3U+hpksLxsmK4CAejH6
	/Z5oovZfzT/bdF+/tpvlnEVJROVzHkuDDjuV54mUU80GYBhvlX/L0CDn3KSeRj0Q8kP+n71HmYU
	Qr1DY4PfW0JJc++xuDj7dXdrUM6dUVN8iPlis=
X-Google-Smtp-Source: AGHT+IFic+NZ6mRJVG3/NsgYDO+LXGnsRyCtXTsDhLGXPmT43NV5CXuxv+c/pV7z2Td8e8dk16WAUg==
X-Received: by 2002:a05:6000:401f:b0:42b:3bfc:d5cd with SMTP id ffacd0b85a97d-42cc1cd94f3mr1522051f8f.1.1763716144129;
        Fri, 21 Nov 2025 01:09:04 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:9cce:8ab9:bc72:76cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9022sm9762811f8f.36.2025.11.21.01.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 01:09:03 -0800 (PST)
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
Subject: [PATCH] clk: renesas: r9a09g077: Propagate rate changes through mux parents
Date: Fri, 21 Nov 2025 09:08:53 +0000
Message-ID: <20251121090853.5220-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable CLK_SET_RATE_PARENT for mux clocks so that rate changes can properly
propagate to their parent clocks. Several clocks in the R9A09G077 CPG tree
depend on upstream PLL or divider outputs being recalculated when a child
requests a new frequency. Without this flag, rate adjustments stop at the
mux layer, leaving parent rates unchanged and preventing the clock tree
from converging on the intended values.

Set the flag in DEF_MUX to ensure that parent clocks participate in rate
negotiation, which is required for correct operation of the display and
peripheral related clocks being added for RZ/T2H support.

Fixes: 065fe720eec6e ("clk: renesas: Add support for R9A09G077 SoC")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g077-cpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 7367a713991d..dfd77a1ecc92 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -78,7 +78,7 @@ enum rzt2h_clk_types {
 #define DEF_MUX(_name, _id, _conf, _parent_names, _num_parents, _mux_flags) \
 	DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_MUX, .conf = _conf, \
 		 .parent_names = _parent_names, .num_parents = _num_parents, \
-		 .flag = 0, .mux_flags = _mux_flags)
+		 .flag = CLK_SET_RATE_PARENT, .mux_flags = _mux_flags)
 #define DEF_DIV_FSELXSPI(_name, _id, _parent, _conf, _dtable) \
 	DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_FSELXSPI, .conf = _conf, \
 		 .parent = _parent, .dtable = _dtable, .flag = 0)
-- 
2.52.0


