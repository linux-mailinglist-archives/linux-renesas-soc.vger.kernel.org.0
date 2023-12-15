Return-Path: <linux-renesas-soc+bounces-1130-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD01814A7F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Dec 2023 15:29:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4EF50B21E9B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Dec 2023 14:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99FA31A64;
	Fri, 15 Dec 2023 14:29:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF26231A77
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2023 14:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4SsBFv40Dxz4x1Ts
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2023 15:20:35 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:28e5:a835:e0b1:5291])
	by michel.telenet-ops.be with bizsmtp
	id NeLT2B00H29mzEW06eLT2w; Fri, 15 Dec 2023 15:20:28 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rE92o-00C71w-5t;
	Fri, 15 Dec 2023 15:20:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rE76H-00GsHi-5a;
	Fri, 15 Dec 2023 13:15:29 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas DTS updates for v6.8 (take two)
Date: Fri, 15 Dec 2023 13:15:21 +0100
Message-Id: <cover.1702642342.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702642338.git.geert+renesas@glider.be>
References: <cover.1702642338.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 95d516f3eb96bac466a6bfec28a1e55b8ed5160b:

  ARM: dts: renesas: r9a06g032: Add missing space in compatible (2023-11-28 10:29:11 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.8-tag2

for you to fetch changes up to fc67495680f60e88bb8ca43421c1dd628928d581:

  arm64: dts: renesas: white-hawk-cpu: Fix missing serial console pin control (2023-12-13 17:34:54 +0100)

----------------------------------------------------------------
Renesas DTS updates for v6.8 (take two)

  - Add IA55 interrupt controller and Ethernet support for the RZ/G3S
    SoC and the RZ/G3S SMARC SoM,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Claudiu Beznea (4):
      arm64: dts: renesas: r9a08g045: Add IA55 interrupt controller node
      arm64: dts: renesas: r9a08g045: Add Ethernet nodes
      arm64: dts: renesas: rzg3s-smarc-som: Use switches' names to select on-board functionalities
      arm64: dts: renesas: rzg3s-smarc-som: Enable the Ethernet interfaces

Geert Uytterhoeven (1):
      arm64: dts: renesas: white-hawk-cpu: Fix missing serial console pin control

 .../boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi  |   3 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         | 106 +++++++++++++
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi   | 173 +++++++++++++++++++--
 3 files changed, 269 insertions(+), 13 deletions(-)

