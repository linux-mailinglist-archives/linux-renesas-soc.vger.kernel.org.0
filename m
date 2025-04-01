Return-Path: <linux-renesas-soc+bounces-15231-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 595A9A7771E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 11:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FEE2188AFC8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 09:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76EC1EC016;
	Tue,  1 Apr 2025 09:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FY4nHA9a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4B01EA7ED;
	Tue,  1 Apr 2025 09:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743498126; cv=none; b=WZqlVAld3fdodVJKO0fbPmAKwJjql/vKsWdLSQL4/EI1SJqn8L+l+r/0wErDdTY2Js0lYV5BsmU2TjQz0YbjULiWNFoiPHMgvQ+vYKSAt6IKOsiULUhFiD0Vven6OciSH5k2+jnVWF2M+XzM1UEl8ktdGJzNsBQdE9gL3EJK+/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743498126; c=relaxed/simple;
	bh=PGnADJhL5wB93vHTCfr+XmlDF2wYRdgZMb6zXoavgxI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W3Dxt4zHNxTBDjVg12/bv0dM4YY0PtZKPY+yhIQ6FlelZUoAjWpdnbAV1YKrqHApqoRsYOaEiNHRqKmQg6rGybK2RvRJSCWoEiaBDhkilRuVTgVaB1+UyezR1FJ/xGwIToQiym8MZcnYlxIfUcV1iK3ut4KTW3VhBJJuLN+0SOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FY4nHA9a; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so37278815e9.1;
        Tue, 01 Apr 2025 02:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743498123; x=1744102923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wri67Ds5kiCiIdkC26EEYx8SzSTt/Dvo3KGL2aYUzYg=;
        b=FY4nHA9aAWureyRKzdy3pXc8wJxAQ8i+oonLXSzcnYrQvnGM9sXJ3fdDDCe1Y9U6qE
         ciVTUINUqF0zBnPczzLazCgIrY7Y9JyGGq5NqFF4pV5EcJET6dWeJKxVrn5VCvzA9Dva
         gsQ8hUgxhdlqnJU6dx+0cijlrqBgI6bVGWaUHhcJjeF31T2TdMYLXIiQos8qcQHQ/gP2
         m/coAy1PbgO93FwgofFG1VtQcf1cPRfzUH3qwGeAjfhTiPa5RFBvQky3FD4/3UMdv3iE
         0+u2AMmomIi5dWNwW9e+Q22q+G2HOhe25AGNshwHw/EC+Fgq11Iv8+fdTN1tWx0dNugs
         SElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743498123; x=1744102923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wri67Ds5kiCiIdkC26EEYx8SzSTt/Dvo3KGL2aYUzYg=;
        b=VzL5GX+nHAcE/z7gRF6Gpf+kz8sVF3b9ywStmbf1uj+x+oLKtvdSRz0QImI0sLMD+N
         g9july3KH75X0Q93WsXze+ZpG1vTkeZASJR2+v9nrdFMOLJe7BviBCqYk63RS/y9Zr+s
         y9TgZu0ldEE18stRBGVYnUeJl1nmOPFnoiQAmYJC/IPkPeDkH5VexzLzKf/IkrgUk+kM
         F4G6V6hSf/Yd/fGzO1bCCiP+33QQfSc+L+qhnSZHO4gYiKeJ1EPcfc7O6KkJKly/8Gor
         S2NK6M6lLuTrTnVVuMoBqMGmtQ9o1Vpc1Ua6tt8Iq3h5+olkmN0StxZBRrayRspCY4Ad
         3ogw==
