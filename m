Return-Path: <linux-renesas-soc+bounces-16902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D82AB18EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 17:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF690525508
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 15:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40F022FDE7;
	Fri,  9 May 2025 15:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLj3tSN4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8603D22F767;
	Fri,  9 May 2025 15:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746805129; cv=none; b=e6l7QBUxJPm1t+pK+DMqjJCnlF+Hvw2M2FQebWCiwOU5VxVb0FljEqC06Sv0+FI1TaTDfJsCvGj6WtqXWCwZzNoNpAPpYjabXHztMzSj2b18JId+HC1wANVXfB8lk7P592mmFSPzSOUj14o+Q9mRwCyr7UBJBWv/W5d/lVv3OlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746805129; c=relaxed/simple;
	bh=23EEvWYAIVOHl/ewlgckhGrHY84KBN76CzwmIFh/e5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=abqTMHAHfnAyeMtkyGnzELcNuaBETCTHb72KnzFOmkhbbGBCCkdwaaTVk+vgMATup2+yMUv0hr9UcVMF0u4+/Zuv9YN20AsjjLgUK1pVQJlMQTdBX6uDiDJPA/1p+zRRjxv640O2D1LXpMCpGRutEX1YxhEcObEjSy31/Wn1hHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLj3tSN4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07464C4CEE4;
	Fri,  9 May 2025 15:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746805129;
	bh=23EEvWYAIVOHl/ewlgckhGrHY84KBN76CzwmIFh/e5k=;
	h=From:To:Cc:Subject:Date:From;
	b=PLj3tSN41WgyTDs+60bn64teAB1L/EXn3XYzZQAxZ58SWvNtFFJJVYM2W5Fhklrpf
	 LboAHYk/Emy+5cXL4CHq61dMOijVLpWs4WsomuPIGPuxHbnHT0UQrpUHz0rOJt/yRN
	 dL6O1Agtd+KEzG9d/2MyAWiawLllfwbRgKTGaoOqAjGLcfMJ0LlEDntrUlw+f9dDEO
	 Ao1wtYvSRXmbsbAHFM0F1OCb6Cdxw0brWb9IhRjBrlPx20BYa1RRR97gLDretn1f8i
	 x9ZWlH353CDqP7CRlsvvRQ0IgcS+/6VRpMLZ6TjT0GNpqEFW/SY/4O/PVYYGWuqPlx
	 mJoh3dnPxfUSg==
From: Conor Dooley <conor@kernel.org>
To: linux-renesas-soc@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 0/2] Add specific RZ/Five cache compatible
Date: Fri,  9 May 2025 16:37:55 +0100
Message-ID: <20250509-sapling-exhale-72815a023ac1@spud>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=960; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=D7InSwvjCvcxVefdG8CAmpmcWUJm9FNi86WLZlt2VAU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBlyiiEvfm1gSzl2Xf+A7aWtgiL7ly/nWSPcKxD57p33h nVHeC9t6yhlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEvvQxMnx8xNvk4CO2Lo9J /YDaxzjBS+JrW9v7njdZPU4Red/kvIuR4ephk+DOuZlVy1KvqUnntGabHi27UeaZcKWXRfBVadV fFgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

I opted not to add fixes tags, but I can create them if you (Prabhakar
or Geert etc) think that I should.

CC: Ben Zong-You Xie <ben717@andestech.com>
CC: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Magnus Damm <magnus.damm@gmail.com>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-renesas-soc@vger.kernel.org
CC: linux-riscv@lists.infradead.org

Conor Dooley (2):
  dt-bindings: cache: add specific RZ/Five compatible to ax45mp
  riscv: dts: renesas: add specific RZ/Five cache compatible

 .../devicetree/bindings/cache/andestech,ax45mp-cache.yaml      | 3 ++-
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi                    | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.45.2


