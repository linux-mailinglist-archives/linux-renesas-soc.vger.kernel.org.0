Return-Path: <linux-renesas-soc+bounces-10474-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8499C5BE6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 16:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A76E11F215E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Nov 2024 15:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785872309AF;
	Tue, 12 Nov 2024 15:31:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5901FF604
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Nov 2024 15:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731425474; cv=none; b=g5Z0UtzEPWrCaT2dC3OHyRpVcWbQ/SRjpgRQUpnv01UcQvlR5IlTLznNqtlghrbL/IQngjlDGg96BlokQKS7gaWy8kPbZA1tHKG9XQBwo9TpKfQlxdVqhNNk2SVryKqVtZjfJZtrXdcjbR8aIG6gRuR4knSpYZf3J4C0LNzCruo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731425474; c=relaxed/simple;
	bh=uQV0n8yCC06ltoSjlnTAEx6volrcn7obATZz9RHAyIQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N3HY5ykX5hClGjTTw+WjU2XTCpRCD1vwMaP65su+RPeZb6geFHnj0rawjNjh/s3Y2y+4PvBnk0N+wtcJH5eXjUcQz+rIWGXRWxz1oMJLe54h7Q4vP89+/xc3RtbdjvdOWtY3/EqhNF/5fkOT3K1ljKaHG31Tfyv/Ar/pLR3suw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4Xnqvl3G8fz4wxhT
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Nov 2024 16:24:19 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:78de:3cf6:79c5:d375])
	by albert.telenet-ops.be with cmsmtp
	id brQ92D00l4mJWgD06rQ9ME; Tue, 12 Nov 2024 16:24:11 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tAsk8-006q6m-9e;
	Tue, 12 Nov 2024 16:24:09 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tAskT-001eqb-Pu;
	Tue, 12 Nov 2024 16:24:09 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas fixes for v6.12
Date: Tue, 12 Nov 2024 16:24:05 +0100
Message-Id: <cover.1731424916.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

The following changes since commit 42f7652d3eb527d03665b09edac47f85fb600924:

  Linux 6.12-rc4 (2024-10-20 15:19:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v6.12-tag1

for you to fetch changes up to 124f4f1a18696c4198f9f903fd74034ea8b7d352:

  MAINTAINERS: Re-add cancelled Renesas driver sections (2024-11-11 11:11:17 +0100)

----------------------------------------------------------------
Renesas fixes for v6.12

  - Re-add cancelled Renesas driver sections to the MAINTAINERS file.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      MAINTAINERS: Re-add cancelled Renesas driver sections

 MAINTAINERS | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