X-Forwarded-Encrypted: i=1; AJvYcCW+Y2qamJAYeWS20Y2ugCdF4hSoxCYhKrh5fvpNQHrWApL5Zc5palKk0nZ5Qo3AnVvHIXlRG5bJcSacRRoa8sqSTr8=@vger.kernel.org, AJvYcCWeTY0PZtL5sfDMwU+GiAGnhG5QWeNZyY2xHInbBxPJrNInNp2tjLiQ7dkMVRl8gYKvWgDwSoS3vOdUSLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyOgi0heSIHUz9Swkt4VEotlXbjKZACsi04Ee/ZD5/pQcGRdpK
	NVLc8gx0gugVLHBsCUBgwloP9MvauGgPz6bkfZzdLfqZfxgXUWqN
X-Gm-Gg: ASbGncvDkkTSlF8K0z47AXi653fOGAU7188oOD0tPT5FMrhbwqosRglvxCGgisijjVz
	BUb10BHpGL5FAyYsy9pjsmtrcWwGZDwUG+kUQT+uTq+gkmsk4+eql5S3MoZB6wjwkMF5CPHwIwb
	ux1N94f7XK+SV4kcgGEkWdZbll+fUlKahO7+dJyBEYmesg3Ak+8w6bp2sPVA/sqp7D6fItwl/N6
	RI1qPW+sQh/6yH9YnlzTF7HdWacxqXVK0RnzOHuBS2d5j7xSilDt31jXGlDyFcVccKtnoQNXBgP
	OJlKPqWOC5UJ4GAQDTbsVN6SfP2cOXGV8EShI+wufvRpQ6dT18Nr8/pg2LjBgkzvUENiuw==
X-Google-Smtp-Source: AGHT+IHnMxzA/8B1PiCr/qwFvdZvG7nBK9Fo8jFLt/kNwQbm8ABV7/dfU79cFcWveKYMQPUNsgJlAw==
X-Received: by 2002:a05:600c:4e12:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-43db628c48bmr96989015e9.21.1743498123327;
        Tue, 01 Apr 2025 02:02:03 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:cd7b:4630:9a98:b82a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fcd0738sm148391545e9.19.2025.04.01.02.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 02:02:02 -0700 (PDT)
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
Subject: [PATCH 2/4] arm64: defconfig: Remove individual Renesas SoC entries
Date: Tue,  1 Apr 2025 10:01:31 +0100
Message-ID: <20250401090133.68146-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Remove explicit entries for individual Renesas SoCs from the defconfig
file.  Since all Renesas SoCs are enabled by default when ARCH_RENESAS
is selected, and ARCH_RENESAS is already enabled in the defconfig,
listing them separately is redundant.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/defconfig | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..5494b8a2380a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1474,29 +1474,6 @@ CONFIG_QCOM_WCNSS_CTRL=m
 CONFIG_QCOM_APR=m
 CONFIG_QCOM_ICC_BWMON=m
 CONFIG_QCOM_PBS=m
-CONFIG_ARCH_R8A77995=y
-CONFIG_ARCH_R8A77990=y
-CONFIG_ARCH_R8A77951=y
-CONFIG_ARCH_R8A77965=y
-CONFIG_ARCH_R8A77960=y
-CONFIG_ARCH_R8A77961=y
-CONFIG_ARCH_R8A779F0=y
-CONFIG_ARCH_R8A77980=y
-CONFIG_ARCH_R8A77970=y
-CONFIG_ARCH_R8A779A0=y
-CONFIG_ARCH_R8A779G0=y
-CONFIG_ARCH_R8A779H0=y
-CONFIG_ARCH_R8A774C0=y
-CONFIG_ARCH_R8A774E1=y
-CONFIG_ARCH_R8A774A1=y
-CONFIG_ARCH_R8A774B1=y
-CONFIG_ARCH_R9A07G043=y
-CONFIG_ARCH_R9A07G044=y
-CONFIG_ARCH_R9A07G054=y
-CONFIG_ARCH_R9A08G045=y
-CONFIG_ARCH_R9A09G011=y
-CONFIG_ARCH_R9A09G047=y
-CONFIG_ARCH_R9A09G057=y
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_ARCH_TEGRA_132_SOC=y
 CONFIG_ARCH_TEGRA_210_SOC=y
-- 
2.49.0


