Return-Path: <linux-renesas-soc+bounces-14909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7C2A72C09
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 10:03:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8235B163EFE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 09:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4324415B546;
	Thu, 27 Mar 2025 09:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIVKcqzf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B792E3392
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Mar 2025 09:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743066216; cv=none; b=c/bihghEj1EaZIEkWUVH3mQMeu8m1W/VhRZ1iDF5gN0Ta+KAXBGEaoFl1tNaGPk5111TH4PM/DinaFDTKkX6fnfQ35SaajytakmmCxq/OjRwivK5B7lAjuvOma821pa6izgBYhPuL/HONbNM/NZYKz5h55AFx4xINbicxqzCjT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743066216; c=relaxed/simple;
	bh=jP73N6+q7I8YcKXigic+jFCM8K5+dmzXGgB+zpRqElI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fIGVFPvR0MsnS0L9ww2f7bB3F05jfg/yEefNukaBeNQFgHgw60Ka3yIslnbPnFyb3Fie1bhrb4PpJLeeoQji3TcpqB9thM1pTEVPJWo53nVxpbVZbIMmbUoIO0EtQ53MXjJZQc0L05epDcGv3jQi0RCk8wWeBTbDKf9UlwE4h5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIVKcqzf; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso4836615e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Mar 2025 02:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743066213; x=1743671013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfIyWbwiIvQExFbbtbWLM6BFase0GJ1ldyzz/ouMYMw=;
        b=fIVKcqzfILqZ1OLF4dqjBT/afI0krdP+0ya1Q/fU3mycGYG9CFn/8R9yAGkfMRzoaN
         B/3OmEjCgNO30V4G5OJbHJx5PivYfaF5r87XpE+TW1uIn1FSA/Kqu+AKp5MkFT+/1iYJ
         ZIPBAg4DnHHv+MyvI0sFQqdvdxyLg8J32FEaGwGK9eQs9ZrqBdzx4ZC4c+FvYntP/dg7
         cARSHia7m2rSIYJBcqs0W50I63Oz34FNipyYFaBa6OxJsokxj31jcjhhFopvlbM0aPke
         gKUx0qwVp9SdXYulazR/DEouqb1N9bwzm/TVs8i4Ufx3wnWST3iTb/1fJqcvM3ccLGdY
         SmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743066213; x=1743671013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NfIyWbwiIvQExFbbtbWLM6BFase0GJ1ldyzz/ouMYMw=;
        b=eEJuei7a0Zg0cH3AP784w0W8sNzB8Stn/NZZKI4RIw8yB0lPPbu42m6zqOhFoq8WHF
         VWpTd81OZRSO6ex5W2pg58Zis1DGE8qwjaqT2BBlNgwyKuoNAXex7vUeon2EeZUgIb3F
         W3gg4kUkBhRT1DrUvq/2ZudCc3TGb8CvwdaP/wQc7iuGeP149pmmkCNBGRL2W3/xUwvs
         fZZXyNUmijh2WxvZxaUafrOmAcjlxByoYwVYDusFXhtoNggjI/+OQ9m66fP6h60dFDXv
         dm4vQ+WfhGMQ5ySylX7pJPHI/ocuVmieGrr6EHQJAOyZEXMjizc1P+HD60IbWpq4ntm3
         CRoA==
X-Gm-Message-State: AOJu0Yyw3MFhYdc/+e3+2vIW4R57vsFEGRX34OB11eDsNHKQsEKeYaji
	IE0LN5fMOIxPdpRPvGjb+a4dEW6uD/LMh4Fb+ORbUtky1h/wtSak
X-Gm-Gg: ASbGnctIENA9/GM+fa+UXhvJAvWN7u8+LdyVCAlQrcizpM8aqwmhuu9skUinQgxvV9n
	atvgz/aL+XZYGTtHQN5u3gec+CqxYlTmJ192RONEi3AU1PDt0/0LZbURqK4+hfgfG9sZhh6tIQi
	tLvwgQlGMbg1Ux/czsSabDujccc06VwsQT43eEmOpM15YKi1AW/8qZ5UCcMJ064ZqllsjgGSyFv
	ZY8L31/5nrSqC/g4XfPnk6Iweyk5ErJJjrKkzYeu2Fd5GIiUVltYEnK2vCFQo981OAEAD4yrLYk
	s0ejYUaIL/EWMgGXG3ctOV3VScmMobRWKUcbhoVq2tXVmvW6Vs/bVwNxdMi6z2IfDifj6A==
X-Google-Smtp-Source: AGHT+IFOCiIbeiqd85qj8YQJem+8zr2j+vvwurEph/fbb+ueAKHYBlwnuiBBBaeuhX5uzJ+YGoh6WA==
X-Received: by 2002:a05:600c:3484:b0:43d:82c:2b11 with SMTP id 5b1f17b1804b1-43d85070312mr26530525e9.23.1743066212480;
        Thu, 27 Mar 2025 02:03:32 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:c36b:2e01:9e11:8d7d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9efca6sm19490682f8f.93.2025.03.27.02.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 02:03:31 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC INTERNAL 2/2] arm64: defconfig: Use ARCH_RENESAS_ARM64 to enable all Renesas ARM64 SoCs
Date: Thu, 27 Mar 2025 09:03:21 +0000
Message-ID: <20250327090321.15394-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327090321.15394-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250327090321.15394-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace individual SoC-specific `CONFIG_ARCH_*` entries for Renesas ARM64
platforms with the newly introduced `CONFIG_ARCH_RENESAS_ARM64` option.
This change simplifies the defconfig by enabling all Renesas ARM64 SoCs
with a single configuration option, improving maintainability and reducing
the risk of missing SoCs when updating the defconfig.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 24 +-----------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..d3cb258f0baa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1474,29 +1474,7 @@ CONFIG_QCOM_WCNSS_CTRL=m
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
+CONFIG_ARCH_RENESAS_ARM64=y
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_ARCH_TEGRA_132_SOC=y
 CONFIG_ARCH_TEGRA_210_SOC=y
-- 
2.49.0


