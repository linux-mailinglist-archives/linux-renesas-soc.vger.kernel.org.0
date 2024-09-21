Return-Path: <linux-renesas-soc+bounces-9008-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CCB97DCF8
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Sep 2024 13:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1847D1F21959
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Sep 2024 11:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135B0155C88;
	Sat, 21 Sep 2024 11:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JGHgMMMU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FD51CD2C
	for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Sep 2024 11:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726919323; cv=none; b=Q0Rtgqv50Z6D+vIRi4dRVKYyqKfVrAoum8FccDHAiJzyEtY5ocAuyFVuD3l4HmISsmr4bqpnyvF/F2fFN6tAmf5TDg17JMXrU3pam+KBtbawcZ/XnhX+VmCuEmNHUxZx8Vz6jJlzs+Ck9IVq9hjsqk+nc7yDbbM+bHtk0N3T0Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726919323; c=relaxed/simple;
	bh=bxocJ30aoT5zSqsupVkc/wv2Eei9qb4gBauQUvFMhiI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X8rHhjDTIyLoGnCUnOnX7Go5BdrPNosj2q3rXOWfe66mpUvoyVIhiRotts4lrtB85UU7I4HfN6fI6ORvJqvDEmwvzZqcwjA2Ia2T5QMRpA4uo067IuqZ8ApEO2lInBCNKYnbODJWYBgX4EaBece6tY6QI4CFwQCdUhH/MU9o5is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JGHgMMMU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=AnGD4oQgfHpw4s
	tijlRvP6UckMuOr8otrdqAYZytbrs=; b=JGHgMMMUi/WPjlj4SNDFtcv+Y791lX
	GqigLt5PBbxKQuFNtF4NvTnWxtRRaDeWuNwXerw43aql8YUBPZT1pbbRyzpyo+Ij
	lhq0SJCIFK5lvGssA+vmCbJNxqMJyKGmQTKiMAwe/8ZGi9SHy9XXzKNAxspw3kQR
	8JqJpXMsKKq6UuFZV6SmEnmgNB5tkz9PwkbVM5PDfDoGnc0ad4KRQ+frhyHgrVeO
	ahjmZM/EhdvgWqUuLbOAp/i61BVPatYVAsit4RWXuasivAunNgR9TfQ9rtPlAsVq
	UkCKOLpJIWgQ8f9yITWwXslNksRoZtb/ZFIV0SSPQUcv/6x44NrIlAsQ==
Received: (qmail 3652674 invoked from network); 21 Sep 2024 13:48:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Sep 2024 13:48:35 +0200
X-UD-Smtp-Session: l3s3148p1@8/pUvJ8ibuEgAwDwn0Nz2qARpwvTE8dN
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/5] ARM: dts: renesas: bring genmai up to date - the easy stuff
Date: Sat, 21 Sep 2024 13:48:12 +0200
Message-ID: <20240921114813.4124-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I recently rediscovered the Genmai board as a great platform for
regression testing (RIIC, pre R-Car SDHI and MMCIF). Its DTS file is a
bit outdated, though. This series adds the simple stuff, and reorganizes
it to be sorted. I want to add SDHI and MMCIF on top of this, but those
didn't work out of the box and need a little more work, probably.

Let's start with this seris first. Looking forward to comments.

Happy hacking,

   Wolfram


Wolfram Sang (5):
  ARM: dts: renesas: genmai: enable watchdog
  ARM: dts: renesas: genmai: enable OS timer modules
  ARM: dts: renesas: genmai: sort nodes
  ARM: dts: renesas: genmai: sort pinctrl entries
  ARM: dts: renesas: genmai: define keyboard switch

 arch/arm/boot/dts/renesas/r7s72100-genmai.dts | 136 +++++++++++-------
 1 file changed, 85 insertions(+), 51 deletions(-)

-- 
2.45.2


