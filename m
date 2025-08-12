Return-Path: <linux-renesas-soc+bounces-20418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95658B239A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 22:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69A976E4F63
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 20:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EACBE2D0621;
	Tue, 12 Aug 2025 20:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKWoXYvW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301D52D061F;
	Tue, 12 Aug 2025 20:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755029028; cv=none; b=egFphUAAsbFfL7hWyzCAISzM63vUUe3MqqhLBw+wCRHAVMx8hWOEQpiHw4VEsu0S6CTs/6P5vxPRuQeObaoIre4Qy7+Y27SDOQZkijwEa+BDLMI+UTeCDO5b2Yb66xK61iBbU71pZ7rY8EZecg4yE+RYnXJcCCzw7h3y8LVKMVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755029028; c=relaxed/simple;
	bh=SxdasrissLGvGXRvp0gyJmbCtu3PfGjLIbNFDsDZVcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q6MGXwua8+VjtCqcyB2/O2sKTzTN494gx5SlYXfn3to8rQU2Mq/GrR3GzYdLymKTeaotolAIOFQPhVcjpRjkIsk2j4QbeAcLIYh3Rpdudx5fzvGtvklMlKi4tNwsRhewHl502hPoXgccN9vofWIg691ejHR3+f9jjMOpEVSH/i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XKWoXYvW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a11a138faso6306205e9.2;
        Tue, 12 Aug 2025 13:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755029025; x=1755633825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X6+FcMg6QvQqmr954QXmJ5ck64+EiprUFswIQoHqfBA=;
        b=XKWoXYvWB7pbogUi2z6/AIv4Hh1kGCIq103fdRS/hyb9aU//eZ3GclWY8oC906wkSZ
         LGWoPtNkIAR0n3Z2kdtjXGurygo2C9MT5nxvltQ0BH47mIPNjn5DRnIsEXJ3pw4AH797
         PSYwDq0al+0Ss3FANIJRG7T84j1RuL2lmiPPFWSMbDVQGzb4p55YN0WlVFttlr9ZICmI
         QEjF4xdebMNjkU2OY7a5V79l5tgJNoCTR9BWNTJYnOJI7M51IyNLU3QuAHlZ/ixBe8T0
         7EseayZ+i7ivwYemM7WjwmUiQA7rmHpaNZU8hZEf5Wtu57vSPzcymWqT8UERK5bEBpvt
         YLuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755029025; x=1755633825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X6+FcMg6QvQqmr954QXmJ5ck64+EiprUFswIQoHqfBA=;
        b=ZnTWxCZ62BkMwBgr8VQaO7U+rkQSQY1hQ833cTgR91ZGZ12/llI50vkjTr9gehmrsy
         L/wZiHLyF3m/sux4p4C+6fJ2tBY7iBVm3vJlmJv5tKsHP6m2vY2cTdhUy5ysyE1Pq38Y
         nADbwXnZn2VQGdhiPYLwPXjEpI04ihL+5ft7IcHnbuWAChbYnqutnJC60ZxqtfPysz0F
         lLWCRUL8fLQBZHZeLELmISsF8xU9p8THj7wOVwXEMDbNYKqKuN7FsKLYFfqY8kV7UVxG
         8hVdg0FrdmwNVC/5KtxOSSGrQ3G+f99+L7dOd0jIWJ2/Evk8A3LAfnLHXOMRfAKz1O8u
         pTlA==
X-Forwarded-Encrypted: i=1; AJvYcCUN5FNmGp0ldWvW0DIahF6sCNDeOPrObzyDwJq1+Iz5udqInlEw89HhFgSxzZK6XNI1mht3hvS6+zdM@vger.kernel.org, AJvYcCWWJIbUyuudhE2My+P4mv3dEOC3r3reWM/PB79pc8iGGcV14VZRBDDqfPrvatcW/Xr0GSzD1mCGc8wXzWLe@vger.kernel.org
X-Gm-Message-State: AOJu0YyIhEPwz7uIC0Bi2MilBB2Zf2gsllZ/uk89bUzuu/DcQ+HFrbOa
	6orn2P9iGso2kF0z8wkAWcSNNDOMLWeO8oTbKS0jkZQFhmVgUhHOOEYR
