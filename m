Return-Path: <linux-renesas-soc+bounces-13489-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 914DAA3FCCB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 18:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E480D707235
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 16:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8EBF22579E;
	Fri, 21 Feb 2025 16:57:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DD0225A39
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Feb 2025 16:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740157068; cv=none; b=JAGE+CEH22N5wB29EOYP0EGnTiCeTF38fLwbMcH8tfz7E84IiSTJHw9ocEQWzCTekxatjrPU2emdyApmwC949fOkO3pg2O/IeFU+F1Wxl5vOnl/LMutW348ohIDLl53mcTKEdDq9cCckRnpuEkHEetdz6390H5hfMd2VrMjGNNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740157068; c=relaxed/simple;
	bh=IUj9RMBLtpFFh2EaTRqD4ZwOnHj8W4mtlzJltudOrKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TnFx2B/9DmXNC9edpya9chISakAoB+GNMjmsEIjJ2eJuEwm9kQ/i81OsZSm6ibjjGMud8EkHQYA0F0nmTvYFlcT1dQmtAb70nztCel+sGNHxqSPGafDky3EuXG5dRHkane29+uzlMNsOFelWxhlrMQpseH52Lu0eyndw7sH3jW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4YzxBq2qg0z50RKx
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Feb 2025 17:57:39 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae9a:419e:d123:9695])
	by xavier.telenet-ops.be with cmsmtp
	id GGxX2E0030y8aK501GxXRt; Fri, 21 Feb 2025 17:57:31 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWKs-0000000BMsb-3jyN;
	Fri, 21 Feb 2025 17:57:31 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWLD-0000000EOqx-1IZ1;
	Fri, 21 Feb 2025 17:57:31 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/5] Renesas DT binding updates for v6.15
Date: Fri, 21 Feb 2025 17:57:25 +0100
Message-ID: <cover.1740156745.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740156736.git.geert+renesas@glider.be>
References: <cover.1740156736.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.15-tag1

for you to fetch changes up to 00e3cb0d638ce70391470f894820d8442a155e95:

  dt-bindings: soc: renesas: Document MYIR Remi Pi board (2025-02-10 09:42:40 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v6.15

  - Document support for the Yuridenki-Shokai Kakip (based on RZ/V2H)
    and MYIR Remi Pi (based on RZ/G2L) boards,
  - Document support for the RZ/G3E System Controller.

----------------------------------------------------------------
John Madieu (1):
      dt-bindings: soc: renesas: Add RZ/G3E variant SYS binding

Julien Massot (1):
      dt-bindings: soc: renesas: Document MYIR Remi Pi board

Nobuhiro Iwamatsu (3):
      dt-bindings: soc: renesas: Document more Renesas RZ/V2H SoC variants
      dt-bindings: vendor-prefixes: Add Yuridenki-Shokai Co. Ltd.
      dt-bindings: soc: renesas: Document Yuridenki-Shokai Kakip board

 .../bindings/soc/renesas/renesas,r9a09g057-sys.yaml      |  5 ++++-
 .../devicetree/bindings/soc/renesas/renesas.yaml         | 16 ++++++++++++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml   |  2 ++
 3 files changed, 22 insertions(+), 1 deletion(-)

