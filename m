Return-Path: <linux-renesas-soc+bounces-27075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FC9D3B7BE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 20:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CE0D30BBBEF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 19:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1CD2DCF58;
	Mon, 19 Jan 2026 19:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QgR28dfC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7977E2DEA6F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 19:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768852399; cv=none; b=VBxzLnI1m677AJQxAR/msoDehI9QFpiGv0RwJDLrIhHFbn3w5gbnWLyuy7SQmothXhagVIgVTWe50lDEv7L9ov7qiNE7HTKL5+ySmsc47ndNgwBd7Ct9DGe0f2pyzjnhMa8v1txZK1CwuC3MFWnSpwpEpZJL6ruoIBTXugqk4pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768852399; c=relaxed/simple;
	bh=Snxh1hWiJUkWobs14saFJw6n6BxULznOgNBMqPgvlxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xx+EagSo50NQbK/eMZQZDAW1DJsluvH5fn8h9WZCAu9/bBLcjeoE+eCqdcikngJbGPRW+IeWPzuHXibGTpoSGREgzXlB3NfducOBENv4BeXabv1FO2ipbyk+OzbM06K9+vl01KAaRIxsqhS0tx4i2xBgaUJqay73ottC7ZJb684=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QgR28dfC; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b87693c981fso788586766b.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 11:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768852393; x=1769457193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/yDyZcj8ePhaL/yIl3vTy9lauZCAE87dk0c2WvASW8=;
        b=QgR28dfCOE0HruI7ZSu4R+yrnWEfD8Wq9VwBNM8/P49h8N2aWZXhhafkKEKBmPeEO3
         WZUzyKrnSBnbg7XS2OStqkFFJ9TkD5TBCg1/3JDQ5jQ0G78UxBYHtq9EufUkhIEbYG+i
         niIlPQjkEWcGZs4sfsfNgRBR3f28bTRhc77lh27iPcAY56dvtBz5q5jz6+EbcpFBRwEI
         DlqWaoZHgLvHLgJd7o6L9MXMNgL4tZ7XaHeTx6Jw1s+AsrlzyRIP8kKX4BhjC0lkwnvx
         67OzLZGwrLR07645ty+w1HAIFSf9p5IZoiobZfvBzoZygJuatbtygWuyVJS9gyj94BO0
         Aqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768852393; x=1769457193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p/yDyZcj8ePhaL/yIl3vTy9lauZCAE87dk0c2WvASW8=;
        b=BbwSfOYkg+nywM4LQujeoK7GBJoOXhann2M7LfDCTrp+eIQJcALVu+QU+cBMZ3vSbE
         qwQ4yzLL5nOI5rHLnh3cT05z5KtUeZ8C+/8P4XTjusW93EKQ8YpQ2WhZuDymbr9q4MQ5
         wSnW2lvxKvmmu9kn2r8hWUtSuLY3SwIsXj0P76hMzuPmfX8qe2B0loFJLWbLKi9V1eEA
         j2iUsSrURHwAi5yGsWQsZ4T7m1Kp6i77hJLhX068FOiyPoToII7LMsG4gCfMePfofJKY
         dpGdCuiFsuIKbg5UgbnehQET0VfKoTOCNQ4aE84dqNvTjdVRupIGyquvLTFZ1OKfcUPb
         Bhhw==
X-Forwarded-Encrypted: i=1; AJvYcCVQnlvgmsEmi07utEIb6RvHYklSgZuIUtvhV13Je0xKaqcKbzYqOpJOt/iHZzj+oUW2JZSiF2mUf1quehh3CFWE0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSfEiyR4sEX5Yg7MzhmHYMG/oFJWLcGLUHN7AwOfxWEgYPHsMH
	x6ccE/DKXzhQ6CG5macb3pAaM/auUrYGoAwIvHA5sF9mdyV5ZaGrTMd5WtcvfdS2CCDIXjduIJi
	i+REd
X-Gm-Gg: AY/fxX5sy8IjlHyFnBR78oMvYocd5d49Lrb00pkB6ytjnkjUxLUubMgdzskScclFVoU
	H7SOyXV2xzooNjVhQxgSulXByb/jb1yzc2MJBrtxZU0t47AZW8kdFaOSZeBxOimz2i3WnHEnMXT
	6o/qbR1QuSEbuL+4ztkKE7tx8w3hD+81gqvbjnmFpABtess3sbck9cFkK0d1tl9WgQf8WTZaWaA
	bgY5PC43Hqerfo7exO+YKoMHPKlRVPtW8ivODtlX5LsS5yyC3pZ2oUs2TIda/3o9lWRUlGSWqT/
	iHH7xu5FWOVoj2A5k0kn55cFg6AxebhS2m3oxpUhQ4AQPgYV4GrKkOtx4Z2HCC7K6D0bDr/eQYz
	9V6/FcdXBDSpatf59sg8Hb/eDxBULPCx/OKmlKZqwKnufWEwAe4d2egsoRiOnG/MeVJqgxw9Hb7
	kQ/sl5+irMOdLqKmshYgRPp6BtqML/1hpL7Ll2as8=
X-Received: by 2002:a17:907:2d13:b0:b73:210a:44e with SMTP id a640c23a62f3a-b8792f79a90mr1044358866b.30.1768852392504;
        Mon, 19 Jan 2026 11:53:12 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fbb38sm1167248266b.52.2026.01.19.11.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 11:53:12 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: claudiu.beznea@tuxon.dev,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/4] ASoC: renesas: rz-ssi: Drop unnecessary if condition
Date: Mon, 19 Jan 2026 21:52:50 +0200
Message-ID: <20260119195252.3362486-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119195252.3362486-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260119195252.3362486-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The is_stopped variable can be initialized directly at declaration,
removing the need for an extra if condition. Drop the if condition and
initialize is_stopped at declaration.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 35239ed7f916..694b32214109 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -604,7 +604,8 @@ static irqreturn_t rz_ssi_interrupt(int irq, void *data)
 		return IRQ_HANDLED; /* Left over TX/RX interrupt */
 
 	if (irq == ssi->irq_int) { /* error or idle */
-		bool is_stopped = false;
+		bool is_stopped = !!(ssisr & (SSISR_RUIRQ | SSISR_ROIRQ |
+					      SSISR_TUIRQ | SSISR_TOIRQ));
 		int i, count;
 
 		if (rz_ssi_is_dma_enabled(ssi))
@@ -612,9 +613,6 @@ static irqreturn_t rz_ssi_interrupt(int irq, void *data)
 		else
 			count = 1;
 
-		if (ssisr & (SSISR_RUIRQ | SSISR_ROIRQ | SSISR_TUIRQ | SSISR_TOIRQ))
-			is_stopped = true;
-
 		if (ssi->capture.substream && is_stopped) {
 			if (ssisr & SSISR_RUIRQ)
 				strm_capture->uerr_num++;
-- 
2.43.0


