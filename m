Return-Path: <linux-renesas-soc+bounces-8003-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CB495B0EB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 10:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA869281904
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 08:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858A0282EA;
	Thu, 22 Aug 2024 08:52:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3834A14C5A9
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 08:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724316733; cv=none; b=iqhlNTi33R/cSRquA5CxxAr1CyQ24yHsAEirmYBIwVm2XHPeP4ySPqz5itkKO+kq2jiTQYseqTaDmet1VbrTzgz40hBPsKRg3F+nmA+M7H1SaiwH83cnS2cATii6f7DnP+QCKE4cNxNJYdTzmjrEBxgI0mXTZHDhG5/nNPXdtps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724316733; c=relaxed/simple;
	bh=a/Ow+EVSUMc0ZArAZLB03W+NapPesYNI4Cvted/tsN4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AQO9ERRnZ07ydCccaxQ3NLxxQSbgQLJug3Mi8bSMZN7NyE6YWfvczArda4TxSH8fbO99OfqX9oi/Ox4zubZbJW12cEuBqgcxZa1WnFd6175+EA56kT0f7lzNJfjOEXArzfGVyeeDV/uuy6q47lC65eqCRb1a+32m/RetJpMypbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:410c:b78a:c35b:cd3e])
	by michel.telenet-ops.be with bizsmtp
	id 2ws22D00B22R5AR06ws2lE; Thu, 22 Aug 2024 10:52:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sh3Y0-000VWu-1Q;
	Thu, 22 Aug 2024 10:52:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sh3Y2-002L5p-AK;
	Thu, 22 Aug 2024 10:52:02 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas DT binding updates for v6.12
Date: Thu, 22 Aug 2024 10:51:52 +0200
Message-Id: <cover.1724316483.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724316478.git.geert+renesas@glider.be>
References: <cover.1724316478.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.12-tag1

for you to fetch changes up to 9f766e8f5c2366d7237735a826084569b5705cf4:

  dt-bindings: reset: renesas: Document RZ/G2M v3.0 (r8a774a3) reset module (2024-07-30 10:50:47 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v6.12

  - Document support for the Renesas RZ/G2M v3.0 (r8a774a3) SoC.

----------------------------------------------------------------
Oliver Rhodes (3):
      dt-bindings: soc: renesas: Document RZ/G2M v3.0 (r8a774a3) SoC
      dt-bindings: power: renesas: Document RZ/G2M v3.0 (r8a774a3) SYSC binding
      dt-bindings: reset: renesas: Document RZ/G2M v3.0 (r8a774a3) reset module

 .../devicetree/bindings/power/renesas,rcar-sysc.yaml         |  1 +
 Documentation/devicetree/bindings/reset/renesas,rst.yaml     |  1 +
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml   | 12 ++++++++++++
 3 files changed, 14 insertions(+)

