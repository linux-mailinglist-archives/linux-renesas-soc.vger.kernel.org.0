Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C56D1D4A67
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2020 12:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728005AbgEOKF7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 May 2020 06:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728154AbgEOKF7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 May 2020 06:05:59 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E0A0C05BD09
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2020 03:05:58 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:ad37:48f9:900a:523e])
        by xavier.telenet-ops.be with bizsmtp
        id ey5w2200E1TfvYq01y5w6L; Fri, 15 May 2020 12:05:56 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jZXE4-0008Qq-Ez; Fri, 15 May 2020 12:05:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jZXE4-0003pj-Du; Fri, 15 May 2020 12:05:56 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/5] Renesas driver updates for v5.8 (take two)
Date:   Fri, 15 May 2020 12:05:46 +0200
Message-Id: <20200515100547.14671-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515100547.14671-1-geert+renesas@glider.be>
References: <20200515100547.14671-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 2f71832755a9422f5a62a13ea3e805df7b173837:

  soc: renesas: rcar-rst: Add support for RZ/G1H (2020-04-30 10:01:39 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.8-tag2

for you to fetch changes up to cdc8abe763c99a6c2b854d7096eaf1ea21017a42:

  soc: renesas: Add Renesas R8A7742 config option (2020-05-04 14:27:20 +0200)

----------------------------------------------------------------
Renesas driver updates for v5.8 (take two)

  - Add the main config option for the RZ/G1H SoC.

----------------------------------------------------------------
Lad Prabhakar (1):
      soc: renesas: Add Renesas R8A7742 config option

 drivers/soc/renesas/Kconfig | 7 +++++++
 1 file changed, 7 insertions(+)
