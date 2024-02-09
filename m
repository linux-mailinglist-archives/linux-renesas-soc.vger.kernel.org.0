Return-Path: <linux-renesas-soc+bounces-2562-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C4B84FEAB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 22:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BECA81F214BB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 21:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5FA25748;
	Fri,  9 Feb 2024 21:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="b8WtF4f5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A0525625
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Feb 2024 21:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707513395; cv=none; b=K7/2yn9zSUYhD5sRqxQiIoUnqod22kcqCGQ768rHP1JNQDQU1Qqih1CxIKUBp40gEn98GCKia+M8WRb7vkI5NpJ9WvGJm/ZYoiq0ht3jxq44S+xM54W6ywgnNWqAu04QN8q5ZVHHjbG4ZiXRvW3XUMKfR2/ZLEwaouqeAaN75So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707513395; c=relaxed/simple;
	bh=9Rqn7dG8jUY45g42br74qgbQcA5VF0xJkzGTWv/b+70=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Cok1eJJKsEWNZc25pONXstOCfqsaC02MchvoSa02P0v94K5eP1aZxcreQehLE6CGKtACSDMvSN4i7AXi24cqW0z6ulUqUrDTv6XE8HBhCBgnc0RWorfnMG/xEBeaj+rLqFXAe2DCMAtS5OVBkq/BdKg7umfHYnOhmFzGcvFI2Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=b8WtF4f5; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5605c7b1f32so1877460a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Feb 2024 13:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1707513389; x=1708118189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8wmYeTCl6g4Puyeq+hHOJXDfECuUyxrrSnQt72/tYE0=;
        b=b8WtF4f5QNq9Z5bb/tPnz9wmHBGM/DzASv2q7z2M0dIZg+qRQMXhYKqiGy939ttKiI
         QD3/gaEJ82G3vM+D524w19QkMJ8RZ0cyyk4rCZScs65dd+jtE3flSZYQjOhpOjovv4tq
         VU9+H2qAy0hk4USeYRQZuzbfPSMpjvcvGjB2iQIJIb5OlgV23h/er9Z4Ic0kwCv5ZZ+7
         fJuRNtBv+hGrSpaaUlm+U+oEo3+ETS2gJSWqDcDvxQoEXnDr8tflkK0GkH8K57Wu6BRr
         JdHrefRhQ0UP5ZN/7qxYjBH4oBAtKSHDqKqOesyplVp+d5wafah1osyIuyDlwfkBfDZm
         f8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707513389; x=1708118189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wmYeTCl6g4Puyeq+hHOJXDfECuUyxrrSnQt72/tYE0=;
        b=ACv1cKBECVzQKqXWP61izhR1ZRs8RdFWn9cYVl/nutzR43RfUPu7NTY7mczkdNgBJ+
         NUUm7Kd4WJz3HlOb7r0eX+jLXeOlqqmy0W6RSSnzE2zvmkRscu9E+2uDFNsWW4b4XILi
         bUN8MCuRzyF23QaAfLb+neCZ502PsWz6g4lpIJ4Qdr30CL4RWwI2EjEFWTiVLsrcXOIw
         Yf7ECSkj7PnNy4djR7bzB6uvmAMFHeIbuoUD/eLMoEWnqVugP9v7/5KsrWTa+QOoCeRm
         Eana/Eh8NWFV3iyq2CDzNmWtRJ1GonjBVY94+NHHXqRDIWg1IIrr2e/ebUptb4cjp0no
         2AUA==
X-Gm-Message-State: AOJu0YxqNN6vkNW5cHVuK/qK+wlHDagLGaTGTt9hR4G/d4PRJ4m80kfE
	cuBp2ZHachNIDcHK3ZF247Ym6IMga37uiznXGhKvPNRc2idNW0/Od1GW7XGUFzs=
X-Google-Smtp-Source: AGHT+IHUWcxtsHrW3Eeqb5w5ol2U9vAxa0u7f2aOE7ikg30kSaIdN/HxnhU3z40HI5iT6jcK/oZqHQ==
X-Received: by 2002:aa7:cf14:0:b0:561:aa3:fafb with SMTP id a20-20020aa7cf14000000b005610aa3fafbmr85595edy.6.1707513389128;
        Fri, 09 Feb 2024 13:16:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWfVcY9Lnfb9ZeVVYIVs/4ouIFo69Fbbgu2cCZ+eNeDPpuxy474PeZs8VYOtGFRL7tHV8c4mlgWuI70nE6veueLPYz8LKGmNIWHPXbNrBJbODmXwnNajWRAp8UWOHjTnjOC7yEoQrD8PIznUHMQGfMJmvh16vRWKunRRN1r+J28YY0peAyt+EE/qt9I+k0WxJkogqz4wFTxfwEJBTv3zRU/oKrvKsuw764Xs7x6RisJcE+URzaAv/GNpOcUg2BK+wOL1xhQZESQwNhuey1ax4128+aSwgfiDRFurPo=
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id et13-20020a056402378d00b0055d19c9daf2sm105202edb.15.2024.02.09.13.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 13:16:28 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Lukasz Majewski <lukma@denx.de>,
	Sean Anderson <seanga2@gmail.com>,
	Tom Rini <trini@konsulko.com>,
	Hai Pham <hai.pham.ud@renesas.com>,
	u-boot@lists.denx.de
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] clk: renesas: Fix broken clocks on all Gen2 boards
Date: Fri,  9 Feb 2024 22:15:35 +0100
Message-ID: <20240209211535.3313392-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To prepare support for multiple register layouts pointers to register
tables where added to struct cpg_mssr_info. These pointers are suppose
to be filled in at probe time and no intended change in behavior was
intended.

However the new pointers where only filled in by some paths of the
driver implemented in clk-rcar-gen3.c. The path implemented in
clk-rcar-gen2.c was not updated leaving the pointers uninitialized
leading to a crash when trying to probe the clocks.

Fix this by filling in the pointers in the Gen2 code path with the
values used before they where moved to struct cpg_mssr_info.

Fixes: d413214fb748 ("clk: renesas: Add register pointers into struct cpg_mssr_info")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/clk/renesas/clk-rcar-gen2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/renesas/clk-rcar-gen2.c b/drivers/clk/renesas/clk-rcar-gen2.c
index 66ffef96b695..89f2d9667469 100644
--- a/drivers/clk/renesas/clk-rcar-gen2.c
+++ b/drivers/clk/renesas/clk-rcar-gen2.c
@@ -298,6 +298,15 @@ int gen2_clk_probe(struct udevice *dev)
 	if (!priv->cpg_pll_config->extal_div)
 		return -EINVAL;
 
+	if (info->reg_layout == CLK_REG_LAYOUT_RCAR_GEN2_AND_GEN3) {
+		priv->info->status_regs = mstpsr;
+		priv->info->control_regs = smstpcr;
+		priv->info->reset_regs = srcr;
+		priv->info->reset_clear_regs = srstclr;
+	} else {
+		return -EINVAL;
+	}
+
 	ret = clk_get_by_name(dev, "extal", &priv->clk_extal);
 	if (ret < 0)
 		return ret;
-- 
2.43.0


