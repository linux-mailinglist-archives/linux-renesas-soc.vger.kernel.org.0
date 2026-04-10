Return-Path: <linux-renesas-soc+bounces-31109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBRdKYmw2GljgwgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 10:10:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 033BD3D3CDD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 10:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26D24305777A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Apr 2026 08:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508673AA4E9;
	Fri, 10 Apr 2026 08:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XU7ARnP3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F0B33A9F8
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Apr 2026 08:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775808335; cv=none; b=QDeJKY7qvEMM7/PABkil+7Ok4x/heWe3oZdSybB7EDqs0lhY96Lubu6rS9FESjlB8Vg1gh/QroeBddqd6Uktui6SDttd2f98boKZZ8ra/Wq2eISOvGYgzb3um27Dp2Z6r5hosUK4jAyYuJcXS7UfnMShR1Zd745vUFp9kGlxA0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775808335; c=relaxed/simple;
	bh=ExdKYZiJJD+Q5GGhOzDo2C5HZMlMu6N2dRQb4ubjJEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQ/YRYz697VHLqhaAvV1Ly96wRvO13W9zUDT/YrJWtF9GV/mQg26Mwf2DHDipWgWpxjB2wytyg8HDaNXqi1sXD9dPE7PWVw2WQusZtyXUYejMfmXpkfVOOdtppSHGxvvbiq2SJnZdnDyzl+gnSuctnsnJoqucpv9Cs6HMNQEn9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XU7ARnP3; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48897fd88ebso18219085e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Apr 2026 01:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775808332; x=1776413132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmDUlYaXWDCF161d1mZMXREvHYM3yqRZXtIiTZpAOb0=;
        b=XU7ARnP38OQ5uoLOrYkfCmMlFogQ4brfalCVwHZ9XBpKicIZ0WfxbCDjegNF1ppphs
         RL62SgXcrVRVlbUJWJTxdv0Bs1i1bylyEbe05oAjWELdrpv6RiLUHiWUpK53iRUKCjX1
         9/HxrHfGyvRWfXYA5FtDXaAONa3LpZVs1/ZLezJwARtg7ZTeKZS3vIqqdfE506XIRmZd
         JAU/gt8ZcRTDX6LDRilwt3SiVncOTKOpJfsyJI3bCQ/Af4jg9GvJ9KqM5bGNmE8Jk+sv
         4VGgvnpUCrxfd1zD3axYfeBkBvbUHTJjybKe+M6dkY3fZgJ8I0LfKQ89j93u0hsmWv0W
         vMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775808332; x=1776413132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZmDUlYaXWDCF161d1mZMXREvHYM3yqRZXtIiTZpAOb0=;
        b=kaLtzDXzj/47cxwwkL3ds3yl6qjAiZUvolWg1tE6qQdBRNQ0rSCLNMqtyLTI7Qi/d2
         5yAQUTkCBuRiUwRA0BMXfMb6ksmkjbKeVpkf8v4P3IBC2eXTJLJc3wQkycKK/5pXdHIc
         Msv+BYxcFk0yExE/JLKLYMwyWs0seZNwLPGFUtHU+jyqeDGLuEW/T0lUcZxCMBLbwgDh
         2zi12pt1UX6zc6jPLIi79kycRARbODHsH96pCyfs+MhtQW1z/mRdM7gWjBGvIOtDKljG
         HnEpKHo1+OXV26lbgTH09vXEWaFfS2YZfRKqHjBBwsM3Py4SJo18T1sq0xg5kFaJNzCe
         OloA==
X-Forwarded-Encrypted: i=1; AJvYcCWiQ86W7dHARVJ9R561cw82Qrj5PsdeniEcY+Bu3fMleOKVaLRgEvu4GYhrgsDTkGIwYwQCTLQ7khZyotg5xi+31A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+x5C84ZCcCAakGlxW+vGLOq32/gy1hXbkuZlXrU9bwebTmx7v
	pKpuQV/5XIIkPwc5Zvg69HHR2FPM6hUNJavXOMDldxO06UJBFbPZ3V+h
