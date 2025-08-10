Return-Path: <linux-renesas-soc+bounces-20199-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D42B1F9E5
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Aug 2025 14:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 682B3179E7A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Aug 2025 12:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F2E25F994;
	Sun, 10 Aug 2025 12:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YbKEMTE8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8B425F798
	for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Aug 2025 12:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754828513; cv=none; b=UHQ4dienKkL4tOWNwIcyDTRgr3HHk2NmACOnOl7GMAAYOLkpWqoTUhAqChk3KiSpP6T27LD7hJbX3auyj0EmP35T+cXUYEy6jQCqucPSQ6l02YRltKPmoO/ALkaD+RyM/uVf4cU3OarETlpzFKNeS8oIFRsZe9Rtl5uz2136bdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754828513; c=relaxed/simple;
	bh=WZSwcNr+pcS2CFvCJqEO0bTLFx2Y5UNax5ZJ2og89Us=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FwUqLX0+hgNP3rh9qt0FW2RVfxLacDiqCYjf+iQha7DI05uNSR4XsSukuXeyM/EswxVjt0fLn7uKvpEzqwLuLLEQ5T06bWjApPob0w3IxMUNvysENzoPKjZ8aAZyvxoY6ShBMoM16puC57V8zOiAqw2RUhdQa8827aFzY5+5UTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YbKEMTE8; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6154655c8aeso5027870a12.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Aug 2025 05:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754828510; x=1755433310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdKoLiN4BRQR4DmjNDMMqfI3cdNQZlmAjUao5oPGRe0=;
        b=YbKEMTE8gIFdGyrqJDxqYur0LPFpXattN2f7+5jnXvTdloPFNqZn/mo9FJjYO7rScZ
         cwPavncIccB673ocrJlCz2NVyCCXlZVVfAOtY8YHPIxoxvooWPz6rD6IMeCteT6R/9ye
         ch+Qh1ciHgDEs1AHNR+oZpwpku7CwizYTk1jhGWIZs54ZgZ9juqJuX2wIAeUaRLpzN+j
         GwAsV04FvuuXA5qyyzHEeHzb4ewQA2gPPgPJhB26qT/jsW6iGo0CevqBttADXfaUfoCd
         4OkoA2t6JhnnnmLBrxpi2/F3vvzfWW1IDELqx0iOaNhTGMh5X661S38klfkZbASwgmrD
         lKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754828510; x=1755433310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdKoLiN4BRQR4DmjNDMMqfI3cdNQZlmAjUao5oPGRe0=;
        b=q3xwAuZgWR4ll0XB0VtyzCFlzOX+Ae+IyvqHWs+YpW9kgPsr/Hia6zRIvC8Slr/fNp
         Wx4DhqowiMOFKX3LBnvyfznse1jY0g/SjTF3qhCKqIJlnF2ss0V/CvxbDneBOdMJsHOV
         Wgg1jjq2NR9SkVWXEs5TNVKYKovxRYZ6URrX9AR7JhYChsvZFholysmsDxCTTqh/Wxnt
         dL+KH6fLc4Akaa1m6JG7es/qHlX+ZdDljXIKxuJAm890lDKkbog89i/c0p7nqm9Gi06f
         biAovynLo3t1HgGHagAx3QUx2VrHVw/2Svt4zFWLLPDsG/kVlnDihG+tUGzT/ue6sB50
         TE/A==
X-Forwarded-Encrypted: i=1; AJvYcCXiEYVrA0CSSb0SoQF2Jm1Ik9/XPrlGnuglrgOYLHm5xhYEO1ShxaIbCxluzwkBVT3rxCeHufNChxZXY3t8hl7Fxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3rlrY2xi1UqtrrfXs1uGAFwyvxrqo7nd8rQar5YKZV5tvByJ9
	fTfnYqp0tvHkFPGbuUaSGRJSrlNgkYfk8R3NyCxyJs57zDYNbFx0hhhUbWTaNvgRLdo=
X-Gm-Gg: ASbGncs4NNZvUc/91pxvF6xJaezjqRAXvsPhnxMFf1kDL3lUibMCxFm+PFgon2HE3I6
	N1AkzzBu0J3xfQWTM7unhoAdKvHeNzsOUX6Y6NN42H+/52oKBu75BhB7qiAk9+XY9HHVgcFISwd
	aLezivUD8I55Qe6JRTbWsAOfgXP8gpu7gTOIplIm7+vqgCaQvq+b5tZ7M1tO0tknbOLLNVeYMz6
	F4HFVSzS8/Ml4zvQEIpKfs4nYKx44jJwJjg7n4Fk7sU4F/x36r55sEKdVSM7jcZuhpxJo2cT/b+
	eaGR9QcLD7tcl7RX4IVa4+Z89c0CRRB4yRTKEFMgNCkUtWbjPOure8269tdCoPuVSz81l22voFF
	0WsPaYge1+m/aVqJMqzyX494WVVyor5pskNKZkOfNmnenBEpAHoB9
X-Google-Smtp-Source: AGHT+IG1VR8s9CUfGvRNrN+MgDdRWdkJbvcTgCrAzRGDjCO8ytytK6dbDH9qosonfYZ+QdH1pck48g==
X-Received: by 2002:a05:6402:13cc:b0:617:c6b1:70e4 with SMTP id 4fb4d7f45d1cf-617e2bd993cmr8435556a12.15.1754828509709;
        Sun, 10 Aug 2025 05:21:49 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a86758fcsm16611897a12.0.2025.08.10.05.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 05:21:48 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	niklas.soderlund@ragnatech.se,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 4/4] arm64: defconfig: Enable RZ/G3S thermal
Date: Sun, 10 Aug 2025 15:21:25 +0300
Message-ID: <20250810122125.792966-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250810122125.792966-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable the CONFIG_RZG3S_THERMAL flag for the RZ/G3S SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- none

Changes in v2:
- collected tags

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366c..540e85a0c676 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -728,6 +728,7 @@ CONFIG_ROCKCHIP_THERMAL=m
 CONFIG_RCAR_THERMAL=y
 CONFIG_RCAR_GEN3_THERMAL=y
 CONFIG_RZG2L_THERMAL=y
+CONFIG_RZG3S_THERMAL=m
 CONFIG_ARMADA_THERMAL=y
 CONFIG_MTK_THERMAL=m
 CONFIG_MTK_LVTS_THERMAL=m
-- 
2.43.0


