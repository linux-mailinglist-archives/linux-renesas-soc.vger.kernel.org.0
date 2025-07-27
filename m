Return-Path: <linux-renesas-soc+bounces-19703-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ABFB1303F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Jul 2025 18:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53BA01897EEC
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Jul 2025 16:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EACF3217F34;
	Sun, 27 Jul 2025 16:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqMCfcLX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EBF2A1D1;
	Sun, 27 Jul 2025 16:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753632458; cv=none; b=Dnd7HGHX/xp+h04pNDMYAS1RejlnHFxf45Yi1jV3uoZp2/UqeXrOBbdpDdQqdvZe/6xWwNQTb+fKqaCzjEkVmECBDGYKR6XlTSeEhc+DEB5Y6DVMKc0yvIArxwqPzOD90wUvqcXzljkkkJMGVgjzFJ2qWZomEwpMx4/W0ict3+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753632458; c=relaxed/simple;
	bh=0x8fxR3jQKVTLjQJKMi31zvpcHKUNNZuh+xBEzgyPWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aFoY9biI9buIhwQxOlJRLc7bdkHP0vT8JtNCa+SJqlGTOh7475klGlHTWEvEIFDhRtYxFqvp5Cvpj0IW6wfc1Aena2u69HwwCY1D7F1yUXz+a+dVLAWHy+IHyI42/mbBDu4yXury4Gfi4ogq4Nc2xZkhbTjA+EYjWqlD/6r9JTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqMCfcLX; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso27059695e9.2;
        Sun, 27 Jul 2025 09:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753632454; x=1754237254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HDpAJaREeJqJesXLLGpj/suPTX+4uyqsUs2XBvBthEU=;
        b=SqMCfcLXrFUPSiK1McDDYDzb0j0c708cVp2YOAw48rMOVE3X49IIX61H3Ac1zoA09i
         OsW01GDGPJTYt0NyaOJ4ObrHGDOX0bGDsrQ/rg3P1D71n909u2bc+Zv+ton3yvjfE29F
         Hg0jjK9AbbqRM8l8IoZnb80ztDlc0HxSo2NsDc+hfTlZ9q6jbsNddsG1pcui4M1naZJ0
         N1P1CKGQIz/SbfVSWiVu5KEgw6MV2FJfo5oInf/fDmn23RTwHOSzuIUXbfKD3LhD1P3Q
         fp0wOBZbxK1Jv+jXSF2TZRTl1+3uoClhLsicABStcqPHDL/61uDkfGEUYGk2qLmh174Z
         sS0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753632454; x=1754237254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDpAJaREeJqJesXLLGpj/suPTX+4uyqsUs2XBvBthEU=;
        b=noSMYBSytPDDJLVmip/TTFx29zVpEzxxOfGi+8lGwfOp7S5KYl3eIXDP2zwN0fN6iN
         WXsJH+PQtWt+MlAq9RuTkUl8hVJlmyCJ5Zia1i2FCef9fRx5zBk5oUdrDfsrZ09Ss4+d
         hHuVhdrxycNrDp9gGSR4lpdnZ3XNYASSf8gUhpnh/By/0Qc2BzzYixjnj8nng+zCmjuX
         gh4/aDr27qDlZwYgokGFvTsmLBgHuI7OiEtssZO7aE15h+L/TH2oRjJQ5/AtXM8AfH4k
         SbRtEutfJ+1ZaolZeaVQDVoaerWI+8az/IBMrBS8JkBHvEyXZ6eZgARGxiDEICw3tOKc
         +KyA==
X-Forwarded-Encrypted: i=1; AJvYcCV/DtjQqJIWKBl25lFzTeYAk9rFYDG5Zfjh6pNdZSJGCCgPT2tJ5lH928RklLieXD9kCFohd2UbvxHPM1s=@vger.kernel.org, AJvYcCWFcNqfVlxQsp+vHfGfAdOD9uZmy1cTr6kHNEfCHOYPtNdZXwn9yQaaLhhM+kxNjwqISNor4kapy403nDSsWZkDIyI=@vger.kernel.org, AJvYcCXiiikf15+GNJXzGuODWoZtTSqvcHh0LtCaFkCjFjgOb03PCsAVF9zTCzxCIPQrTt0bYZttlGs/pcax@vger.kernel.org
X-Gm-Message-State: AOJu0YygAospn1jy+tgLEWtEcguWul6PLfhrZh2VbYK8C6lyKqnGlrq1
	98EiQR5xP02USNBZbpbsm+wi8eGcWWB8UJzNNLDnGib2IqBIh62XuFBB
X-Gm-Gg: ASbGncsFSWFMCTz3FXtQ+9GeObKeUuIq3rhqAnaIWFyNPnR1VU65kfoNeQGZFMJlk2b
	/ZC4pApD7ABDXnMK/y6/7ALCrQ6LYcdzKzkSkvTqCRLhw1T6zmJe2ySMuggm8tD24x1/y1A3rdp
	TT+HrvkGaVJ8URS0cPuTZVQFcnCIJ1I+ew3UQEEBp1eRE/yNAwkgD/xO5rHUvzh+5+gSx6lCcmU
	fu0MEGna0JMq94EeBkV6UX25y632soeJtvmJP+0aZ/I1iYqlQPptOwxzW8A27hf/R8quf2lHh4q
	q/X8R8xpcK73+pRcSag8bdseV5WP3NF/0hxv+fce32D66MlvobzpDrdP+0XamaKaSCG6B/i3ubg
	XZlLV1UIPoScbTk0q21O8xiUNkHQmwEr/TnM68DqVCb2R316VFAsHPA2nzXg1ulzJXaSHgJdtag
	==
X-Google-Smtp-Source: AGHT+IFSt3sdIgAXXN8wsBGZM1SKL5Jm9g4xwSo4s2eNu8YGQW01DDYElfzRUGerOlKPd+JrfLq5gg==
X-Received: by 2002:a05:600c:529a:b0:456:475b:7af6 with SMTP id 5b1f17b1804b1-45876306dd1mr68044425e9.7.1753632453560;
        Sun, 27 Jul 2025 09:07:33 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4586ec63d29sm107788615e9.1.2025.07.27.09.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 09:07:33 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/2] Enable 64-bit polling mode for R-Car Gen3 and RZ/G2+ family
Date: Sun, 27 Jul 2025 17:07:25 +0100
Message-ID: <20250727160731.106312-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

As per the RZ/{G2L,G3E} HW manual SD_BUF0 can be accessed by 16/32/64
bits. Most of the data transfer in SD/SDIO/eMMC mode is more than 8 bytes.
During testing it is found that, if the DMA buffer is not aligned to 128
bit it fallback to PIO mode. In such cases, 64-bit access is much more
efficient than the current 16-bit.

RFT->v2:
 * Collected tags
 * Fixed the build error reported by the bot.

Biju Das (2):
  mmc: tmio: Add 64-bit read/write support for SD_BUF0 in polling mode
  mmc: renesas_sdhi: Enable 64-bit polling mode

 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  3 +-
 drivers/mmc/host/tmio_mmc.h                   | 14 ++++++++
 drivers/mmc/host/tmio_mmc_core.c              | 33 +++++++++++++++++++
 include/linux/platform_data/tmio.h            |  3 ++
 4 files changed, 52 insertions(+), 1 deletion(-)

-- 
2.43.0


