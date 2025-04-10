Return-Path: <linux-renesas-soc+bounces-15752-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BD1A845BB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 16:10:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 874B59C23AC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 14:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2EF28C5D0;
	Thu, 10 Apr 2025 14:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="AI1DkBSq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799A328150E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 14:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294004; cv=none; b=N51vFQ+N/z+tN10ObgJEBuf9WCnVjZKoN/pNYWFgUVFSg5/UfqCOHKPTi0lONOEFedGLqXGj1G5H1MlQ0PQMiPlok6VIh4xRJgOadn8x0mp1sJkb86f5bEQ2ifaAHXWIVPlaFvtm4dkKRPZGG9tXFa1+yowpTPf1HEh1HkZfS6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294004; c=relaxed/simple;
	bh=hbP9+zw0Fcw1ISRojomtfQ9Ytr8BAnXkESaQRO8oXIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t0cBouROTIC/bgmKUbNHo/vARN7DgRO0eDqFcy2XSe82Xy4DSDIU8bFEstzfykTPjj0cRmUoakemJcH/6Sh+nurPIGMwhQ26l+fTIX7ukvdOh66cc9v57UkwMaEfdwTZQCpUAOa/fvXrcI5hQb+qhtbC6mCuV5V3/wgPAAA/FJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=AI1DkBSq; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3914a5def6bso460001f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 07:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744294000; x=1744898800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7A/GRyhOtG3bO+YzatmKCaSfgKvP9KmL+6FQr6d4sI=;
        b=AI1DkBSq9+1MUrWQGZv6I8wJuUzBEfPaJcNfo+O7hJLspydBw2lfo6JytSpPMKqI3T
         6gGmVZOpq62YUYZMKsfKSBz/B8SIvvBGjqdJE8YpmWjVQIET49+dPg8s122XV04U8Vm2
         o0aUk0uVBcktqxundlvGZynLuTn9GFgby807pvWghLypJ/l2JOOGhOLSXD77T3hzyV6C
         2FQ2wCjryTiWYqP2SSaeQmmWPQ+f4XLYXVgtN3hic0ElWfMA2fIfRjOolJydCZn/zABT
         Mjh/mNqTBrKtyv3G9490V0ERArZz7CEHBweL3dvPYFnigf4NOwAyjZ65vBKBN7cEeVT+
         NVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744294000; x=1744898800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7A/GRyhOtG3bO+YzatmKCaSfgKvP9KmL+6FQr6d4sI=;
        b=vpajDkILgRz3TTYJQxJ/pSuC02ZFuDU/BmBpfUjvLxXee2cxAG695liQgOC49ZNsCQ
         2D4ps9D4dzrdYTlOXLwdxOtjdq4MuFyxAL1At25OujPzsIcr9ZiVcUtmjGwITThQHogc
         Tni37DgaiVKIRcDQWQqK/AJyMDB4ZcngdcZHzucgZBigKBuXefRcr0Zakm6m8TfnUjhL
         bcJXUnN1ySQAN2aiMcniayVp44LyW5rl+zgPl1gwJNgk0DQcfMmrlHGNaLLnpS+HAcOs
         redv4blZCjcOwft70JZpkQBP4L/QrnmwHf3EUud5btUCxBtc/+V8rDxr8hxxTAKq0PFj
         PeEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw3F1UXccGw23zdoM8XUHav5nSBRVQrzQjAnsc32v71g2gW7Q5rOAKhMcpIDhm6kfLNNrjoc2wiwdkNfFEtfesJQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMxtubn+BR81oDQC2Oa27pUIEl5hMkheb7m5g5uV4mkp7Dyac1
	2cN9cqbkgYSCft+JXTQxUlfC92+84NaHm9Q4M8q1/1leeM/TD7jtswd5BqsVba0=
X-Gm-Gg: ASbGncuuWHP5UIcJpLnazN1D/dx/NMPiVIuuDMc5GvZi6yg2rOyp0kFyI7HDqOjoyqu
	biw5FjIKPrh2BClqi8mYv4/V7GqzzOG9hhiQgzVyLPXeLAmd+EUGR7R8WkRceD0h+aWfl35d5t6
	B7DnbiT+xE+7bj/8YoYHMNGOYLCVM1xDunA9Uvt88QRh/prWeZY8wp+B+b6IRJGplPXxPOSFoDT
	pB1Yzs0n3WNPipkrjeHSLIiW9X/6ZFMomYFLXtibVhPK6eLVG7xqQLkgdJNczKe9l3iHSdCbwYK
	Kqtelq6pLw4RWKzEmW8S22KlltKLtcU919CSpvhzum3SPYeT4RremUs+6frzuPX4S6Dd2g==
X-Google-Smtp-Source: AGHT+IHHzYrWkYVJB2jd3EaUVrf89hE8xWwgx3sxtfVkK50L5LRAbxgU0L/HY6E/Eihy7Wd6XXe4jg==
X-Received: by 2002:a5d:588b:0:b0:39a:ca0c:fb0c with SMTP id ffacd0b85a97d-39d8f496e01mr2596448f8f.28.1744293999580;
        Thu, 10 Apr 2025 07:06:39 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8937f0d8sm4806913f8f.40.2025.04.10.07.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 07:06:38 -0700 (PDT)
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
Subject: [PATCH 1/7] clk: renesas: rzg2l-cpg: Skip lookup of clock when searching for a sibling
Date: Thu, 10 Apr 2025 17:06:22 +0300
Message-ID: <20250410140628.4124896-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
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
populated. To avoid any issues, skip this clock when searching for a
sibling.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index b91dfbfb01e3..2ae36d94fbfa 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1324,6 +1324,9 @@ static struct mstp_clock
 
 		hw = __clk_get_hw(priv->clks[priv->num_core_clks + i]);
 		clk = to_mod_clock(hw);
+		if (clk == clock)
+			continue;
+
 		if (clock->off == clk->off && clock->bit == clk->bit)
 			return clk;
 	}
-- 
2.43.0


