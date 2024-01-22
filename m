Return-Path: <linux-renesas-soc+bounces-1634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5729983615A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 12:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A4D61C25979
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 11:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2501A4BA8D;
	Mon, 22 Jan 2024 11:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DZWsPIdB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AB84B5AC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 11:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705921916; cv=none; b=KWc2f/dXIbArEZDSvo0v7JrKiEzR81h9CEyEmwW6HlgqnRCSWOAOh56Ld0TuMiEUuRVktj22M524i/ZinLNhN7DFKdgyxMJEKfVUqkzmRs/2vzgiJrft8W7/1yjidoSD4ay01zkU0J4H7a7s71KXXVNpufuDSTEnQ4hU8RX2BoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705921916; c=relaxed/simple;
	bh=zTlqsx7mKfKM3c1U7q3bgF1ozq6SPgRhMiKSXezx7ps=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c7/+h227b3WiS7KK2svmIV3/o/8btDOhP3XARE0bHj6Bk9/EwToTJC3L+NL3d4n8/zsfq6eaf5fJzmH46TADY1BE4q+MsWf2230ZcKf1y0Al/ADd9X0BcDu4I37GMVneYap4vb7i8FBTVIBBu7/NVvb+8AIxQImyKZgMj5laWxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=DZWsPIdB; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ccae380df2so28759821fa.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 03:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1705921912; x=1706526712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQQ0M1y0R9w1O9khQHwqELj36c//l3qAUiggBNqlLWY=;
        b=DZWsPIdBczQp1mym0FAttc4bI0Z56jLIXLHrtPecYWzvG2wfd0BtJcAp67PShMYVWI
         c2y2xHrton0QpqHqni8zdwTYZxefJXYR8wWM0R2Jt12HGLRU5UCGbAjZ0iXykAEmePro
         7P67A4SMGw19iplQD+tvvYW0oanClsul6dgXEF76LqYOecRWuah6oQB8iCP9ypudOlSg
         1F8KrwGFS32CTScTkAuKEWOhZV39geFHSM0J0fQShf90DcJakZbeb2n8RjcVSuo/Ege+
         1fFkkPh0I2DNFWmFLLIMz5tsEHqZHDoubGDQyscQj6HfOzI2cXbGt26FDfLloTXTHTFI
         s/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705921912; x=1706526712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aQQ0M1y0R9w1O9khQHwqELj36c//l3qAUiggBNqlLWY=;
        b=ajHDuyLU7hFVqEAx/GPIISlLXsv71ILtMRZeg4MUcJJcMaEZjPwBjfA5ESuX09At+/
         FRNahTUM0fGLS3ohJhPS3qfeGPMPxuI89KQ600oxQBchxz3RQHwET6uZNOVdbMGg8oHr
         OyOI8UK9XfeZXeWxqKCyXTqlvTHpK4G4KKtyTduPCrhWc5hwVzonmgLmEEhZSABa/Jz3
         +FwFuahQYr+B4NPZb9FBuBH8RpYe24jCNL1/Nod+5Hw8m4UJmeaxqf8GB+nN09FtJ2p5
         e0keZZZ2gqQRYrwZ5xrurVRzPpYMFSfIDQSmYKOkFTrL9L0ThHCAEvrAbNhYlWBG+Ka1
         KdHA==
X-Gm-Message-State: AOJu0YzEh2z3FwIv181EEEZh8aXNudY5gZPjB5WZBWrBUbb2wmynXQaj
	HF33d3hLE5h4Yv7vfq4YGdIsyvFSzBnICQb2H2uONsnpmWAAiE89v/8fxNd4t6c=
X-Google-Smtp-Source: AGHT+IHSSE1awmKtlpENu0dlTIoJBksSl9M22BcDbrDCiSEauFdroEktdrK8UjU0sUX9a3qUPgS0DA==
X-Received: by 2002:a2e:a786:0:b0:2cc:a636:d5a0 with SMTP id c6-20020a2ea786000000b002cca636d5a0mr1683977ljf.100.1705921912027;
        Mon, 22 Jan 2024 03:11:52 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id t34-20020a056402242200b0055823c2ae17sm14194241eda.64.2024.01.22.03.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:11:51 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 08/10] dt-bindings: watchdog: renesas,wdt: Document RZ/G3S support
Date: Mon, 22 Jan 2024 13:11:13 +0200
Message-Id: <20240122111115.2861835-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240122111115.2861835-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240122111115.2861835-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Document the support for the watchdog IP available on RZ/G3S SoC. The
watchdog IP available on RZ/G3S SoC is identical to the one found on
RZ/G2UL SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
index 951a7d54135a..220763838df0 100644
--- a/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/renesas,wdt.yaml
@@ -29,6 +29,7 @@ properties:
               - renesas,r9a07g043-wdt    # RZ/G2UL and RZ/Five
               - renesas,r9a07g044-wdt    # RZ/G2{L,LC}
               - renesas,r9a07g054-wdt    # RZ/V2L
+              - renesas,r9a08g045-wdt    # RZ/G3S
           - const: renesas,rzg2l-wdt
 
       - items:
-- 
2.39.2


