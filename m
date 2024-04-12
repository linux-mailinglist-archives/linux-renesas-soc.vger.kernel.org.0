Return-Path: <linux-renesas-soc+bounces-4548-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F9F8A2CD5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Apr 2024 12:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EA6E282E8C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Apr 2024 10:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6AD53818;
	Fri, 12 Apr 2024 10:49:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB5550A68
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Apr 2024 10:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712918948; cv=none; b=JZ5h3xZF6E3mX6T7gto5+WJ0MQBhjjPH8gPjHXlWmh7nhnx6l0BkPekMd4iWm7vzb4/kIhZoaw+ZwWn+F5wkDtX42SkULowBA3qeVwPSIpvHDaTDFLbx0NVWV1OvQsq3k3l7LSx8kTgN9bjmygYNwvcnanBz0ZInu3hQ3w9n1UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712918948; c=relaxed/simple;
	bh=kmGKfs9J5G7p/Y7Sfpya7WUA9UbPV5vOnW2k7rsVSV8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GruUWx1nO8yOC6eWPG8fN6pmwheUJ2i+xRIB1oeJXlRsftBdwVDbQY39nTs4v20uf37HVUHbkJ85xJuSZdoklAYMV+EZExuXLn6jUZQ50AtqTAeKwnh8EmjsuvUAHUDGe/D3FgByw//AaOuvKGT7lUBOxJBmAEZoG3/jcWVZQe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by michel.telenet-ops.be with bizsmtp
	id AAox2C00L0SSLxL06Aox05; Fri, 12 Apr 2024 12:48:59 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rvESG-00GpBx-0q;
	Fri, 12 Apr 2024 12:48:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rvDj5-004eQQ-SH;
	Fri, 12 Apr 2024 12:01:43 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas DT binding updates for v6.10
Date: Fri, 12 Apr 2024 12:01:39 +0200
Message-Id: <cover.1712915534.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712915528.git.geert+renesas@glider.be>
References: <cover.1712915528.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.10-tag1

for you to fetch changes up to d4319f220f577156200ad43c823e22be05f34523:

  dt-bindings: arm: renesas: Document Renesas RZ/V2H(P) System Controller (2024-03-26 09:33:29 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v6.10

  - Document support for the Renesas RZ/V2H(P) (R9A09G057) SoC variants.

----------------------------------------------------------------
Lad Prabhakar (2):
      dt-bindings: soc: renesas: Document Renesas RZ/V2H(P) SoC variants
      dt-bindings: arm: renesas: Document Renesas RZ/V2H(P) System Controller

 .../soc/renesas/renesas,r9a09g057-sys.yaml         | 51 ++++++++++++++++++++++
 .../devicetree/bindings/soc/renesas/renesas.yaml   |  8 ++++
 2 files changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml

