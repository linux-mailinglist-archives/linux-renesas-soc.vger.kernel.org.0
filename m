Return-Path: <linux-renesas-soc+bounces-17458-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5C5AC25EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 17:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 731469E30D5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 15:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994D62957CD;
	Fri, 23 May 2025 15:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="N0JpRAe7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838C4295526
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 May 2025 15:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748012765; cv=none; b=ZyGqGITaGd0+jVNYkws1mWpVsC5b3mgBM+zaX1TcxV+3JFhEi08j/lgNlQC6yXEjSmeIYMXzFc3YxA2wnC7H0iJi1dLfVLxgNqN1mjOlN79vi+RbAwY7uuqBr71wceVFJY3gv48IXtIP7MmnMX3Vv04RS0blGkir/i/E0U7XcVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748012765; c=relaxed/simple;
	bh=Sgrhg6xgc7IwU+6gB/QwbQd0fJlwh3n56jnfDQ6mOQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uaBHR+HfmMoLKa0EJOhptTre1e1uwyb7W39jBpKvqxOmJiZo8s4WFGK7J2MAKbQFsA649FJd+AyajY+mE2vGO5NBcaKkxf9tcAxv59KXA87vj0mWu5nRlIsHmUPp6D+26obBeZcDgXhweyjbzs7Gu1WAI1XoyEGsIm3N+oynBKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=N0JpRAe7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=fkXSsTjYoZ06kj
	N+bLPEkr1JuDlPu3rVmuYv/2HyiD4=; b=N0JpRAe7tBF2gAYNWEZQemYbWt3Nfy
	DfYTPwZBwOcNcc8ToovKuOJy0vXqt2BRthPHeD8bKVUakKp2MKdmYkChE1HqAEVP
	lQ4MEuYR6fZNqm/m6ditGWHMx1ch44EJEnGccEu0UnUeyHAYQhZjjxQF1Br4jjm1
	Pc5IbR9yisXDqJkgd67Uis1ET4Eut4vhi6gWIuT+fMqAhDWj7b5Hj+kIsOPU8A+a
	atmscR1rhi7ZECARXbzPdxo16DUZQOO6l/sa6jdL/rQ5NiqTi7iDS+7ayPRndmGF
	Y2XKGxa1hdyn64BFZbbVXIJj0xKJUtdhVZdYec+welzFRTyMVp2Efrfw==
Received: (qmail 4082898 invoked from network); 23 May 2025 17:05:56 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 May 2025 17:05:56 +0200
X-UD-Smtp-Session: l3s3148p1@R49e7841oRttKPAL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-rtc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 0/3] rtc: rzn1: support XTAL clk and SCMP method
Date: Fri, 23 May 2025 17:05:37 +0200
Message-ID: <20250523150541.8390-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So far, the code and the binding for the RZ/N1D RTC assumed an input
clock of 32768Hz, so it was not explicitly described. It makes sense to
do this, though. For one reason, clocks with other frequencies might be
used. This RTC supports that via the SCMP counting method. The other
reason is, upcoming SoCs may have only the SCMP method described, so we
need to use it there later.

This series lets the driver handle the optional "xtal" clock and switch
to the SCMP method if suitable. It has been tested on a Renesas RZ/N1D
board with hacked devicetree values.

A branch with updated DTs can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/n1d/enablement

Looking forward to comments!

Changes since v1:
- renamed variable from 'use_scmp' to 'scmp_val' to make clear it is not
  a bool (patch 3)
- added tags from Geert (Thanks!)
- rebased to linux-next

Wolfram Sang (3):
  dt-bindings: rtc: rzn1: add optional second clock
  rtc: rzn1: Disable controller before initialization
  rtc: rzn1: support input frequencies other than 32768Hz

 .../bindings/rtc/renesas,rzn1-rtc.yaml        |  8 ++-
 drivers/rtc/rtc-rzn1.c                        | 59 +++++++++++++++----
 2 files changed, 53 insertions(+), 14 deletions(-)

-- 
2.47.2


