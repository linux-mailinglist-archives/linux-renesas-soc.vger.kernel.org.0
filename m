Return-Path: <linux-renesas-soc+bounces-22760-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BF4BC1E4E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 17:20:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0B62C34FA12
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 15:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054832E3AF5;
	Tue,  7 Oct 2025 15:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Bf83pC+u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DB02E3B11
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Oct 2025 15:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759850431; cv=none; b=t7hwBY2j0fF0PngL2H5YkPXRS0i7mhvw80wZ2dxqG83jz3ajUJFB9TxrqEEzA2/+QFeolYCXPY5cgq5X/nHfObp/DAQKGtphFyE+HDemIJRFcgw/KXycnSkaTBxdlCGYIqgUs14WXp/476YBqzdJi+1pN6/OVhbM2izb5cfA+Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759850431; c=relaxed/simple;
	bh=5ix/xMH3w3PyNpAXFhVzHGaR5bjNdsrIFNS++MUjIfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=shWY0uhgYzcPmjXbJ70ICT3Au8AmCM8lNgUoJyQ3gGXde2CdYZK5xss7p6FvsZqA50ltFJYHtSrhWa/RozOfDA+RACC/f0OE3ymLd0QMJEEZyIQ/lPJSBojMS5+xF5qSPTkOE61kwbu22jCB6xBpIeQC4/BeGhJO76b4LF48J9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Bf83pC+u; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=DzRGqoTxDBrne6
	urB5mtPh0E5kjLt4Z+LF4wlzjpX/U=; b=Bf83pC+ulmefkhZJIhsG0xZ35tYgWu
	b9pmrvX3gP3+TJwoQ6i14GC5rz7jXZtJovX4B6htttEE8Tmeh83aD2jL0b+lvMqG
	1SZtsYsWe7wQPfvLo5tpqJsyePJL73DMoI2IltwIVghiYFMK9Iz7DA0a/GQHROIw
	toPXT0en5oWQXOCrJcRBElhlSGZme5a/UjxbDy16mwyaAbC8W7Hi5MGND5KLLLvE
	CUPyTSpyilk60KVFxD2hbCnsh03CNpGmhUaua423xVpvNQitzzK8H7ahU+Upbwp4
	Ve0mVnfpMoKoAxM86sK//AGLspmsU+T83rKk7K/jbWgzS8SZOQmIEufw==
Received: (qmail 313078 invoked from network); 7 Oct 2025 17:20:25 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Oct 2025 17:20:25 +0200
X-UD-Smtp-Session: l3s3148p1@he52G5NAVsoujntU
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-watchdog@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: [PATCH v3 0/5] dt-bindings: watchdog: factor out RZ watchdogs
Date: Tue,  7 Oct 2025 17:20:05 +0200
Message-ID: <20251007152007.14508-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Minor changes since v2 are documented in each individual patch. Main
change is that patch 5 is added to keep dependency handling low.

renesas,wdt.yaml describes lots of different hardware blocks which
results in complex if-structs. Factor out the different IP blocks into
their own files. I took over maintainership of the files for RZ/A and
RZ/N1 but if someone else wants them, very fine with me. RZ/G2L and
RZ/V2H have the original driver contributors as maintainers (Hi Biju, Hi
Prabhakar :)). If these need changes, please let me know, too.

After the refactoring, the V3H exception is finally added to the
original binding document and is now much easier to understand.

Passes 'dt_binding_check' and 'dtbs_check' after each patch here.
Looking forward to comments.

Happy hacking!


Wolfram Sang (5):
  dt-bindings: watchdog: factor out RZ/A watchdog
  dt-bindings: watchdog: factor out RZ/N1 watchdog
  dt-bindings: watchdog: factor out RZ/G2L watchdog
  dt-bindings: watchdog: factor out RZ/V2H(P) watchdog
  dt-bindings: watchdog: renesas,wdt: add SWDT exception for V3H

 .../watchdog/renesas,r9a09g057-wdt.yaml       | 109 +++++++++++++
 .../bindings/watchdog/renesas,rza-wdt.yaml    |  51 ++++++
 .../bindings/watchdog/renesas,rzg2l-wdt.yaml  | 110 +++++++++++++
 .../bindings/watchdog/renesas,rzn1-wdt.yaml   |  48 ++++++
 .../bindings/watchdog/renesas,wdt.yaml        | 149 ++----------------
 5 files changed, 327 insertions(+), 140 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rza-wdt.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rzg2l-wdt.yaml
 create mode 100644 Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml

-- 
2.47.2


