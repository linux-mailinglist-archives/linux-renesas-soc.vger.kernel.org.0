Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7FDA12D7B3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Dec 2019 11:00:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbfLaKAX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 Dec 2019 05:00:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:39472 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726334AbfLaKAW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Dec 2019 05:00:22 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577786422;
        bh=BqBgMHDITFOTnsoH9DNvl3DjoMb9z1AQFiSWQWQNWwk=;
        h=Subject:From:Date:References:To:From;
        b=LAb6MJJfyOTYG+mbXvRtcHfRsaZSfts6coV2BYGrOO9fumnc7gsS5953Fw38WycCd
         /R8stgFIak5OKRRWZ0yhpBkV8BtyVNK/kNEDrSrZi3xvtfp5dD8ndGzd5FpP/r9NVW
         m8xRaZpt88K63Qaj3HC21glIuK/C0WgabS2ov35E=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157778642227.30877.16877800949193588043.git-patchwork-summary@kernel.org>
Date:   Tue, 31 Dec 2019 10:00:22 +0000
References: <20191213162736.2160-1-geert+renesas@glider.be>,
 <20191213162712.2056-1-geert+renesas@glider.be>,
 <20191213162604.1890-1-geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: ARM: dts: sh73a0: Add missing clock-frequency for fixed clocks
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=216451

Patch: ARM: dts: r8a7778: Add missing clock-frequency for fixed clocks
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=216447

Patch: ARM: dts: rcar-gen2: Add missing mmio-sram bus properties
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=216445

Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
