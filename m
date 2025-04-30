Return-Path: <linux-renesas-soc+bounces-16503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08942AA4891
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 12:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D6C51B63FDD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 10:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1E53246796;
	Wed, 30 Apr 2025 10:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MmoMXDQp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC392239082
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Apr 2025 10:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009185; cv=none; b=cHQQleCatOjvU1w4A7nSOXciQMNxbW6rtVq7XPFWhnMO4E74DxyLKBpKIcoB9V3Jzb0he2KmSflItt0ldZ+RIdbRK0zHdWHo7Yf5ua3vqSEXyYWi1opiZU7WeaSQVEp4wr87PZMKFasR5SFQ1SrHPZ7XMZGkRfOQbU8U2IM8YQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009185; c=relaxed/simple;
	bh=VF5hE6k/MDcqLuREIWpFmNpYxebRlFOo17tVqVOfzy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TOFzTULOYc5vD46x/aYelbbjc3+BBOMmT5dUYEeTjfYxUeP7SZO3tscd7oggkHNiX2oKtBNDvKwwA6AaK2AUl0rR0KmscAE6w3d5vdAdSCUMRmnB1YecQozU+XSglwGOt0Y1ZpwORyH7U+ne249ck3OCZO/uLwYNazgj+V1+h3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MmoMXDQp; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2c663a3daso1414062366b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Apr 2025 03:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746009182; x=1746613982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nn4Lhwi6wj905Yh1K+BGwOU5DNtShR8+dwNym0HIX8=;
        b=MmoMXDQpSkwPOL1N3wM5PlpsTXW1hbo6pivRv85iro2MISs7YSPBZnNDrh8B5z/+dS
         ZEW5KB2ecmF6RlXa8qdhJup7dfwZT+OA7PhnEaieQ84nmcCux7bC88CF9m/ChaY/d+IY
         wNoHrsNgpdnStGgWXKKS9mRRWWR1aN6lEH8AMCpyUJJbChfkefqF8ESYkuKbkmh3qoKQ
         Ax3Ob8NTg+ELSoAxDd+cviyQcMup8UowetRfAMIfTbEjFAQKthUOwystrtGVNUYKnId8
         z2DVGvOnYK7Cq/y0fEGwUFZzJl2LzVfUefE8sq7QnMFCR10Upz0iWp14YRoodxND88A8
         crrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009182; x=1746613982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nn4Lhwi6wj905Yh1K+BGwOU5DNtShR8+dwNym0HIX8=;
        b=MXlJnOF36qGYvW1KyBhlXa83Z4W26wA8mZu3vlcre2JppUfLZnpVWJH3WgGBnPvJZ5
         Rif4xi8fHIjySXXJoSnWyTPzESe+X9s/Y4nCsJs+WYQWn3WIu8+zEfR079kBjRse2MdH
         kgvfXQC9zIiuv7Ty4oO96nlYckhCD0RrAKOR/ujo5M9Ualb1PHYZQKgAS3zsrLR1FdCK
         4Grx+4kMPCw7Vc9rUB68DohQsQo+jL4aei8Q2XTuzit9f6Ar0DkqezbPOMhmMJulZY7S
         33XEie2uS+ajWvUPVpI4ZBdloLdqf04gmy3k8yV3iOL47kL66P+g0ru+FLa5ZCbzLXMX
         lR0A==
X-Forwarded-Encrypted: i=1; AJvYcCVWXLcHTM/LqgVx8SCDSi0M1kb9+kYzuway0Ufjp5tX+HAplRHzkG6G5dGtAbEKcUsKTqXNFQ3Z2Jy+VjTvkQxmEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJGX4HkDL3IdfjHSe8aofna/gFrtkAiCu3BVMpl96+/vtHnkN4
	0G6lZe8kbFKib7ANJELd1v/F1JTtA7fPahpMki1wwHF1xhwNLL/BUOsn6jm0kbE=
X-Gm-Gg: ASbGnctb92b8xpyw4VQeRQkLzvZ/qg0sO9E9E7+gjPEt3DI0JRqXhrcibAECQ4LGt7k
	GLEwqiqSXeBKXe2+g9dxFxk/miCR0MXUfr81mdOs/FlJqmhTwbngpCFc/ceni/NofNYjP5oPXzR
	teKtl3wK8036T7iJTp4tHhp5Ge2jl4Ke1ID/A9SaBlNanpM0I5bq6xHLJfspMNjSH5SZT+4wvDQ
	jEBNDf4cbS6Dq64dVcN+Km5lHlfsaLZ218YLpaiIUlRjCiS4uaFb1ch3wUSmoUk9/kbUbXKzmyv
	OV57ZjXPAq/fnG9jR76R1pEchSMCupnESiau3BhNsJ7W5Osq/IiRWRMqwQazxXpQy7uM0vA=
X-Google-Smtp-Source: AGHT+IH2N+37bdEAp6umDXJ/Tn+PS9iQBAS/tLfvtmUbmUfhbibyBqoqYkGkCT5w9FYdpi9e+fyJqg==
X-Received: by 2002:a17:906:c10d:b0:ace:6f8e:e857 with SMTP id a640c23a62f3a-acee1f240cfmr179989866b.0.1746009166269;
        Wed, 30 Apr 2025 03:32:46 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6af86sm909390366b.133.2025.04.30.03.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:32:45 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	saravanak@google.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 1/8] soc: renesas: r9a08g045-sysc: Add max reg offset
Date: Wed, 30 Apr 2025 13:32:29 +0300
Message-ID: <20250430103236.3511989-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add max register offset.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

This patch depends on https://lore.kernel.org/all/20250330214945.185725-2-john.madieu.xa@bp.renesas.com/


 drivers/soc/renesas/r9a08g045-sysc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/r9a08g045-sysc.c b/drivers/soc/renesas/r9a08g045-sysc.c
index f4db1431e036..2eea95531290 100644
--- a/drivers/soc/renesas/r9a08g045-sysc.c
+++ b/drivers/soc/renesas/r9a08g045-sysc.c
@@ -20,4 +20,5 @@ static const struct rz_sysc_soc_id_init_data rzg3s_sysc_soc_id_init_data __initc
 
 const struct rz_sysc_init_data rzg3s_sysc_init_data __initconst = {
 	.soc_id_init_data = &rzg3s_sysc_soc_id_init_data,
+	.max_register_offset = 0xe28,
 };
-- 
2.43.0


