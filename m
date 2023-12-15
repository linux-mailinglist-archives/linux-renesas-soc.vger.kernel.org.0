Return-Path: <linux-renesas-soc+bounces-1128-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26ABA814A77
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Dec 2023 15:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC2271F254BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Dec 2023 14:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9676031725;
	Fri, 15 Dec 2023 14:27:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9C62EB11
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2023 14:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4SsBFv404Tz4x2fB
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2023 15:20:35 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:28e5:a835:e0b1:5291])
	by laurent.telenet-ops.be with bizsmtp
	id NeLT2B00E29mzEW01eLTGa; Fri, 15 Dec 2023 15:20:28 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rE92o-00C71z-8Y;
	Fri, 15 Dec 2023 15:20:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rE76H-00GsHf-4u;
	Fri, 15 Dec 2023 13:15:29 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas driver updates for v6.8
Date: Fri, 15 Dec 2023 13:15:20 +0100
Message-Id: <cover.1702642340.git.geert+renesas@glider.be>
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

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.8-tag1

for you to fetch changes up to 31b2daea07643d8b83d62c670c76d95acca84f06:

  soc: renesas: Make RZ/Five depend on !DMA_DIRECT_REMAP (2023-12-13 17:23:28 +0100)

----------------------------------------------------------------
Renesas driver updates for v6.8

  - Remove duplicate setup of soc_device_attribute.family,
  - Make RZ/Five depend on !DMA_DIRECT_REMAP.

----------------------------------------------------------------
Conor Dooley (1):
      soc: renesas: Make RZ/Five depend on !DMA_DIRECT_REMAP

Geert Uytterhoeven (1):
      soc: renesas: Remove duplicate setup of soc_device_attribute.family

 drivers/soc/renesas/Kconfig       | 1 +
 drivers/soc/renesas/renesas-soc.c | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

