Return-Path: <linux-renesas-soc+bounces-9072-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB5F987190
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 12:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 664611C23811
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 10:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B269B1AD3E8;
	Thu, 26 Sep 2024 10:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aO7GUiCT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1E01ABECC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2024 10:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727346836; cv=none; b=stuHxujShdVCVe/BsepvITneqjExJqFl+eF1h2bwT7WLZ75wTHN7410Jyo/OBC0Y7htoCsniLnI7Iya3v8ngNNgAjNfuUkQRcBoFViKer2E9a5ZJckA/Lfh8peKY+HMu6zglJrlFkMzJacqbnvLs6IqvFxCeZIF3////4NXK7UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727346836; c=relaxed/simple;
	bh=8WfZ+3YgvxG8zS3DBZJ/4sn6LEQ2cz0zz/PPLslELHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QoamLJKf2ZGLjaO2r7gJD2ym2y84sy8wzfx0bBsJxrgKpIiRtAL6I4UPlqBZompirjZiO7CHaBT8UxXMP8kdcC4M5ZBU0lnTBlr6cAmFkqnEbYs4aBV2AKjq1drD2sAwBM4ZZbEZXj/tOQUY/k9+ZFZPSQqhR9pFTpN4XxYMs/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aO7GUiCT; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=5nB1m+uIH+auGh
	l2/4A1O3wJwPWwNS6LuQE7z8IAZpc=; b=aO7GUiCT9ESTLvKh8CpvnygGSVqkRi
	GjqIz/VR9ha7oxCWYcbfdiZ80wpCB8eUS6e5T2MAwW15EdiydZt2neAcFROgKRr7
	h/zZ7G/eBsptjjoVxVwOWJGR9qcfvj6q3LyAEVqnHkc+/Hw6NT/xSQsG5MRZWzWs
	4WgkgW7lvtCNbGzsLd6WviwUmhPYXSvGChxrwuLUNywTVRWcUU0QAbZxYIkKPpEn
	OoKiQAFtg+WXStW7GAcvlz3D7YxucZM6xsrWvfj/nZcmwihFuFYu0sSM+JVcx7br
	V0wbQCvqbf4kt93+CO4RB3ySVaG1E5yuDtH/TXy8dPM5LUB9bi1r9DYw==
Received: (qmail 951167 invoked from network); 26 Sep 2024 12:33:52 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2024 12:33:52 +0200
X-UD-Smtp-Session: l3s3148p1@VhlbRgMj6KwgAwDPXzRXADDuo30Z+IZ9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 0/2] ARM: dts: renesas: fix BSC nodes
Date: Thu, 26 Sep 2024 12:33:40 +0200
Message-ID: <20240926103340.16909-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While cleaning up the Genmai DTS, I stumbled upon further checks
regarding the (L)BSC. These patches fix them.

Change since v1:
 * drop the unit-address


Wolfram Sang (2):
  ARM: dts: renesas: add proper node names to (L)BSC devices
  ARM: dts: renesas: r8a7778: rename 'bsc' to 'lbsc'

 arch/arm/boot/dts/renesas/r7s72100.dtsi     | 2 +-
 arch/arm/boot/dts/renesas/r8a7778-bockw.dts | 2 +-
 arch/arm/boot/dts/renesas/r8a7778.dtsi      | 2 +-
 arch/arm/boot/dts/renesas/r8a7779.dtsi      | 2 +-
 arch/arm/boot/dts/renesas/r8a7792.dtsi      | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.45.2


