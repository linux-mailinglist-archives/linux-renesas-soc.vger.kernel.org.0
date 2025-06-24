Return-Path: <linux-renesas-soc+bounces-18660-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB73AE6D7F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 19:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5D6517F171
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 17:30:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25AB22E62BA;
	Tue, 24 Jun 2025 17:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCEl5YHw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC7E2E62A1;
	Tue, 24 Jun 2025 17:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750786239; cv=none; b=ZKxxgK27X8Qf5UjvHzUR45EpFZzGQKZ5CwYGMYt/DyXY5VUr8mF+8zHUjKyLfZ7/f3vs8A44R7Mi0XOV1mpZ2hWhSBweM3seh20OHXxgcF7T8rxBeuAhYAyzMmtcSfET/qyoApGepITrLAHykxw8I91COeuVcSEFrIdFYN1FkaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750786239; c=relaxed/simple;
	bh=vfsyxl/iq070xZAICG1am3E3oIVo4pRy60dTKlcOHqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BHfSTluvrQ7BjWvGSu+RRhR4pAlT8mr++Hb0uXiIV68VbAh6LgywDS4eA4CeGupAnE6OsAvqhd49IBBM0Bj+XPLTIuoQphT1g/1v5UJB3htWXQQMACS5nuegav5aMw595/uHmdny2xuNCBqzMRclScMFzEYXanjratlVQX2DTXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCEl5YHw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso44100615e9.2;
        Tue, 24 Jun 2025 10:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750786235; x=1751391035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vq4PNRMs7F+DzgJ1q+7elDnyqvucjET7HDXl0iNWHq0=;
        b=RCEl5YHwNkkyrHRjmseycxfmqR1k1Q2ptuIrYFybymnaym5rUzX+AK1gZui1KeME7S
         0OuvJzZAezuLHMzj6pE7aM1ERnfg7VciPUNCiZY6SJjguP7YYkFFxlEKCLv2IeQnNAWH
         IY89YBCqt3a9V1pkCYvv+7dn/IzbYqN8FSCAeX5QxorXx5ZsCKbbVmebN8hyhStW3G8n
         pcKMPBJKLiSL6+XoMXdBsfooSDDu5NoeOcKD8Eb3I7OgXpn5rS6Yu00O6379xaHzQgeA
         EZpPpxlcaRJlpngBL9ogbZ4wwlpG7Wx9hvkwUGpRoDLV7kO5jBIcUjLsGD+XE88LbFqi
         7MgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750786235; x=1751391035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vq4PNRMs7F+DzgJ1q+7elDnyqvucjET7HDXl0iNWHq0=;
        b=GBoWJxLmOFztVL6M3UWiht6f9/EFtd42FaavYBZt59BVF0kksnbFDHSES2tXFLSklO
         Zlcj4d2y+dn6oHQhZfGkR4+SZ0NXubySubzw6N9tnngnCRLyXggePbeTqZ2TlaWPKrSc
         vBnAGTiqSxdbPVJk/xgAfPglQN0oVQyanpeSmrKCEOVuzFIi0t3LDUVftwciZcNsGdeX
         h5nuR36HnQmYnp9iWQGVktOcij2ZE3NfkYe6haW0oweu8Q4YL7qcxF/YqsWPfXuss41e
         iHJSX7Jc/rt5K7JBe+5w1lgRLhK5+CGJ0fNUh54iC0UqXTVmrMQi6XkRjMQqaeracUud
         LM2A==
