Return-Path: <linux-renesas-soc+bounces-19978-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BF3B1AA18
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 22:27:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 786A33AF986
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 20:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C71238C07;
	Mon,  4 Aug 2025 20:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ejYS2BNW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9A4219E93;
	Mon,  4 Aug 2025 20:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754339224; cv=none; b=heFhiTmUINzdjyu4V/38LpQN8TJJmiQ6o6wbMQS9eCeHjhT9nrBPCSBpGxIyVaG1xR7VRBrBDS3+nhLrcytj6mtDbuDeFm5HplBhXiBaeSmNKMS7er4rhAyws+i/kYgWyBXZjHZxZcUg3yp2scUI2d9lLXeWcqz4Suqb7qtDNnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754339224; c=relaxed/simple;
	bh=OwK8XDiJQa2tmh98HuXfoe3dUQLpak8CjE0+CCS9hUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WSMVdjTmBOoFqCGyJjNe15AHsq5jo00e+hXwhO7N1SphVo19jgfBszErFxPMTxJDdr+KNJWc+C1B9uIgsYrnUGVdipvKd2OmpT4+U53wSD/tt1OYdIVnOwAs2PbEdKx/Gq/88nnVmepMq6PjvWmHqS0Gw0z+cvCs/zF37ubPXIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ejYS2BNW; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b790dbb112so2647676f8f.3;
        Mon, 04 Aug 2025 13:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754339221; x=1754944021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7gSRj0kIrIAWVCkXb4MlkUxBg8yUPzlpBkkuJvaNqQ=;
        b=ejYS2BNWwwvvJT74g+MptlUA/+ChHng2/5dQq3e/ASuV+jQP6MZxHaG1vw12vpiYEV
         bhjnGhUCW2TzdGFeulCiJXeSpc42EwWkGF8dYkR4k5iP+oGQ5PzDrn8igPMNGdkKQaHV
         0XrMwGfrYdEKZGDYkR2e38lMqsrMHEiQv9ZXS7zUfRxZbcH7YBjwkKHt0tOV/0q01S/X
         QcoOaVUHi0PljwQw10tUJYQIdFS/K8t4as4R2VE1+Lsepb2iiUS5KuNKfwKfGRMx1SY9
         GJSdsmfhOh32d3zprLHvVidoH7IgLJIcNj1c5eSySeF7jcYVAgiZ8635TdPHWs4GFPH1
         ug9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754339221; x=1754944021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7gSRj0kIrIAWVCkXb4MlkUxBg8yUPzlpBkkuJvaNqQ=;
        b=Lnck1Y0t7EXAOLdecC9EVx7Yw/8i9mm2VrEASyUfcN22F1VqSOcr4324xyksIhOqQ9
         KGjW1OKnN5MFkMZNXwFe9RHE+8wUAscqRbPWwAd6y/rkNcyvm6cwSiXOvEif1zdmCWZz
         iDsc5UteFiC/Ph4YWJjMCNZAoeASvALCtPFZBDWrrin2KeLqTwFiErzflMhe9hwBPfhK
         znGjYjEIvWymG8qM16puAAq2Ylf+MPuTqVY2ByWWU7/VFLFxgLM+70FaKkacH5IuWXl4
         qNzIBM7K5Kqn/uyLDZvEoQRpYAgr8QsO9b47gI1WHz8MBJQjTYX7pLwnCyzPWWaz28V9
         ZKzg==
X-Forwarded-Encrypted: i=1; AJvYcCU6YFJA1on6CYR9c02bVnmzAY0msFs1AHuRk98w+bGt2ti7nA6ryub4qM5Zhmbbmpbh718cLDvBP9ccJ6fr@vger.kernel.org, AJvYcCUPHofAQ2dA5qKK6RRbkgB91vsrU0Zflv3fUZvvEV9W/RR7mba3gmdQzFRe8UfsaZ8dBw8NvS2KPtD3@vger.kernel.org, AJvYcCXxTSjZzyPQFECTiDWL56qL2h+74QHSGn4b058ZcyQtiXKZC6uPbylRuxCDsGNHlfZmE7fy11hYaqCr@vger.kernel.org
X-Gm-Message-State: AOJu0YxdwnUtFls8JfrjlCg7DEs35AP7SC/B06+2hceblzQoUlETC/uy
	ZDUN7iyaLc1fjYIbfzjoR+vwJ+S1P1EsvtqbowDJCaqIikOcaKi4Fx/i
X-Gm-Gg: ASbGnctgBtADM4CBSLPbnFcOMJw5KF2LW6e7XKrkEq9ACvXg+olJO+uRdhKuKdZZjsG
	w2hsRXuULlRBm59hgzLlpzDNerpqU0yQJ+mPAsTH2+pt9bKm4SFW0H7QC/THXXalDTFmHH1PrsX
	fUiWtRCW50Nyd2H2UIsxH+dyuMLvHiuki/Xzi/makKPm453q9bb0soovjugIe0XpDYbhl/9T+L1
	ydTGK5o3+QWG5pmVVzh0jxDQO6rWY8UD2sUjR8hNbBw5ThchtpknHGetbPEjA1IWEzqz1H9TQFz
	muuowJKTwj+58ZuVEYjT/Ue9A5YdC/E/CDKJCKrX4/GOkzx0kYKzAsCC7abB8CYMG3Fi2/iZ6GD
	J/4GQj8QHdG5lePfSI2CSlgDPrGaI5C87oYtIxXOCMKpgd3a1S4ufdpqkLs8nyEktkUo+GGq+Bg
	==
X-Google-Smtp-Source: AGHT+IEwhiFyUfq7pS/Q0At+0yzhWGM5zOsaZwmKWbXGYF3xg8cm/PSun4rCRkfNhzdi1JtpIFGd0g==
X-Received: by 2002:a05:6000:2408:b0:3a4:f663:acb9 with SMTP id ffacd0b85a97d-3b8d9468531mr7825786f8f.9.1754339220775;
        Mon, 04 Aug 2025 13:27:00 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c469319sm16396126f8f.54.2025.08.04.13.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 13:27:00 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add USB_CLK clock ID
Date: Mon,  4 Aug 2025 21:26:42 +0100
Message-ID: <20250804202643.3967484-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250804202643.3967484-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250804202643.3967484-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add USB clock (USB_CLK) definition for the Renesas RZ/T2H (R9A09G077)
and RZ/N2H (R9A09G087) SoCs. USB_CLK is used as the reference clock for
USB PHY layer.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h | 1 +
 include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
index 7ecc4f0b235a..0c2ce81a8744 100644
--- a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
@@ -25,5 +25,6 @@
 #define R9A09G077_CLK_PCLKM		13
 #define R9A09G077_CLK_PCLKL		14
 #define R9A09G077_SDHI_CLKHS		15
+#define R9A09G077_USB_CLK		16
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G077_CPG_H__ */
diff --git a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
index 925e57703925..70ee883f2386 100644
--- a/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
+++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
@@ -25,5 +25,6 @@
 #define R9A09G087_CLK_PCLKM		13
 #define R9A09G087_CLK_PCLKL		14
 #define R9A09G087_SDHI_CLKHS		15
+#define R9A09G087_USB_CLK		16
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__ */
-- 
2.50.1


