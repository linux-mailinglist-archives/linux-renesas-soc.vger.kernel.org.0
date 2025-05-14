Return-Path: <linux-renesas-soc+bounces-17073-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8521AAB66D2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 11:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30C984A3BA8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 09:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D60B2253E4;
	Wed, 14 May 2025 09:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RbivllH1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA0A224B08
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 May 2025 09:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213467; cv=none; b=f96egJHRiHmLOW6K5ZNllRwpRWdHty8heIaQMlKRedCXZNaAhXOtieuiuJigdKnfeLYukLZLB3HCmRH9VGtuORiM7PXMTBqsY6fAbBmT1zhzumKViiZpc5ooqtJDh9uoqsv2OnLmRLlcq/89SzO8TpczWtdd4TBnK8FRa8JyS2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213467; c=relaxed/simple;
	bh=5K9vutlNbCySpn2mNDTs4+oqYbErEJzRkyHBo6CSjUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SKYvOsqskR2X4B5a/rFYqOTESJ1P5L8iCv5FFmC9+s4fQZgBMATDJZU4UHgjQJJ9/b8ZATZmrGD3lOcr69FmNpz3Iw5VK+1zr5obmLVpGpD3B2pCYBv7TF2wBTdr/L5cklpD8m2w4XEPrA6xYUm5wvnPe5fCFl4jRHiz4ObTq1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RbivllH1; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-442ea341570so13812825e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 May 2025 02:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747213462; x=1747818262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P3wGtNITHa0U9o78hhbypZiCBzOOsk2GAy0wSEWd5SI=;
        b=RbivllH10Q9QTchRwQ9uc4Dd2nm5qVYmJvwQABgbkSafJB3aDZMHSR5dw5S2WpSSH8
         aGbqu9ThmPKGNDHezRGtYQFVa1SH3WUUTo+CLWISHirFmnsJ+IYAg/5/SRMiZWSa/WJu
         cO22pWZPv//sbZpldEHSZxwFBAWU7cyEoK0mAuYCQZ16+b2GfcA5IUsqm6Isg64b3yuN
         dcvQ/zjf2rTkp1i6ahze4XzWjngOroe/hVushea33xVxjb445peCXwgwhbnAc9x/RYh3
         t22OsS+2KWgiYVnBN544tgdt2vNgH71RT3zgUjNi3CEUpcAnqYIHfms0muWuHf93R9fg
         rNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747213462; x=1747818262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P3wGtNITHa0U9o78hhbypZiCBzOOsk2GAy0wSEWd5SI=;
        b=PzbFLJFghYHYbtHgG6BedUQaIyyEguXEHSbBUipwsigeQPJIXYQS575sFAWXMg22+9
         SZ0VyBmMn7gwedEerZyMKsB3kTKq0gKGNMQ+CYFpuaPEmgnYypujirKK95dStXBU+tI+
         sl0BQVaMPl38JiuAM85NXABsplSnoGQn3hAsKoC478FRu9/79i88OdnLp3c+KmP30ISK
         K9zSvrTvXF8xhghexYVwkNlxHCMQwtZSVF25OAqTeQq+wW5NOgbn49A6BzieRHTUJWd4
         n/MneNJ8WhjQu0KOqwQmRTn3GY9GHuZJIJuYZp03R2v+tn9izEQByjaORi4dr5/e0CuU
         B0ig==
X-Forwarded-Encrypted: i=1; AJvYcCUJuO2eP/scjMoT1xvDqin8nZj2t9h9xftEr73t7kZx6iHNraBIgp+bl6pMBSzqGgt8+/9r2LJW18fKlZS8+V5pRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRUnmkNinWNF6PNbiA7cGuxqpGnAITiHZnJVl6RQodbkMkhbvH
	jsKoLQWD05sACxM7+Ye7j6kBEy5g6+K6/JDYwv/xmefgmkpcpnMgPvbAPQdDmxk=
