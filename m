Return-Path: <linux-renesas-soc+bounces-5455-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5471A8CDB91
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 May 2024 22:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8ED0F1C20B0D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 May 2024 20:51:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8615385297;
	Thu, 23 May 2024 20:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Z9Of+yFX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1C184FB1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 May 2024 20:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716497458; cv=none; b=OySKeNnFC4o2gF/8PHNvN3vn4bB3uleYbLfuCY58EFOjRqeNtKTfLngnBQonfLWgjzYgvTHOSOKwRCQOsZt782vWMOXoefo90eLFfhSpQKGJGgeYwANY06bCXAfaPjl3c21x4HIiFe3Tdxzr6/zCcOaPl4JNE2uKF3xTAaDd7R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716497458; c=relaxed/simple;
	bh=D87qY9Eq0W1t5bK7Je5ov2+1F/KsexB1zGZWGTydf1k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pJLMyN33BUII4lav3JdrXSFqXlSwelyQvCLKIDE7tTqwWGirxyGkvXGu3XVSj9t7EAbuE60ZZbhki0v5JQli8W3+txJE3oh9Qtln+dl+S8JWJasgEIyMG8RqBnEiaLZh3qXUcM4ycRznijnJszwOl1Sm5L0xTUtpV/OYxJwf2/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Z9Of+yFX; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=84N30pUe6yYY2Y
	Gr5BjN3JSDe/pj+zXvdAw+uNinYm8=; b=Z9Of+yFX+0VVVpk5WZRlMnhFsX7rRl
	lrG8s+YkRVQ/SsE3jk1K2OqQL65XPH1W4T8BTA0FWxVrEHTxondqn/yJs6r+04iD
	pB2rcP24Cf33bjHyy+b6dzR3sV6GZX/FG/+pdkbkL0b9ppR3ICqezCgzW80gojw8
	GFZzJVKQl9u9JmepBvOfQIdNByBcK5DBehSD42viAbIXD3W8diBh+lCmv4EQviVv
	nHqE5kc6uiXlGCUDhKS9nxJ0lIRcEhJaAKTmWPGTb/6uiLOvaKw9fO6eIxpB3RMZ
	bMwNeZmU9d4r37kD/BwHKmdCkxLs8fgHqP2DgXEAYAQVxLqTQKhWmTgA==
Received: (qmail 1241469 invoked from network); 23 May 2024 22:50:54 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 May 2024 22:50:54 +0200
X-UD-Smtp-Session: l3s3148p1@JuL9NCUZKrQujntm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/3] arm64: dts: renesas: add aliases for I2C
Date: Thu, 23 May 2024 22:50:37 +0200
Message-Id: <20240523205041.7356-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Here are the I2C alias patches for the other Gen4 boards specifying the
I2C bus numbers in their schematics.

Wolfram Sang (3):
  arm64: dts: renesas: white-hawk-cpu: add aliases for I2C busses
  arm64: dts: renesas: spider-cpu: add aliases for I2C busses
  arm64: dts: renesas: s4sk: add aliases for I2C busses

 arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi   | 6 ++++++
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts          | 6 ++++++
 arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi | 6 ++++++
 3 files changed, 18 insertions(+)

-- 
2.39.2


