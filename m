Return-Path: <linux-renesas-soc+bounces-3943-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CF6881028
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 11:43:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A9A1B22BCC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Mar 2024 10:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41FC38DDC;
	Wed, 20 Mar 2024 10:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Up8pId5g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909482770B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2024 10:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710931412; cv=none; b=krS8WjCBjPBODaktYRmvAbcNWVVuFvdsVLsaJrnK28BaiDcCmcCFlaTFCOacslV3pX+o7dj3CQxUrWmg9XRLdyBe07x6FRvHr+4uIFvAFaIAv9Kxp5nXZRvD9/AIh4Vvv76jFE95KCt99DpOYSPEr6Icg+/4P7t9GnebPWLWDxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710931412; c=relaxed/simple;
	bh=nq2wKNNpeo2285g0qZC3Hza2dTO9nFQmoZ1P4qfdFx0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Oqr9NU/kf310/Q6e9U7vDWnn3l1bIBnak8o8H5S5pcRkyjYT6mXnWOnZ8Vrbx/8tCrEjeSLTs2+aIHdN4g7FTSmCZsLzKOrrtNfo8MDd+69gffhlnT0H2GI7v6a+4G/o6DAIJYztlM2tWjMj1RmZ80/J4hnzZDERlzgLYuTtyiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Up8pId5g; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a44ad785a44so782011266b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Mar 2024 03:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1710931409; x=1711536209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y7YCcW0F6Lrt8JcoNOIMWwfvsSbg5Iix+K6rhgXUVTA=;
        b=Up8pId5g9gHg7yqNhNkSZBxi6B+nIwj4EMyhmy/LyddFTVOdCLjDtqiNEizarkPG8Q
         rPJzTDLIQujxc8HyftQ6KrMJeRzUKpeD3537E535ddBUiI4bc0PKuMpFO7FHidakLops
         dUonoIGpO9n2AtbWW77Vm1Zlqst++PJef8SZOIi2GMTK8kUNvFd+15h9X9Ejoc0qAJBW
         Eux+tDnqPXXMRsuSW4IqZ+GtyXnIB4eDjYtL28aY0Z3BdtqMXoreHCiP8id5TNwFHTUi
         x0NGt96etxuvPGHCOQUKZ2+81krzzMEbyY3qgjyrqCYNbsN4ZBBLTAXW3vR4YA2+uXBk
         5iTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710931409; x=1711536209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7YCcW0F6Lrt8JcoNOIMWwfvsSbg5Iix+K6rhgXUVTA=;
        b=jOf29HYDp9NnuQf12rta3Jb7hmYuA0UWBMn1IztyT84xzixbuXr8KbAOvFs9v8sXjp
         +mG0HMgKPFsSiQnrNOvuJyRKXXSt73SzQqUAPw6u9+37DhDClQ5fuR84kpDPK+qhjlwV
         rK7g/NKSSMGPU7uo2Tpks9oz3yDjzqOvdHkECnXemj6Zx7yme14V08W9frR40K0yiA0f
         6hi2l/9hna+qA1KVdwRHms9jXJvGIC4FhmEiqexyX7Ow6/YEtouxSNLwQNuL8//fr0DM
         Bue8oD9GfNLEiFf5gUKRm3CJ67S5AKCQc33MTN57HHBw6Bt8rpIbqtYjqCgXLy1DKkUJ
         JqAQ==
X-Gm-Message-State: AOJu0Yx0tFsnoMlRhSyJnFAp6/fa//6iij8W/QFFsy68tXmHU272YmzS
	OZSfMv1Yw82gUn7XQixQefEXcVDbu1Ym8biU8w3wYWp6dG4vSO/sSsWvj7ugxiI=
X-Google-Smtp-Source: AGHT+IE07FfjL+kP7sHe9nti7Psa4p1ib+32l0yhChQlqn2xgLf69hil2T/W79Ix4Q3NmFccWuYlkw==
X-Received: by 2002:a17:907:208a:b0:a46:636a:2c23 with SMTP id pv10-20020a170907208a00b00a46636a2c23mr11284694ejb.34.1710931408673;
        Wed, 20 Mar 2024 03:43:28 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id o20-20020a170906289400b00a45ffe583acsm7092081ejd.187.2024.03.20.03.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 03:43:28 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	linus.walleij@linaro.org,
	tglx@linutronix.de,
	biju.das.jz@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 0/2] pinctrl: renesas: rzg2l: fixes for pinctrl driver
Date: Wed, 20 Mar 2024 12:42:28 +0200
Message-Id: <20240320104230.446400-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds 2 fixes for pinctrl driver.

Thank you,
Claudiu Beznea

Changes in v3:
- collected tag on patch 1/2
- added patch 2/2 in this series

Claudiu Beznea (2):
  pinctrl: renesas: rzg2l: Execute atomically the interrupt
    configuration
  pinctrl: renesas: rzg2l: Configure the interrupt type on resume

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

-- 
2.39.2


