Return-Path: <linux-renesas-soc+bounces-18465-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFC7ADD4F0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 18:15:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C59F81946DE5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 16:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67B12EE619;
	Tue, 17 Jun 2025 15:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gqd9+B7U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6912E92BC;
	Tue, 17 Jun 2025 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175884; cv=none; b=Sl/i6lf3ryZFG5tpxvur9xLGwjGS4u/lcsZ1QxMifLhErDQ4lvdXgsBm8F4Zuf6ktDn8xkTYeX1Bb944p4xQy3yCEDalhft6tVnjuLewBptEEsaaz0+p26lAcM9AkCMycLYfFIZ1MXGbY7M2ofwTWxCdt36qLHfFZG47/BoYKB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175884; c=relaxed/simple;
	bh=DOuguTgGDuEu8UsveQgxyh0O60xitWB9yN1pocuhPgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aGOZhE81EmHwIsZDVNuUCcG/+OHfKiK0pnfHa6dr1oWFyrSlgAmVs1zRMGi0UCmlTrura4EQDqSVWSYifXveKFFS2NAzFyXksGrqvfYpAAwZKvZLZTrpIAGlIpx+h35hah/0IFfo+CYLoHaH8XtTRIPAS07Q6A7NfYqu3fSAR6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gqd9+B7U; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so75454145e9.1;
        Tue, 17 Jun 2025 08:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750175881; x=1750780681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=717t4uXqqHJ/xWQnNBMF1mtn6twDlKScAhRL5+wnqGU=;
        b=gqd9+B7UU4LdFT2rvwR7B3WIT0ZeKLCLAcl95d4ta+uMmtppfvIxUkXlSPNrtUq070
         xXLZt4BqauKCqoIZNEZy2W7MY0Od+yMnhpBT7rehqwL+xccJuyA+orZyd9BDvA7ANES8
         LrQS6SAd+s2yE6ozqbv6eRnfbc4LN/Mv13/eJOYqwCDoMrU05Awi1FXGjI/ohU8GGMCI
         34dXhhT+RYUuSzuqokkrOqJ9i816hiOqtcjkGqc32qJLEGVE5/0jCSjq/1cY6LTxpQlm
         Ak5f3J5X9hpm0/6vql7ljvBwRe3Zadn77AttWBxahoqWRuJauoJOhQzZn2gddsPPj9Vx
         NzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750175881; x=1750780681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=717t4uXqqHJ/xWQnNBMF1mtn6twDlKScAhRL5+wnqGU=;
        b=dJ2sD5COErftpKFYcSKAY9hxCxJnzKQIiFRqinAyk2Zf8TR+LzEdKERTJydMXYfOUJ
         4KHYlY3UnPyKm9s1KdrI0Bztce/1ECeukyrxmtQRB2rjNVY3QH7JcbzkVpxzhSFJtNxS
         Ds5XO0Qenx8a7T1nVq0dwzq+2oUMeOLoE8OOpCq1G8meBzKZ3HQIxMu6CGgtjPHq2IMo
         mN/eYm6qwvSW4bQZ7tEgamfMoPmbcOFZ8Fp9WuEzL4qIF6Fag+TUcMSzi31/fMHKYD4q
         F1wA9pkKcTmeHUiTlLlxRSVDUg34o4c/FzGD5Xe9khdhTTzbAFwF/MqyR6+otiWCpoX5
         oBxg==
X-Forwarded-Encrypted: i=1; AJvYcCW+d4SARG7eZeAueWoqHD8KMmUkNfQbbIPZlEvrSz9XL/vhdtJM74lS2S7epRhRnlJdsO45gnnQui6FEN0m@vger.kernel.org, AJvYcCWUpGAgohOqu0zguE92nzznaJx/ifF59jVh95NWmRzT/BoQ2cQgEn+/6yZhHEWVrmLCopOz45Ec/GRj@vger.kernel.org, AJvYcCWXRl+kWd1XWJZy435uK5ItPemnlbiUVLN2+A7J/SGn3M70wScU4EU8JGzHjHns3dtRHUAoWoBHY6tm@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6/GM4sb/w2r5/QgR5Freq/pM50b5Y82IA53k2g/X9L0GzWPsx
	5lJItQ5sLkIkzAr5i3RZyRoOvDOO1gWqB0TAMxhBfAXJyPGn5xYpJfgo
X-Gm-Gg: ASbGncsO3TXq567Ium+QMZjNc0rSWYM8qinfNmlPcen2hjv5om8BbYFbsCuLIoj2YS0
	KZpb3sxySBxpHZrqdfj2bJqFQYALG19XFCeJsmnTi09tMt2rb7sqS1e9JvFa9gGal/kW38u/MYa
	Y8+UOr0k+wsHJB9qzY1EPwqg9t1uvTQHsoZvHq9k/t+KkErUHCg5AqkaFV6gPo62pYlKHMhZZX2
	Fr/9XrG5Rf+bJ2rCoBo8Igoqe4d1eVUdNbO+Lg6dnzeJdIoW02YkMmHrxH/QgT3jDrE37bc/4qQ
	5h+ASWOnCfnesblGci/uJQBlucy2yvczJkaHkanuDf7W9bL9Ms0iNMzTozmm7urv4Y83MLF+B+i
	YELjMEcowXzY=
X-Google-Smtp-Source: AGHT+IHT0NSgTGA+L2Uhm398gD9x6InOeTcEZRd7M+KQfwhB55CNyH43et4InW0k+lIF/KzmN1NZdA==
X-Received: by 2002:a05:600c:8288:b0:440:6a1a:d89f with SMTP id 5b1f17b1804b1-4533ca946e2mr148778555e9.4.1750175881111;
        Tue, 17 Jun 2025 08:58:01 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a53f79sm14189115f8f.4.2025.06.17.08.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 08:58:00 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/4] dt-bindings: clock: renesas,r9a09g077: Add PCLKL core clock ID
Date: Tue, 17 Jun 2025 16:57:55 +0100
Message-ID: <20250617155757.149597-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617155757.149597-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250617155757.149597-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the Peripheral Module Clock L (PCLKL) core clock ID for the RZ/T2H
(R9A09G077) SoC. This clock is used by peripherals such as IIC, WDT,
and others.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- New patch to add PCLKL core clock ID.
---
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
index 1b22fe88dec7..f6e5f62b07c4 100644
--- a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -23,5 +23,6 @@
 #define R9A09G077_CLK_PCLKGPTL		11
 #define R9A09G077_CLK_PCLKH		12
 #define R9A09G077_CLK_PCLKM		13
+#define R9A09G077_CLK_PCLKL		14
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
-- 
2.49.0


