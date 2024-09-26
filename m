Return-Path: <linux-renesas-soc+bounces-9076-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A7C987258
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 13:07:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F28D71F21E2C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 11:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06AA1AE87B;
	Thu, 26 Sep 2024 11:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iHaemT14"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131641A42D3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2024 11:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727348853; cv=none; b=Kat9ri5F9VFC6r3kCYDBpKctl9U6U4a+8nKBO+/x24UtZDfcAmKNKLmJVcY0Yd9eLJVpvvbzJBCEeom2913oluc+GffONMtOhFQ57+91BSTaLRDUYpRmKBIIUOFfqvN6eQrWeTCnZs0bEYRZqBoDIaXydLST7YOUKRYQX1HMfOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727348853; c=relaxed/simple;
	bh=gfGzQ7CiYwCSYzOyqABEWzDC7oX9nuck74fqrF6R25E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hbsaPUCDNpl77TGZFiPjVuXtIcQQvXG+Ia+nA0sG8fSMawMy/HeAwiIXaYW3eL57X5izSxR4LNynPsFJ5hpCkS7LqQXI7fftIRZo2kZhJHItkf/q2WZl+4ujsG4zq9sBg8BJ1sy3HpuD8e2hgLq/y8JjdkDg67ASf7AE0x4DvVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iHaemT14; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=IY1dV6jYGIFrou
	L1BegEJ04TlNsGb9Sp+OfWa+DyAnM=; b=iHaemT14BOIxYjsNBqZidLjtfjRjvP
	aXqdiZ+OM2p9DjW84rv9+g4SzzkUI2ZI9s/TRve51vyhLjKNsBbDej98NzSRqLLf
	+OHcVoLSbbC3rE8Dgo7nTD42NIqRrLP2bMgi28cJQ1O5KBFu7PQV5hu9KY3kF8fu
	Q++VyOTGADiA3qPCIDpBCANr3vJolm9Dtg875yPQKvFbtV517to5m0Ut07uKg5Iu
	4/Zi9zOeRvj0mY54/FJ/KhAhUJQiRp6v1ZrqASK/5VeIM0WGt6rhwn/nj1ZxFat9
	+sjNxa6WINdi+aqGLgh6eLfAemGoMx3J8BtjcXarmZc3mnVi1wjj1NKw==
Received: (qmail 960737 invoked from network); 26 Sep 2024 13:07:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2024 13:07:27 +0200
X-UD-Smtp-Session: l3s3148p1@WDVzvgMj1swgAwDPXzRXADDuo30Z+IZ9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/3] ARM: dts: renesas: use proper node names for keys
Date: Thu, 26 Sep 2024 13:07:18 +0200
Message-ID: <20240926110718.20519-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Another fix for dtbs_check-warnings. Patches may be squashed into one? I
am not sure but don't mind either way.


Wolfram Sang (3):
  ARM: dts: renesas: lager: use proper node names for keys
  ARM: dts: renesas: alt: use proper node names for keys
  ARM: dts: renesas: kzm9d: use proper node names for keys

 arch/arm/boot/dts/renesas/emev2-kzm9d.dts   | 8 ++++----
 arch/arm/boot/dts/renesas/r8a7790-lager.dts | 8 ++++----
 arch/arm/boot/dts/renesas/r8a7794-alt.dts   | 8 ++++----
 3 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.45.2


