Return-Path: <linux-renesas-soc+bounces-23979-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAB4C277F1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 01 Nov 2025 06:01:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8C7A421983
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Nov 2025 05:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47867264FB5;
	Sat,  1 Nov 2025 05:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGmNCzlz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1FD21B9C0
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Nov 2025 05:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761973257; cv=none; b=JX7Mu+anSHosm2jejTHSsK5xsapJPLVeI+A7jd32ME9zghdm4livAgwSAtgFLDprbIE9tGoIqlTjdiAzeQY1XIXJdLdG2UzDujkccUDS/sYKJT1KW0Irhyl22N/2mkDXr6+q5F1KKu/0gY/HgR4It0ZWZBr/+lIAM1ZK1n+uuUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761973257; c=relaxed/simple;
	bh=16CUY4BHukYrONigdNf6hHwKpWDcA0Nh385BQ5R55XA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=betIHz/ggBqS63N8to3//x3CLnpfDmYjqZbDUGTmKUcxKjKl6zFtnOTtJWwPq0APWaZnXrlVRUJ5kYpb0Dct47a1SzIVDpmYU6uDWA7JAKuYdS+FZ1nE2kUChTdB1PRuRIzTaU4pc96H01ff/aiV3U1jKdfiwaZmM2YdH8WK3Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGmNCzlz; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7a27bf4fbcbso2954958b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 31 Oct 2025 22:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761973255; x=1762578055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiw7k5BoI+E1avLBAbhUpCYSAa1PLmht1gV7sVpOsMA=;
        b=aGmNCzlzq7yYoC2K6jmqxllEEan/sdZdJHhvtVZj1vHUpGCPUv8s29CfFDD2Gs15ny
         5jVCw+cg9BgI0HMElFeZuhWkVQfGNxJXz0C3wUKyKcrIharSt5dMBdAFAsqAu6/R8515
         VKn5x6KjmnmMC8+n88SpTnPapc1se7M60tnFUxYmSZEx4wAwLuBnUP1m9xZDdiEqdeRf
         TO2GC5YI4X1+Kl+xTwODewTtU4NbYkv3q/SiQTWm4PRsg6QsGg3Lt6sxNE1RpG8dzybe
         Qmtuox+KBCJvy+fPO+y8SkGACl7ObB5ZYz6zhwEcKE3uW62k1IOPYdI+Om33ayLmgBJH
         wJLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761973255; x=1762578055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oiw7k5BoI+E1avLBAbhUpCYSAa1PLmht1gV7sVpOsMA=;
        b=IHxvpL3orrHIPH7TZfgo/ZcRqPz/+POcZMjl0Twf8zjAZ+uveh3SFRPH8zaTiyyTWZ
         rSE7cqNG5JSpBQb+LD3nm/qY+EpSHVcBgObXWM5iD7ag2Er4uMwwoiiYKqhuurFFq2J1
         f+crJlsOZAx6PFJG2v52tM5DKChP1DjbgyQv/5qkv6VFuyOKIzaw+yBgDEfokQQ4O1/t
         NrwGUng7uhHdqCdjJx1+WtD9rYXDmr2VMsyljigSjij/4M2PFHm5HJI7VSlEKLwzww8c
         verEk8+jdXOGF8SIQrOnp9CMSPKi1JhmvCAoR9dK50inXuO85hrwhLRUxTo671V9VOEe
         cI9w==
X-Forwarded-Encrypted: i=1; AJvYcCWIUPUnZtQ7FF4PLXV75ANIGjxWSuHNOtSkgokjqRWjbnx+/H9qqmj//S4lmI7LMllrOXf3zEC+4MinM4y0XA0jXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQbJHwA31O8CkFe8Z6VT2moQLpWH7LWI78ignd4K03ZfH7KJyC
	KwV6H+/wCBAjzdNeCd3TUjq7/BBFSOuTfgbvV6hPov1ogOroXtS6BwE1
X-Gm-Gg: ASbGncvhq0FqjHvS0m2FOlngcToSYbVqQePRHNTNXIMEzskWpE+MA9k6XgrLcFvtVHx
	Mp3vNbVrIhSKxRY1DHQmRoNP5K3Rr5W0GhZti/WO9eox1lO2aRGYyAvfxhod7FClWG2tdXGWJ+Y
	hz1TSu46+L2BGfjh2itg7tOwV2PZicQ9FwS8HmoADjwUhdt4GpoUy2/u+uZrxs20bMRbXPUpu/Z
	BlqsKqvQyCOWaIIC+vOKhEr2g/HQ3t3PnkSl5F4u89g6VbUJh3g2R2zd9nGqto4yBL8Qg/LCQ+7
	RQB5Hr1RL6LeeEt7Mbs9VXPqECC4oI5UhmOxSXaVJJlyCsJjk/kAP+M5qMSmCl1gjQdopW87AEm
	sRbOSPAQ7/kc6qugsFq/vUcUfC1R9cMe5dmckUpOT4BLlK9k/sal/b3M8Ql2qv56pZZp6Y3lrTa
	OioMyKDfa1VAtse0yTgHt687uRBFhnTDI=
X-Google-Smtp-Source: AGHT+IFd2bk88eDysEPUx421uqVUQRIoZmTj+xtwyXu5exUwOlKOq6uKKxTjYZHf2N0IRzsbcLrjcg==
X-Received: by 2002:a05:6a20:549d:b0:2f3:b278:eaa5 with SMTP id adf61e73a8af0-348cd213c93mr8457177637.60.1761973255036;
        Fri, 31 Oct 2025 22:00:55 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:600d:690:cbc4:d4d9:22c2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93b8aa3ff1sm3761095a12.14.2025.10.31.22.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 22:00:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/4] dt-bindings: clock: renesas,r9a09g056-cpg: Add USB3.0 core clocks
Date: Sat,  1 Nov 2025 05:00:32 +0000
Message-ID: <20251101050034.738807-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251101050034.738807-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251101050034.738807-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add definitions for USB3.0 core clocks in the R9A09G056 CPG DT bindings
header file.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 include/dt-bindings/clock/renesas,r9a09g056-cpg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g056-cpg.h b/include/dt-bindings/clock/renesas,r9a09g056-cpg.h
index a9af5af9e3a1..234dcf4f0f91 100644
--- a/include/dt-bindings/clock/renesas,r9a09g056-cpg.h
+++ b/include/dt-bindings/clock/renesas,r9a09g056-cpg.h
@@ -21,5 +21,7 @@
 #define R9A09G056_GBETH_0_CLK_PTP_REF_I		10
 #define R9A09G056_GBETH_1_CLK_PTP_REF_I		11
 #define R9A09G056_SPI_CLK_SPI			12
+#define R9A09G056_USB3_0_REF_ALT_CLK_P		13
+#define R9A09G056_USB3_0_CLKCORE		14
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G056_CPG_H__ */
-- 
2.43.0


