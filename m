Return-Path: <linux-renesas-soc+bounces-13041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B01BA30934
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 11:56:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9014D1888D45
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 10:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99741F7569;
	Tue, 11 Feb 2025 10:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="biTSKRBV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298F81F193C;
	Tue, 11 Feb 2025 10:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739271379; cv=none; b=fUUFCu2UqOaEwLosfEFFeZbk4oir8LVRp32mnF7R6lvBtr103ywfdeWwPtepwCtkx8kVOXOfqOXzHihye+YJQpukrjGXfZZx58oLZe/MJn3hw9vQKnrzhRmwVBbir1/y8ba4K26TQLmtpR1LT01kJNH+/qE7APeAc4t+ErQtOto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739271379; c=relaxed/simple;
	bh=Y1XrKCOtv9qxBYR3Su1pCe6JZ2L33Fio3MEaQAqVVOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bSRz1r1ZX7cgQGI7pDsDBSFjzsnCMpxz1FgZrr0lB2NV+wk9XqLjEbCc0C/jbrOx3rVR+WDWSEqjuQME3bfLy4yQTmdyrtwS5uLoCosY8OV8nYuFAa6eMGYJw638yhcQZ29Qhwo+X3/pCcvFpW5in/Z1Q5tlG3YgthS+xPTNFU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=biTSKRBV; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43618283d48so37228155e9.1;
        Tue, 11 Feb 2025 02:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739271376; x=1739876176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jnLzczR9h9GUGbhBy5Ok+9WYUKgSFnCQkNKMm74353I=;
        b=biTSKRBVWIAssgi74uPlDPjrUrYh+f1F3KX41nU67RiW0I2mS60I16LpBmrs+4+xRY
         cSXI8BCfRncv3yUohpOYY4ao1xejYFi6aT5rgwcMsTkM25MudKak5FtwL4GQ4veWAgOl
         qk5ynP88CECEivkT0rkXt5pXefMaW1ghG7ASEIIyRalm+gszRjL1VD4N8tOvWhbJaYzF
         CM4igs1fhsCkz1MdzNX4gtdSBDAny2MFdumSchLHTByuv5jhxRHTQXhOBlmzR14vEGZV
         fH4jOWsm4v/b5+nDMgclQxwyDox4ELjuQVpwaoMZc6ch94hP42YdT5QtU6l28BrDqbzb
         VpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739271376; x=1739876176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jnLzczR9h9GUGbhBy5Ok+9WYUKgSFnCQkNKMm74353I=;
        b=ZGPo9lHyKTvEVffQiQQZX3NusTFOtYxeR6Lnptrrp7R7j9/fE/87wN6ClhV3QpH00C
         Q9o9G7/dZ3l0NLCo6TwrIf9xfLMAc08DhZmCkwP7azWnOhxoIg3Ntb4VLBLJGqdGjyja
         lxPzGLAglLbYVSioRcj4PZPJJ+hhmR7MTF46ePYf6fjdHIU9jdS6ZZ0LUAAcQF7SKHVs
         9Top0sN7va6ib2AT1qDych2rWifRfm+puKqdVXosJVpzXjUmawBUNCjmoPc8LFibjGLw
         jpWb2nzqxELVZK31NgFbGR0hz2VMggvAkgGUFpOwxlS2FhXnNn1QJOE1ZKb+jKzfo5Vn
         Jkyw==
X-Forwarded-Encrypted: i=1; AJvYcCUK92R2Hud1II8GOm+TWXdzEVc4a91iXKkb2sBQybLo5ONNxsX0KAUKIHh2hekCQ09k+JwIgKnMWf8=@vger.kernel.org, AJvYcCWNqNcgDKuYSq5/gT9vBnSgcu0OQpcLfpCqnxGzTtaZsOxWvVi2maMnWzYv0hPk9m0INTTThJYQ4Tg1Auuy@vger.kernel.org
X-Gm-Message-State: AOJu0YwofMZiBgAkdQpyQS6FLIhMInrquFHj6iHqOLEISLCaAyX03T9W
	Y5QguR7hwae1ajVxfvhHgUHB1pB2OZOyG+71vBz+GaHC4QT3RTI9
X-Gm-Gg: ASbGnctwiwgnEhcE3D7ZiT2WAIQ8Rl3HiMjYy9YJ/wyouwwxKovmIH6Fas1L3pMFG8p
	XljMha72fxJtLjSbAeV9bMTZuZg8HB8qbjuxeXzj+VlN032PdLqRwd+E+JOvXTz7S4h1NOVvP67
	A1MtCI6O2YXhwCNxFD+0CGWfN9MHxgWHkiy3f3++/w32DoVdD7WPeLpDtcDZtR5NvSTcYoZiVSg
	psRJiXr8tCMH2J0KlHLZD6YnlqgjrqFWZlceKgM3IXPrGVcESNfeHVdfZZP+RnmPaFzNXjBzAnS
	TOzpOEsIzacQSNzS25PiBJseCVAtbjliYcUI5Jozwn1X
X-Google-Smtp-Source: AGHT+IHwCi9jaCgG3lTclzF6uZLYafji1VSP1+CRBm1b+aI3RIZ/Hk32x4rxvZSCxm8+fr6gEvBlwA==
X-Received: by 2002:a05:600c:1d19:b0:434:a711:ace4 with SMTP id 5b1f17b1804b1-4394c8213d6mr33966545e9.17.1739271376099;
        Tue, 11 Feb 2025 02:56:16 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:cfdc:8258:1d0b:42be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm64088655e9.40.2025.02.11.02.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:56:15 -0800 (PST)
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
Subject: [PATCH] clk: renesas: rzv2h-cpg: Update error message
Date: Tue, 11 Feb 2025 10:56:03 +0000
Message-ID: <20250211105603.195905-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250211105603.195905-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250211105603.195905-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the error message in `rzv2h_mod_clock_endisable()` to provide
clearer debugging information. Instead of printing only the register
address, include both the `GET_CLK_ON_OFFSET(reg)` offset and the
corresponding `clk` name (`%pC`). This enhances readability and aids
in debugging clock enable failures.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index a4c1e92e1fd7..419dc8cd2766 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -541,8 +541,8 @@ static int rzv2h_mod_clock_endisable(struct clk_hw *hw, bool enable)
 	error = readl_poll_timeout_atomic(priv->base + reg, value,
 					  value & bitmask, 0, 10);
 	if (error)
-		dev_err(dev, "Failed to enable CLK_ON %p\n",
-			priv->base + reg);
+		dev_err(dev, "Failed to enable CLK_ON 0x%x/%pC\n",
+			GET_CLK_ON_OFFSET(clock->on_index), hw->clk);
 
 	return error;
 }
-- 
2.43.0


