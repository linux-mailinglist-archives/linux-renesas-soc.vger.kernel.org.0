Return-Path: <linux-renesas-soc+bounces-20993-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDDC2B38964
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Aug 2025 20:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92C5016B2E8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Aug 2025 18:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74902D94A3;
	Wed, 27 Aug 2025 18:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Va5zAj1C"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C24C13E41A;
	Wed, 27 Aug 2025 18:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756318792; cv=none; b=o6vpTyAbylgqNMCcQyW1tTvbdPAGcqSkTC3S0wyUm+C9dpyMtH4ZixFG1bkj7Lcbd0Ebw+kLUrS0oDq3FIPivKMNQRjDMzJ64JnynL4hmUWaUQB9PUszG7KuoU59gg7xzAGm+SW55xoy9uMUL7NtdAjtECTqGIgOL81d9AmpkA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756318792; c=relaxed/simple;
	bh=AoB7RtMWPGPKI3YjzpnVxFzMLZRaV0tUnljLiktOVYo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kWRc5Jnhvncj3mBkW+LixCiQixr60SLf3+6uWBdKswklLqm+UT+BcoKA0LszrCwQSn5pUUx0OMyr616goSUz/HKBbX9B43OnjnQRcpCYoTixvuxCpk+gwrhOtrh9alyE6Otv+he7osC+66JwjKb42YcOJwHju7mgs3aGBX7zV8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Va5zAj1C; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45b629c8035so541305e9.3;
        Wed, 27 Aug 2025 11:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756318789; x=1756923589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b1iWyT21+fm0/ET10Fcea2WHsXwAX4VwcEeu61gegUk=;
        b=Va5zAj1C3NynF0u1QeaUE8pIUv2U+sKKe0GSzodU34r+FB9xfV6gbmbktNbk2ZZbGT
         Zhhp8o50q8qUFrvMzV2BxGwioBZnarDS94AuateI9e2EKUEQUXou/kjGdLN+2+KldHpY
         hCSIUIlFRX0vWzbZNuxGXsfV221qq5GnC7obHNoR0NdWbR3tejQDNMTaupfzaD4sH1Lw
         wxrLJ+tc9/zAFsf7kAKi1qrn4pOeRH5mlrjKevK1XXpqoVKBpHgoFQCjWy+PJGVFHQTS
         IQjqyDAQusDwmDpbp/W3lzwflteZYoVpgnK4i/3QyOdwSLc7Pq7D+2B/Rt4Hjn+L/DnD
         +Jcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756318789; x=1756923589;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b1iWyT21+fm0/ET10Fcea2WHsXwAX4VwcEeu61gegUk=;
        b=P9dXlLvOkk8f6d3TTBe9OOXv6XA94ITz6Nkvb8XqBioUawlSO78dqyQWQQG3X67qYz
         zMoNeH+I2rIHVR0XaXAA96ZwzXBaeNfB+ScpRHGXuZJzw/Pi2Y8dtnG+4Xntttr8kCQD
         RCaMUvKJ9j/tpcKRdoxjGg/UCUaTh9pUOJDa6O0I0TqA57W9HQGEiWbJoJjrWc7gyHvd
         C3KUQqBjn9/WHmh3bpM2BNhRtLjJAc9RE/sw0jGUlSjiTf5fyIOXFjwupXL/wa1a8wXf
         Hwx/h7ANYnWZ1wG68lmy2kX/6iRXDl2r3cqbvMvGDjdIdYnZ4p3EipLz7Aig8rUnwcMw
         nrqw==
X-Forwarded-Encrypted: i=1; AJvYcCUpj4ArX5IqznSk7yK+ZI+AY7lWsQZXlz9Pj0dAm84oCEfTscZ7QNtYLy5Uzs+ZYuu2L2+4f31jzKKW@vger.kernel.org, AJvYcCVGbHHUzirDieI5FwNYtVpJpr52rHkeA9j3OVcSTiodwRz7eRoK1JKlCK6myZb6wrPZz/x6+IrmaFXZ@vger.kernel.org, AJvYcCWAg9EssWiYKYamnh5DQHL4Dhc+9P0cvg5HrgxdojxwOyrONTtQYfyy1w+/Ka4TzYx+k+SqG2+Ug76uoSdz@vger.kernel.org
X-Gm-Message-State: AOJu0YwRGPEZUkR1fEJYU5FK13/gKxUoOjm1WVRaASr8jNCKfCEpynjc
	VL83/7/GukiRttK8inwx42UzOwGDqYWMBzUtnFKhow9CqMEGcq8vzCXh
X-Gm-Gg: ASbGncsWkR+gppoTo6yrD4xNUNQZEXswVJ6l+flk4ofCnSBc6Yyy2h80V+9c9wBV3dz
	scMpR/rIku3Bjf3dzRaJgFTnS9/i8sN+H+t9kQ+PiShbbhum5IPswrYdwfxgx0eEOukfcZ/E3em
	dnYJfqkTDULiA3Qry1Zj7JQOrs+2MHJBa6PIykbM2PeUIINgz/4LTmnATuB5yIvffSrIgN/ry/5
	9ori9/kNYML9m5iYNPNVocYXH/Y7QcAT+XyaXwZhb3K+MrKJ7Q+NPXVCv2hCTwDp6TGVegmlU8L
	QFToIK3xN7dNELRqEfgo773U5JsqJhuOvjSl95TH03Tx/5Dl1oBxnr9RbPIEGwbxO2kMQZGqaOf
	oE9Zblc/pEjhGRSe1I0xEdfsOZWCrMq8Mp0louVN8ravciS7I2U97UI9ENsZDty4mY4E=
X-Google-Smtp-Source: AGHT+IHkpSxz5/17ztNCvd3miIcH68VEO5SybiYJxvFm1dY68bpmmjhlH5jOXGIwv7gydEERMzMlGw==
X-Received: by 2002:a05:600c:4f8b:b0:459:e398:ed80 with SMTP id 5b1f17b1804b1-45b517e9de7mr158244295e9.32.1756318789157;
        Wed, 27 Aug 2025 11:19:49 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c546:df97:4816:d7e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6b1cdf05sm24604485e9.1.2025.08.27.11.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 11:19:48 -0700 (PDT)
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
Subject: [PATCH 0/2] Add Ethernet and GMAC clocks for Renesas RZ/{T2H, N2H} SoCs
Date: Wed, 27 Aug 2025 19:19:42 +0100
Message-ID: <20250827181944.2750142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to add Ethernet and GMAC clocks for Renesas
RZ/{T2H, N2H} SoCs. The first patch adds the core clock definitions
and the second patch adds the entries to modules and core clocks.

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: clock: renesas,r9a09g077/87: Add Ethernet and GMAC clocks
  clk: renesas: r9a09g077: Add Ethernet Subsystem core and module clocks

 drivers/clk/renesas/r9a09g077-cpg.c            | 18 +++++++++++++++++-
 .../clock/renesas,r9a09g077-cpg-mssr.h         |  9 +++++++++
 .../clock/renesas,r9a09g087-cpg-mssr.h         |  9 +++++++++
 3 files changed, 35 insertions(+), 1 deletion(-)

-- 
2.51.0


