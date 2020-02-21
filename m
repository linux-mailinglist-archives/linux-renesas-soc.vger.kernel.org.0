Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3E9168000
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2020 15:20:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728312AbgBUOUd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Feb 2020 09:20:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:41990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727315AbgBUOUd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Feb 2020 09:20:33 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582294833;
        bh=RZQMhGh5meTj/7Ql8IH60F/4QNiFWNzr/tq1C5045ck=;
        h=Subject:From:Date:References:To:From;
        b=P3Us9nSqeocjdEHL0ttLE+BNrSKxPkbKSMZDP8Xqeqtcll+nie5CYxZaoj2AOlZid
         p+p2ycQoBrydo6nzixSGtf5e7DrGkNbSJBMzEC4WSSzHhEtZJhelol5iAjyxqFh/jh
         I4iXyPdMXWAKWBzo7vlP5r4u9mGmgMRxME3eaQvY=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158229483332.12219.5639020605006542672.git-patchwork-summary@kernel.org>
Date:   Fri, 21 Feb 2020 14:20:33 +0000
References: <20200217101741.3758-1-geert+renesas@glider.be>,
 <20200218112414.5591-1-geert+renesas@glider.be>,
 <20200218112449.5723-1-geert+renesas@glider.be>,
 <20200219153929.11073-1-geert+renesas@glider.be>,
 <20200218132217.21454-1-geert+renesas@glider.be>,
 <20200217103251.5205-1-geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: arm64: defconfig: Replace ARCH_R8A7796 by ARCH_R8A77960
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=242521

Patch: arm64: dts: renesas: Remove use of ARCH_R8A7795
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=243169

Patch: soc: renesas: Remove ARCH_R8A7795
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=243173

Patch: ARM: dts: r8a7779: Remove deprecated "renesas,rcar-sata" compatible value
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=244103

Patch: ARM: dts: r8a7745: Convert to new DU DT bindings
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=243237

Patch: arm64: defconfig: Enable additional support for Renesas platforms
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=242529

Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
