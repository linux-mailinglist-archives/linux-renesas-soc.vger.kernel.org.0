Return-Path: <linux-renesas-soc+bounces-15233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5326DA77722
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 11:02:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 052D93AB510
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 09:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EAA81EDA3B;
	Tue,  1 Apr 2025 09:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXKBnHEz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C745D1EDA10;
	Tue,  1 Apr 2025 09:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743498129; cv=none; b=nt6ZsvWWk6PfTf6GjTx9FJI0EvW4onxMRBCZADWJZdOCV8bc/BR+vKM7jYZi7ePrV44wmS5lZS09HS/dOjNvyc3iNCQFU1JsRU2HgOIdkCERtQ4FYMMtTxF3Wg5AWycc1CNxeibCtJW5m6pt5FORACPAjFyJtDZVJniOVhB1IRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743498129; c=relaxed/simple;
	bh=BN0MmPV49sfKH2EGLZnIOKfH+TmWaUx5L8s2nnTkvsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gxp98QT46v8ML6dR19TJzGlmmM/wtSsdN4/f7GOhggxlsnM1mFDBBnnzWvOOrgtd896iH62Ab9D83hRC/H73ppKCDvypaeuShqSNC6CjSzSY5WXneW1yng4DDQQzu6a2bS0JLzxkG1AcY7JqVszGwfYmTaFybVop4arGq1RuDU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXKBnHEz; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c1efc4577so692586f8f.0;
        Tue, 01 Apr 2025 02:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743498126; x=1744102926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0r3mxHe+i3LeXa5yS0z4WXJRqy9ymNunl85KS8e+g9o=;
        b=aXKBnHEzl2eAC84FXhKswJSm1N5yqzyuYRaoFjsVjLqpFhxn8gUR2CI8Tt2fp4SnXG
         5wJwzgcIYk0ai2QLYfDeCpka14NYfeVacFDhoUFaOm/xwi52EzsKdklAV4BxZXdzf/Vc
         DiURsleJd3u4w2hLmozBjjfFE0XPSOhXuYhX5liF3ihqHHAODTQofRQ2XyMD38O7PahB
         lJFu42HqDewzQRN7CM/kQdGrhUlMB9PeoCGMY8wkT85zSyFM1uXBL0CDcKWHA5vY5GH1
         MQtlpQoi5uaDyz+m29Pub7vR/tpUoJg6YeMnLPEHodoK/wGzgH39Krp+6A6ILzwIkbgo
         +mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743498126; x=1744102926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0r3mxHe+i3LeXa5yS0z4WXJRqy9ymNunl85KS8e+g9o=;
        b=PU1VawVvlqzmCfZFIWU3Wyo2XTZshfrzfQKc5O6Hbo/vTZK1IVv1kYmj+KOlaxrhmh
         4yWSPltMzoz9JyMo9EtUyP8qjuUzuPK4lkN1dM9f0xHiaMrZ4PO+oXiS3R1MH04P4qy7
         8vJXy/2HD2YZn8aIPpgOshJJAzab+iNIRYoEHlIdnhkkfqwJSudaiaR18IUiRjqDlRYq
         e8bKuu+O2N0EMYPIMCSXpveCVB75tPOGCpaXYr7cYtnLXLpH2tLAvb6mUioZxp5W9cAd
         SHgp5uiIpXHKy2XkJqYWXz5kl53acu0aiuR2+HyXvI0NdDrIXmnr5GK0gsSokmxhoxaP
         zl+A==
X-Forwarded-Encrypted: i=1; AJvYcCUT6jbNmOJbezvgo/KGSlH6rdOH8uTvymbQ2Z/GJs63cqTXjw3St0FZbMr/IkGyd3JcjcikUJ7QC+/QfCV9nXxBhNU=@vger.kernel.org, AJvYcCXnwDw6ZTKM57LGgN0BXHHAjGs1RkFRIgGdMN1PUt81LWIP7omsTz6UZ23/ApNkNWf13GBjB6Xskp9JQOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTB5g7XaeibqQf1hce+XZAAPymuHXn1n5Mz1Zb4FW+ARpWFPkK
	SGnxMATwFCIUiAC+nQwpD+ytGl21X0TKUyz0HZA0awFNdqK6zSW3
X-Gm-Gg: ASbGncuONSb460YAfZDNODAjjr5O3G3cNPdqMiNe+euD3SOa8OeRJT5byBhOrm3B89h
	UeeiENBSg+FzNB7OEP0sXoaA44vv7EnpC8zQzSPMx1jumuTG6wDwnJLudgyVDuNUK4H4mqL/8Uq
	QiRsRglOHkAH8JlxTnUVAeyI/O7C0X0OgDa6xkFCFIi3I5Kg4quaDhG4EmM4XOp7tH6Vr9x1wWq
	fQ+L7Ve5n9vYjS8GtcRJ82t0Yut0rJsfedpM0qptjxmqSj2OcF+apt9tVpqvUyA2SJjglQYO7Nz
	RjcvWXk0D99WKz/vfa+uC69fLIPnB/rZFrRyC0lpGYa5zCeyQnhSLyjUKvV6BtIzZbjoUEYrkp5
	vIUd9
X-Google-Smtp-Source: AGHT+IGmKFvTg/yofctMdQrb5S0LWZbbLHd3QbiAYm+NG01gLJytZaWUloiGIY2dPZesUFUEoFfQWw==
X-Received: by 2002:a05:6000:40e0:b0:391:47d8:de3a with SMTP id ffacd0b85a97d-39c23674872mr1516570f8f.53.1743498125946;
        Tue, 01 Apr 2025 02:02:05 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:cd7b:4630:9a98:b82a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fcd0738sm148391545e9.19.2025.04.01.02.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 02:02:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Russell King <linux@armlinux.org.uk>,
	Magnus Damm <magnus.damm@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/4] arm: multi_v7_defconfig: Drop individual Renesas SoC entries
Date: Tue,  1 Apr 2025 10:01:33 +0100
Message-ID: <20250401090133.68146-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250401090133.68146-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

ARCH_RENESAS is already enabled in multi_v7_defconfig, which ensures that
all ARM32 Renesas SoCs are enabled by default. As a result, explicitly
listing individual Renesas SoC entries is redundant. Remove these entries
to simplify the configuration.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/configs/multi_v7_defconfig | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index ad037c175fdb..28a6ca750861 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1121,25 +1121,6 @@ CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=m
 CONFIG_QCOM_STATS=m
 CONFIG_QCOM_WCNSS_CTRL=m
-CONFIG_ARCH_EMEV2=y
-CONFIG_ARCH_R8A7794=y
-CONFIG_ARCH_R8A7779=y
-CONFIG_ARCH_R8A7790=y
-CONFIG_ARCH_R8A7778=y
-CONFIG_ARCH_R8A7793=y
-CONFIG_ARCH_R8A7791=y
-CONFIG_ARCH_R8A7792=y
-CONFIG_ARCH_R8A7740=y
-CONFIG_ARCH_R8A73A4=y
-CONFIG_ARCH_R7S72100=y
-CONFIG_ARCH_R7S9210=y
-CONFIG_ARCH_R8A77470=y
-CONFIG_ARCH_R8A7745=y
-CONFIG_ARCH_R8A7742=y
-CONFIG_ARCH_R8A7743=y
-CONFIG_ARCH_R8A7744=y
-CONFIG_ARCH_R9A06G032=y
-CONFIG_ARCH_SH73A0=y
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_ARCH_TEGRA_2x_SOC=y
 CONFIG_ARCH_TEGRA_3x_SOC=y
-- 
2.49.0


