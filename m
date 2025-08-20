Return-Path: <linux-renesas-soc+bounces-20766-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC82EB2E393
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 19:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86BABA24374
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 17:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86C26277C8F;
	Wed, 20 Aug 2025 17:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+G6ID/H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9974424A063;
	Wed, 20 Aug 2025 17:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710299; cv=none; b=oKF/i09M0mA+CcY/adglTGyASx0UIqR84W6ocL8sjuT6Tw6nw+4oiJQeB5hBf4hIhfFiIaWN3IWBTYmrycwg5VCihpBmgdGEbgJ4XVnBv7TK00za13ZjRc1DL4ChpZb6YgjABlaL7NwSWW6eTGQvbLajZGcLktGamEk4UzSBTkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710299; c=relaxed/simple;
	bh=CmNWtLZ2s9K53e1ONqlsg46UiADNACIlzrJX5ZDlR6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FvCq7wGjwGWwZ0aDIeWN8ZTL+YF2eIb0hZE+WoVfwkdqTA7GNfqyh8bu9WFSxNKtVo975gKN0cejTnjnfBQwkYKRYqzruP0PLhmGC6TgNDyOY1kVEelwbu2j/sA5TpcvSrr2IfySs47rug8hfJ5fciP3jZ2zmov0IvQZbA/aPs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+G6ID/H; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b9e4193083so155304f8f.3;
        Wed, 20 Aug 2025 10:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755710296; x=1756315096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ND+OuYZtU8cHDfP5d0xay3pHHejc7Ij+v8jKbCIAZE=;
        b=g+G6ID/HnvcdtA/bGk7cgAGWu42Ps52jInVt0fQ7eK2R9xAEo3fQ1TR+xkCBu+tTwH
         Vk+RQyjBFUw02I5Hg2JRswrs/l4loAyUYDkjqDD9miuUlp8p2VAFIDXzUX9Yr2nEjlxg
         I8LaF/KoZUw4xZXZ2b42IBBTKlmOAnSFUMyg9H7LdBvdwGG7gsvqpt2zpW/pSKiQwo9D
         QEQ4BQuIbagkQP5Ojyo0MVwAI/NVllD3XKCo0tb8znfPamGdh2RKZuFvN1WRkyYOlrww
         i27bWwmXqjKACK2i1aJXdIyAyFX4EaPNuNvUqeuqOUsLLG9DPQVnwrKAYsFVr9xx37AS
         Oe1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755710296; x=1756315096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ND+OuYZtU8cHDfP5d0xay3pHHejc7Ij+v8jKbCIAZE=;
        b=Pzpr6un7WKF0v+d3SyRMWrEVT5iE/poAKY37/FVJLsyjpnBY0Vf5MNlUCL7HhRjP2w
         nTbIYkb1xe5V4ho1waEdC9B8rv02pQ3n9Di015nk93ZfHXJU1hDI+av/V+nd64N4fWFh
         yYV/Rpe2qGOLByOXHxHKbgcwtpYrYt/Ra095g9Dar5aZGEq/1Oy+4h7JkShPj5FQKqby
         xl+mQFaMmuxVz7gC1bOcA4azlCeExH3nYPwtitg8dFLRIqYe1sR8zJ4JJF6Zg19Fwklt
         aJtfYrkY8XEtO4zEDpX2gnUvr3zTnXtZarq/vXH6Kq6fKHElnDRYxTkB/DuJpI1gymKM
         /uxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+okOjeln1C+Fwes3+8fdu+bk4JSCDRegGQX0Am19aKdVzkcInS7DIFOOgyZ4nm0ALgmhn1pwZx8mV@vger.kernel.org, AJvYcCUeEBXW2befGK8vMOFPLuW0CZV3VBUWLd7CmBO4VWxJQaUHw3wgy0VBQpIbiJK+fpkvtU6/cvrm6odM@vger.kernel.org, AJvYcCVDUWwsR0RLvdfO85JTJGzhWHIOS3EDOFvvvHFYYWk7pwAslu5L8/kV4mHJAaoOGL9d87bPFluUpecgpUuI@vger.kernel.org, AJvYcCWlHa2Rztyzioh4rXG1XnqqP4WzRxtUchJEUoibhJusFLtWROz+nZsUPQWf0fkD0oedvX6VimIukXTMst4VIEMJj80=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVd3oWWXs2dCtL3qzQec6rHd+1WTDzVWkB3XXFr68aZWWR/KDO
	in7FsmMPAwOhLw3OBcVEy0jDCzWH5Sn9Db5RoihSXUoubZ0yojRs6ptf
X-Gm-Gg: ASbGncunu6HfETVZNENRGnvpZuGkt8p5QdfLtG0qx6NXVjw0iJapKwr5ZaqwdqsLsmn
	ztPaTgApOlFAOiGdddsnXJG/mcNhm5c1yWIc+Lqx8A6oen6oUi2M0S/bbkgd4EyJpu1YLdcqPJC
	l0O6YpZQv9XiVhSfGzUYOv4U6UmBbLL5AIWUE221voKj5tme5EozCdCTNQw8z1BbE2X2bm1QLoC
	xUHNdGg+D4Gxw1qz3d7rIhF9dVghvqopNFyR3Q5l2s7dINDolnWZgm9oy2IdGTl3KrkT0FWzHGg
	YaHDhaO8S8kFshSOLBktGF+xf17JmwxlSja7INn0thipmqAl3WlpyPrxNzCVoKI2HuCxwk1V3LG
	3kpIGPUMAVGsmt5oemJczMYjtptGEZSimhXgFxxtt4lovttmSGCSsuQwiupWBFyJNakKxnockfg
	==
X-Google-Smtp-Source: AGHT+IH99TSCBjgQlZV2cxN4ruzMS93qT7bj6JHQ1jwesjD7kt87OQj3cO0bYtjR84SdN60QlkR0Yw==
X-Received: by 2002:a05:6000:20c6:b0:3c4:655d:f31b with SMTP id ffacd0b85a97d-3c4655df82amr182161f8f.5.1755710295613;
        Wed, 20 Aug 2025 10:18:15 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c2865dsm40319815e9.2.2025.08.20.10.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 10:18:15 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 01/11] dt-bindings: clock: renesas,r9a09g047-cpg: Add USB3.0 core clocks
Date: Wed, 20 Aug 2025 18:17:48 +0100
Message-ID: <20250820171812.402519-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
References: <20250820171812.402519-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add definitions for USB3.0 core clocks in the R9A09G047 CPG DT bindings
header file.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 include/dt-bindings/clock/renesas,r9a09g047-cpg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g047-cpg.h b/include/dt-bindings/clock/renesas,r9a09g047-cpg.h
index a27132f9a6c8..f165df8a6f5a 100644
--- a/include/dt-bindings/clock/renesas,r9a09g047-cpg.h
+++ b/include/dt-bindings/clock/renesas,r9a09g047-cpg.h
@@ -20,5 +20,7 @@
 #define R9A09G047_SPI_CLK_SPI			9
 #define R9A09G047_GBETH_0_CLK_PTP_REF_I		10
 #define R9A09G047_GBETH_1_CLK_PTP_REF_I		11
+#define R9A09G047_USB3_0_REF_ALT_CLK_P		12
+#define R9A09G047_USB3_0_CLKCORE		13
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G047_CPG_H__ */
-- 
2.43.0


