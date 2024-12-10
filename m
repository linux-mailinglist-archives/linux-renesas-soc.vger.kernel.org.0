Return-Path: <linux-renesas-soc+bounces-11190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8DA9EB7D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 18:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C0D518806E0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1133223FA0D;
	Tue, 10 Dec 2024 17:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Oum+znJo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8B1232378
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 17:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850649; cv=none; b=QQJFoaUGk0A8S//ZgtI3IeB9TbcrMiCvlBgn6GDMKxKOkNcUgmA16GX6f68zvbq19hl6Am0uN/oX7faLjSFiJJ5aQ76rmE3jhoMn+1/lAIGaGyvwIkbg17v08YL3Z1KCBWdLbfpKfqNj58UEbo90Fa5ihYgvQbjJQ565SiRNIT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850649; c=relaxed/simple;
	bh=NtVph11BLd+x3z/1Zok/7JAFGIkvZxSriGpx0rha4FE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gJ4EvKCg5OsGZdciOvADXgCSN/XsIGNbUmmi1o7JHyYRgHQvYkGuen0mR8flWhlvGnHEaYfWUv69J77oV6nKnVTzRcW5oQDR8ZTQH9WFm8KmoH6675/cYCqvq3pwHism1vUKLJrNEcIyZAe5Ov75pFHhjkSoJmVUFl74M0YXtiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Oum+znJo; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5cfa1ec3b94so7696706a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 09:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850646; x=1734455446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pzloo09Dgg4guioxkvLZOvAnsn9Efhp0SVwyR1byrx8=;
        b=Oum+znJotR81/GL+s9X3RPKW5dG7Pck33ayCgAliJEErevbuKFkHniF15QcQxdR1Lu
         vF3o8AhuF6Ny7cyQFsEuNwdPc6trLk/EWN7ujzUcFmQaHysDSPF6A1ZhxolQstOajJiZ
         ZnKbRxOk3roMK3Rz+yycNhSsGq6SJ3gksF1ieic7eNUH5/N3IdtUd70i8hCLfbbCAcfJ
         k80F0Quf6lF3FZxetKrqqw0wS0zJMxdVFKF3jdUSgL1yV+xE9tpT43R43DsKI95fJPvs
         EC4e4vq9x+nXRpvQaTgPqeslzokVL1S2fr6vO7ngkTGvpUSiVxsz5w+aWIRSQeFrjF6q
         SB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850646; x=1734455446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pzloo09Dgg4guioxkvLZOvAnsn9Efhp0SVwyR1byrx8=;
        b=SJHOhWO6u0qljk9/tWLtEWe3dU+t0+h4Asdm+pZCHr242Z5iY2wXSguQBDJ3dGe9pE
         V52N1rNs124Gzvk0xOVRJl1wBK2dDCkoeiJJ/DNfNivnmVyGjjJLen4Je3rBukOvkjfd
         rMwhioOp9ickSQe7OtgWvhvp4MzaRSF987/q/aNesylCfEc8458Lz0FN1NpDzUYmVbnU
         niDv9a46N2iqS2drMh7vPEIOKJGAvF2IbrJljmMMK1o8A9Wk4abz5fVmMuHgdhAFzFMr
         qzZtS7Wh1aR2rrHPxJay7wiPb/F/ICYiZbFC/IUJ131ZC/IYySEnMP49B6M/x1Hsog/v
         +IfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPXnJvQ74UQkWliOIzoNTcr1MjwYI42bZJU2lDHj5lNJ0LjZUwfgw0m1c33bkn+oULIk4tcY4ZbqIeudx1zvb5BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQTB0ekfp8VbAW0fIuJbD/ce8gKtGhUO7DIV/vLsjRBYDmAkvL
	/7HIkLExoF5bItYvG2ypLCc4FtrITH7Fwn9M7HVy9sQpYqBOB4idjSpdfu9ZCyM=
X-Gm-Gg: ASbGncuUCJ7WI0lLjh9Mu/U+MxALG3ccjDeHxrj8TAclFiJQMctEs2JXY/D/c3f3jQv
	wIJKeGlIt4doe2XJrg5MRpGj/td07GrvQYXqfIGu5yg17EFkts+/hiBOVplxViQjupc4Dm4JNas
	Qo+wTolDgV1Y2N5YpnC9iLfYHLN34XxF1kNiRZ0niakTDnLfyXXfo7Fghmdcid44tlF/fGtiQld
	W5e0+jQrHzfkw6QqZccAB7Gcj7UIyRWp/HMYj/TBrQD6ONbeUFi/XEKAiYuIdnvGX8lFRnLKOMF
	D7KuvOIBixk=
X-Google-Smtp-Source: AGHT+IHu+/x+M8u5QIMjQ6egtfsihnsclgAo9NZ4IQV+C7GzhzYxCnvnX8xs1AndpKM2ie6VGxgEag==
X-Received: by 2002:a05:6402:3591:b0:5d3:e45d:ba91 with SMTP id 4fb4d7f45d1cf-5d3e45dbbfbmr13230055a12.32.1733850646516;
        Tue, 10 Dec 2024 09:10:46 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:46 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v4 18/24] ASoC: dt-bindings: renesas,rz-ssi: Remove DMA description
Date: Tue, 10 Dec 2024 19:09:47 +0200
Message-Id: <20241210170953.2936724-19-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Remove the DMA description, as it duplicates content from
../dma/renesas,rz-dma.yaml. Additionally, remove the MID/RID examples
mentioned in the dropped description (this information is already
documented in the hardware manual).

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none; this patch is new

 .../bindings/sound/renesas,rz-ssi.yaml         | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
index f4610eaed1e1..5b42eec864f8 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rz-ssi.yaml
@@ -57,24 +57,6 @@ properties:
   dmas:
     minItems: 1
     maxItems: 2
-    description:
-      The first cell represents a phandle to dmac.
-      The second cell specifies the encoded MID/RID values of the SSI port
-      connected to the DMA client and the slave channel configuration
-      parameters.
-      bits[0:9]   - Specifies MID/RID value of a SSI channel as below
-                    MID/RID value of SSI rx0 = 0x256
-                    MID/RID value of SSI tx0 = 0x255
-                    MID/RID value of SSI rx1 = 0x25a
-                    MID/RID value of SSI tx1 = 0x259
-                    MID/RID value of SSI rt2 = 0x25f
-                    MID/RID value of SSI rx3 = 0x262
-                    MID/RID value of SSI tx3 = 0x261
-      bit[10]     - HIEN = 1, Detects a request in response to the rising edge
-                    of the signal
-      bit[11]     - LVL = 0, Detects based on the edge
-      bits[12:14] - AM = 2, Bus cycle mode
-      bit[15]     - TM = 0, Single transfer mode
 
   dma-names:
     oneOf:
-- 
2.39.2


