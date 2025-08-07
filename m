Return-Path: <linux-renesas-soc+bounces-20094-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F944B1DA9D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 17:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2E29176263
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 15:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A454B265623;
	Thu,  7 Aug 2025 15:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QHp659HE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06F6262FE6
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Aug 2025 15:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754579697; cv=none; b=O3Hce253ajYVAZvPOIUQRn7jBWmZNVQO9p1XibWxAHP6M2M7d3vzgksSDikvWDMQcHp+1V5Sa0jo/RudprXG4Au2Iu4IuDZvplxm3eL5+wn/la5gFubQPnNUrv2eRCZVhbEcc8TWeA06kPu9jMLpDDcZLeD7/RWzRu2Kdlsd/34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754579697; c=relaxed/simple;
	bh=IhRULOqFjskcLveYYWwDIbMas6XUAyN59SmfLdEfoYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qak0JfWMcZ9M7E/U21ATeHYd+j9y0lCCYauXNf0ptfIlE6ow2PC0tEHC4YszyOKNsOlzRby/+/FzJeaItYkBsUKXXjcTIx7clMTMVl7evMFXwkBqEG8tIxzg7T5gABDmSWkukz9wYo/cDGDDQhONsY0lj+hw+y9FbAcC3jqAnSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QHp659HE; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=CcN6xAYw0qQZtA
	A6ms3sO17aXcIdq7Im9o+jiOi1pjI=; b=QHp659HEjLXjaXDJK2jCNdu+A2lAuw
	NIlFrzikUoaoIs8cxmkxZKvxYn71JKd5zwFLitDTTle8VHntpYk3G9fCkuhRC/1I
	SM9w5GHj7ZMO1RatKds7kVKn7nSsEvsAC8rgaVEn1lvsuXMKx9RKq1TQtYOCUTwf
	HKuA8U0wVhXT4NDx6+lWUbCICwmf4q2RzfirgfTIev3T5y++TM3c+JZXCtr8GxZA
	F6Tdq1/Mxq8yXGFkJ1OV/2prGCpe3eOydQFGC71iR8Vyd6h3Tmk+yVZWJiAPTOgO
	muVroG+02mDD936wyqJsNqnK3mo9sY+9JXhIr9YLyqgEPrhS1kjutzxw==
Received: (qmail 1277494 invoked from network); 7 Aug 2025 17:14:50 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Aug 2025 17:14:50 +0200
X-UD-Smtp-Session: l3s3148p1@jAEs68c7OLXCtheG
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/4] arm64: dts: renesas: Enable I3C on RZ G3S/E
Date: Thu,  7 Aug 2025 17:14:34 +0200
Message-ID: <20250807151434.5241-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As the dependencies are now upstream (controller driver) or in -next
(clock enablement), the DTS additions to enable the I3C controller on
G3S/E can now be considered for upstream as well.

Patches are on top of renesas-drivers from today. Please let me know
what you think.

Happy hacking,

   Wolfram


Quynh Nguyen (1):
  arm64: dts: renesas: r9a08g045: Add I3C node

Tommaso Merciai (1):
  arm64: dts: renesas: r9a09g047: Add I3C node

Wolfram Sang (2):
  arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
  arm64: dts: renesas: rzg3e-smarc-som: Enable I3C

 arch/arm64/boot/dts/renesas/r9a08g045.dtsi    | 35 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 35 +++++++++++++++++++
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     |  8 +++++
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     |  7 ++++
 4 files changed, 85 insertions(+)

-- 
2.47.2


