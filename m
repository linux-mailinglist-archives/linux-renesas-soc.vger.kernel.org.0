Return-Path: <linux-renesas-soc+bounces-17506-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 943CEAC3F3E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 14:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 319FF3A3605
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 12:21:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16D2201261;
	Mon, 26 May 2025 12:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="e4kzRv9X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59081FF7D6
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 May 2025 12:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748262082; cv=none; b=XEz/SBvRvyib6TJxyWGtPw5+JUpW6zz9S9Emz31hkPwUSWpyVxUQolPHQdpBUxYyECBHlD6fS+iTr7+sMNXnH8ZxNW09UiEr/9RdpHh48wY+hFau5W3F8UcxlOyMU5EPbzdn06pm55n0X8tGABrKBrdiJUKxHz1BAFnJjOp0s7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748262082; c=relaxed/simple;
	bh=OSjenUtGeUxY2QKIW0qhPspnf7oHuTj3PCtjTBlzbp4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XO+ETvXWJndopnJmDVNGIgrCCyvuBduN7QwfBVl+loas4l/MylkQdr08aqIUbq9Y7o9sqZp2MsRJR8YoilDgyZdK47eI+A8A75N5yk+2zvj+4ljb748SPMNQrOctQGr9D5KmgQ/PCSMdo552KeVvWLMIoKS8w/vwC+2nnre2w+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=e4kzRv9X; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ad55d6aeb07so424219166b.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 May 2025 05:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748262077; x=1748866877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=768zz3A5MyltBkQLlSbOf4oJniHEYxMfBQNxunlsy5M=;
        b=e4kzRv9X7YDuVP+psgZDvgW2JfxVPKQjZGqnHmZ9nazMd8PSdws/UwD7htHySuvzd9
         lDDDuEjaJD2+QeOhzmL+T0NmYGm1rPgIdsrqy/0VHiTGK8N7+F5UbKeRT/yulQjQq2f7
         g+1FZXOwttW2qWUoPZKlVmme8oF2sVrT93wJcmwJqdjuzS0LwiCW1T2EkGSDVjt1Ndfh
         RoLazqb5d+nnzkkhmKlotpWHeHFZLuWpvYk/w2+jumB/xaIYPq3WDTsZcxLNDZVeNEnD
         QXIpoptNMDiRNrXpQGhO3pqRJUmhZ9EWGqcVv/JIgDSBFdXLJ5SCbZOzPNMkBs/Kg11F
         iFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748262077; x=1748866877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=768zz3A5MyltBkQLlSbOf4oJniHEYxMfBQNxunlsy5M=;
        b=LvrXQxGG8hpFA9pB1rf95BiN9yVpaLXO7U9dXG4/efmtD9WlutO+ZlCs203Ca2Hdnm
         b1SjSgO6lZ44ZSQtJe4TpLjhf23TmVRSrfVtOSgZkQKThyFeX/IRnJrxi/UzlUbk497L
         anV5DuirJrbHASyiI5CmcusFp5NT+xVIFMeL+9JaGDnJaqG9roXV4CEY0exGfjdOM/HC
         GtwE/vzoRqobhsx+jDVVd5jbC5HbopiU7XLoKXkve+F6eu1Mr/AqX0tSXO9aDFrIPLdk
         kPGSepHDTQr6YeOEbG4LyI9KJ6iGrdEzHLS7f6z9Iirx2TCmIun94k7JpAyR2M5hd+z3
         JsIg==
X-Forwarded-Encrypted: i=1; AJvYcCUuk1xsHg+oUNDfUhLwolcY1B/886xuBBHfIFwzq7f+F4B33sFejsRHAZqmP+boH7kmGE2QSnhoGARHI4IbnXMEBg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9vulLk6998W/gV9xWASRuo2k7Q6shiCBSHfYJac1bwBPdil/X
	aTEpxGt+rn0WcBFQo/IonXU/skAldoR2UkHWml1oQ2IFNyRQo/qQjcM40uchlFCFEFM=
X-Gm-Gg: ASbGncu91QxkZ1NJaPssnLFpGz8GWMsLTQvBywrMCzjtIGy6E5s8ok31CFCMwgb2mEz
	1Yl1k7PXiHpyP0m9mb+mqhxCgLrPe/uX3qdeTraxJWLtZtHmz7KSrM0sk4X/yP+zEZ0Nu8uKLh2
	ACme8anMx7q5Px177ccEKThAh0g6/RYaIlWMiuxScBnMWwu+AzDvWmmBr51z02ZXuT3IGzBKDJ6
	bOltnMzZ5ST6EQ4rihOAAHJjfRCMOw0CM/AtaigGspmn49g53EKXTD+hR4/ZsxwLDqFtLxO7jvN
	cviNrJwB1uWmpQs+Zd0uTpzpblqvpc9JTfmthvWMTnkTZcTMnpORhFHDO15zR/iehxsej/MhVSt
	t1qi2
X-Google-Smtp-Source: AGHT+IF/1QayFTF9qsFXVEeDjJ2ecvcZuUY2FjpmdnnRWet2lfUsBrEqZWoEsIXUVBdEMDGEtRJkAg==
X-Received: by 2002:a17:907:8dcb:b0:ad5:1fe4:4d0d with SMTP id a640c23a62f3a-ad85b2065d0mr729565366b.61.1748262077456;
        Mon, 26 May 2025 05:21:17 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d071c36sm1687630066b.64.2025.05.26.05.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 05:21:17 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	len.brown@intel.com,
	pavel@kernel.org,
	ulf.hansson@linaro.org,
	jic23@kernel.org,
	daniel.lezcano@linaro.org,
	dmitry.torokhov@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	bhelgaas@google.com,
	geert@linux-m68k.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/2] PM: domains: add devm_pm_domain_attach()
Date: Mon, 26 May 2025 15:20:52 +0300
Message-ID: <20250526122054.65532-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

As a result of discussion at [1], series adds the devm_pm_domain_attach()
and uses it in platform bus probe.

Please provide your feedback.

Thank you,
Claudiu

[1] https://lore.kernel.org/all/20250215130849.227812-1-claudiu.beznea.uj@bp.renesas.com

Changes in v2:
- add devm_pm_domain_attach()
- drop the devres grup open/close approach and use the newly added
  devm_pm_domain_attach()

Claudiu Beznea (2):
  PM: domains: Add devres variant for dev_pm_domain_attach()
  driver core: platform: Use devm_pm_domain_attach()

 drivers/base/platform.c     |  8 ++---
 drivers/base/power/common.c | 59 +++++++++++++++++++++++++++++++++++++
 include/linux/pm_domain.h   |  8 +++++
 3 files changed, 69 insertions(+), 6 deletions(-)

-- 
2.43.0


