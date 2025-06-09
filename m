Return-Path: <linux-renesas-soc+bounces-17987-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B774DAD27A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 22:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EF491893CC4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 20:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DE0C221DAB;
	Mon,  9 Jun 2025 20:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XF0A3APN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFB72206AC;
	Mon,  9 Jun 2025 20:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501423; cv=none; b=SukbjEiPHM9m93bP5QJgKa29306Jhaqdzpu2tZXP/soUrytd1Dm75aedovAGoZt4plJFUnEMuKooPemSqr354mf0YYJQRZiCyfxOpoFAt2OQAxyD6dKBAgny/8T+azouwTlqCJ9t6h5OMJZGAk9l6bvt3mIkVMexxPIkiSV8puA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501423; c=relaxed/simple;
	bh=I1wXYeSxB/lJlzmKxQ2gja130JTbMJPh0qefgKzpDQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TF07HfoMrf9WncMVlsL+A+7tzBDTluhRjGCbscHXRW8AUZq9KNi5rA1ohAG0/3Yius9MYzTxKkc6ASLet/5ERc/kpyM22c35V+EIz0ciOtn57ce5AWtEc7PLRCRnVPCC2yX+pSo6ZWlLHogqA/GcIsYKVgI6L426+B6xkj+n9gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XF0A3APN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so36614175e9.1;
        Mon, 09 Jun 2025 13:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749501420; x=1750106220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arqpf1m894ZitA7ntJh+YuLQdsY2BWOW2E3r4zrsi7E=;
        b=XF0A3APNo7lzn2A+Yz99AGAE5gDSVnQd0PcafT2l+04zEC3nq93EIrlRrbh7zed4vP
         5uSLnnYp0NN1kkldi9WrSG4rsNxsUPFboH43I0xSARpoQJyMEuXzZWrL1puZQ6u33XAM
         blzcW2TUejtUVk356kdngScjYxLlAoRFX+0yNTSAe7Cb5jCq0eK9HuK/GjMHTopf9hbr
         uVS7/EyrSEk8RMD+bI/ZWezDV0im8loJ9r6no57cEmNPGqrhA2iry3uHg+6iTPfrtRmt
         xdZ5d7KY/mkVMUgnE6Z1rbWLWkVIeiDdzhf7I3s/EWZ2POKSBzOMfqav7biLFyA2PUdy
         /zDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749501420; x=1750106220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=arqpf1m894ZitA7ntJh+YuLQdsY2BWOW2E3r4zrsi7E=;
        b=XMLtNSMdDk3Nrk4Q307EpYMMo2XLmyDNdGAsoBWDvti3rFjKmz3TcMhz3unbCmZFaa
         p42fF2m3eVC93o6iHAGTt9foNryjeDyzBKNzcdAfjWeRlC8W4WTGK9bOgbv91iJifoRj
         xb9zQl8BXcSVwgC4QQ0DODVGps2ewYnpyUQFAmdgkA1g/B51ZSzzIOgTzkN6PzIqquBQ
         1LOlZEZO6e5zDZXr6DGA/yaafHlidklP1JWnOeRULa2ZAcvyCzUlz+vYERt4cYL5m6h4
         c4xrc81Sb5PWcpeFNXEBfkoe9wkiB6Oxkqwef5LEU4vV/ldtlhn3icC/8Jc2m5UtZuzg
         pMcg==
X-Forwarded-Encrypted: i=1; AJvYcCVSr3YL77GZ42yzYeQFErkXB84iLcSMf2Pooe8UzJvae7Ckzx91MA4HsLcbiSeJpwhbl3oHujt3Sc/BSRQQ@vger.kernel.org, AJvYcCW5t1mwVyIGEnqr9v564Me+2x5w8hE4gSxjEsg5nYav6jVA92sdonJXwW/34F3MPVwog1R0ZBuXjG8X@vger.kernel.org, AJvYcCXoJW8MzqDOXhFgPrT3LULpmaBqPCqVjR+IZZHMDSN8FszXbLZ1KTguO5rFzaO+GtWimGe14Izw0LUY@vger.kernel.org
X-Gm-Message-State: AOJu0YwpAUWcZ19086R9ABjczHcsw98PlU9M1ITe1Pcfkm7L5lLSNHAr
	lMOmhJtxTdjZCvgNeWe4nSzKGvn1s1s/F53Ky5dQ6pKj+dRszkhwXPRR
X-Gm-Gg: ASbGncvmqo0W4F25HfZv8qwjLeZDrLxYEvCn9nxosyis4Iispu0CKpLqM3l1FlszEBT
	wg6XcoVphujEpxzyp/urIMUrxd5tpfk8z+d0ipSNY8iyJmpQvNT80ZkJqzFooeQ9XCeLsb1PJxR
	QGzyDvyZVOWwCAfkHstPEFA6QWyfd4ti6VXFFvntyXewDKmxeKVVdzRAYubGkSkhX00Iaz+7ZZz
	WP+FWsLQrYXnASsxSPT0qQuaYeGGnTrvoy4ajZRs8qHdLbvGD3FbKpNXoRgSTZAOLWXoOAUK6Vr
	NjnEG/tH5DR28XqvhQfubU8fF33EtbH6hr6dQaDxTNexugJBMONA3p+R9StiGddthYlXbV73LDP
	WWPC8QvBLY3y1MQWmS3g=
X-Google-Smtp-Source: AGHT+IGcsgbxF4ZHzr3W66cCJAPFrZDZyx5ZOXoHVw6Mlaz6qGDVTU7BC8huNLGhSQenj27piI5NJw==
X-Received: by 2002:a05:600c:1385:b0:453:ec2:c7b2 with SMTP id 5b1f17b1804b1-4531cfba2c8mr8424395e9.7.1749501419911;
        Mon, 09 Jun 2025 13:36:59 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730c73d2sm118240345e9.30.2025.06.09.13.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 13:36:59 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/8] soc: renesas: Add config option for RZ/N2H (R9A09G087) SoC
Date: Mon,  9 Jun 2025 21:36:50 +0100
Message-ID: <20250609203656.333138-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a new Kconfig option, ARCH_R9A09G087, to enable ARM64 platform support
for the Renesas RZ/N2H SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/soc/renesas/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 7f4b4088a14e..ba921f5c3aff 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -414,6 +414,12 @@ config ARCH_R9A09G077
 	help
 	  This enables support for the Renesas RZ/T2H SoC variants.
 
+config ARCH_R9A09G087
+	bool "ARM64 Platform support for RZ/N2H"
+	default y if ARCH_RENESAS
+	help
+	  This enables support for the Renesas RZ/N2H SoC variants.
+
 endif # ARM64
 
 if RISCV
-- 
2.49.0


