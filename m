Return-Path: <linux-renesas-soc+bounces-16643-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F042AA7285
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 14:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBBE44632CD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 12:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9000E254AFB;
	Fri,  2 May 2025 12:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noluADna"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4125253B7B;
	Fri,  2 May 2025 12:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746190033; cv=none; b=s2B46ewqucrrlD+NpmTCgfZ5JLTYYBmPIX359i2TLNQfZtBrcnm9gpk5e/c+2Dbau1S+q4gKFaJ9CxvGU8CRU8WnEhNCjOvSBds+VjiNoXQSHi+CdMW04d1i4Mbs4LI9InBULRyfSHJlPAvLck6k6W5u0HYDuRzW5BixTSPuBEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746190033; c=relaxed/simple;
	bh=IbvGkt4GXc09hbWiIUTvQsh0pXs2j1L0CBHEqmVOi+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a76j79+8aJa0BAMg+MnDlJo+bAsZAq6CeXhoGxt7gEAEsw5JQC7waHYVATKhJc2180TfK5PWOttSYoOhQs8GxO+ahTMRsLgrKAKERii6t54ejjgVbcFiz8UroppODGDYxgTgoNRHwj0eRy3EyYtaKghwOoMpsbet0tCdlqXnIv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=noluADna; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso2068500f8f.0;
        Fri, 02 May 2025 05:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746190028; x=1746794828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VyZ+eLudmHh2VnqIodF574m3pdc+SuHZ5uWsOFJLCKI=;
        b=noluADnaC3ay6Td8pDssGW0xDZhwj+UVoklRB0H3Mtli+T9Y2oiyalmvVt06pjYlXq
         1qmCYgmFmpg8NG6ocSp595JWV35alqLJL+WgaZevAK2HbEsvulx3IgWYFlGAnxD+aGoy
         qxOTsDHTzR1IWMBsCmzNHlng27c5NJVIL1/mZg8h4uqOxpiLdDnUdUso1iip15Yf/xG7
         1Bv0WC+bN2ByjP2YeAvBF/YbCTQopNFqIbSKoLBA8EfiuEb7NK1Z1ACquwtj2xaiN6I7
         7O2nr7oliQfE1PNf7RJWiZg6afDrkzCp9FRdZiovfBvm9YP1iBH+lm0IJas2alVHscLw
         ajHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746190028; x=1746794828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VyZ+eLudmHh2VnqIodF574m3pdc+SuHZ5uWsOFJLCKI=;
        b=gA0pfzHTAiUw+0dZbl0Byo2oh0UIvECjyeg6LgKniZ/vKuJ7CoNe0UOZmFD4IGCNG9
         jJXAq7qUx+bJFPyCGq59ziLMtW83B0XS2ifg7SBpzvMiIHM1MKBzdf8qbVJZhyrqpNZH
         Bu62SUYp7UksNGqNcKx7gW4YUGuPA7MDDfbgYcyts4xb9pkr261ktizX3VBIjbXMuLBH
         Kz3Oc1q9qy15ByeU3IRV8wW/6duIOQAXND4uRpBxTiHepKJOM4Qhg2BGttDbf7xNw2Vv
         5xjnIdiuFol4GhhNoKVYZmjE2xFw6vp5IVByxETKjEi0KSk2d20mkNzElKHCTTAGp5nF
         If4A==
X-Forwarded-Encrypted: i=1; AJvYcCU8Nxq7dNwaAutegurSCLKlhxNgUyKNmTPQxS/YnzTt43bDwZCNvZ6JYQWBRMBqU8zB+6oApw2ZKzNlIprpt33zR+E=@vger.kernel.org, AJvYcCXHYVi/DKuKMs26DEtptz/Ik8zZdyGw3VWcFMHX3h2y+ijeMnEY8rBegcgQNfpAybsjvvFfeFoPUb1f@vger.kernel.org
X-Gm-Message-State: AOJu0YzpSV2fJtPw2iN4zRoRm/AC0Z6J9RgjTIxlnlPs34/IOa33bboQ
	zz20F9dkhgyaHfMrUC+zCGWwfMBppXEkhypGW+7bbx+ZFyZ9/53y
X-Gm-Gg: ASbGncun911DjHhzFD7LdKzwvmkWRaCG8Yr2BSlK79o0GblC3t+UwZAQs/bPJLn7U93
	Z1cvL3BLVLND7wKmXllHt78O1+pR0QcYsVTWwAuvpeDN1yuPyEuQSPGwR7TcsHFVqvv/DESPZ3i
	o53gyFmT5qqFjjHjPUDTOLR/x29YO/Rbv9EieRPqwIuFJy7PT/NWiv3UzKl9SLIOP6JQbaaFh1N
	z3GXRQQYP38ljTgy4QvefFFXD0DbEOnDRhUvQJBXU/BRJDCYeSaR0jliLQOv1Unv1+pOFaFiZzu
	aX1e3DkqMNpLKCQJrcXosyUiqtIsD1il3lIczHMb4PKbN3WDwniISPAHbqJbY+i8
X-Google-Smtp-Source: AGHT+IF6Cpj3okvDc4iC/5uUndp+JjODJdaRzI6e7QeAzCIjmBfAW7UuXi1BOJlw8WNGiV0/o+enjQ==
X-Received: by 2002:a5d:64e6:0:b0:390:e62e:f31f with SMTP id ffacd0b85a97d-3a099ad2f9cmr2204754f8f.3.1746190027748;
        Fri, 02 May 2025 05:47:07 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:10cf:e432:b2b:bf99])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0f16fsm2059134f8f.77.2025.05.02.05.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 05:47:06 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/2] clocksource/drivers/renesas-ostm: Enable reprobe for all ARM64 SoCs
Date: Fri,  2 May 2025 13:46:27 +0100
Message-ID: <20250502124627.69644-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Change the OSTM driver's probe condition to `CONFIG_ARM64` so that the
platform driver will defer and reprobe on any ARM64 Renesas SoC once its
reset controller is available. Previously, only RZ/G2L and RZ/V2H(P)
were covered.

By matching on `CONFIG_ARM64`, this avoids adding a new config entry
for each future ARM64 Renesas SoC with OSTM IP. RZ/A1 and RZ/A2 (ARM32)
are unaffected-they still use OSTM but do not define a resets property,
so the deferred reprobe mechanism is unnecessary.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Hi Geert,
I've restored the Reviewed-by tag from v1 with your suggestions applied.
I hope you're okay with this.
Cheers, Prabhakar
 
v1->v2:
- Instead of adding config for new SoC, changed the probe condition to
  `CONFIG_ARM64`.
- Updated commit message
- Added a Reviewed-by tag from Geert.
---
 drivers/clocksource/renesas-ostm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
index 3fcbd02b2483..6a5785f9c9c1 100644
--- a/drivers/clocksource/renesas-ostm.c
+++ b/drivers/clocksource/renesas-ostm.c
@@ -225,7 +225,7 @@ static int __init ostm_init(struct device_node *np)
 
 TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
 
-#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
+#if defined(CONFIG_ARM64)
 static int __init ostm_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-- 
2.49.0


