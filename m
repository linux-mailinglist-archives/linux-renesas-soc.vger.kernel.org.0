Return-Path: <linux-renesas-soc+bounces-20594-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40871B293A8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Aug 2025 16:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D6941B2149F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Aug 2025 14:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA851C4A17;
	Sun, 17 Aug 2025 14:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NN9H9JcD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4836188735;
	Sun, 17 Aug 2025 14:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755442223; cv=none; b=slG3u4QdP0fcrUUlNq2dJwww9A/s3HnT6yQvF5+3usy22BcDBOOu1wvbE0tRengdyxwQzDUVxbjNtsrsmOZqz8bkEL+nbFtLoAdmQbmMiTuFDCH4xPher9BgtXojjMGgA13jHY5kgW3ePLF+Ym97DZap731qxGIZqWsZmhT7xdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755442223; c=relaxed/simple;
	bh=awK/M2dhN/9SUXl7AiD4jrIJERqZs2ku+Xu5c2T7a/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G52M2Oy9ZzGssbq1J4cvoHEUQ6xYVTeLzYuR/LhhveIjIlm1bnTD7ZAeBmGiuATFIQZ3zQZm4X4BqzONrwj4uWelbzrWlo15HCEWAw9nHSxbT9skTDN3AIyMRVpTylIaXwOE/2ZHg3tgp56LFQEoFQpm8HQvd1OpkLAA+kUae0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NN9H9JcD; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45a1b0990b2so17884745e9.2;
        Sun, 17 Aug 2025 07:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755442220; x=1756047020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIH6VHVWkPH8Lp7DYNNft6vh64yO0lgWZEuMmVXdlRw=;
        b=NN9H9JcDijooT2OnBZIxoShRI9icTUvIuwYC89xcdIqsXATGXWUe2HoFX51vAB/UF7
         WSZScNljJIPmEjKYnQfyFqsRPy0IAGoECkHYhDdFCoV/BGzJISxNor2iagcs1wU+kRbO
         ZiUL/2Li/h6BAyLVBTHqbUiCPxjyqjrn92JeR6E3gs+dAZ3Hh1gMsTycNwZ3T+LW7cwT
         CJd7ShT7lD3KY7weWrXy5ASAymG5L+Jfty2qaoHxFJg2QAUvJJO040W2x7tfzMJQkiOT
         P0jBRl/tewnWuCCwb8Mf9GXp71iSdd0MqeoaOCTcuPw6So19pfRRX3W+dtqb72IOjC04
         waXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755442220; x=1756047020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIH6VHVWkPH8Lp7DYNNft6vh64yO0lgWZEuMmVXdlRw=;
        b=P1tb96WKX6JNEzLJucRsklqzTKmCwTGmVGuIXfQPtk61hnRFE3Qrwzo9Yhzup9I8d+
         mjafg6T5oG60CAy0o9vG8NDO9zAk1b1IRp/tMOboWlsvHU8rhYxWqro65ArSjWIh8xkF
         +oEw709dzK0Fh8MwcfAGKNzAXnb5NitstueHmGACtd5rXGp77LshUKJP3DR2oCzSkSpI
         IADCXU0/f5X+BPYx/O48rAW6Usv/82KDfWdxl8KM8DkPqiuNFjcUC7HqAmTEJtsTAoBp
         t6BpzSVaA3aFuMJIJRG30sp38y05ddmOK8Ten27Gi7HIHyZWEEyJdbIlGGGl3X9WTzUx
         Ko9g==
X-Forwarded-Encrypted: i=1; AJvYcCVHceOH1cCeuYJvJqmK50juPLkyZrK/gx6+jZCeuLubuD2ktVblU1dFnvd/7tJ63gdW3TcLw1VP+6/WAUJn@vger.kernel.org, AJvYcCWbNM+HjhZyv5Xup3CAu12hPaVPMsHaAaFY0L797Mv43ABC4X4F0/NtVfRxBn7YKEPUAdcueSrjOKQIjj8YfvI9jcU=@vger.kernel.org, AJvYcCWdlTCj6IHq6Z9VdpDQbPukuhR9LeA3L8ThkrCwzWFfH9ZN+r3NGfw3UqFIN38kh8P76fjgFT0YBw+9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl4cYn/aCgi3pUwWWO8qg7nP3kKD+dEHQRrTZCvXxIMTIbEVoJ
	j3wjQMAvmPd0j2FDC03VYErzWgkcCqYYmBZoOK7vdprLLSQ02pEs+3H3
X-Gm-Gg: ASbGncvmTO7LQbhrXSMnD8WWmnbgcbGU8z5TyJ+M+bf5Oi/Yb4NB+vA9qqrKn4w0yIT
	PuXtl7egXPgRAgfz14TaemrJnPApEHlk+VJil6LcMorl0mD0tGY6/KhuSEsd1kRpWqdueTfd5w1
	NsI0uQaXeCb7vHHHvdBjqEpJf+hhvPHRt03U2+Pwm5BlAmPofGtsLXM3Fb/syL3aURkfY2ec90v
	Qf4eRITfT7xWTeNakSJvqdRxH3MEE0Muj61ubriscpkEx2PVzwevz2TEEUBdmik2zTpAUNn+NQk
	H+IAs0DIkfjDdLohpkwdLurDsGZI0ju8MninffqHirhRWYczJIxZUsfpTNONUvd17Ly4o31LaN8
	fqyQSuVpC3wX+5MB3Khr+MMgjSEOKqWRxrqLI+/Vr+SvD8mWWvO4z5pxBaeXrmJsO1sTbu844/E
	ly/18sbUoj
X-Google-Smtp-Source: AGHT+IGjD2UCj9feSjI0Az8o40GWrdmLLoxS0sLuZqQ8St0na83/y47Pyhsh44hgLaO/ImRWq1WkBg==
X-Received: by 2002:a05:600c:3b1f:b0:459:4441:1c07 with SMTP id 5b1f17b1804b1-45a21844b9cmr63646015e9.20.1755442219940;
        Sun, 17 Aug 2025 07:50:19 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a2231a448sm94161595e9.12.2025.08.17.07.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 07:50:19 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 1/2] arm64: dts: renesas: r9a09g047e57-smarc: Fix gpio key's pin control node
Date: Sun, 17 Aug 2025 15:50:10 +0100
Message-ID: <20250817145016.166509-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250817145016.166509-1-biju.das.jz@bp.renesas.com>
References: <20250817145016.166509-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Adding pin control node to the child won't parse the pins during driver
bind. Fix the issue by moving it to parent node.

This issue is observed while adding Schmitt input enable for PS0 pin on
later patch. Currently the reset value of the PIN is set to NMI function
and hence there is no breakage.

Fixes: 9e95446b0cf9 ("arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 1e67f0a2a945..9f6716fa1086 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -90,10 +90,10 @@ &i2c0 {
 };
 
 &keys {
-	key-sleep {
-		pinctrl-0 = <&nmi_pins>;
-		pinctrl-names = "default";
+	pinctrl-0 = <&nmi_pins>;
+	pinctrl-names = "default";
 
+	key-sleep {
 		interrupts-extended = <&icu 0 IRQ_TYPE_EDGE_FALLING>;
 		linux,code = <KEY_SLEEP>;
 		label = "SLEEP";
-- 
2.43.0


