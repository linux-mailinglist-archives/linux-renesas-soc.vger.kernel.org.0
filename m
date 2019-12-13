Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCECF11ED10
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2019 22:41:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbfLMVkc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Dec 2019 16:40:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:46402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726382AbfLMVkc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Dec 2019 16:40:32 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576273231;
        bh=w0FuY4GTcwE2jnuxLxWss4NsBJxugudtc0UK+fMT/hQ=;
        h=Subject:From:Date:References:To:From;
        b=qtpGrFrWmEYx+DfFRFq1u+ncZ5ZNOJcTouTCB8GBV2lVQsCMqRptzN9IL2hDu6obg
         IZmMf/KIeXf3bZD6+ZuCX39wOEhQHV6BpvUNTO9vOkk4RSiEpQTAyr62Ab3S7ieBw9
         5UfzkpmomkWFp1gjvh2ExhyDlsALZD+Gdy8cRkHM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157627323152.19961.11380334663116958759.git-patchwork-summary@kernel.org>
Date:   Fri, 13 Dec 2019 21:40:31 +0000
References: <20191211100510.7182-1-geert+renesas@glider.be>,
 <20191211131311.23661-1-geert+renesas@glider.be>,
 <20191211100438.7094-1-geert+renesas@glider.be>,
 <20191209101327.26571-1-geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Patch: soc: renesas: Remove ARCH_R8A7796
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=214881

Patch: [PATCH/RFC] arm64: dts: renesas: Rename r8a7796* to r8a77960*
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=214985

Patch: arm64: dts: renesas: Remove use of ARCH_R8A7796
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=214877

Patch: ARM: shmobile: defconfig: Restore debugfs support
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=213533

Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
