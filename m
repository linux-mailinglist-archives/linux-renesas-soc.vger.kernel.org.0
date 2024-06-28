Return-Path: <linux-renesas-soc+bounces-6892-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B65991BF5C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 15:16:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CAF1284CB3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 13:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE72154434;
	Fri, 28 Jun 2024 13:15:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6248AB653
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Jun 2024 13:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719580556; cv=none; b=dGcu3WQFyBRx2X7cVB9XoDfIGVOgCorUiT7DnxD56QdsZ6i4j7PY8WSA2fk/rXuqE/vIbKIv1mc6qbfh948Ug3PDU3YexeitbxQMSfd+VrqAbfXUPveX3x5qSVA9J+QYuWsIg1BPqQhmp3krkOtu1lcZZ22ipTrcZYGEPDqG3rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719580556; c=relaxed/simple;
	bh=0ZEfLF+nxgkrc18uGPOmeEv30CQG+0CkV5Vho4xnnIY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SfUJbBUzxqTBaVOF3U3g+ql+QM0GBoxYjn1maQTEev/G3WB5PwK2E6WY0KNsdkvKVkzbxygeCQbJ8B7Dw4m97N3hDWnh/FeF62X0t5M3JWBIfP0JrBuKt8saRW9zp/UEkSZrtJFFK1Dp82AuwOvgVPBETt6P397ZYx8eYl22zFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:acf4:1256:ab55:12e6])
	by laurent.telenet-ops.be with bizsmtp
	id h1Fs2C00A5ECAAU011Fslu; Fri, 28 Jun 2024 15:15:52 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sNBS6-000VGY-92;
	Fri, 28 Jun 2024 15:15:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sNBSC-00BlRM-4g;
	Fri, 28 Jun 2024 15:15:52 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas DT binding updates for v6.11
Date: Fri, 28 Jun 2024 15:15:48 +0200
Message-Id: <cover.1719578279.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719578273.git.geert+renesas@glider.be>
References: <cover.1719578273.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.11-tag1

for you to fetch changes up to 8a3d2ad6129c1c43b683550802a93a9ca7f9645b:

  dt-bindings: fuse: Document R-Car E-FUSE / OTP_MEM (2024-06-24 16:16:55 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v6.11

  - Document support for R-Car E-FUSE controllers.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      dt-bindings: fuse: Document R-Car E-FUSE / PFC
      dt-bindings: fuse: Document R-Car E-FUSE / OTP_MEM

 .../bindings/fuse/renesas,rcar-efuse.yaml          | 55 ++++++++++++++++++++++
 .../devicetree/bindings/fuse/renesas,rcar-otp.yaml | 38 +++++++++++++++
 2 files changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fuse/renesas,rcar-efuse.yaml
 create mode 100644 Documentation/devicetree/bindings/fuse/renesas,rcar-otp.yaml

