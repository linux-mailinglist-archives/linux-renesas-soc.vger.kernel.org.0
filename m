Return-Path: <linux-renesas-soc+bounces-16383-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 967E9A9C91D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 14:42:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 134299C6CD0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 12:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B698B1A08AF;
	Fri, 25 Apr 2025 12:42:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14D94438B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Apr 2025 12:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745584959; cv=none; b=OXY6Yh7e+ujDRtHjPKL/rww56Hp2hnbrCQxQSeFPFXgFcKF3exsHqfFi8nL+xJ/slJfHmlFie7thQkKdl2NPDNcUqAfrcyZZK7n5BpKE3jd3+jFCC61FgGLCc5xvca5tiFORVQzje0Br6wNpcizY+KMLUSpdqGYsR0Dolb0a+78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745584959; c=relaxed/simple;
	bh=ZAjudanoPshGD3qwQ4+sIF4Hp0MNHS5HqELkFm6Z8S0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lPB1JQWOTyHYKV6N8jAZCNynBOrbgoR6qFn+uefexGAhfEGHMbHw7M0DC40sN31Qv/d6vPP1f7j0UO6YL0PvF2mF+h3hHKuknApnOJsb75BJWBeCieuAD/hau+3o1Ed56FpD60KuyiF8SA/dOUNkrhoNFordY/ZBoNP9iIhvXaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4ZkXNw5zjSz4xr3J
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Apr 2025 14:35:12 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:3329:b4bc:d565:c72])
	by albert.telenet-ops.be with cmsmtp
	id hQb42E00616PE0206Qb4sM; Fri, 25 Apr 2025 14:35:04 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGc-00000001gJg-3Bal;
	Fri, 25 Apr 2025 14:35:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGm-0000000CKj3-00w3;
	Fri, 25 Apr 2025 14:35:04 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas driver updates for v6.16
Date: Fri, 25 Apr 2025 14:34:57 +0200
Message-ID: <cover.1745582592.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745582587.git.geert+renesas@glider.be>
References: <cover.1745582587.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.16-tag1

for you to fetch changes up to 31d358e611b7cc21349da58dd2c9118c84b0859f:

  soc: renesas: Add config option for RZ/V2N (R9A09G056) SoC (2025-04-14 10:53:12 +0200)

----------------------------------------------------------------
Renesas driver updates for v6.16

  - Enable all Renesas SoCs by default when ARCH_RENESAS is set, which
    will allow up to remove all individual Renesas SoC entries from the
    various defconfigs,
  - Initial support for the Renesas RZ/V2N (R9A09G056) SoC.

----------------------------------------------------------------
Lad Prabhakar (2):
      soc: renesas: Kconfig: Enable SoCs by default when ARCH_RENESAS is set
      soc: renesas: Add config option for RZ/V2N (R9A09G056) SoC

 drivers/soc/renesas/Kconfig | 48 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

