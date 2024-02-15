Return-Path: <linux-renesas-soc+bounces-2831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A4385636F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 13:41:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C33131C2295E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Feb 2024 12:41:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9936D12CDBE;
	Thu, 15 Feb 2024 12:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Z6Il3Pvm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A4112BF04
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2024 12:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708000891; cv=none; b=EgRpHBnMqzBlbkrFI8rWx7QZPB2vKiD4YLqmlXKvWx3KuENR6GdkxSxR5au+DfltoeaZDxv3j/JoCMa2gcA/Kvg5s/XoQnwALhGKrQWDLNPp54c9YRpww0LHpVmbSLGxIEp4TG4cEIRYRTO8jQeOPHGvmGfYdB2324PS3rvViAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708000891; c=relaxed/simple;
	bh=SFCpTXqbRdAXHUBBAzzxnjc1Az5f8TRxLKC/k3F4vy0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RYgtDdfQEVm5SbX4/ID6oGTYwF4fj4s+ndI+GR87nciONTea7SH68LGhX9r47TV5PDa37AOZ9kUki/PF+IJGWTo43efL3xyuzx/8M+E53MJVoQWETm3AaadXGrtMDL4CFMb1iO3uniRTlbjb8DRfgeKDcGo1RtGBJhJz6+LIsOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Z6Il3Pvm; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33b29b5ea96so399859f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Feb 2024 04:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708000887; x=1708605687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MYnY7O04/x9zyqYEQqnNz4jRAg4FTDodHzcngEZrlFo=;
        b=Z6Il3PvmGKjrj3wv2OGK0Btonvz44YqMK1xp0TWb1xoWkhQa65XoKbxfGc4xOYO934
         m/LVFeHzpbYBPYTIuFYf/8H8oppIxnMTCOCUqF3/VNU10RvBjuhGKZmn9d3xD/kJ/T3k
         I/gVZwS8+kxruNjiZoCV8tvZ7DesMssZk3jW8JGuJ/IMIKDgfMTKIfHvosBNnVmBNS2D
         pPq+3LkSVikRTX1WRBGG2YFsPdSaiIKpYJTwRo02sgky/Jiqh5noDQLoEbtH+tOSVmuB
         fjM1KETp6+a/8+zIm3EnfvVvMY6n/749k/Tb0QivGn7pV/UritF3nK7xZ6zRHyfZekwV
         wLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708000887; x=1708605687;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYnY7O04/x9zyqYEQqnNz4jRAg4FTDodHzcngEZrlFo=;
        b=IzBlRRIOWswMSl7IY7wwdPfhKTFRSJ2zlfrjIA56il/Xs7mzgXc+o27zoDJxhQuJzV
         g0/ncE/OP6+zP+wdZKk0zexRMC5NUbKQmTVxHiYr8l5ZM2qoVfR/EqPLuSLdUyWM9JdT
         +kXqlOb1DNzCv0dQgHsY9freP01Z60HVl3rdNf4lMjmY+DThzcjXdUKvrnPETTk3JdJA
         Ni8b1ANLfTgWIoHzScZGzV//EMiKGpMBeoy/m3ibvP89SFYL19UGaxjhn0Q1ta/AV4V8
         Bos+zfmN6orUhBtATl2nCibp9e3OTKLKFQ3jsIIbxndFfxmMyIUyeidEWSZhpz/1Iu/M
         ro7A==
X-Gm-Message-State: AOJu0YzAO858qN0MiNq/hNvk2wIhEOeFluuMH0I4nlRElq14nEkP5etL
	zDaN1fIRyaxcWVQ044/vgXyfPy0yMgfBil5DU8XmBOtLFtuy7H88Lvv3NnYohZ4=
X-Google-Smtp-Source: AGHT+IGIGdB7TdXBD9OIkOScp9kvODa/Rio5A+z65NM6bDSmto8L+H13OukSXkPCKyay8Fdy8bJ5IA==
X-Received: by 2002:a5d:5591:0:b0:33c:f627:3bef with SMTP id i17-20020a5d5591000000b0033cf6273befmr1304211wrv.25.1708000887580;
        Thu, 15 Feb 2024 04:41:27 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id n16-20020a5d51d0000000b0033cefb84b16sm1674931wrv.52.2024.02.15.04.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 04:41:26 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 0/2] pinctrl: renesas: rzg2l: Add suspend to RAM support
Date: Thu, 15 Feb 2024 14:41:10 +0200
Message-Id: <20240215124112.2259103-1-claudiu.beznea.uj@bp.renesas.com>
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

Series adds suspend to RAM support for rzg2l pinctrl driver.

It is expected that patches will go through Geert's tree.

Thank you,
Claudiu Beznea

Changes in v2:
- dropped patch "arm64: dts: renesas: r9a08g045: add PSCI support"
  as it was integrated
- added "pinctrl: renesas: Select CONFIG_IRQ_DOMAIN_HIERARCHY for
  pinctrl-rzg2l"
- addressed review comments

Claudiu Beznea (2):
  pinctrl: renesas: Select CONFIG_IRQ_DOMAIN_HIERARCHY for pinctrl-rzg2l
  pinctrl: renesas: rzg2l: Add suspend/resume support

 drivers/pinctrl/renesas/Kconfig         |   1 +
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 408 +++++++++++++++++++++++-
 2 files changed, 405 insertions(+), 4 deletions(-)

-- 
2.39.2


