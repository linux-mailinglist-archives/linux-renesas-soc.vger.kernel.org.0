Return-Path: <linux-renesas-soc+bounces-18731-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECF6AE85FF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 16:17:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39D6C189DE13
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 14:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD58A265CDD;
	Wed, 25 Jun 2025 14:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGamQUDq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFCD262FE4;
	Wed, 25 Jun 2025 14:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861040; cv=none; b=cTzxubL2vsFC8mZRCCL+3zRvzUa9gfu2fFKcqSrpYW/8+Y3JTUSxV60Fhe1BmXTz7PcalXK9tYF7lNu085SftWMkBNLbGwY8e3IwgscQ5ogc6+LjBkrTMTlFLZfQW2a2XfFjDUu3iHzyRJ982rVZOacH5QXaDpjxYJC+XZFjFOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861040; c=relaxed/simple;
	bh=thoUzQeEoJLAXTaful/0O/JY/uXxC58oHMndcf1/oug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yfo+xJqPey9s7KD8+rNSakLBwcQxyHh70aTtY7O9t+fdq9ZDsy2BuOOuMTextVUXLA/USd90wOiIpVEfsHJc/zTO59gsokBYx/1/Bbk+B46TOWd+VUjHhVCMMV6wy6a4xzqwM7+Ysvp4TPKhdK+cbxq5y8Vp50fKCfNm51gxExw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGamQUDq; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-453647147c6so17518665e9.2;
        Wed, 25 Jun 2025 07:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750861036; x=1751465836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtStaJFwDGBR6KGIR7pquylpF4oILlK5IM7X/8HjidY=;
        b=LGamQUDqzjUhgOc0t8tixgeam5V6H6s+XwD1tFvJMC/2gEYXJSAlwhK4dwmIsg/FZi
         b1eN3JXCboufSux6Cwd9kJnvRm63D/4nLLDNLPRGlgAsE+LXTUYIWxfDN9v35VFm72JA
         w6Ts6KNFjlqqurFleDQICVrW9FBdeDBMmQZow/0uZrswza6hEoRPtwj1K76xfhgcWGEF
         lyR2jMhyJbbHh7xWgNdOIzCWtlgt6kCgG2waFUKLJ/fIUR6yCcLtJYDZNeUMjkQ5VZJ9
         riDGHMysDt7613mMy+/5SgfQTVK82MdCy8vjjQdsEj9s7lOoH5vt8nstJk0idX65cVfV
         q7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861036; x=1751465836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtStaJFwDGBR6KGIR7pquylpF4oILlK5IM7X/8HjidY=;
        b=w8l4/nKpkBXX48m8HJgBra69vd5JwTIuS9ERXUiNIgjmAdh+uR/amswjWBdE99q57L
         0llX52s+EP9o2hc8l9jNwgD7mFFmy7Qt0DYx838/7jNOrWzAP4I+Vfsj8GhfCMJNQAkY
         S3SD4gXYOaHi5YE/dPiu+9pxeI5+q+PjiGVmK1l1dYk2DwBlOZJxNmgcB/QXP/irzc8m
         itTaoq8c4A41jquQlf9iHX1pZoHSLxZL7K/BXcw7NbYBy8eDSaaqA55qpFXhmzTlPFPw
         sPZX2+FiKCY/TAdGdDYxqt56MrHulSWvUE4AHSia6p51KxVUOLTapTGV4EIUVt1RZzFH
         Jvmg==
X-Forwarded-Encrypted: i=1; AJvYcCUgiNATiF52lnkrjrGxfJgV1GRlpmH7Ob6WonqdNa2iwYaD0VUbqehLRCRDztisGQdRkfRt5wMd9P2h@vger.kernel.org, AJvYcCWUnvxLhfJ7pXdDC5wQFwr186VL9w/eX6v7CegHgc5Yhvmo7S1iOkzpV1YxzFqkJOc9oS+L/t2kIocf@vger.kernel.org, AJvYcCWkuvsXXdNUaN8/0WniQrx2seQitjOXlaptN4MDlq2Cw+qyl7ULN4PtNztRB9b9w/MdH8HiAT9Ke77GhQg0@vger.kernel.org
X-Gm-Message-State: AOJu0YxnZt2nuFS/4ajTmuvHEzN9ecwZCs6BZtTJD5B0uVb17D6h0jlp
	Up8ziOpC9g0A7QrcaLCpsP8GdNxEvVV0nr+41HIw6p16Ptr5nOxTm7/l
X-Gm-Gg: ASbGncug1t42zfRuzlHZ2Gf70CL4m0s5wrqD8bPzGmnOWKQzuiYU7j8xnZLGIvt3h7O
	mSUq0F99HTPbP2V+UCnZjUJneQ6OtfdgHhpiGkQ8wPPIyN4VHlkLbkPucmEQqeKUHtJeHqcMWHO
	XuXUbiDoHZasgyrHBmaS6PBVL26myL8jHZDWHvcMdkpdFVRtB/MtDtMLBXCdcKWkjpmPJxtHVNC
	cqYFOtIV2ybU7CvD8E/OsYnlJtrvWziBGC84krk5HkqdWutUzmAMMjCU7H0hMhDz7BWt+6NlRhn
	SzEY7FwoZERRt4GXUKwkri4QhVQLsQE8fOfkyWsDQyCqVWaGZvDaR5/d36iM3axA3x4HavjU1g6
	4ESsAUT8K5zXqbYgHW00x
X-Google-Smtp-Source: AGHT+IFdtf/u9TOtg4Im/t3qKT0njFUL0bsPAsTWodzn/pHCo35cCoimFWH/qaC59fyYx4ylCatnOQ==
X-Received: by 2002:a05:600c:458b:b0:450:ddb7:ee4d with SMTP id 5b1f17b1804b1-45381b15c45mr32052665e9.24.1750861035937;
        Wed, 25 Jun 2025 07:17:15 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c47e:d783:f875:2c7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538235a85bsm21609425e9.23.2025.06.25.07.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:17:14 -0700 (PDT)
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
Subject: [PATCH 1/3] dt-bindings: clock: renesas,r9a09g077/87: Add SDHI_CLKHS clock ID
Date: Wed, 25 Jun 2025 15:17:03 +0100
Message-ID: <20250625141705.151383-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625141705.151383-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250625141705.151383-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the SDHI high-speed clock (SDHI_CLKHS) definition for the Renesas
RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs. SDHI_CLKHS is used as
a core clock for the SDHI IP and operates at 800MHz.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 1 +
 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
index f6e5f62b07c4..7ecc4f0b235a 100644
--- a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -24,5 +24,6 @@
 #define R9A09G077_CLK_PCLKH		12
 #define R9A09G077_CLK_PCLKM		13
 #define R9A09G077_CLK_PCLKL		14
+#define R9A09G077_SDHI_CLKHS		15
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
diff --git a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
index f28166d6015f..925e57703925 100644
--- a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
@@ -24,5 +24,6 @@
 #define R9A09G087_CLK_PCLKH		12
 #define R9A09G087_CLK_PCLKM		13
 #define R9A09G087_CLK_PCLKL		14
+#define R9A09G087_SDHI_CLKHS		15
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__ */
-- 
2.49.0


