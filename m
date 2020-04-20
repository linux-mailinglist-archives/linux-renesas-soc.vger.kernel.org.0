Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 261001B061B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Apr 2020 12:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbgDTKAn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Apr 2020 06:00:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:55036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725773AbgDTKAn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Apr 2020 06:00:43 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587376843;
        bh=T4p1E7qWzINJ2rIdAd2D1RwAoxff5Ninxm08nPXKP2U=;
        h=Subject:From:Date:To:From;
        b=EVv4efA0A1dtPmC1dqizcSlbXZVqWT6RJ5AboUiBI+mQIX0OTjBhIdP7pjb1COD86
         7rOEcBsS6U3u52x8/T2UAW2EwqrXTPN6fz6L13GMpGI1kpv4MvVGZSi+EiR5Wl3YG0
         TxmRfLUocg4MWFPnciJyRg+YHNAW356BWx5m+85A=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158737684324.3108.10994107426708752732.git-patchwork-summary@kernel.org>
Date:   Mon, 20 Apr 2020 10:00:43 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Series: ARM: dts: r8a7791: Enable PWM support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=256953
  Link: <20200316102540.28887-1-geert+renesas@glider.be>
    Patches: [1/2] ARM: dts: r8a7791: Add TPU device node
             [2/2] ARM: dts: r8a7791: Add PWM device nodes

Patch: arm64: dts: renesas: r8a77980: Fix IPMMU VIP[01] nodes
  Submitter: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=272621
  Link: <1587108543-23786-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>

Patch: ARM: dts: r8a73a4: Add missing CMT1 interrupts
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=267947
  Link: <20200408090926.25201-1-geert+renesas@glider.be>

Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
