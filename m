Return-Path: <linux-renesas-soc+bounces-9069-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C929298712A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 12:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 775BAB27C60
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 10:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1C91ACE00;
	Thu, 26 Sep 2024 10:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fISoBORu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7F7146A79
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2024 10:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727346022; cv=none; b=CDioy93sv7TXdZheRJixRyQgCkBqpCRahrwFXD1vkdggbJ+vfZ831exfRM7qBF5CSNuAa5WCLaf2ME5ZZUFLhOGF+Ukj+TFD8718mz3Zboc34G8Mf4az/wfRtyFnBqUVNaZ/Ti9f57Cy+pO+YOo+pjIeu0lvodx0gbap/w7zeQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727346022; c=relaxed/simple;
	bh=jvV1bUKCEgdJ27wbRg2NQTkBvenIz/42IYjw7gAGAUc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JV+xhuXKzxPgOlfHm+5XzMxgYenCg4KuDVt1oSkj5h7ci75VcqMuFp4UCY/3lVvC2Y13ibfDVpwCtZSjytj/qIf+7bmTczb1CexNRMHFbKsaKb/lfTMoRCFcX1BLOFf6mopXOgIHXlqFD4e7tOX/8kHCOSPQjUdW70ZUnDLh76I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fISoBORu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=uXyCtFf+S1hcmh
	P9w2gSEwqKfKKwojF7X1PxDuAiJfY=; b=fISoBORuD/VXL6nqvA6ZTqcDGZuC8d
	W6XYZkIT1sDAVGtWCa3sgM0ovxkLu24GXW8os53uqwLIsv9osJ2OXnVLI7hbTCzp
	wOq26t4pt3Tlp8W8xNYZ+MNqakoWjNgswO5ZmOTkbmUItDHTwWCaPApSClC8zrX2
	XTjn37NKycJyeYmWhHF2PtwCs408voo8d5Ea7Mpz0l3ULVOQyOOSOa81vQLHDvNW
	fOQXsCkkUHRMx1B5s4GXwdV9+ZuCUnXo+vdXfdsxPkH2VsPYU5APJUNN0dJOHSxa
	Tb7GcIXDrr5LN+VQKZ5Zg2oN1AmZ1blBWZo0thw3JRlT/9cRIAPayLQg==
Received: (qmail 946804 invoked from network); 26 Sep 2024 12:20:17 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2024 12:20:17 +0200
X-UD-Smtp-Session: l3s3148p1@CpbFFQMjoNQgAwDPXzRXADDuo30Z+IZ9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/3] ARM: dts: renesas: genmai: enable SDHI and MMCIF
Date: Thu, 26 Sep 2024 12:20:05 +0200
Message-ID: <20240926102005.15475-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Finally, here are the patches to enable SDHI and MMCIF for the Genmai board.
It can now serve as a regression test platform for these devices. Good!

A branch with all my Genmai-related patches can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/genmai-upstreaming

Thanks and happy hacking!


Wolfram Sang (3):
  ARM: dts: renesas: genmai: enable SDHI0
  ARM: dts: renesas: r7s72100: 'bus-width' is a board property
  ARM: dts: renesas: genmai: enable MMCIF

 arch/arm/boot/dts/renesas/r7s72100-genmai.dts | 55 ++++++++++++++++++-
 arch/arm/boot/dts/renesas/r7s72100.dtsi       |  1 -
 2 files changed, 54 insertions(+), 2 deletions(-)

-- 
2.45.2


