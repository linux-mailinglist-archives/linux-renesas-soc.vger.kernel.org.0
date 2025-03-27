Return-Path: <linux-renesas-soc+bounces-14939-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAEFA73E9E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 20:33:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66A1B16566C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 19:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6431B28EC;
	Thu, 27 Mar 2025 19:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEZBWX7F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4BF16DEB1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Mar 2025 19:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743104018; cv=none; b=MXeaRGKsn90VcvlD3r9lYH1RszWSTU2pNXR77hH44ygQHuDeKHGOVohTNiB2rEEJKyQdwCLvpEfwBINid+t29VxMOfWfufamqxaxNyV347p2WORcS97DIsreAsNi4eDcyJZpTJngp/hO1szltKZGB8iFUQVE0yNqP7PKp+CeOnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743104018; c=relaxed/simple;
	bh=Ot8uZ9R1NNFAEsWpkNDqbHVZnGrEnMDc8TVCbtgs28g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YXcrss8SO1cze/B6goCBWW4a62O4+6RrW7bTJ/2iQzsTUJhLQlNscRcZe8uZ7R0DkjIUo4cbViBeQ5CR7RS/8quVDx0iAPI+k3ZFEmuqYw8/qeFbaVWpyl++FiI56iVjryQeXbHz5MG041dsay/02gScATu9t8JZuW6oFJe1D0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEZBWX7F; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-391342fc148so863978f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Mar 2025 12:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743104014; x=1743708814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMCA06fKWwqGWZF9sD23Th9HIFPETcbUPJeMNvG9UII=;
        b=cEZBWX7FTlmpDEEUm8MvVhGpW3qF6HMnc3n98iH9hQN29IU8N/y8bFfQ7k/khYRfDX
         AZUew1EELtGeNohRlIBGMLLKWumozRqYhe3h77PvyjWSGmGT8/duEniBgLTYWLTKfykK
         k93eyZ+lAuVsNCuIiV8FFmelCh99t+BZoRJsbtmILJfhUI9zO1MSGXhBhBG0xyTShbd2
         8HU+F2SS0o0iPmekkfBVpI2RaZU2CqbbDNe+H1Gn2VhOz3NQcs7aA/rVu3QnaLypjuOV
         EeY6U+U/H4GcpQlUMZYU4hPHXzCLQvQ8z+RXC5EzkFOKzXwl4VIR1GzarYCgv06dQlUW
         eqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104014; x=1743708814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMCA06fKWwqGWZF9sD23Th9HIFPETcbUPJeMNvG9UII=;
        b=EubTRV2AhS4uKxxtVFWSwgWzBd+nL3MvDSZN9fOk2DMqP+YqZb/+D8tD7hNffFNSEe
         Sf6YU3l3LtgQoYl+NUmLw91YLg8v6ppA8h2djTFGDWAdt96HfKsRuiKF61En9vKqEVUl
         0OPqF23Fdf17tuvzlGMIyUjM2aDAj4kq1XN6VHCNmi9fmnXOl/wdxwqgfbR3fT+KhEmM
         Ft2f9FPRz6xvltvXNR3ywoLEaH1Dk/sm0gHz9TY8MVq9pe2CSRtvjVYcdORgluXaogO5
         ZmqCKQjJkqkOfVXqCBnE/KlVnKihb+pO0I+qqA4zULdFaiep1Yp3bB+tl0gx+1IjJzTG
         VjSw==
X-Gm-Message-State: AOJu0YyL+b2HERKgxU1eTdwk+/mWNYgTkJmvQYjknO/dpED7sK+vfxcn
	XsEFCzLe1f7uW5y2c8NBDcMJRNCskrdVByLhs2PGM15z7L/FMDrjhryNn7Qn
X-Gm-Gg: ASbGnctydymenK7gWT7CoiBqwLTpKY/9Su8fQBHvsl0AcdfzNgWtjpFX+vFfU2tF46m
	fwwE+zuJYydj7CPgaTl8RCYhVBc+yJmxTv/iy8EsaCYglqCPC0+nw/BYl/tk2juvgZvuonbN5vi
	K456n/WVaiBK4/B+j4AMEZziIy6FPvtMsN+XI2jqCQySgqBVRkb6i75Q8xZs9BCDov+K6HVWv5e
	dsQ76v/KWApmojBi3Jlf17mo8O89Y4ew0jJIUzkdj4Oly7mbeRAkOrJtX3e5q1eYrJ5TVpBhbvt
	KLXGkKbO9hKx8NflXgfagqSRZEd8cqzO5fTynDDF413sRMFQVKi7FNcs/djoKNpmMxOFC+eXz1d
	gAZyH
X-Google-Smtp-Source: AGHT+IGkEBoVHSRRVAOBfX6MspMIbpT/JVhrB1WSDWIYWzkqHfCTHi2+vFEXYw/6c9jFWGwhjuexVQ==
X-Received: by 2002:a05:6000:4211:b0:391:3157:7717 with SMTP id ffacd0b85a97d-39ad177b815mr4524707f8f.34.1743104013767;
        Thu, 27 Mar 2025 12:33:33 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:c36b:2e01:9e11:8d7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d90001531sm4039265e9.40.2025.03.27.12.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:33:33 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC INTERNAL v2 4/4] arm: multi_v7_defconfig: Drop individual Renesas SoC entries
Date: Thu, 27 Mar 2025 19:33:18 +0000
Message-ID: <20250327193318.344444-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


