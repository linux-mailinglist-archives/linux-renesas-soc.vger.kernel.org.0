Return-Path: <linux-renesas-soc+bounces-15232-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BBDA77721
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 11:02:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFC5B188B5D8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 09:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771031EDA36;
	Tue,  1 Apr 2025 09:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVKi/uOR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08661EDA0A;
	Tue,  1 Apr 2025 09:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743498129; cv=none; b=unDOo0pnjmKOVxWr92DGr4l5vH3JzcRTwZOQee+HwHmMdCaX21MHetLsp/WAfdViOn3kg9Ly48HEM9OWXWAebWTTPaIs8Gm7nVuwLm/BnA4pwfSijnUv1eu5yd00Unhej4C1ToJfIeI7XJI9Wrh5ErrJhqO8dnl/XjhXQdY/+hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743498129; c=relaxed/simple;
	bh=9CBXLTofbnz7qLpHFWcf1ZbMBvQaLtGEBkRVd2b/zkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WbLM/E0vhWt6sytT/DGd7TQJAdrWxo38IUrE/5uuKwkXO7ceHAxvA3d/4JLfQfqSLzN/LGULJTdDOYFzVGmo7cbK8RVqwR8SLdYvNsdpu/xuTQh9RILo7zITwmmVNn19oelr3p3yIexvkYUNupN1EhO4Mn5q+hE40jcCnE0Nz6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVKi/uOR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4394036c0efso35076285e9.2;
        Tue, 01 Apr 2025 02:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743498125; x=1744102925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwuUd8hYGj3GNL0Azh/1bN6dVI+5gqcHi1ZNroqNifY=;
        b=SVKi/uOR5NqtvUR9NnxkCCl5sz+JLb5uk9ehMOzoFtSlC/OwbiD4pg83wF+OO9Vw5c
         zZ4l1vuolGsfm0SqYzmbGpUJ1lUfCQ9h2hR19xImnr3R6+LdgWyD1V+Mpo1x47SjfyJa
         1oYDTDUU8kDw9q5/RAG8ceaLFh/EhR62pHnBfywTU/cXwqHvf3ZH8Rsu5yBuepyoyW+T
         4m06gaGd16NYayF6JJ5Ndfcyy2i2qbU5+ZuaJz6XZBkJ+v9DsBR/Y4loiuNg9k9uu5Hn
         z7Advo/cfdpkAYD6sddmSj9jVF3V0s0C6xB2jWOrMW/3Pjw/lPTtcouHkqJDcb2XgMsc
         FOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743498125; x=1744102925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwuUd8hYGj3GNL0Azh/1bN6dVI+5gqcHi1ZNroqNifY=;
        b=odQ8SwzARw7o9K3Mi2MKgR6Fk1l6IZ1+95Et2Qz4Res6IZUs2skn96PsOqLeKRmyKa
         yQJFjd/WYm6Dt5ueMuunsJ0RU5kIB66t+XIaLfGWgJAYN9di6FBM/dDAGtUoRVrS4Lih
         jlv+SVP9gP8XFYc83Hsl96iJQdnzmK/nnP7VtmeVIYdsNP6yHonPsWdTX7gyEycGqaSe
         Fp4loo5y9rg//HjchMuJtEviSbLC+Zlv1ZseUrpkB6Cs+fKLlEw4GnY1uLW2ylHR7RVS
         BnnHGpOWj/eGBF8R2UbJ9j3vWVZ5ZaVbid7MwFDXi+NwWHGv8MdyFEmDTKuoXDZQsDrm
         95Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVe9itqS7eYLgg7miXGiyi/PE2126SFDCigqJiNcjXMt+LdhNVg7PT9zXnX6z2Z2Z3CjfhG0sTix3SarW4=@vger.kernel.org, AJvYcCWOXReBGj6iCjagCyGCgt63xuIrmwcEt2MQRmbOlH5IafwQEhszvdmsfu7ZCXtaEpWmTfhFvfBVwS634kT8A+1KJN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyH7FOb7QIHIfgsUAFhEWQnj5f2WbQWvLRWd/WuGnx9+idt0mK
	yOPtY6nGrjTkHzU+XgQU7mZPH9ltKKpKlvpoqWywlsW/DhB8MCGj
X-Gm-Gg: ASbGncuxzXZ44v8bQmlscxI2hoWQ6pbZBkAksILgOa3HCXvnSTsemH5k/HrbD4J+aIr
	Qt4eaE7MfKzuEyVShcK/JwGJqE3tTU/3+Lp2PUeB7ZC1MWMOXu0QKKrn3k3Bj/vacbFOCJMJS8w
	W87wrLoNbqvv4hywzvX2BKZ4+PuBygUwolANlflvV6HBn1bSQp51XAAbkxc+wY/jjVM0mmI+k4K
	bbbxy8K3nPt8cZcta45F8X64N2s/sSH3bBtAo7bBRVfAqsosJzLZ2XflIxvO/wj9sEnaiQoVHpE
	qXlfmxYi1j1q7OMPxR1O5crNEw7JJtmIyv9an5Z1I42ft8N1+Wqah3A7eW/ahM0H92GoxA==
X-Google-Smtp-Source: AGHT+IG5q/PEbpPaVh0iCNItH4EvuvUb6MLDTDCWLGwP2sV7/oussH3tigDTStcR73sD1oJkDtjKpA==
X-Received: by 2002:a5d:6d8a:0:b0:39c:dcc:f589 with SMTP id ffacd0b85a97d-39c120dd036mr10663831f8f.20.1743498124843;
        Tue, 01 Apr 2025 02:02:04 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:cd7b:4630:9a98:b82a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fcd0738sm148391545e9.19.2025.04.01.02.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 02:02:03 -0700 (PDT)
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
Subject: [PATCH 3/4] arm: shmobile_defconfig: Drop individual Renesas SoC entries
Date: Tue,  1 Apr 2025 10:01:32 +0100
Message-ID: <20250401090133.68146-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

ARCH_RENESAS is already enabled in shmobile_defconfig, which ensures that
all ARM32 Renesas SoCs are enabled by default. As a result, explicitly
listing individual Renesas SoC entries is redundant. Remove these entries
to simplify the configuration.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/configs/shmobile_defconfig | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 8c30ed14e52c..357cb144150b 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -195,25 +195,6 @@ CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=y
 CONFIG_RZ_DMAC=y
 # CONFIG_IOMMU_SUPPORT is not set
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
 CONFIG_IIO=y
 CONFIG_AK8975=y
 CONFIG_PWM=y
-- 
2.49.0


