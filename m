Return-Path: <linux-renesas-soc+bounces-19165-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FA7AF8492
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 01:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 824BC3BB74F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 23:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FDB32DAFC0;
	Thu,  3 Jul 2025 23:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLrLjXAP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AE12D4B53;
	Thu,  3 Jul 2025 23:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751586954; cv=none; b=nVGCvbUoNije0lVJXqQumkCkFDQD01kEmuNhx4x1AAO3Kuk0fHEWAHDT7tOYTXHs7ZNikbVnfzl8Fy2ntXkdk8b6lttLRyGYxXVuHj6iQTB8pjZ+9AlozFV06DYCzffOWV+DilNLiy1O8lg/fnCoqaMp8Hy8pxF8WYah5Zl4yxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751586954; c=relaxed/simple;
	bh=dj+7ebJKVoDtYctJz9uTithcTe1oC5BEjsUMPwFSYB0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eKBu6Y+j39Hs90sXG30taLw5Xj6USFTbVVSkr3pfhggKF2a4mAYZkaIt7D7V9D1Xf9/n3+FpcrgX0LRvuXCAkXxMAqJgh5wQWK46FaiOjIr/+kbRgSh1IgvYQtoP6C1oMIIedEI/aWGEox8J2txVXNaWLayDiw+itYhaud+yM7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLrLjXAP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso2689055e9.2;
        Thu, 03 Jul 2025 16:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751586951; x=1752191751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L+4Z2K0VK4treV/9ak47i8S0ql9LKU6g1u/cXAT3ogo=;
        b=VLrLjXAPgppQYQE+u/cbj7pTFwencMMdJhvgFnsU45l5/bkVc18pv4f1XMBQA/Smfk
         BxwpK1E/oeRWunOXmRWU/LgzKJZiXJu5vUdz2xU3sUGVHz4nOfqqHluUoafw4Gmulv53
         luceEBeq6cjopUOrUkqQcHt0iMyCFleFoSayTkX3di+7mMsQMNj/uDWfidmFpswm+MRw
         lfrV+nZw04QJk8DA3DKBkyp/VliHZQLUjmLqFmIlLoZgn3/Xl9Xxc/NYkqR7+r5vJogt
         wwTQEOpWB3oJJvXObvgDwqmby5X/0GtcbeyQlODfwmT9UHO/IjJbAMCbcYckYWt99xpu
         4gbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751586951; x=1752191751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L+4Z2K0VK4treV/9ak47i8S0ql9LKU6g1u/cXAT3ogo=;
        b=QbJTYKP7NGZlzyMSIYZeVJ8b8dYedv7n2fDoBf9MeK2Hjd/R6x3SgpppglWtYqwfUt
         Mle8dsc+uxs3+gnm3XHDQX4F/o5UGDdC7uumHrWcX3fKwcWddJK+KbEI/fScWtjmiDM3
         PLFcq/kyOXPqtc54qYupB+i5jLPyObvAQln5zfGcWEbLdbNzHLZ3yeYodkSDLVX4ytGi
         2KpuTst17uuy4bFYKbRaNbQCNSBzH8CkNL1wrbU7l6RrYpz2L8SFXXUz3jXpsU+NUJQ9
         vJ92tZx3VS5MhWEuEAGfEfaPR11My1TBYsC9MlnyMm4R5Ayera12jMuluWm1cG11pz6v
         iqpA==
X-Forwarded-Encrypted: i=1; AJvYcCWjmbvxLDAXwOpWA7IS7cuYdoDv9U/r6HrO1w1ORJAjynHZO3lAKdhnxlAZz5wb+w8zWWL4FDwRX946@vger.kernel.org, AJvYcCXWOCqKWHMWy4LEmq6N3VQmW8X1E9qRmaJWW3Y47mIoAZnYyAh4k1BXOSngUMrneF4zifBNohoilfLmmU4B@vger.kernel.org
X-Gm-Message-State: AOJu0YztLVf45dvYnxJojZh3yOGJ6y1aEPnqGuMbeHPEdG2bQwV+7e1y
	lj8zd22HQO/OZytqpBuaY46/ZarLLRZMm/D95wsLGnKCZaT4p8aFaEaS
X-Gm-Gg: ASbGnctumJBw21pc8r2OqayumdQ989cmr9FOO+UCCbQAZbb4E2Atsw8Qaas6N37rIAD
	44t6J19G083Ga2ZXCrQEarhNYCDJtOUnYIX8Cj5P3UtHn8/XoxF761vcZgikaccNjeHhPKSzH7w
	970s4nXNQgean+IZsX6rTBucrh2MeT1b3eU/7wWVkj2q7iHxmqb7vdCkxqwscOdxfqA8OhbYHPt
	qZUvPXP7kvLfhe7iICTGG6eiQdeLhoDQybI0XjA8kR0vlLEtHxAFcGayTrAKJZVfQtiHDOhfz9I
	qkbmQwiJeE3dDvk155nUO27kkRJrL0YKrRBQWk3qcaG77OQr9RzI48wF5JE1ngm8t40BjeuAadc
	KRaQdNvlYgsY=
X-Google-Smtp-Source: AGHT+IGi7hSSuvLiBPv/4UrLrCBRaZJ+2egiw5vhTGl9xic+5pACw+TJ52WEXgdhb5omJdnhHDv0+Q==
X-Received: by 2002:a05:600c:3b23:b0:450:c20d:64c3 with SMTP id 5b1f17b1804b1-454b30d89b1mr4253145e9.18.1751586951065;
        Thu, 03 Jul 2025 16:55:51 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:5f46:9d65:6ef9:1650])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47225b5cdsm932436f8f.85.2025.07.03.16.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 16:55:50 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] arm64: dts: renesas: r9a09g056n48/r9a09g057h44: Fix pinctrl node names for GBETH1
Date: Fri,  4 Jul 2025 00:55:42 +0100
Message-ID: <20250703235544.715433-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series fixes the pinctrl node names for GBETH1 in the device
trees for the RZ/V2N and RZ/V2H evaluation kits. The node names were
incorrectly named as "eth0" instead of "eth1", which could lead to
confusion when configuring the Ethernet interfaces.

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Fix pinctrl node name for
    GBETH1
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Fix pinctrl node name for
    GBETH1

 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts | 2 +-
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.49.0


