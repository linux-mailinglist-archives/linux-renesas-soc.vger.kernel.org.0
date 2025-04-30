Return-Path: <linux-renesas-soc+bounces-16505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DD4AA4899
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 12:37:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC5571C00675
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Apr 2025 10:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0473E25B686;
	Wed, 30 Apr 2025 10:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ar3MVEeq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E5425B1F6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Apr 2025 10:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746009189; cv=none; b=EVS+JafihtllJt8Tf6DztuZYWZrHTcaL7RDdXtMCxRT8S+Bga7gAkYDJKsdsweLMaYo7vmMFTOn2UMzX9PstsUCVRnXxYgm/e6HCR5rbkT1cAJ+LyEIDmWl+3qNiQpQYUVNrDT7arRu9jcsEtbm0t+pTEL5/QpPSArShCwBO8d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746009189; c=relaxed/simple;
	bh=qqyemasPL6QK59u6QUV4f+mqdNA0WLZoLI0hQaQeRAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ViMuP6yrTg0ttBsuDOkMGWPMj8xtsTEkupXLYME9hd0kgUUzUMkDgxPJnOEw0mLaj6HXENXiAuOvbSBcLszYBUR++QpXkCagatEDdGRsEAJAa/pJbbqS3uJAnAOiOv873rdCeJsw0UPLBezNR9cI/8FHs1Rz1wk8KJZipdeCJmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ar3MVEeq; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5f4ca707e31so11832864a12.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 30 Apr 2025 03:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746009186; x=1746613986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfTKPxq4bZ4SwTcRdBqaDniN3wi53FAiqmOye0MFIKo=;
        b=Ar3MVEeq032Zsp2bufQHkoUShr0l2ARJ00SAzEmIxHbLo7ufXPfuT/OFIyzkjbHwB/
         8arCjpcysqoHLbdlRHedX1yniC1MAit4Iy61zTfmmZIb+kRzpr8Gju7toflkHnFr1ioC
         siWYCQ7rnG5t6S8fJNXn53WYfeM8Jajveq9c3o8JcD4mWeHHkhgGrC2or5IaW0li0pjb
         hQ8/Q+5xVz3yBufrns5L+OAr58s1kdAwnTkENCcBrjWv/mVla3y3YaM8xCkveG4/NgR0
         t0ZdJ2jKLabmgUxRK/h0CmhiiZUcPWCiKG0rNW70CTFT5I1NCixAVa5hpm1Ud+BC8XFI
         u4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009186; x=1746613986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfTKPxq4bZ4SwTcRdBqaDniN3wi53FAiqmOye0MFIKo=;
        b=acmnRgCUY31C0oqeVevV5u03j2t8rn0qTFqbNLudmhCg9YspsT07nIr2N9khFY+HjH
         9Z7a69zGsXAmnL2CX8lX999/PPRjaFMhlz6qGYft6PAzUWeXvbDJciz64EBXorffwPmK
         hO06wRgH4fa3a/sPPvAs72HYPkZXPAnrOAa5BA0nIrE+88Q11n1rNQP+krBe3jPZXfdE
         Gf6ree3mg3saFTtS8Ur1lrTScBw1dFQtoo+Ec0Qa8NfALI1RG83hG2BTXWJx6fIsKeMB
         gtbzqlBXEIO7Nj9PaNhbjhaAEvKNYWUfzUmbTXZ+WruMQcu3E1N7wvpz18Irm8RCPiCg
         yFKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtpdUIUezp9CYK8vcqMD5gTQ2BsxmuuWqh0bUlHQU5JrmaFj1YVZWrk8D5xCCzaLbOUtZr/bY+HXhRd9xBXC0/Dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQdWzl1xkaCUuy2VOl3N9f/OQl0AYWgPviPwK6wYD5NZKndkVO
	2V+DFQsnouGKxXhHZPFQsPa3dwcOMW2lQIil3o48vJui1mBCQ61Q2O2hY34kzHM=
X-Gm-Gg: ASbGncu5MbRb5sVSLXi37LasPcakeOks3vgWAt24K1HWzgsie8eLGGt3R6PCjBEUrlL
	jzl+paWOrurrQer7sLTBy/YIJX6nwlQ7Ng2SSbhwQKwrArQtbkTHtbg8tr88kIWHJGfRZmR1DAk
	RL6/uKFi6uTIdxYx7+JPplqt7Yf0HIg1KX5gbJFHMiVy/NA+HQcT/J1AXoM8mOe/1fpczx6Djyy
	9FvguAGV5kb256bjbCWKomo/8zx2PQttRRjt3KhCtMIYmtl/orZWTSana52nAFbeovip7LFxJao
	FNscaXV2TAJv23Ik5jMHmqSR+e7xEhiV0VGDahQ85l0miCIkiZVJ2jSUn/ATC+Pw0uLPG/A7wZi
	e6MVyOQ==
X-Google-Smtp-Source: AGHT+IEEfl+k3BC6Us3G4LOLDc9wt5JbZ4OiyNOr1AeXljqq4kLkSZXbAFThitp0f3NmQGw8dzbixw==
X-Received: by 2002:a17:907:1c94:b0:ac7:1600:ea81 with SMTP id a640c23a62f3a-acee2600a17mr193116866b.49.1746009186334;
        Wed, 30 Apr 2025 03:33:06 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed6af86sm909390366b.133.2025.04.30.03.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 03:33:05 -0700 (PDT)
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
Subject: [PATCH 3/8] of/irq: Export of_irq_count()
Date: Wed, 30 Apr 2025 13:32:31 +0300
Message-ID: <20250430103236.3511989-4-claudiu.beznea.uj@bp.renesas.com>
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

Export of_irq_count() to be able to use it in modules.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/of/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index f8ad79b9b1c9..5adda1dac3cf 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -519,6 +519,7 @@ int of_irq_count(struct device_node *dev)
 
 	return nr;
 }
+EXPORT_SYMBOL_GPL(of_irq_count);
 
 /**
  * of_irq_to_resource_table - Fill in resource table with node's IRQ info
-- 
2.43.0