X-Gm-Gg: AeBDietvTKODizy9dF05+mAQumu4UkyBXQLDwRXHrbyug7Sl31EVI8Nd30h+cGOXjqR
	UxA8f6Io4Gb1cAwB9frVb9z4KsDwiHnD0dU8le5V6fJl5JjDukpGNi9A7z/2o7fF799un4+PPZo
	K+DXWGZ3594j6zCwlAcp4EDNANtq64eTCtdi4rDfBgJFL7MsQchv11plzp3mC+FUb4KlT3GLxtZ
	aaVTEyYaUJ8jV9Ixhq3plgCKU/0AB7nLFHZratTFhosOQ+4fzFCG/hxZyaye1lzkmlnZDijShPj
	eoLOwGPyu1hZesw2DHOKx5P/QvulDV1jw06ouupfcNakW0n+LdXGtbtIc3f8bHJAsSR/x/jAwW8
	8Qf29LNIQE6DgZhOAduVe7ulyJrDRd2WFjI9/VcjjWzQr2xG6rDEzsbtFsXcF8l5MTAARK/YuBi
	IC30CCSjJjd61QgRGvF95D9OduFRd0/Vr75+BaTNIktiOF8t1okNCJnccwxjvLmN292DH6jdpEO
	vqppSDcboCheXgB+YIsf/paIRckOeyQR7IJWA==
X-Received: by 2002:a05:600c:4451:b0:487:1fbf:e0a1 with SMTP id 5b1f17b1804b1-488d68057e8mr25070635e9.4.1775808332036;
        Fri, 10 Apr 2026 01:05:32 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a73b:688a:4297:c5fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67ce3e4sm29950375e9.5.2026.04.10.01.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 01:05:31 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-spi@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] spi: rzv2h-rspi: Fix max_speed_hz advertising prohibited bit rate
Date: Fri, 10 Apr 2026 09:05:15 +0100
Message-ID: <20260410080517.2405700-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410080517.2405700-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260410080517.2405700-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31109-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 033BD3D3CDD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On RZ/V2H(P), RZ/G3E and RZ/G3L, RSPI_n_TCLK is fixed at 200MHz.
The max_speed_hz was computed using clk_round_rate(tclk, ULONG_MAX)
with SPR=0 and BRDV=0, resulting in 100Mbps - the exact combination
prohibited on these SoCs. This could cause the SPI framework to request
a speed that rzv2h_rspi_find_rate_fixed() would skip, potentially
leading to a clock selection failure.

On RZ/T2H and RZ/N2H the max_speed_hz was correctly calculated as
50Mbps for both the variable PCLKSPIn and fixed PCLK clock sources.

Since the maximum supported bit rate is 50Mbps across all supported SoC
variants, replace the clk_round_rate() based calculation with a define
RSPI_MAX_SPEED_HZ set to 50MHz and use it directly for max_speed_hz.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/spi/spi-rzv2h-rspi.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-rzv2h-rspi.c b/drivers/spi/spi-rzv2h-rspi.c
index 38ee09e389c9..ad59944c773e 100644
--- a/drivers/spi/spi-rzv2h-rspi.c
+++ b/drivers/spi/spi-rzv2h-rspi.c
@@ -77,6 +77,8 @@
 
 #define RSPI_RESET_NUM		2
 
+#define RSPI_MAX_SPEED_HZ	50000000
+
 struct rzv2h_rspi_best_clock {
 	struct clk *clk;
 	unsigned long clk_rate;
@@ -771,13 +773,7 @@ static int rzv2h_rspi_probe(struct platform_device *pdev)
 							   RSPI_SPBR_SPR_MAX,
 							   RSPI_SPCMD_BRDV_MAX);
 
-	tclk_rate = clk_round_rate(rspi->tclk, ULONG_MAX);
-	if (tclk_rate < 0)
-		return tclk_rate;
-
-	controller->max_speed_hz = rzv2h_rspi_calc_bitrate(tclk_rate,
-							   RSPI_SPBR_SPR_MIN,
-							   RSPI_SPCMD_BRDV_MIN);
+	controller->max_speed_hz = RSPI_MAX_SPEED_HZ;
 
 	controller->dma_tx = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(controller->dma_tx)) {
-- 
2.53.0