X-Gm-Gg: ASbGncsFxkJXMOCVk7WodeXTeKW2t9w46bSO58pufwAPCZRoAFiWfZh+K1DG1Zc7GGF
	M022558OSlVpymb3S14bYyUrX+w00kSuxXi+f+5NOf6gow0wOgfQc43DbnVT7SZTcz5snqRmrE3
	KsHIg3REqXUF2ETBFEV0tmexFSgZ3bB3x1cCHsAOfDvfbE5WCI7CRL7iA10Nu/8kN4Wmtisjc+M
	/oy+jwzT+V5snyRXjKPNa5Ey01jdrL1efswmDPgW+P4deEDRN7Ub2mTvCIvKQmKovg7ri2BPCcm
	d7qvt6B9+cBo7Ggk8wqbl/jM8TrzWBCt6lmksxV25FwaRy5Bv3OfG3SFhwOLARyKWakR81kPwC6
	jAPrzpG/ATgXItP8=
X-Google-Smtp-Source: AGHT+IFjZxHD0RqKbm4Bz/XFWoN+olN+g7TOLkSX6yfDvf6e23UqKDyHNvx4g80jZ4+20Yv+zITBSw==
X-Received: by 2002:a5d:6342:0:b0:3a1:a96c:9b76 with SMTP id ffacd0b85a97d-3a34991decbmr1659237f8f.38.1747213461891;
        Wed, 14 May 2025 02:04:21 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfbesm19286561f8f.10.2025.05.14.02.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 02:04:21 -0700 (PDT)
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
Subject: [PATCH v2 0/8] clk: renesas: rzg2l-cpg: Drop PM domain abstraction for MSTOP
Date: Wed, 14 May 2025 12:04:07 +0300
Message-ID: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series drops the PM domain abstraction for MSTOP to comply with the
requirements received from the hardware team regarding the configuration
sequence b/w the MSTOP and CLKON bits of individual modules.

The initial MSTOP support for RZ/G3S was proposed here:
https://lore.kernel.org/all/20231120070024.4079344-4-claudiu.beznea.uj@bp.renesas.com/

There are no DT users of this abstraction yet.

Please share your thoughts.

Thank you,
Claudiu Beznea

Changes in v2:
- updated the title and description for patches 1/8, 2/8 along
  with their content
- added patch 3/8
- collected tags
- drop duplicated mstop lists in patch 4/8
- detailed changelog for each patch can be found in the individual
  patch

Claudiu Beznea (8):
  clk: renesas: rzg2l-cpg: Postone updating priv->clks[]
  clk: renesas: rzg2l-cpg: Move pointers after hw member
  clk: renesas: rzg2l-cpg: Add macro to loop through module clocks
  clk: renesas: rzg2l-cpg: Add support for MSTOP in clock enable/disable
    API
  clk: renesas: r9a08g045: Drop power domain instantiation
  clk: renesas: rzg2l-cpg: Drop MSTOP based power domain support
  dt-bindings: clock: rzg2l-cpg: Drop power domain IDs
  Revert "dt-bindings: clock: renesas,rzg2l-cpg: Update
    #power-domain-cells = <1> for RZ/G3S"

 .../bindings/clock/renesas,rzg2l-cpg.yaml     |  18 +-
 drivers/clk/renesas/r9a07g043-cpg.c           | 132 ++---
 drivers/clk/renesas/r9a07g044-cpg.c           | 168 +++---
 drivers/clk/renesas/r9a08g045-cpg.c           | 227 ++++----
 drivers/clk/renesas/r9a09g011-cpg.c           | 116 ++---
 drivers/clk/renesas/rzg2l-cpg.c               | 493 ++++++++++--------
 drivers/clk/renesas/rzg2l-cpg.h               |  66 +--
 include/dt-bindings/clock/r9a07g043-cpg.h     |  53 --
 include/dt-bindings/clock/r9a07g044-cpg.h     |  58 ---
 include/dt-bindings/clock/r9a07g054-cpg.h     |  58 ---
 include/dt-bindings/clock/r9a08g045-cpg.h     |  71 ---
 11 files changed, 603 insertions(+), 857 deletions(-)

-- 
2.43.0


