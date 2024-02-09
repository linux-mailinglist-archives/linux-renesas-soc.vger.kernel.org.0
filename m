Return-Path: <linux-renesas-soc+bounces-2541-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC00484FA50
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 17:58:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D3181C259D3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 16:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725797EF00;
	Fri,  9 Feb 2024 16:55:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E607BB1A
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Feb 2024 16:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707497710; cv=none; b=sby+C1VrW0yeMOg1SWcnzzxwjk6wRXxGDOpxy6ZNLZn2h8WlxE7eJMb9gJdgOs5UwUtQ35IlxWCSbMHdd78orbr0/V7BidUXUmLvC+Fw4rpyd17CdaDhsPIP3V1e+XzB03mD1ikKP0/FafgLanH5NwoJPpvd6i5e4/vU7Z1/TDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707497710; c=relaxed/simple;
	bh=wOXOrg9CrlA6j211swG2fL1m7mrdzbr/Rq/uC81iFBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gMMmnoAZ3xlq4OiCZ4rSCf6javdcVpqI3oC+M8F1IuInPJkHEe/AJj0Rul87AxF7d28BbNesNaiQZigfA1hoJKt7W+28d6+slvap7qA0I3m0mTuULn8hRRSV/Nlg44zSIRcbpCQDTLTzrVTUZiuofwXIHp1p/UmIfyglbPM1Beo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:55fd:ff17:c1c8:954d])
	by andre.telenet-ops.be with bizsmtp
	id l4uy2B00K4RKXn6014uyDb; Fri, 09 Feb 2024 17:55:00 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rYU9O-0008Gd-8k;
	Fri, 09 Feb 2024 17:54:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rYU9S-0061GR-Gu;
	Fri, 09 Feb 2024 17:54:58 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas DT binding updates for v6.9
Date: Fri,  9 Feb 2024 17:54:52 +0100
Message-Id: <cover.1707487832.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707487826.git.geert+renesas@glider.be>
References: <cover.1707487826.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.9-tag1

for you to fetch changes up to 49558e814fefdf33bf0b2d1c46c30d6a3f9634f3:

  dt-bindings: soc: renesas: Document R-Car V4M Gray Hawk Single (2024-01-31 15:06:52 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v6.9

  - Document support for the Renesas R-Car V4M (R8A779H0) SoC, and the
    White Hawk Single and Gray Hawk Single development boards.

----------------------------------------------------------------
Geert Uytterhoeven (3):
      dt-bindings: soc: renesas: Document R-Car V4H White Hawk Single
      dt-bindings: reset: renesas,rst: Document R-Car V4M support
      dt-bindings: soc: renesas: Document R-Car V4M Gray Hawk Single

 Documentation/devicetree/bindings/reset/renesas,rst.yaml   |  1 +
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 13 +++++++++++++
 2 files changed, 14 insertions(+)