X-Gm-Gg: ASbGncuaqMJMaRVWW8nlX6nRPFeim+N99ZEtKQpydfNIU7vBsEkGJ2hQOhjYvkZn6Yw
	/P5u93rovlXd5xsjuufZYoBds5r38ozvDq1/DBNsUjCPw6qNPu2Ug4N4liwkqK3qkVgwvu2D0lW
	8XpZdL/iVx+psL6VzrwAJAR2ttp/3ivIAWTOyVwm4jYnV8TE1Mox9CgpUFTEoPm6zCjnnjpdGlP
	jweB7jOYv2xkU7ygDgugMcJtt97uhD/Qrd+A9D/U8MZeQDp63jVxPpl3T3QxQgJ5DEPuhE2mqt5
	N4s4zlQ+FwCSAEPav9U+sRZ2Os9tQqMMLc/qQO4CXog2yr85rgmmkBc0Nzke4WfwvqGdSG1O9ES
	NkPFGE5ODaqxI6MZn0NSSUMS1fhnDa1ObwGi9G4BtvZXURRWZxa1ZwyH4FmZJcXTGqmcfz86uIJ
	vt2rpw60Gn
X-Google-Smtp-Source: AGHT+IHXsRSDiP3Y7jmzKZGS8y233mFUcwP4pTfBD0FRRClJFUePk7AG3pJAVgrDEzCzFm2jXJjJaw==
X-Received: by 2002:a05:600c:1c15:b0:459:d645:bff7 with SMTP id 5b1f17b1804b1-45a165c883fmr3516925e9.12.1755029025249;
        Tue, 12 Aug 2025 13:03:45 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a16dde163sm297645e9.12.2025.08.12.13.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:03:44 -0700 (PDT)
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
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 00/13] arm64: dts: renesas: Add support for SCI/LEDs/I2C/MMC on RZ/{T2H,RZ/N2H} SoCs and boards
Date: Tue, 12 Aug 2025 21:03:31 +0100
Message-ID: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

Extend hardware support on Renesas RZ/T2H and RZ/N2H SoCs and evaluation
boards. Below are the features added for the RZ/T2H and RZ/N2H SoCs and
EVKs:
- Add SCI nodes for RZ/T2H and RZ/N2H SoCs.
- Enable I2C0 and I2C1 support
- Enable EEPROM on I2C0
- Enable LEDs on RZ/T2H and RZ/N2H EVKs.
- Enable MMC on RZ/T2H and RZ/N2H EVKs.
- Enable MicroSD card slot on RZ/T2H and RZ/N2H EVKs.
- Enable SD card slot on RZ/T2H and RZ/N2H EVKs.

Cheers,
Prabhakar

Lad Prabhakar (12):
  arm64: dts: renesas: r9a09g077: Add DT nodes for SCI channels 1-5
  arm64: dts: renesas: r9a09g087: Add DT nodes for SCI channels 1-5
  arm64: dts: renesas: r9a09g087: Add pinctrl node
  arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Add user LEDs
  arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Add user LEDs
  arm64: dts: renesas: rzt2h-evk-common: Add pinctrl for SCI0 node
  arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Enable I2C0 and I2C1
    support
  arm64: dts: renesas: r9a09g087m44-rzt2h-evk: Enable I2C0 and I2C1
    support
  arm64: dts: renesas: rzt2h-evk-common: Enable EEPROM on I2C0
  arm64: dts: renesas: rzt2h/rzn2h: Enable eMMC
  arm64: dts: renesas: rzt2h/rzn2h: Enable MicroSD card slot
  arm64: dts: renesas: rzt2h/rzn2h: Enable SD card slot

Thierry Bultel (1):
  arm64: dts: renesas: r9a09g077: Add pinctrl node

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    |  83 ++++++++
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 108 ++++++++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    |  94 +++++++++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 134 ++++++++++++
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 196 ++++++++++++++++++
 5 files changed, 615 insertions(+)

-- 
2.50.1


