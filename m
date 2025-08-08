Return-Path: <linux-renesas-soc+bounces-20170-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DC1B1F06A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 23:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78DC83A385F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Aug 2025 21:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FBCB28A419;
	Fri,  8 Aug 2025 21:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmL/NxpR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB954289E39;
	Fri,  8 Aug 2025 21:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754689944; cv=none; b=uC8VZUBrwyvkoGwWPQ3XjdTEI/87i0DetIFZqKLjgUjVTM4o0BZ7reRgJ5UCC0aK3BY6KErRzPN4ZuFcGMyU6ChGdaIA7HGsy6ZlfaxNeS0Gn/xag/G5ExZPEh5ZrlqKO85Pf3x0LFETMjDe2mJ78+Y32OxPnWXET3pyMDzGh2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754689944; c=relaxed/simple;
	bh=MgRQW6IwPCnaCl/We4GjzTXHJKwd4rAbiwcpcw8mUjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z1f+ssYhMcFJV6GNPR6X7udJJAkG51qRaIrbY6F3KIdKKwBmnmWhya90VtvRZyPtyGnli5GPCwez1nIIvtWdytBJnrSWw3M4Hd1XbkelaKZ8sP5RAOJ1s50dBM9hXLwF5nMtFB62mVGZDl3Gg7pNFQSAn5m4xiBxQRbOR2YoeNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gmL/NxpR; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b78d13bf10so2591938f8f.1;
        Fri, 08 Aug 2025 14:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754689941; x=1755294741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmSdf/9CQUvl70IdXMlZn/po6qGixtnt6qlryVPh128=;
        b=gmL/NxpRX3hP3eUbZ/BF7bAjzKFMvBWLLrZq48q/G5UbEw+p61znkD4CR3XR/stsK8
         c56soMm/MOqkSeYe2lLd2+sTAJPt1Y/OKKU7q4Y2JCibdPwty1LctDs6zFXwrZ+mHBPh
         +c0+z+y+yGyxMFp68WRaGFlWaaCubtZvne/8/Gg89EWmLIRu490VGLLOEe+o2DZSsC41
         e2Sj6Xt71jgXOu3aEuVwdQ1OMmCUwKqW8NjEBIIrZckFccVqtmwAagDtsXefSmZxUiI/
         qKq83YnHNbb1lkEM1dMJPbuk2NQBERAM2aEJTws2anW4CNDmIq93fEHxjo5H+Rc/k1BJ
         D99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754689941; x=1755294741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmSdf/9CQUvl70IdXMlZn/po6qGixtnt6qlryVPh128=;
        b=JfoQNJ603wQ53xa42LscOwhECUo51wmNcnfVUAJGOdJ8r75+lvJyodavOk1jXG56Yl
         h0KYCLr+bYN8LELa/yWAgz52Npaly1wI3hSboWH7rySFIte/jV/na0dD+WXLHYgKnhlh
         DmkpV5qc0ucb8Bns/5yU963Ayi/CLKnqKv+mj4RMFYu1sB3e7KKB/mJn0Ji7mlq/Yre0
         lBuyCdS5zpDQg4nLO+Jlgx/S2sE7mo0dAkqKeuC00rYvYBNK4R/MrbZsSpXDONDFwq4B
         SoPGLob6kplrIEImv7NnoUwGVHx1Rm8jISGYbHQ3F1TmtVo7uboU+qqcitxcRpgdHskR
         YeJA==
X-Forwarded-Encrypted: i=1; AJvYcCVKEg2XYFr/UunQm7rrvncOKMiNJqYBVT0HTsPDXZJPuKmbeCkL6BU1LfKx9QeqVVKA/RTMQBK3x18x89Knc0B0lqs=@vger.kernel.org, AJvYcCVz/iKWCzZy8/gl8G05XhlRgpnrqtPy0uZ1VTh3WzP4w5cFk7DbTV+6AZArH9DC/pj0rWXS0l97vpGdZ3ce@vger.kernel.org, AJvYcCW+yTTn/aum/C+7q/SjQyCEtEFwaqkozkPt8HgxUNAOxKWe35xQbSnzICHIJ+Lyqe36IRvzovmnHSiO@vger.kernel.org
X-Gm-Message-State: AOJu0Yybp61dgY/5vmsg7yZu1ZozU7vLWH6gXxH+qul1zIkagBjheEu7
	OU2FkatoigAYeGUqgGJuDWEXGGweCFePDKFQ9aTvqSIXBcMzsQQsuAWP
X-Gm-Gg: ASbGncuHU/2oK87Qqpq0yIiYdJL6qYibCHleaRXsHpTnqWVuPS9vlPm2EBlfk0FtmNh
	sU0vGpsRmjJXjizV8w+KUlTJv6vuwzj0V7RMuSkR6h3dEWRHv+9rDCHlFCkgGdXrKpD2m3puOxI
	iMGdsEOxxxPA0azUPGoE1R7lpeX96n4YtZWyc/UOaXmL4hpl9/veTAnwKPSMmdSy1OezYA9szwj
	tYWC3cvnwpSJqdhVicRGamhKN9qCgwMW5r8f16OGGP/jed8TwJtEshlmYffeL6WPF6jWmTAcQBK
	8ID94HX0eqxStLz8mDhVypKG88gNPBSrEDc8lSKLgjDL6vJdp4TWHlsy5TW2hfDvBKQV7Kmfnle
	eGHmzIkFvfqFaX2QX1TuiC+nSYnbOFzxLJQ1E7lFQRNqCIkMQHZlXWlhB2xemcG8h9lqHg2/jM0
	jOBI/jkOc=
X-Google-Smtp-Source: AGHT+IF/05lCcQEipOrmBWnaTpk2Y7mleC1kcTd4heh6tjbXJbUyTuT7e3mrMhTJPNdy+G7l0l5YmQ==
X-Received: by 2002:a05:6000:4283:b0:3b7:8af8:b91d with SMTP id ffacd0b85a97d-3b900b72e05mr4400030f8f.35.1754689940999;
        Fri, 08 Aug 2025 14:52:20 -0700 (PDT)
Received: from iku.example.org (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8ff860acbsm5326759f8f.51.2025.08.08.14.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 14:52:20 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 5/5] phy: renesas: rcar-gen3-usb2: Move debug print after register value is updated
Date: Fri,  8 Aug 2025 22:52:09 +0100
Message-ID: <20250808215209.3692744-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808215209.3692744-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250808215209.3692744-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Relocate the debug print in rcar_gen3_enable_vbus_ctrl() to appear after
the `val` variable is assigned and updated based on the VBUS state. This
ensures that the debug log reflects the actual register value being
written, improving debugging accuracy.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
v1->v2:
- Added Reviewed-by from Neil.
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 8caef9cb228c..7b4a6e8b7508 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -211,7 +211,6 @@ static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
 	u32 vbus_ctrl_val = USB2_ADPCTRL_DRVVBUS;
 	u32 val;
 
-	dev_vdbg(ch->dev, "%s: %08x, %d\n", __func__, val, vbus);
 	if (ch->phy_data->no_adp_ctrl || ch->phy_data->vblvl_ctrl) {
 		if (ch->vbus)
 			regulator_hardware_enable(ch->vbus, vbus);
@@ -225,6 +224,7 @@ static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
 		val |= vbus_ctrl_val;
 	else
 		val &= ~vbus_ctrl_val;
+	dev_vdbg(ch->dev, "%s: %08x, %d\n", __func__, val, vbus);
 	writel(val, usb2_base + vbus_ctrl_reg);
 }
 
-- 
2.50.1


