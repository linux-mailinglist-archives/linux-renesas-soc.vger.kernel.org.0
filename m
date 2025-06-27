Return-Path: <linux-renesas-soc+bounces-18863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ED2AEC134
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 22:43:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1889E189972E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 20:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72E102ECE89;
	Fri, 27 Jun 2025 20:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJbaH6wf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A8F2E8DE8;
	Fri, 27 Jun 2025 20:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751056969; cv=none; b=PUjFSlSISwxcrxXCs3L991D1st1wXDqamBYQZs6YqsuyuIU20Z+8jgWsNHOrhRZTOqWNsG6SR7ZsXZTUqw3Uz8xpY2R+KTUyxgrH4SLMG6bbrr9HycXAktoRVPlipeEdZAvtTAMZu0uX6I78BuwsMp6JAfs2IwJnotz9N/L6+c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751056969; c=relaxed/simple;
	bh=NpcxBaXS+EPPlVPSDeV2z1H/MjHExc6oueWezaz9vWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gw8m7CkjfMc1LMwnsdFnDSnLlj9cop+PkdgxmZ01+xrwFhFCpSFOLTD+A9PkZteybLwMseXuOk8wq5fhSrcrQ2wHB0Dg3YthIV/5QDccan7KECHriwtGDNALES+Rb1/ltwf1awqAnDF6N4ZU+qytHCv+Y66MNKnA1Ob1lcWZzxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJbaH6wf; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a582e09144so161556f8f.1;
        Fri, 27 Jun 2025 13:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751056966; x=1751661766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SI5aRUv+cz711YrxG4xwgxqHOLdxpaZNcl6KKDHu8Fs=;
        b=bJbaH6wfcEvdcpIoVNY2qOdZR6rsNTQwW0Cy+FiKdnZ5pXjghinmmcFx5ZcO1vlsDt
         5MT5e9tfvZpIQ9WoOLEf5U2EuFGoLbO2t55jHYCgZg3Orx3Cx3xJNfrgBJpiDFaZ9ZIy
         QQiOrE7NfTSFd/SaQ7qWBq/IJwD9TMDJnV5q/+WdRSb+YrrKtSLZ4iWCM89z57TD4rep
         K31GxdUQvdR2CjM/2Y3yFBvQ18494V0b97SggSqpM0WZTSo8jFgVbo5xzBWWnfoRVOzL
         ROalJu7LQLlPIykhdBe8JDdeHuH571qCJrDwKqEFqRaxZKIZE9xL/KlA9S/1vmvXp+YK
         WpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751056966; x=1751661766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SI5aRUv+cz711YrxG4xwgxqHOLdxpaZNcl6KKDHu8Fs=;
        b=Fia4BcgGPFgx644/Jq1XYlrUkeTpUOx+5hDqhv8oVjY+vSlbccdxYxS2yNA5Yf0HRa
         StuRY9UiVkJqPu+K+RGCcfuuBVpzSpSw/HnCyuAvUb+crUittZh7yWJ5yRKIuyZrG50s
         dzQMQFi3RmMsjriM+OTPKQmWGg4RArT5BubHyGo2TrbG6cfWHsA0KtIAuif2cW4ZFa7A
         ERYU+1CpH/BcTkgXZoOERgRDSTwxCedOLYexff8vaNjX4lZ3BPRLIiFRkFu3OsZoJdvx
         puICa0jUvWNl+eSOLxjoWAj8bUymcSk+CesSZMEZ3A8owNxCzXw6eZkOMrO+dw6Dgudg
         Wbmg==
X-Forwarded-Encrypted: i=1; AJvYcCVTi/rlpavVK5XneTUv9mvjjm5AeUjyjF7kL1P3tv3ZkNQX5RoCtjbgWXnAy5JpzfafafdtWldRMkyK@vger.kernel.org, AJvYcCWH532TXCKNN4UqlmoOi+OydUjPgRoSu3DUjTcQ4XfGKtKNovCl8xtHJR0atyGXvNDIXhdBTMB1kllw@vger.kernel.org, AJvYcCWe/6nacEF/u44HviXNEsp73q7MsGif+i+Ts8f3TXcdxpqhpnEpHHu8E3nsbx6uczmcR+ZwRg2qYyduO8fu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Qexz81V4eGSbKu5F6Fa8MPeZX7BsfVYboCfi/yE8CgNDisuR
	H1XGahv2ArQ/MFHMvgG2iS43vpzsEQz5hT9SSMB+4SEwzXr+JKaFMtcV