X-Forwarded-Encrypted: i=1; AJvYcCUVC81b99c2GQy5Q1uPF3Cp6M4fFjvUbUvACtlt1XlR6JRlwOfBpQVK5G+M3KLWArJwgS5NB3Yvy+/v@vger.kernel.org, AJvYcCVHo/h9wj0g/IkUM9WZlPNf/+PGkbfIBFLhQej0fKnCm9S4OeJcmehp9jjebHHflfD0XwVWu5Hs8kiVyiow@vger.kernel.org, AJvYcCWtgnmuk+PBtTaVOHytKiK0o0XyRyRrazuRzO6wdWZwTEC/1FwTupMxMxoWnGuVlyVgbxkdjLs5oZ3/@vger.kernel.org
X-Gm-Message-State: AOJu0YzLgdlfBaX6hzsjz2z48VdDb0Go8wzAuSzd00trZg9GGMU6nGGR
	DLdWDoUCcvJkhL5+cjipy5LGYcMuMRAnDwwYSNyf2uxCI5wTvaEtMuOY
X-Gm-Gg: ASbGncvhEomQklzd4+nY2OXFBohidX3fejB5ghK9rxnrK9XO99IFtkA1NWLRt0x2GC4
	NqqBk4q7gnxAh5vemfcmK834av/akEwx0u2iEJqhfbhzh7j2rP0ZyPNfn1CcOD8mbO20ifQnZjI
	bS5ORSS3rr5aUS/mtNZ3/5yWGDOPvSRMcLI4b9IOok6r3aaDpjdi3aScJA3h3iZdSBpYFBed5tA
	gruUl++BgLNMYy89QiE3dSgFm8CADnTxhwDNWkU0YDdDPvN7f0Jyy2nbTCF0pUIngnzAsP5hUYk
	Rt3rRzGt0n7SP2i41pkT1CaVGEDTdR9C/DhRnyMoUxmik3otaUjnNmsDWLAuno/uAIYbxdrsHLR
	T+A4+E9sZqoGg8fydZIAS
X-Google-Smtp-Source: AGHT+IFch86Bwj3FpcBseDY2MN3vAtSRyWtMvVwN0WFKsbh478c1F1adbvCxkkH1adMYxF3X1H1A8g==
X-Received: by 2002:a05:600c:c168:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-4536c253eecmr128593605e9.14.1750786234450;
        Tue, 24 Jun 2025 10:30:34 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:a522:16f6:ec97:d332])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead202asm181662565e9.27.2025.06.24.10.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 10:30:33 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/6] dt-bindings: clock: renesas,r9a09g056/57-cpg: Add XSPI core clock
Date: Tue, 24 Jun 2025 18:30:25 +0100
Message-ID: <20250624173030.472196-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250624173030.472196-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250624173030.472196-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add XSPI core clock definitions to the clock bindings for the Renesas
R9A09G056 and R9A09G057 SoCs. These clocks IDs are used to support XSPI
interface.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 include/dt-bindings/clock/renesas,r9a09g056-cpg.h | 1 +
 include/dt-bindings/clock/renesas,r9a09g057-cpg.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g056-cpg.h b/include/dt-bindings/clock/renesas,r9a09g056-cpg.h
index f4905b27f8d9..a9af5af9e3a1 100644
--- a/include/dt-bindings/clock/renesas,r9a09g056-cpg.h
+++ b/include/dt-bindings/clock/renesas,r9a09g056-cpg.h
@@ -20,5 +20,6 @@
 #define R9A09G056_USB2_0_CLK_CORE0		9
 #define R9A09G056_GBETH_0_CLK_PTP_REF_I		10
 #define R9A09G056_GBETH_1_CLK_PTP_REF_I		11
+#define R9A09G056_SPI_CLK_SPI			12
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G056_CPG_H__ */
diff --git a/include/dt-bindings/clock/renesas,r9a09g057-cpg.h b/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
index 884dbeb1e139..5346a898ab60 100644
--- a/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
+++ b/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
@@ -21,5 +21,6 @@
 #define R9A09G057_USB2_0_CLK_CORE1		10
 #define R9A09G057_GBETH_0_CLK_PTP_REF_I		11
 #define R9A09G057_GBETH_1_CLK_PTP_REF_I		12
+#define R9A09G057_SPI_CLK_SPI			13
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G057_CPG_H__ */
-- 
2.49.0


