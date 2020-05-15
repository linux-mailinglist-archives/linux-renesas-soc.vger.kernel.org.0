Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B91BB1D4A68
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2020 12:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728154AbgEOKF7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 May 2020 06:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728228AbgEOKF7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 May 2020 06:05:59 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CD1C05BD0A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2020 03:05:58 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:ad37:48f9:900a:523e])
        by xavier.telenet-ops.be with bizsmtp
        id ey5w2200D1TfvYq01y5w6K; Fri, 15 May 2020 12:05:56 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jZXE4-0008Qo-EM; Fri, 15 May 2020 12:05:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jZXE4-0003pg-DE; Fri, 15 May 2020 12:05:56 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/5] Renesas ARM SoC updates for v5.8 (take two)
Date:   Fri, 15 May 2020 12:05:45 +0200
Message-Id: <20200515100547.14671-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515100547.14671-1-geert+renesas@glider.be>
References: <20200515100547.14671-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 135e7a156ae2c1a7a1f0c1d44bf2b3daece04bbf:

  ARM: shmobile: r8a7742: Basic SoC support (2020-04-28 10:13:58 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-soc-for-v5.8-tag2

for you to fetch changes up to 96866b1a1d32318b6bbc321a762bf79db1f4686e:

  ARM: debug-ll: Add support for r8a7742 (2020-05-04 14:28:21 +0200)

----------------------------------------------------------------
Renesas ARM SoC updates for v5.8 (take two)

  - Add debug-ll support for RZ/G1H.

----------------------------------------------------------------
Lad Prabhakar (1):
      ARM: debug-ll: Add support for r8a7742

 arch/arm/Kconfig.debug | 10 ++++++++++
 1 file changed, 10 insertions(+)
