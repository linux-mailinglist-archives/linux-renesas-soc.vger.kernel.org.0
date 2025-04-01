Return-Path: <linux-renesas-soc+bounces-15229-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9260CA7771A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 11:02:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5EA81644F6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 09:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4B41EA7C1;
	Tue,  1 Apr 2025 09:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mqz+4jAA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76B72E3398;
	Tue,  1 Apr 2025 09:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743498124; cv=none; b=AE7aFQUuPcN8tDzDvapHPyzGFD7lUAWGvC91U55smaMMNIFw5k/NwprqcDQBpvUeJhQwdl+utYbn1hwKLE64Ac1ELN5yNRDyhPwPkTFflCL85btba1Vee9B05/owHM97m91HH54GFnsmQe0mTmRQBtCeOOL7wC0U1PFkYpfdQ8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743498124; c=relaxed/simple;
	bh=VI5yT9jpHjlzg60KJwY/XU6fciyxVu2IGdFjNie9vpo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qalXQ3ScZEpyXIP5UPpwZlWRHP1Jf5pbWYh3IrBTxYptQkXtd8H2OzEtlC27e9m3FYrtKqof+9GNm/LoHQzedAD9zXD/MvdcXwX9eJLjsMjLlMxsVW6JrEtHq895yVaffTFuETK+Nmh1Kb+NCyr4Yh8bl9lN3LzztkjIYeK1XaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mqz+4jAA; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso36976495e9.0;
        Tue, 01 Apr 2025 02:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743498121; x=1744102921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vXhLpKVjnwBdZ6H+LETE03eu0VWJLVcdTshCBskUvJ8=;
        b=Mqz+4jAAd7PnJNlu8AWZxTuCYEYU0wzM3JzgAVQXi3qLzwSQ0Y7JeKfaN2k63tgUpc
         /LdOpH7SRPXtmCY8hOBkw07ZnpExUmmAg2fZMGyN/YAp2jlh4KeNSEk7Un7Ute1MZs8d
         IZkpdcMJKxrUbNpeRI7oBq66RHG6Emtupg5OHtY+HHEZ8LyijqX1dS6qkPbaFYCbqWwr
         cY9VaPzAPILQNIy7F7UKvjSDO7cWM1Zfei1SfsmdD/SwephtqMsTAWvcXHIiqQ2OHAvS
         19Z0Ks2If1mjT7yFDeqicB/HgWv6VchBpp044bj5YRnvQvCt5P6eftYXW6cVbtH1x2Cu
         0ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743498121; x=1744102921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXhLpKVjnwBdZ6H+LETE03eu0VWJLVcdTshCBskUvJ8=;
        b=JLA7mxTbZj8ansERjXdexvfE/zONSIIhFIGYcax90C4AowruQDScQYY1ngsV26d9p7
         IAbvlaNIl1pmgxZBNodJiH//DCeAl68Ym8qQyoa8NmoqJmVUsCQ7owzlzXaXH46av4hI
         hQUWYm8j9fJshss+VOJHIt3JYolwOZNW8CReZvX+F8wXJjSXU2kfyr4DuD/bnJrYpEyT
         8hcnOZ487MuPcP0gl8twQ23ghWQLGsfL13vkgVcJephBvy1ZSa/roj7808lbrrnPWduv
         zRA5PzbVxufnFKbLBeequtynpFvmZeDDFMzvf3zUc2jewyXv5numf5QRNP4yVUyLLYrF
         jG7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUBZFae36AAKO5dQ4Y9utJojzFcdL/eKAEzznJOWV5QGkOBeE+NmH6CBgKOs3goQe9HUm2wcjg6kaQd0BwPY5YuskA=@vger.kernel.org, AJvYcCVLZSXv0a49nybXdeTbDjlZe7llM0lelFZdMSWpEgztCx8vMvC2aJI2akgOAq5NBmLoF3POY++tGZ7G45I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyP1kMN2n9CPJI+dwmeYLjoyOIp/mHOlrcs9ZWhRihn11eCYk9
	+jjQpgeQXgiPl2AkEvSiGPVpP8udAkJVVnfwcGhwOcIgFuf1heH9
X-Gm-Gg: ASbGncvHkjk6uSTz3g7SpTXBLQywsHtePKHb4Vj6AYIPF04rbVeq7S1uW5WyYga78fE
	r2SrP5vtOb2T4AfzB2kRQAhs4ak91F8WA9SWjxgeGN5uQLXIcz4OEWNEQusDur/8ocXjjM9jruR
	rsP18bdDbgifmJs2YQ8ZZD0YPmrkC2FykvASV0HMWJTJ7jDXbfbMWfuu3ryj5Z8Dd2kNyE4V16J
	PG91WMmnMxyOJQB+mShXwN1y2ih0p96EX3Rovf64/nDQjqy9jJz4CpH8BP2z3uxHsF8yj/gaV2i
	XSl054imm3M89a7ZxAjg7RczUKgXS14UMPG1wYbRiyJTtc9htS1rtUL+rpf4o1C5/V0qMg==
X-Google-Smtp-Source: AGHT+IEbDdByftUuB1De7ADpvc3T3jH/tL6StJDvnUvXJU9t27T8dcC38/SRewNGsYVLRwVfe0oXnw==
X-Received: by 2002:a05:600c:8718:b0:43c:e8ca:5140 with SMTP id 5b1f17b1804b1-43db62bcfeemr99251765e9.23.1743498120922;
        Tue, 01 Apr 2025 02:02:00 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:cd7b:4630:9a98:b82a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fcd0738sm148391545e9.19.2025.04.01.02.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 02:02:00 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Russell King <linux@armlinux.org.uk>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] Simplify Renesas SoC Configuration
Date: Tue,  1 Apr 2025 10:01:29 +0100
Message-ID: <20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series simplifies the configuration of Renesas SoCs by enabling
all Renesas SoCs by default when ARCH_RENESAS is set. Since ARCH_RENESAS is
already  enabled in defconfig files, explicitly listing individual SoCs is
redundant. By removing these entries, we streamline the configuration, reduce
maintenance effort, and ensure consistency across different defconfig files.

Note, acks from Geert are added to patches 2-4 which were reviewed here
https://lore.kernel.org/all/20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (4):
  soc: renesas: Kconfig: Enable SoCs by default when ARCH_RENESAS is set
  arm64: defconfig: Remove individual Renesas SoC entries
  arm: shmobile_defconfig: Drop individual Renesas SoC entries
  arm: multi_v7_defconfig: Drop individual Renesas SoC entries

 arch/arm/configs/multi_v7_defconfig | 19 -------------
 arch/arm/configs/shmobile_defconfig | 19 -------------
 arch/arm64/configs/defconfig        | 23 ----------------
 drivers/soc/renesas/Kconfig         | 42 +++++++++++++++++++++++++++++
 4 files changed, 42 insertions(+), 61 deletions(-)


base-commit: 7b7d0894c66154494b8295a2e73cfb5516f65756
-- 
2.49.0


