Return-Path: <linux-renesas-soc+bounces-17548-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E99DAC4D1F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 13:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D988189FB44
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 11:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D32825A2BF;
	Tue, 27 May 2025 11:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="j3+vslsy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F329C258CCC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 May 2025 11:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345057; cv=none; b=N/6q/IGnP5GmSaOmX5h1j6B7JdmSS3ens64l3Bnpwvf9EGtst3kIB5c+zVUSVg2LHuHl8ujhhUIvjRs9MwWZDhyCsA/DcJZO6RK9668F37v+bcFQA9Iukp3IoN0t/P3lzyycNOJWH/vNW4n/4q8wR+xPGDmDDhGEGrjxrIw4sjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345057; c=relaxed/simple;
	bh=ySv8MiicG70yIYdWD/VWDHOvRt6DoXeDwWbcOVt2NPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ryLzdEaG2d+aE/oppDYxjf+Xyx6lVRVfZkf0nUTjn8qBD7LaPlA6NsbBvYdaZSeH+C1qV0B0ivsnwQ17LgaWvmg7XfdnmKhSYcG+uI+0HEz9gB3RFYFJUwIfp6dw4BC3NENT9KpEH8SZjG3UWGLLOtOfZyWWDjxt4Mm7kBanCfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=j3+vslsy; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-602e203db66so4685843a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 May 2025 04:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748345053; x=1748949853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jQMddyz/b9XXlkxpzbvlzuW6mWfFvIUAfUlht1RCuA=;
        b=j3+vslsyH1dtFNBODGdVCCgWnY3MUxuhLPYUAaGWlBHlt5ChsZ53g7hABUkP0piTub
         +HdNhwBushnodlSCxAqfFXZasHfgNgxB/TsUIySrGl5Fce2GlwlifXZHJAcXspGXhQgF
         iS5eN1GNAAfxFjAmyGqu8Si+35YipzUJb1ZHBGtOEgLOwdIYjKXXfa1c2Hnf8T0h8Kew
         O2QT7d5rEwEhCUNE8Ke4eIoSL0p6aq7BgQG5FZCfx51lTqcloS/Q2N15e2P8YoY62FWe
         SALGWm7tz7NkQViI3A+UjE0Sr8chvrGeIOI1ujq37/cagkG3SxSWUNfUXNEApluz5Eos
         LKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748345053; x=1748949853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9jQMddyz/b9XXlkxpzbvlzuW6mWfFvIUAfUlht1RCuA=;
        b=T67X45sBEERsE4ScoxAVjq9CGEcc1NuCmx66PRqHmN8ww7I3L05ZXsHuuoTr/JQNJb
         V1di5k4+Eg/XqZgMRI5aDzrozKtCJtHeGTLRiS5LQTTQd8yzxe3Kaw5QwCHP9ggOCkC/
         rTKyys3D6lK7Sr5ca8NCA7BIcS79Sn/stqBqihyyvXwoJ/8NUx6xuCyFOpf+fHo1grVz
         1ve73LS+jFE982ih0I31RT1ZurwlGpGxLDwI2PPqMjBTIxfgcqBuvN4h4/UMdta5zRvS
         wQCgiBpMmNSYt4HuzfALDpvx29oBvV4tFDlsAodlFQheMSD5OuBA5u9WF1LqePhTh5io
         qOJw==
X-Forwarded-Encrypted: i=1; AJvYcCWKIwS+SY8ntlPjb8ISwgjE7iyVA5NVKIdIsjKGh8hToJ3hFAgFf24gOaWE95N0VjEDmbCQj1mF6/yy5ZGaabQ9Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVJZGV6T6deEfHZhlNQ7IepquY/hS14ZT03Fs9t7QbG4C8/N/Z
	37xDl/kEWaXNLB/8uePt6uwy9T9o6dEKwnGcEVJWofQuU9PNF6ufEj9gdbIRmqH1C0UiUsuM77s
	kT7xA
X-Gm-Gg: ASbGncsu+rN8oWYCmzZZ4R++9bM7JZDRQnEOJPP95U4Z5YB8h1P8Z22czUVQNEAk9Xp
	J0dTlMfIYrLeBXblN1QPfNLHPjdvqSSPNmt70LuaoBe1Ber8Ggrm5E/nMzGO/LcEOOLotDm/Lez
	ApZsiI8yLgJfPP7WSzxhiYpAw6o51rmr/IGBxuOdom3oWJj2chPVKOHccDcc3jugsKWFrm1WLCr
	AZNIIyWCYNyt1zHONKmzuj2hme6aXtb7ZzkYUsYQMO7/1x+5vJi28Zij2GX3L5ftiIe+JiWjdXf
	z9sUqtPRJ/0EqlkqvLPiuG7v8StP9IAHYkuhkgoGx6sRkhJuDUVmkuYczYg4nnWfAorU3at3v5L
	pR0eR
X-Google-Smtp-Source: AGHT+IF5akmMqw6CEUbR/QQ6FymHHooQEWDKvO6sDDOO00kXHdchwWD6GzRsG/MefjnDhLywbLaIOg==
X-Received: by 2002:a17:907:869f:b0:ad5:a203:b6ba with SMTP id a640c23a62f3a-ad85b22bbb6mr1281210966b.43.1748345053131;
        Tue, 27 May 2025 04:24:13 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d438403sm1807297466b.123.2025.05.27.04.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 04:24:12 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 1/8] clk: renesas: rzg2l-cpg: Postone updating priv->clks[]
Date: Tue, 27 May 2025 14:23:56 +0300
Message-ID: <20250527112403.1254122-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250527112403.1254122-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Since the sibling data is filled after the priv->clks[] array entry is
populated, the first clock that is probed and has a sibling will
temporarily behave as its own sibling until its actual sibling is
populated. To avoid any issues, postpone updating priv->clks[] until after
the sibling is populated.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- postpone the update of priv->clks[id] as suggested in review process
- updated the patch title and description to reflect the new approach

 drivers/clk/renesas/rzg2l-cpg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index a8628f64a03b..c87ad5a972b7 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1389,10 +1389,6 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 		goto fail;
 	}
 
-	clk = clock->hw.clk;
-	dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
-	priv->clks[id] = clk;
-
 	if (mod->is_coupled) {
 		struct mstp_clock *sibling;
 
@@ -1404,6 +1400,10 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 		}
 	}
 
+	clk = clock->hw.clk;
+	dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
+	priv->clks[id] = clk;
+
 	return;
 
 fail:
-- 
2.43.0


