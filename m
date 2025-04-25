Return-Path: <linux-renesas-soc+bounces-16380-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0993EA9C906
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 14:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B6F19C6E47
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 12:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6831A08AF;
	Fri, 25 Apr 2025 12:35:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90EC248891
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Apr 2025 12:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745584522; cv=none; b=OY95OpIiejwCSETOfNRixvvtpYynQ/K3ns2/xoD7NmjZk8PqP2NTO+uCNhKxa7mgX+Vg6I4cSiu/8mjlI8lvj84s++SqKR2udiO3NccfIGA//P7XbUpFQivySkwBRmFqANMSNqvseLDOGXtphgeW75kL4CtNUiMJReC994oAkNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745584522; c=relaxed/simple;
	bh=WtIsa6WhPYa6Ba5DnGp4PGskpMPqybSzyWjBwGKwfHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Le2KBBgjrN6w6bZYvpxi3i/f1ckrmX8naGV9OOKs3GxEtPYV0TGOXhjvuvRTlH4uXqtxev7F17EHLDKxfApMjDhO+a0h8eobdPmL4sCTOfAFp36viU/j1o71c/NNnpox1OfhSNxL4n8EISTbqOYgYWF/xcR+SpjV605/FYzvi4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4ZkXNw62LVz4xbw7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Apr 2025 14:35:12 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:3329:b4bc:d565:c72])
	by albert.telenet-ops.be with cmsmtp
	id hQb42E00C16PE0206Qb4sN; Fri, 25 Apr 2025 14:35:04 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGc-00000001gJj-3IuM;
	Fri, 25 Apr 2025 14:35:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGm-0000000CKj7-06pD;
	Fri, 25 Apr 2025 14:35:04 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas DT binding updates for v6.16
Date: Fri, 25 Apr 2025 14:34:58 +0200
Message-ID: <cover.1745582594.git.geert+renesas@glider.be>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.16-tag1

for you to fetch changes up to 9e3b7138c3745a91d91e7e525e4b800ea276a761:

  dt-bindings: soc: renesas: Document Retronix R-Car V4H Sparrow Hawk board support (2025-04-24 11:13:53 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v6.16

  - Document support for the Renesas RZ/T2H (R9A09G077) SoC and the
    RZT2H-EVK evaluation board,
  - Document support for the Retronix Sparrow Hawk board, which is based
    on R-Car V4H ES3.0.

----------------------------------------------------------------
Marek Vasut (2):
      dt-bindings: vendor-prefixes: Add Retronix Technology Inc.
      dt-bindings: soc: renesas: Document Retronix R-Car V4H Sparrow Hawk board support

Thierry Bultel (1):
      dt-bindings: soc: renesas: Add Renesas RZ/T2H (R9A09G077) SoC

 .../devicetree/bindings/soc/renesas/renesas.yaml        | 17 +++++++++++++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 2 files changed, 19 insertions(+)