X-Gm-Gg: ASbGnctzLLtFozUNq3mU4pWfBcadjHyyh0yhw8JC90C7GptZUXVY9k5K6n5qqk1yMP7
	VyeFArzMxwJJ0sbq4xpBGS1KMpEfb6Ry5ZT3jO0S+uV/gZn3ZoRwkWtZqduKE0POuvdOvIuRL4a
	EpFQ4ESUSL5oMEzxITOp8ezCTK+OwmGc9fBCW9AuBok+vpb3dj6JinXQQAdbyh8tATUyz+W1zn3
	odFbPGZdJls8Ga9ix9/JQECQuAV1UwaTeWbgxTzEoel/XDevPlVA+9ZU9UMqZlap5bMHG8EILWZ
	/FxPCmVIiI6ZgVFPSOfAUBGR9wYhgUMqDbw7vweeCq/2pSO3usBohW85hTE6j5ExFpEmAxCyB7s
	1tXq1igO+SQ==
X-Google-Smtp-Source: AGHT+IEi0BAPtni2BWBhJ/UTd4KA18NrHDNdgSJ2pmstKHhy5iPi9oUau87z7Fw/+je+5Uy0JnPbfA==
X-Received: by 2002:a05:6000:2012:b0:3a5:8934:b10d with SMTP id ffacd0b85a97d-3a8f577fc09mr5014846f8f.10.1751056965854;
        Fri, 27 Jun 2025 13:42:45 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3b46:edb1:4d0:593b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fab7asm3609322f8f.24.2025.06.27.13.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 13:42:45 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/6] clk: renesas: r9a09g056: Add support for xspi mux and divider
Date: Fri, 27 Jun 2025 21:42:33 +0100
Message-ID: <20250627204237.214635-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627204237.214635-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250627204237.214635-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The mux smux2_xspi_clk{0,1} used for selecting spi and spix2 clocks and
pllcm33_xspi divider to select different clock rates. Add support for
both.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1-> v2:
- No change.
---
 drivers/clk/renesas/r9a09g056-cpg.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a09g056-cpg.c b/drivers/clk/renesas/r9a09g056-cpg.c
index e370ffb8c1e2..040acd4ae5dd 100644
--- a/drivers/clk/renesas/r9a09g056-cpg.c
+++ b/drivers/clk/renesas/r9a09g056-cpg.c
@@ -16,7 +16,7 @@
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R9A09G056_GBETH_1_CLK_PTP_REF_I,
+	LAST_DT_CORE_CLK = R9A09G056_SPI_CLK_SPI,
 
 	/* External Input Clocks */
 	CLK_AUDIO_EXTAL,
@@ -32,7 +32,13 @@ enum clk_ids {
 	CLK_PLLGPU,
 
 	/* Internal Core Clocks */
+	CLK_PLLCM33_DIV3,
+	CLK_PLLCM33_DIV4,
+	CLK_PLLCM33_DIV5,
 	CLK_PLLCM33_DIV16,
+	CLK_SMUX2_XSPI_CLK0,
+	CLK_SMUX2_XSPI_CLK1,
+	CLK_PLLCM33_XSPI,
 	CLK_PLLCLN_DIV2,
 	CLK_PLLCLN_DIV8,
 	CLK_PLLCLN_DIV16,
@@ -62,6 +68,14 @@ static const struct clk_div_table dtable_1_8[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_2_16[] = {
+	{0, 2},
+	{1, 4},
+	{2, 8},
+	{3, 16},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_2_64[] = {
 	{0, 2},
 	{1, 4},
@@ -83,6 +97,8 @@ static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
 static const char * const smux2_gbe1_rxclk[] = { ".plleth_gbe1", "et1_rxclk" };
 static const char * const smux2_gbe1_txclk[] = { ".plleth_gbe1", "et1_txclk" };
+static const char * const smux2_xspi_clk0[] = { ".pllcm33_div3", ".pllcm33_div4" };
+static const char * const smux2_xspi_clk1[] = { ".smux2_xspi_clk0", ".pllcm33_div5" };
 
 static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 	/* External Clock Inputs */
@@ -99,7 +115,14 @@ static const struct cpg_core_clk r9a09g056_core_clks[] __initconst = {
 	DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLLGPU),
 
 	/* Internal Core Clocks */
+	DEF_FIXED(".pllcm33_div3", CLK_PLLCM33_DIV3, CLK_PLLCM33, 1, 3),
+	DEF_FIXED(".pllcm33_div4", CLK_PLLCM33_DIV4, CLK_PLLCM33, 1, 4),
+	DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5),
 	DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
+	DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2, smux2_xspi_clk0),
+	DEF_SMUX(".smux2_xspi_clk1", CLK_SMUX2_XSPI_CLK1, SSEL1_SELCTL3, smux2_xspi_clk1),
+	DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK1, CSDIV0_DIVCTL3,
+		  dtable_2_16),
 
 	DEF_FIXED(".pllcln_div2", CLK_PLLCLN_DIV2, CLK_PLLCLN, 1, 2),
 	DEF_FIXED(".pllcln_div8", CLK_PLLCLN_DIV8, CLK_PLLCLN, 1, 8),
-- 
2.49.0


