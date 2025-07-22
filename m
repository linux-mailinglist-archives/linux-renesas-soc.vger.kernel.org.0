Return-Path: <linux-renesas-soc+bounces-19603-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2552EB0E091
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 17:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5559E3B201B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Jul 2025 15:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7887627877D;
	Tue, 22 Jul 2025 15:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HEZMnfMu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE8E278172
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Jul 2025 15:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753198507; cv=none; b=j6PtNj86VCfdxsldCdBg0Dg8OgbTE4XyUJ1f1V4CAh6It/RWjPpR1C20F04Jn4bumgVpc03pavdMouQvNZ1KFR/Gh4C6EYTfA58IGoxgATHUl4ILHHCwP0x0jNhEzSgxSh2icAmat+dCSenQ4M6fyqykbPV1NQZgNOix+BA1NRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753198507; c=relaxed/simple;
	bh=DDPDqAZ85JT6AbnAWqvDRyp7mARhWlb8DCeoFLrmVxE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GU3GcMJCUfO20J4zr956Pnq5u/X50myu4eVReYwM8/7b/QsaSTknmt6I3Nrxjx2XIkIiUhb15GIG6fBzzzX6qboihY7NRjmotN9OLm7PoWCFcWGqZ4iCpxJiAf4VLV5NIIWXT5tEJXVUM2fHG+rMJNlFXam25j5XIwZnwsAJRdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HEZMnfMu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=bcvQKzCNCUbLQV
	4lrtpyW3AYkFKo/MMXJO4kKx57llI=; b=HEZMnfMuxaulrs0tZDli2/ZsFxlRWY
	gQqjDKDuU0wdL/hZ5/xyRj6YIco7+qijIuJRXAXCKO2hXlC7/WcBYV+uPwJ1oDCb
	Nx4bguEyQUC+r+M8C7dXOcgO7kVoBc+SpKuVEP9G1B0AMuwaw1gfKu0raxKMsWa7
	acTYDH46mu1WGLgD68xbqiy63rgar74h6r4KCkepFUFRau7aOVOYn8DZGXvuqIcL
	zYHDOzUmkAh1HA2ya0qKaHzghF3NnmtW1WSvSnFpIb4020Xp9ihet1btScCfyTJ5
	/SYSuKOzP/q8MuK2Y+SES1e95tIwdhLyl+Nzd4P00SzLZqp/dUhFvpVQ==
Received: (qmail 1374377 invoked from network); 22 Jul 2025 17:34:54 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jul 2025 17:34:54 +0200
X-UD-Smtp-Session: l3s3148p1@YrF7VYY6iKggAwDPXyBWAATEinPyanBm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v3 0/4] i3c: add support for the Renesas controller
Date: Tue, 22 Jul 2025 17:34:38 +0200
Message-ID: <20250722153445.5003-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Conceptual change since v2:
* improve and add more parameters from the spec to master.h
  (new patches 1+2)

Detailed changes since v2 are described in the individual patches. A
branch with enablement patches for RZ/G3S+G3E can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/g3s/i3c

Old coverletter:

Here is a basic driver for the I3C IP found in various Renesas SoCs like
RZ/G3S and G3E. Missing features to be added incrementally are IBI,
HotJoin and maybe target support. Other than that, this driver has been
tested with I3C pure busses (2 targets) and mixed busses (2 I3C +
various I2C targets). DAA and reading/writing to the temperature sensors
worked reliably at different speeds. Scoping the bus, the output from
the protocol analyzer seems reasonable, too. It was created by merging
two versions of it from two different BSPs. Then, improved according to
code analyzers, cleaned up with regard to coding style, and then
refactored to hopefully match I3C subsystem standards.

Looking forward to comments,

   Wolfram


Tommaso Merciai (1):
  dt-bindings: i3c: Add Renesas I3C controller

Wolfram Sang (3):
  i3c: Harmonize defines representing specification parameters
  i3c: Add more parameters for controllers to the header
  i3c: master: Add basic driver for the Renesas I3C controller

 .../devicetree/bindings/i3c/renesas,i3c.yaml  |  179 +++
 MAINTAINERS                                   |    7 +
 drivers/i3c/master.c                          |   12 +-
 drivers/i3c/master/Kconfig                    |   10 +
 drivers/i3c/master/Makefile                   |    1 +
 drivers/i3c/master/dw-i3c-master.c            |    4 +-
 drivers/i3c/master/renesas-i3c.c              | 1404 +++++++++++++++++
 include/linux/i3c/master.h                    |   16 +-
 8 files changed, 1621 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
 create mode 100644 drivers/i3c/master/renesas-i3c.c

-- 
2.47.2


