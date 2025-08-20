Return-Path: <linux-renesas-soc+bounces-20777-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFD8B2E3D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 19:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CD695E5B2A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 17:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA053570B4;
	Wed, 20 Aug 2025 17:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtWCW0k6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6445B34F48B;
	Wed, 20 Aug 2025 17:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755710305; cv=none; b=YcPCeVucrAriTcSq8zPB2cfnfG2bC30WdLA+NVC4xwiy17xKV+wcBrE0q3PMYv/mTZ9diVYBXLFNlIBpamsFJS8ph8/PgOpra2Qe1d4ekw+qs/m8cUOTylLNvhP9tVAn4h+9NZfbEwOcXyBbDXM8Qv/7XvV6pSvC6NXBOwBL+w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755710305; c=relaxed/simple;
	bh=OWjnDqBDjPny2+p7Xsm70kWGuXa2xd4b181i7oYZArM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V5Z4MBPUkJkOTcU++gOQeHJvuzjlWvaBh9vrVEbOWbHi0gbgjNT1h4VhUCzunc5QJnJKctLSGg1ogItRYVTY9IeFIGfdxThhuiF2Md4jA3nM7kDCu4fcNDAJZnC/u65zij6ii3Ax/7XA5YtMwhDNOp1oIIqqRd/L08N+9DCvmU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UtWCW0k6; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45b49f7aaf5so599395e9.2;
        Wed, 20 Aug 2025 10:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755710302; x=1756315102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZzDPwdTWpO5ZbTCsgd4c1T4UGDt9Zw6rdnE0VuNn8PQ=;
        b=UtWCW0k6LPomsLZKT9YSj3hz9FvD2UySxuvxGA72OhW7ga4kSNxQM0vS/4cliwI+Ml
         0NlxdI+bWH2r7+Kuncg3yCMndkgVS14Az/zPZnGlkefjtg84TLF7D/EOZCKmq1vOTtXY
         MAQOERVuhDMI08l+/JlUj+QGB+6U6qOWtMZq4tB9n4pAr82oTQ1Ln1D77O8ITNHqEUTr
         s2aNI2uqczkuFGYem+KCF+2Ujh9ZuTrXfgWcfsw5+YKs2zHpRRTo6I8OULBFRDpeaoUm
         T0S83gGgSWYkzOM5yLy7jv68kCSgd3VZkWlJ3dNr5Hy8wu4/j65vKYloBjSjoiIrnkVn
         2v4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755710302; x=1756315102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZzDPwdTWpO5ZbTCsgd4c1T4UGDt9Zw6rdnE0VuNn8PQ=;
        b=NwIPU7zI0LRQf7ARuYCqJab85UNxvHhFhdMM/OzEUqjJd531yjlFKjMrXrDHC6sdDN
         HV+uHbFihAAe8a9NgeIPXY+JQt8Lkzfc3n3pMVLiWMGeR20v3Ym6+wnqN4h7Tr4/mSmk
         4Y1JBYQ97zHPcPabHZ+YyCFYFdITI1kMG1k7HBm3KdjmeTRavzTLbvIYTdPi0CQK2X18
         pWVqinxTJKEKy4nL5FGY0rHZxoy78vdYTJKKzL1yS2oJ+kjNwkRT0h6e5MnoU69qEZFD
         UPhKrikjiN6ZOLhXJox0MJruWPyqR8/wLhbKhb7f9fGSuM0/D1Ja7IaxaSvjg5+Ml8Ix
         Q3lw==
X-Forwarded-Encrypted: i=1; AJvYcCUMTifWeJQH8qJZki/RfHhLhf7tDIRStH/BDMLQLig67cCRPYorwfgIWS8GF8cME5dsnyMYIyeLkwTHUhE=@vger.kernel.org, AJvYcCUluI5ERJpyXA2yy/kIO7lZ6nLMqVgPSfiW6MJxdwoanK1ymugXFxZjtyVFZRd0ilO3833dzc30qr7zZTpaD9J44Rg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEsvLB6QYTluGXpTyUUTS4+iAo4x3HLa0FVmOYGMkCA1C+MqM9
	yjUALFFp8FPtYjAh652SFxgHmGdoMmmM4NrJNdlC8tjdK/u/MSAq2aQa
X-Gm-Gg: ASbGncs0zBVoxE0600+XYeZhlHF16hdPOZ0Iwxt3HfOOPGkCZyR63bLYeo4HDyzN+4H
	ioxC4WqdEgpbMcLCg7xU/J0BYbzPzFIGomZPISBRpTcv34yw3opmLXdqecU8FWtS0+halFfR5K3
	0imgKSyrpSAAf230tm4dsb1JtNmzARq6Kd6ooEPyGZhEjxbBxTpmp5QkFGq2QuhrbQFEHNNqIwd
	H5XfF1R1MYAunm2M3U3tB8uOra1hJFtMiZC4FqumXeFpJcBkykPEx3ypepcxeIXLKhXd+PKatLg
	TPkZfCjpeE6QKZR4VeSMMGISmNmV3TmiYORHjP5kCQhq5oKMD7S2IB2HYeYvyBhirEcgSCdzo3J
	Y1bPTmEcS+B+WdSt2vWexTz+Z3Z/2r0WT0oiowMoPb3zIFvIn7Pim8ocZqQf26AkC6IrAJvN2kA
	==
X-Google-Smtp-Source: AGHT+IHYnbTTvJ9VaG8T3IJeOXv3Sk/I0X02h6sdPumKCz2EeqrzQR9k5qKRYE+FZM6PFYFvfAYa6Q==
X-Received: by 2002:a05:600c:358a:b0:45b:47e1:ef78 with SMTP id 5b1f17b1804b1-45b4c73481bmr2241815e9.35.1755710301634;
        Wed, 20 Aug 2025 10:18:21 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c2865dsm40319815e9.2.2025.08.20.10.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 10:18:21 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nishanth Menon <nm@ti.com>,
	Eric Biggers <ebiggers@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 11/11] arm64: defconfig: Enable RZ/G3E USB3 PHY driver
Date: Wed, 20 Aug 2025 18:17:58 +0100
Message-ID: <20250820171812.402519-12-biju.das.jz@bp.renesas.com>
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

Enable the RZ/G3E USB3 PHY driver on the Renesas RZ/G3E SMARC EVK board.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7cf21ca6a860..110142ab2f82 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1643,6 +1643,7 @@ CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
 CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_RCAR_GEN3_USB3=m
+CONFIG_PHY_RZ_G3E_USB3=m
 CONFIG_PHY_ROCKCHIP_EMMC=y
 CONFIG_PHY_ROCKCHIP_INNO_HDMI=m
 CONFIG_PHY_ROCKCHIP_INNO_USB2=y
-- 
2.43.0


