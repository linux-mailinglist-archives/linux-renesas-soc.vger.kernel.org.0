Return-Path: <linux-renesas-soc+bounces-18466-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A80ADD4AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 18:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7C9F18954E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 16:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FCD2EF29C;
	Tue, 17 Jun 2025 15:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JCN+86GW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7C32EE601;
	Tue, 17 Jun 2025 15:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175885; cv=none; b=qGICXfrPmzkAJKAwWfIe+GSVcsfb1umZKbtmJ8iHufXpw8PJQktkHyGR40pKikd1yQuMoaj0glrZYNdxGMbosbmu6bBEa51InsxMGfjRsUNzknKDMoNrJb3AKj3dFgn09DOtxbLOvyu6UybCv1lbFNN8CbDBFxrCtPaPVJLYrbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175885; c=relaxed/simple;
	bh=a8Oh1wL7E7z3t/96HPpvMNcCbWgseCg+dcISve3f/YY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QK/nrt+KgMBYlpXGHICP8nH0tj5GfUoaMmQjakU0w7nRaDUixwSSINHU4/yqtpDJ88wPY3n/uMNqdo40Z1P8eSigTN/foRsWFPDlWl1yt2749vXL/v3bDYcoqLVrkSJLG5K8cP4he8JAJgVYGbr7Ahh4pr0l/P1sNDeEHuk54vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JCN+86GW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d54214adso46226025e9.3;
        Tue, 17 Jun 2025 08:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750175882; x=1750780682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PWwnWHzAtnOje7ih2DXB97zwG5RVmT9ha6l5kFfT3o=;
        b=JCN+86GWogRAWj3mfhMPPIgEmY82OX8DZvk59V1T38fAYaaUqBd9KvTAgsgkRskAZC
         XeHXSCDBAcnSAkwz9f0BVFJMmIsrmnE9FSWUn/Q2NQayEiVVBc7LDKlRT2/IjWbn14Xj
         x8gzLaIqSE16lxZiqJN2Hor6f6rYvk5CeDwX7v4H5gCNCzOXgMNLfnHKpFW+EHHp9oF7
         +lhdbUo2o4f1YIc8HSM6O3GAaaGQkeelM5QikZ2B3wU4sX3quxKQdhfFpbd+WbslCKSo
         vuWyN5cxTZyspPYiHWONIOLEdPiFveHyRdVvxnY2vpEOQrze9wdjACfRS03M9EdYGhCO
         HImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175882; x=1750780682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PWwnWHzAtnOje7ih2DXB97zwG5RVmT9ha6l5kFfT3o=;
        b=lNhGeHgQpqbSmR3bT0KEgvXdFpPax/1O926u9lTYHp7Z7F/fkU9f1eG87MDDUDLh4E
         QRMmfHSsZodEArnAK/YvtPdnyM3X6TNE1gKHzzPiDMPYiOTSMEJEw+GTcKGKxGdIFYzT
         j2IWqhVtUe2qrKkj0OVMWgj8V1mCM7/rPvBXlDS1zsb2ixrs/EsHj+ThZIUO0N/S1ZsO
         J1LbMS01AZ3Cfw7C0dpyZxG4AEuSrbfzUHdvWdgQIiThRkvIaFddP9JETPk0IPEtyS+0
         WIVuygP5rX07NV+R2I2FZnROi4BQpFQv58/tWEvzAkTYSKsxt1ic26G1cz8vJP8GQkbP
         9OlQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1YzVdc2Tce0xK9kfHjhR2hsqk/rQwUVjZwK2j7TAjgBL/cRSL+ZaWsYF2EUX/9azcIhaS7I/JaauH@vger.kernel.org, AJvYcCWby438qM2otSUkjyVwsx7VkqVc+XOfYVzewf9lC+D+9hsoZnHh6USCwNXG0qpJKFVHLxpRwW1TcPOkql57@vger.kernel.org, AJvYcCXxnqfxTaFqqJZSQ524+M5rYYKwJ7jNx4gTDm7XeUN6WCeYp7XLmIuhkcdUOml5gHeFLu2/cTDsmoBh@vger.kernel.org
X-Gm-Message-State: AOJu0YxiJJEoIpCLXRcJ8+MzMQgQ4+EYvfhsuIhKrMNkyyr8MDecxkQj
	Ox3wrwjZ8BgPR1Hb88an+9Z2BYWvRe2ePVnDDw8bpcpQwxUGBS3ZlS/L
X-Gm-Gg: ASbGncslCzsaN6r89pfkaXXlgI6mt7vZQkq268x8d8Uo+5X8uRaE7MxhVtHEhxybu7E
	yJ1mSxOMfdbSSu7/H9YwmzOUKkWjfeiYTIn9KpZviqoMb+mwb5AbV6YKBZ8lKZkL0K6/2vGCT/g
	DH8SLn8gy5A06764OFa8mwiPsM6ads6DnYv2FtNeUBTxRyKpY7zW/+lfNF0KOCJ1wio9as58r7A
	jBMSdA652s9NYleBtQLIgrYiugm5RDvpV/Q5U6Cvuc00KqnbR/IWVXFu+2JGbxXmX3D3sz6kh6D
	SWS1s+zZeYloYm3smDzsJ+tGCD0KbH/b+frG3d9o8IZJXGzwIfYfDY0yXOqa+9PtPA+MpSDpPON
	qfZ8yLHZq/WM=
X-Google-Smtp-Source: AGHT+IEKIVqP/4h9sjeio6jtST/2R4L8t7H5I6f8xaE79BGUyvzbvpb57/YEs+bEgDZqKvxO7mearg==
X-Received: by 2002:a05:600c:1f94:b0:442:f956:53f9 with SMTP id 5b1f17b1804b1-4533caa6567mr144982585e9.18.1750175882154;
        Tue, 17 Jun 2025 08:58:02 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a53f79sm14189115f8f.4.2025.06.17.08.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:58:01 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/4] clk: renesas: r9a09g077-cpg: Add PCLKL core clock
Date: Tue, 17 Jun 2025 16:57:56 +0100
Message-ID: <20250617155757.149597-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617155757.149597-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250617155757.149597-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the Peripheral Module Clock L (PCLKL) for the RZ/T2H (R9A09G077) SoC.
PCLKL is sourced from PLL1 and runs at 62.5MHz. It is used by various
low-speed peripherals such as IIC and WDT.

Also update LAST_DT_CORE_CLK to reflect the addition of PCLKL, ensuring
correct enumeration of core clocks exposed to the DT.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- New patch to add PCLKL core clock.
---
 drivers/clk/renesas/r9a09g077-cpg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
index 206816a2df23..b83ef933ae0f 100644
--- a/drivers/clk/renesas/r9a09g077-cpg.c
+++ b/drivers/clk/renesas/r9a09g077-cpg.c
@@ -66,7 +66,7 @@ enum rzt2h_clk_types {
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G077_CLK_PCLKM,
+	LAST_DT_CORE_CLK = R9A09G077_CLK_PCLKL,
 
 	/* External Input Clocks */
 	CLK_EXTAL,
@@ -140,6 +140,7 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
 		dtable_1_2),
 	DEF_FIXED("PCLKGPTL", R9A09G077_CLK_PCLKGPTL, CLK_SEL_CLK_PLL1, 2, 1),
 	DEF_FIXED("PCLKM", R9A09G077_CLK_PCLKM, CLK_SEL_CLK_PLL1, 8, 1),
+	DEF_FIXED("PCLKL", R9A09G077_CLK_PCLKL, CLK_SEL_CLK_PLL1, 16, 1),
 };
 
 static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
-- 
2.49.0


