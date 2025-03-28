Return-Path: <linux-renesas-soc+bounces-15032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 262A1A7511B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 21:01:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BED5D170DC2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 20:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE011E8347;
	Fri, 28 Mar 2025 20:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKcjPVy4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1901E4B2;
	Fri, 28 Mar 2025 20:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743192087; cv=none; b=eTKReSp0AxBlq51MpJXTZBJ6F1AoDbPylyQBN/da1WMcJlcMU9uNT9HATokb7b1hzoCnraoIq6OCJsroQEx0g8Lbquh+pzxAFJeAV5zPigZHyLcdG1O4NUmSJjjD1+oD60gQtP4KyOESIuT5ZeRzeiuEr6/7Pje6FvFexnKIt+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743192087; c=relaxed/simple;
	bh=Eo/kZKrGoIM5TsgQ95VKZ8ZUDiJtVk3sj55ctQ/M2Yw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i1CrusQhdI3bxeK4eae5Pgibn+xI7YSxR9n4yFsMXTOpM1hq7cVaQ3Hq+2h5hjUItlvQvryUghOAIaCfdddy7GoNnMg0y5pQAVFUhLBpRMmuUJ5io1OJNGsXgngXjm8tayPfkUCV4qfgbJf7bQZKaYRXvm97kdqR9ewmX+hWc5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKcjPVy4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso18776845e9.0;
        Fri, 28 Mar 2025 13:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743192084; x=1743796884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+pekbS4NUAwvKZ/B2b86T/+AEj63RVTJfey6aPBmu0=;
        b=hKcjPVy4d4MYQlTt/veRIlozGPIFnoCfWWiuiUjh9G1kt0A+L1lY0FNn1c7AFwF8Vr
         w/PtxwaMp6NYnihNo1/ZDyskByVir9Q6Ei5W/Ta6akqzCU19gkbKf45jrAhyyaVNnrlR
         6UEuM4/0GuwVlGAQmIH8H4TFztk1nhj/g+nR7sfFQkKedP7FMA/gPwjaNnz2ul/N3VL7
         Vs+ML3fC8De/myYTuHJWGVTXBeMO9DkrpyRSFqqSbBSKbq/b60yofztsoKXP+ABk8DCl
         zDfuClil7L3d2shHzwTvuiVNXy985j538eHp+7h0Ae7DJ1XFO7h+ox7Is5gt88yKL58G
         iKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743192084; x=1743796884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+pekbS4NUAwvKZ/B2b86T/+AEj63RVTJfey6aPBmu0=;
        b=qnNVm+vmrtIqTnAqrEaWXMlmzSsTlnf3jJjE7jVI7fHzO2ELcxkOws/L4Y41lDeJrb
         q8HtxtZfBagHg685g8fKWdEx+atJ5OrGTY5bpsNZY91ajjw8lYmXtLBe60o0amfXWxTO
         3KJFEXnUDLUt3H1puMwq89nvqAwg5+lcCpu4Neaa1ubBHWU4shQOQLtuDguznsZMHGeo
         7iJ151G8f6kyYfMpSNLXVLinV9hQ5b47yEoK3CCxXyqZNXOZwsKsq4Jp1P9POXjMomrD
         hBJmED5gjZmHlTKjDd0/rKBBjoItMkDQkXEW6jjzJc7Zoe47TDeTCtMns0zo2xI+U8qH
         wY0w==
X-Forwarded-Encrypted: i=1; AJvYcCUjoE6zvAK/OZbK4PsCA+ouNatyROKxhFYwKJRu0xHCBLFO0b1i5mXfpXktG7KipCJskraXq6LqcQTtMVzK@vger.kernel.org, AJvYcCV19xnAyNMFprUrK2evP19YS/r2RnschBgZ4UY6oJy5iJlmFNtHIF7hF/X+WpfC4ijlJvCevL13W01+@vger.kernel.org, AJvYcCVT5GQ9+C9awtGeh9rM+ENWTkRSw8SJwywUW9+Q1rzilionTO/WxxaA/byo4v99mIP9wytVwPudgoYG@vger.kernel.org
X-Gm-Message-State: AOJu0YxNH2tZDnOiEVcRkqzfE+uA3qfcg834P41VefLuw3lacV9F8fO9
	2XtVXglRtgEWDIiL5/+X3wK8lSO7QvFpBAS9cvD9NqeL7ecD7u5K
X-Gm-Gg: ASbGncu8mniZO6yfafmdMrONzDYTFpBnCGJbCHJGVrB/ojYsQHVhLWpNvoSSt7b4iQX
	xbGJjPVB7q5xx+chjwKW/8iF/GP8S+6cdHLz+u86PW3a5fgUYjsIxR+CevqQlDCvN11QOBpQAvk
	fpvMWhKxKyZl+qClKMfaohJ+6D+YeMofcYA7CbpRYsRupsjMn2MgA83VQOQuopmIrm3hcCnNVQe
	Z24WLf0OB1P6mr+C2KGK3YlGaoEKL3L1X1TDtSwdeWDDt7rJVz3FGRJuvTkR0ZYB9brzRs/njuf
	TNC/jRg8ENqzvBRMe4giD53fAoqy1vWrWLQ/MB9LsnI/3swrsLR31f3PwKSGqkV0o6g=
X-Google-Smtp-Source: AGHT+IGmgizPS2RnWbTyUkoC72rOm6aUF2e0C9ZsoUGNIGl2gGKujUEebhImgal58dcp4kgvf+TWmA==
X-Received: by 2002:a05:600c:8718:b0:43c:e8ca:5140 with SMTP id 5b1f17b1804b1-43db62bcfeemr7260845e9.23.1743192084074;
        Fri, 28 Mar 2025 13:01:24 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:b400:d08:873:badd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fcceaaasm37930955e9.18.2025.03.28.13.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 13:01:22 -0700 (PDT)
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
Subject: [PATCH 1/6] clk: renesas: rzv2h-cpg: Use str_on_off() helper in rzv2h_mod_clock_endisable()
Date: Fri, 28 Mar 2025 20:01:00 +0000
Message-ID: <20250328200105.176129-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250328200105.176129-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250328200105.176129-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Replace hard-coded "ON"/"OFF" strings with the `str_on_off()` helper in
`rzv2h_mod_clock_endisable()`.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 4123c30e8663..817a39a8b852 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -25,6 +25,7 @@
 #include <linux/pm_domain.h>
 #include <linux/refcount.h>
 #include <linux/reset-controller.h>
+#include <linux/string_choices.h>
 
 #include <dt-bindings/clock/renesas-cpg-mssr.h>
 
@@ -595,7 +596,7 @@ static int rzv2h_mod_clock_endisable(struct clk_hw *hw, bool enable)
 	int error;
 
 	dev_dbg(dev, "CLK_ON 0x%x/%pC %s\n", reg, hw->clk,
-		enable ? "ON" : "OFF");
+		str_on_off(enable));
 
 	if (enabled == enable)
 		return 0;
-- 
2.49.0


