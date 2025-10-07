Return-Path: <linux-renesas-soc+bounces-22749-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A958FBC1573
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 14:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DD92189311F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 12:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8CC2DC764;
	Tue,  7 Oct 2025 12:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bKU2aE3d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFDE8BEC
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Oct 2025 12:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759839341; cv=none; b=XrJHu9ZNqrZ0JEGKOZP7INF8eFi7wWPw1LioFfLvzHLz4L0Za6FIlFa3tqjXkbEMXpG8ETvqvhjWy581uXym2QC2clzNBnVjE43Dd08PatBBnPjA4C2/GjPFaW2oH5Ujs5tk/dsr+dYTjYKSsc0NLPwM+OfJ5GdtBQyxbTk4mVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759839341; c=relaxed/simple;
	bh=GSaWZ7aCzP8lqbL2VZ74ZgOa1jqGO2XeKUCr6ss+STw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LpE/UxGeyGvfRIeQE3ZebU6q8xmovBAww7qpZgGy2koWd9iWFJl48JAeL29BbezYi3eSxybH0XODCNPZFQ9AxITBMSW9z/O8yfRmf9Xwv3SN3qsV4UWcRWT1rEi5uh1yxl5jvq+j7z1JzNL0UmJVVglx+JCHWxnG1QpHW++eVbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bKU2aE3d; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42421b1514fso2913749f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Oct 2025 05:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759839337; x=1760444137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Qit5d1ah8Bj1pDYRzOtk2F8SyNo0Gmdn1Mtvckqvbg=;
        b=bKU2aE3d6/DH/RS0x8y64ZeECv34cuDlK/yn40cwfGL47PLPpzhWFADX/0w4YtKHMW
         YI1J9d7pVvFHLrtwTDrB9HsI7Z7QG5mdzJ5t+Y6+2HY0OZSUmX3NYe8vBrpAwSrSqJsl
         c0tLAfPeqic/9fGkguj65rdbomi01xbjZzeOfmIJbAPCKEODNxpRwLRJtQT3y7WeJ+4N
         oShWb41FW8/jurDMz4JhJKEWWhxoWUrB7gRiBfgA9FKpRpcFDiRdmG8b+rShFGiBfEPU
         4lfKtI95PeIVFe2R/U3h7ngJ6Dcn0fW+jsv05luqDHkiNU560hXLIz0cw6YHIJPeU77J
         WI5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759839337; x=1760444137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Qit5d1ah8Bj1pDYRzOtk2F8SyNo0Gmdn1Mtvckqvbg=;
        b=w/GdmE/mksP4EuNmykaK5eEutPCy6fUNQdEaPKjtqbV8twqGhEB3bIQeg3NG2XRFJA
         EAOAKFoN70TUFzmKtAy98zu2CBoy1ANjTZp6fEF4/31iswUMBubd2oiqpu4ktya4QlsZ
         6i0dgYJ+sLtJoOHl6QcLx6uLPNAwzP0mywge6CgAaehVDJP1XtsImaIL+sFTHUcVnyPo
         4SQNzwQxQ4PMhyYFoKGCIqEXM+MtB6GV9rM0IyVE9aT4TnhK8JOKsGJ7iFQEFv+F1COF
         7s+Fm0xZ1SicrH93o0uOXcky/BlpNTIsf8WHr/c5mCdztLryQVyP7pWpYMHjFudKBKVM
         IscQ==
X-Gm-Message-State: AOJu0Yyo4Um7LIwQt+M7c5lMHmI/si1/ChZoa+I6dQ74K1U2FKUmCIvE
	6d5kjKk7XqbDkYX30UblC8YILDWJv7WE8In0qCAj7JfVvZV1AEy6wvXF
X-Gm-Gg: ASbGncvGV8+gjsE0UyWGawssXCbyp9E7vM9gAtWjGJv5zdnoW84+Kv16DKRZkfYUo78
	8NcIfZd52+8DOYf5WpD3PRs+oZ6stvQySBTJ/riKo6Eg6XqR0In68P44xSvTliH2E9SOpumC26x
	Qy72T66gL/k6mjWdg8YMmgrRDs3e8Q6YoeXtFCLFLWU2vqe2LjMVJqkHgBpwFLnF/YiU0HBFA4X
	fYOcM6FAifEmTBJAfIfJqgi1ISTSsZ3utPWnrMyg7uEgZpAIdRTWQnYo6dAiHaN3JPnvVyqn8ft
	GTLRhRkKPxchezlME3CVncInUBKfRw2oSYzjD6ZL8l9QstpjSSYtvJgLeN1VezlQDcww4BWmsu+
	IQ36XfCpAovuU7VUDMUJlL7gwTSSOJoT9xG5A3hzwnJECcxOM3az7tHxJ5KwizBHBBVF5OLLhA2
	GRVMs+cex/hGg9k78=
X-Google-Smtp-Source: AGHT+IG1s8byHvdNKFydToVpb8hvJVpQJOzAscjoELRzm4iXjeOZk1vx64ybxodArTehvqGRIbNh2g==
X-Received: by 2002:a05:6000:2204:b0:408:5363:8266 with SMTP id ffacd0b85a97d-425671b07c1mr10822096f8f.44.1759839337311;
        Tue, 07 Oct 2025 05:15:37 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:9667:4f0f:586a:20c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6e1bsm25590167f8f.8.2025.10.07.05.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 05:15:36 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/4] arm64: dts: renesas: r9a09g087: Add Cortex-A55 PMU node
Date: Tue,  7 Oct 2025 13:15:08 +0100
Message-ID: <20251007121508.1595889-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007121508.1595889-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251007121508.1595889-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable the performance monitor unit for the Cortex-A55 cores on the
RZ/N2H (R9A09G087) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index 8144d3781023..2d2db858f48f 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -65,6 +65,11 @@ extal_clk: extal {
 		clock-frequency = <0>;
 	};
 
+	pmu {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0", "arm,psci-0.2";
 		method = "smc";
-- 
2.51.0


