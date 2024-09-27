Return-Path: <linux-renesas-soc+bounces-9107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 692709881E8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 11:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99CEC1C22A48
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Sep 2024 09:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903281BAEE0;
	Fri, 27 Sep 2024 09:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gB0sVby+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F13189BAF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Sep 2024 09:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727430872; cv=none; b=hzpvO6I/w+uT89/nb55pFkf7TlC9nO1eGT8Bu4648Bd/wNUE4uIEUArl/GyDe0CYI2Er4KSV1nRsNstwLMh8mQ/Ak8Y9ww7yc4gzKSwGUcvKXORONPG3oQq69JeVjbcRVb9nR4Y70QNyZ8/jMfJV8erBaCOQh4MiX4Ci+L2cayo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727430872; c=relaxed/simple;
	bh=XjsccP2jNC0Y0GNI4UfnTAQTM41JGTNVjpo9JJGrBHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IsV9KDaoFd6vv9lOVPp/N1Ak4yYnsC/+jf+OILDqxRvaemKWVHs4QKdTwBi1zb3dPtObKnMQgaGsb4yKqbllUctgfbHQLx0hb6XBGMyr3a4bmTxyzzTYu4m6Jq+eX7FnNY6OT4GIPFmt1w3X8E3o+X48lvo9P7KpNLMkQqvN5Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gB0sVby+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=0Xnj6ssSY8CH5g
	y/3Of7m+yF+gBfOwb8bruAaKYun44=; b=gB0sVby+DT23144g805E2NKn62hLag
	+Jyl+k/FVJiU4SzkuenOwPsTy8JyZ5zv/D1D1/lfkabpk2Pc3tg/tCogIVEipQTd
	0WdLgp3pwq82K6UNfS6KokXR1RckmwhBV2fKNCoMQCQydeMjqXA+v/oTZiYlNtJ8
	72hgpZMzWckf4e5oD7W5l/aKpiDafMpWHdgcl/jfgQqNSnrE/+Ifrv1PPbtrIeIK
	yCK145i2wXPKzQ1popJAr+qBUCPJX0mH8yP7nqvmpjDABAWF2bakgT7i3jAQ7V3/
	kN+rm/6R+uqM7EFCE+R+ei4UdCViA/rOumMw9NCcHbI108ggkCcQzj/w==
Received: (qmail 1283377 invoked from network); 27 Sep 2024 11:54:25 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Sep 2024 11:54:25 +0200
X-UD-Smtp-Session: l3s3148p1@xeAb1xYjhmhtKPLv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/4] ARM: dts: renesas: use interrupts-extended for gpio-keys
Date: Fri, 27 Sep 2024 11:54:14 +0200
Message-ID: <20240927095414.10241-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since inheriting interrupt-parents is discouraged, use
interrupts-extended to describe the keys in Renesas boards.

This is the only conversion I am interested in. You can have the rest,
Geert ;)


Wolfram Sang (4):
  ARM: dts: renesas: marzen: use interrupts-extended for gpio-keys
  ARM: dts: renesas: genmai: use interrupts-extended for gpio-keys
  ARM: dts: renesas: rskrza1: use interrupts-extended for gpio-keys
  ARM: dts: renesas: rza2mevb: use interrupts-extended for gpio-keys

 arch/arm/boot/dts/renesas/r7s72100-genmai.dts  | 3 +--
 arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts | 9 +++------
 arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts | 3 +--
 arch/arm/boot/dts/renesas/r8a7779-marzen.dts   | 6 ++----
 4 files changed, 7 insertions(+), 14 deletions(-)

-- 
2.45.2


