Return-Path: <linux-renesas-soc+bounces-7535-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB3793C8CF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 21:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4121E1F220E5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 19:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7704560B96;
	Thu, 25 Jul 2024 19:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SX9p6/ru"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177E85381A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jul 2024 19:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721936313; cv=none; b=Zo/gV0a1bls/7Ln5ICxcU8+liViyqCxHbf8+RAgK1q6GSMHp156cz3bWQQmz5Pp5RXskuJ4Pq5X6MiPbIOJmYT79vjp2h6MhFdirawenryAq1LBYHkHBMb6KHQMWkVhFQgeC46MjqTpYJOazI8w+cJ3w3XCVduoDRsZ6UTO+2v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721936313; c=relaxed/simple;
	bh=OJ6dL3Tb55sqLB2qXtO+nrcNiUTuai5OfQ7n4rAEV/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jKy+itHRt8gFW0p24+nfkILIHq/zUZ2tZDad4u0rP8mkDigqU/XmA88E7+xY/TK733GqjXBZlJxDAK5d6fSJzLxGeyGtbVOJgOc1I6D4rjMyq1m99UwU6uY9l+1Is3vH88H1Z0wCiKhbHTDK6Z4GoFLna4MPFbhE19GiNTpgd8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SX9p6/ru; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=/j/emlq9Wcwhx/
	OO5NxgFzHCdkszYejrWhvvaOBz9tE=; b=SX9p6/ruqMFj1iCehsX3slXDEdmLzA
	Cxx0unhmHnub60eGzYNKX+i8cUES2CvR83WuEiEYOAGbnDqSO0Qj5SDG/RaWIrxq
	ed6qMNXxu2LMdQbbEgpqOQ/gqYXlOMzeppnt8kN+M9GQHxwdK/UEVoeCTGymA1N4
	Wx0vMu1sSURgokYWA0hbUA6lDJxzD6rde+r81z0FlpWWu9xu+9Po5GU9jBrsFRYf
	NSkdfeoHmTJPsQk8YrobwhNFgqie1LJiHyFC0xlJBuGv1OO9owSxFhSGwnCbFT4C
	f0Zs9cz6aGVZGyh5UeO0nUkwTDXNvYSf+42OmuDAivcQxqAUOG/JhkZg==
Received: (qmail 3086194 invoked from network); 25 Jul 2024 21:38:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jul 2024 21:38:26 +0200
X-UD-Smtp-Session: l3s3148p1@GvTRiRceXtUujnsv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] dt-bindings: pwm: Add r8a779h0 support
Date: Thu, 25 Jul 2024 21:38:03 +0200
Message-ID: <20240725193803.14130-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the bindings for both PWM controllers in this SoC.

Wolfram Sang (2):
  dt-bindings: pwm: renesas,pwm-rcar: Add r8a779h0 support
  dt-bindings: pwm: renesas,tpu: Add r8a779h0 support

 Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.yaml | 1 +
 Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml  | 1 +
 2 files changed, 2 insertions(+)

-- 
2.43.0


