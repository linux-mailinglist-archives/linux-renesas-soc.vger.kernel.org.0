Return-Path: <linux-renesas-soc+bounces-17944-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F8FAD1299
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Jun 2025 16:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FB2F3AAE1C
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Jun 2025 14:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3883024EAA9;
	Sun,  8 Jun 2025 14:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xWLDDrUT";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="QDPkFHwJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9381FE455
	for <linux-renesas-soc@vger.kernel.org>; Sun,  8 Jun 2025 14:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749392881; cv=none; b=PWQHqL9F6YKjyhpJSv+qfHCE+n7tzbwnivjF19TtPmn/HGSd5ImMi6IQ4srB2EEDaKaHqFbfe1Z7oCxIuMXj8fzYbYDmGt4fDw/wiIk95K3iPXTV6wzLlZqwuHKxwrBxD1fhv+6TlGJfxbcWA5d/5c+LFBDPzqu6WaQ3oFL2I6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749392881; c=relaxed/simple;
	bh=yVvFOpTDmFouAPIa9i3Fo1eJwAkwkzte+UAvNFLbZfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zq7F/G+qYHzwDkHG5SzGbIgioQ92r9ZRtPTv29iqeupxOMj+QZ8i8j+WuSbAmVFUNmupPjo/IKXk5ERByOg8Fv5ISA7Ufole98Ahx7GOeKh/zzzJLbHHCa+sstbz4Wukp6s3UJjnCvw/KJQsFeqkGln1d6+Hl995wNLdEf3sh/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xWLDDrUT; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QDPkFHwJ; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bFcpb4CMbz9t9D;
	Sun,  8 Jun 2025 16:27:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749392871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=C91pvQGM1LFYFT1KCnnsiWD2lSWJALbWv64QBPBGwLc=;
	b=xWLDDrUTv7T1hptpO0lN/RXDcoNLZgJfuuhwI2gwjkt53Hmsfs06UfXE2775uhEvINaHIi
	fW2PDqUx8MEyZqW02pKIOL5tcmRZQWQ+zDitaFxwwq0Bd93DfOpROEx+HZu1jKNDrhAaIY
	7XMzNpgmi8V9hL+VANlTYeAfnsIFr5yAX27WDB89f4lDlez0I5rNYz65/O89Cb0e9imd/T
	SvUkHTcvX/GQ0OKHBovKjujsqy6VAbEDXTNK+0izDyXFXP0NPdN3ETRADhchWQFwQI7vpI
	AGobJP3SHh/No4IWRF66kmWO0FC5h2WskA+66HTlb+399mbSN3Ip1U2yueX5Dg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1749392869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=C91pvQGM1LFYFT1KCnnsiWD2lSWJALbWv64QBPBGwLc=;
	b=QDPkFHwJFfrCaXTPDxTxjI6p7m//pV9IsfFOrwROVgkQ+T+VyZKBM03sRn3TrL8vwAKrRR
	qu2ivwhUzcUeqI02GAnAkJk0AxOH0uLTn1QLEkq+SAkNrCSYNxcE7UuGtLfKIA6Zz5H3Ky
	+p+XeiHHeAnhFofSOD7m9G1R34FiYRRF+FtZrBPgTaxrn60PAC8K5//JXSDvR5S7J/ChoW
	62l2kjonOEeHiKRTwQEhOO6KSHvnrx0WDSKI9D9ReX1GVCEkaVnyS+1x4CexIUYyY+qPkN
	m4s7vpO6PdwWhZALPUO48y4MIIMLebCmRDexWXE43qAfEICXKPTpEAen7v8PAA==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/4] drm/rcar-du: dsi: Implement DSI command support
Date: Sun,  8 Jun 2025 16:24:46 +0200
Message-ID: <20250608142636.54033-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 9ty4hbb87o46hi5c1uuqdk3tf9kjkb5g
X-MBO-RS-ID: 13237b3cd0eea42b1e1
X-Rspamd-Queue-Id: 4bFcpb4CMbz9t9D

Use BIT() macro. Clean up lane count handling for non-4-lane panels.

Implement support for DSI command transfer mode using register based
access, with maximum payload length of 16 Bytes in Long Packet.

Marek Vasut (4):
  drm/rcar-du: dsi: Convert register bits to BIT() macro
  drm/rcar-du: dsi: Remove fixed PPI lane count setup
  drm/rcar-du: dsi: Configure TXSETR register to match PPI lane count
  drm/rcar-du: dsi: Implement DSI command support

 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   | 220 ++++++++++++++++-
 .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h  | 226 ++++++++++++++----
 2 files changed, 395 insertions(+), 51 deletions(-)
---
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org

-- 
2.47.2


