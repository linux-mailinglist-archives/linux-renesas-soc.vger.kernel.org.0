Return-Path: <linux-renesas-soc+bounces-10152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 988049B0747
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 17:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44C721F248E4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 15:10:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC4E217475;
	Fri, 25 Oct 2024 15:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DlPaA5U3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E9A217443;
	Fri, 25 Oct 2024 15:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868728; cv=none; b=fQJd62vwus/ikf4qBNUz/dATz4AYE+WB1BtHMHdvWyq9IqIqS1SoFfrEnkbIzuWYt1w5izJkA7dIvxShzdhH255NuTr9PaK/3mAmafI9csIoyMK8IzmEVdquGDpzKz+jhjBV2r0utYJ4XWBgoT2Ud4YkAOKwuHxpRGsETW/OS04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868728; c=relaxed/simple;
	bh=DpDaBRhjQEnLaqU9vxEZzLU17ROLebTe3Z+BN9gIgE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dnTd5x37S91kK3c+Gg6Vle1ej/TCKUkhpSVp3ZO6sY/GY0NBCERDyMnx6HKz6Z0kGKoRVaKuYdxZEWDkOTycoCFNNjFmjXkDShndlw/HQ/+Y9quyAzCwn7XA/BNEYDqbgeKk7KfBlSZ0GkWvxC+H7ZpN0/u5UZA8tGwXS6I0npY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DlPaA5U3; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d4c1b1455so1373984f8f.3;
        Fri, 25 Oct 2024 08:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729868724; x=1730473524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLwKUCDJDQmIgbj3EJkbq6jYGQfZOf30H070CEySzBw=;
        b=DlPaA5U3suY4Zl54yaw/IQ0IsUoDyC/FgxRO99O/8EeYVlf2gxakyqcrvKbPw27uqA
         rr5TFxKzhCIBhjG5dC6w/k6TRxBsrbkIop4qwjMuH9xTwfMae9uYWZaNoSC6pOSjpwwC
         utYQSgWRWxMEZSW6psMoKGQvT5j+1oYN3sZOFC/pg1GdyD4kdBtkerJ3h1yQxbgyV7Z9
         w16pVMsdOjftqf0ffY7AW5lygwVpLdvMwnrYUFzaKlD7TMzpTYlEXi7DktrrWHxg04QE
         bvN5pP1SDi+inO2IQpXwz3tkarTOBwea2Z01rJzeq1OIZV/Kfxe7FNJd4xUF7Hdiunre
         +WWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868724; x=1730473524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLwKUCDJDQmIgbj3EJkbq6jYGQfZOf30H070CEySzBw=;
        b=Fp9zyomgByXUZLaf5rG2ZDzi7ZJsZCfyTslFe3m+51cwzY5rQtDKfSswiuDoorvG7i
         Jpu/Ju4n/OX7amX8+cefHH7wrrQ5PnT1gUEugqV7l60YPWPlvsUMoXRMFR/p37Pnn2Gl
         t+l/CWJjRqbv2wFh+Hw/yzbB3PGEaQzugc82lX6K9fP8Dg/V6zDmIj7Xc+n1GjubDahL
         q8rkyp1iguC/+WZOtRPPzlJ4t3WZ5hTnskb7CpAVQ0Qba2X6y+0Yy9g6Cq/LCXIPLqWR
         YmOAYpdu8VGfjopCdviYHzPg4syx9U8ZtiAoicOC/+vx09Bkd+vUNAudZVktaB8H1Utj
         Ya5A==
X-Forwarded-Encrypted: i=1; AJvYcCVZJNO3bxtWCKyVvd6INAV1S3g726IEe++YSEV/ConZMYvXaiYJchMqmBrJWkHnmOb7rZDad8KapaTdwlfUX4QI0v8=@vger.kernel.org, AJvYcCWpLH/6EjFHksLDnXUfqG7d1sIh+FiNPLBT5gYTBYH2PMLwwNUtHLwO8MxPCu1s8gHgfv//IGQv6QHK+Ck=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrDjSVN2vGnJHvyxIlE/fC2gwz9DDG+j3byz7LwMwsegf7js5x
	kJb1xkZ86bfpnk2IPAIUnXxW9jiM9+5wiHQ8mILBbCQkWqIOQaDC
X-Google-Smtp-Source: AGHT+IFTGTmhdBL7uQyum+N8dgravHzk7p7/TnDnJgaccpeW/XL3X57DReKUvVXrmN7fQBLQggqF0Q==
X-Received: by 2002:a5d:510e:0:b0:37d:4332:e91d with SMTP id ffacd0b85a97d-37efcf9320dmr6375033f8f.52.1729868723354;
        Fri, 25 Oct 2024 08:05:23 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:1044:9cc9:b89d:54cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3b57bsm1764349f8f.26.2024.10.25.08.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:05:22 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 4/5] MAINTAINERS: Add entry for Renesas R-Car and FSI ASoC drivers
Date: Fri, 25 Oct 2024 16:05:10 +0100
Message-ID: <20241025150511.722040-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025150511.722040-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241025150511.722040-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a new entry to the MAINTAINERS file for Renesas R-CAR and FSI ASoC
drivers.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b009c3ced239..041df0410e81 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19683,6 +19683,17 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/renesas,idt821034.yaml
 F:	sound/soc/codecs/idt821034.c
 
+RENESAS R-CAR & FSI AUDIO (ASoC) DRIVERS
+M:	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+L:	linux-sound@vger.kernel.org
+L:	linux-renesas-soc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/sound/renesas,rsnd.*
+F:	Documentation/devicetree/bindings/sound/renesas,fsi.yaml
+F:	sound/soc/renesas/rcar/
+F:	sound/soc/renesas/fsi.c
+F:	include/sound/sh_fsi.h
+
 RENESAS R-CAR GEN3 & RZ/N1 NAND CONTROLLER DRIVER
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 L:	linux-mtd@lists.infradead.org
-- 
2.43.0


