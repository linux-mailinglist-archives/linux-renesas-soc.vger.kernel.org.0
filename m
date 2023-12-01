Return-Path: <linux-renesas-soc+bounces-503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B055F800ADD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 13:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C525281577
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 12:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A78250F2;
	Fri,  1 Dec 2023 12:28:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E54CF1A4
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Dec 2023 04:28:31 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7f2e:4977:a943:cc87])
	by michel.telenet-ops.be with bizsmtp
	id H0UU2B00K0rKVV8060UU4s; Fri, 01 Dec 2023 13:28:29 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r92cr-00ARcB-Sl;
	Fri, 01 Dec 2023 13:28:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r92dA-00CVD1-JE;
	Fri, 01 Dec 2023 13:28:28 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas ARM defconfig updates for v6.8
Date: Fri,  1 Dec 2023 13:28:16 +0100
Message-Id: <cover.1701433487.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701433485.git.geert+renesas@glider.be>
References: <cover.1701433485.git.geert+renesas@glider.be>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.8-tag1

for you to fetch changes up to 7c77368b6c42ec87aed9976288a9b50bccb272a6:

  ARM: shmobile: defconfig: Refresh for v6.7-rc1 (2023-11-27 11:01:01 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.8

  - Enable support for the Renesas VersaClock 3 clock generator in the
    arm64 defconfig,
  - Enable support for the Renesas EtherAVB module in the arm multi_v7
    defconfig,
  - Refresh shmobile_defconfig for v6.7-rc1.

----------------------------------------------------------------
Biju Das (1):
      arm64: defconfig: Enable Renesas VersaClock 3 clock generator config

Claudiu Beznea (1):
      ARM: multi_v7_defconfig: Enable CONFIG_RAVB

Geert Uytterhoeven (1):
      ARM: shmobile: defconfig: Refresh for v6.7-rc1

 arch/arm/configs/multi_v7_defconfig | 1 +
 arch/arm/configs/shmobile_defconfig | 1 +
 arch/arm64/configs/defconfig        | 1 +
 3 files changed, 3 insertions(+)

