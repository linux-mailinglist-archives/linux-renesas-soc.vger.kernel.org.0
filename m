Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70A9E20E4F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2020 00:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728822AbgF2VbH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jun 2020 17:31:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:60640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728820AbgF2SlS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jun 2020 14:41:18 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593422486;
        bh=/6hZWO4kLIEjsauk0KxrMCO+M/XZc9t0ZkjQXB3hSrw=;
        h=Subject:From:Date:To:From;
        b=raB8CxElqXQq0qBRyBVqqrAaXKCKI9jyzqI0+Rb0qEvqmMEbGtfmKEMaEXJhraOGk
         AEAhJRDcOE1a1DenHse4P0fUsAkb6SXPzU/9paUU24coBGgyl4jRKFVtLTpkO+3cko
         6h3+Z3qyXRtcNnny4fpm6JwQ7ZuCsAemOpfaRzps=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159342248665.14778.18127323139756126994.git-patchwork-summary@kernel.org>
Date:   Mon, 29 Jun 2020 09:21:26 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/next):

Series: ARM: shmobile: defconfig: Update for v5.8-rc1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=307889
  Link: <20200624131931.3686-1-geert+renesas@glider.be>
    Patches: [1/7] ARM: shmobile: defconfig: Refresh for v5.8-rc1
             [2/7] ARM: shmobile: defconfig: Enable DA9063 ONKEY support
             [3/7] ARM: shmobile: defconfig: Enable CAT9554 support
             [4/7] ARM: shmobile: defconfig: Enable RZ/A watchdog support
             [5/7] ARM: shmobile: defconfig: Enable RZ/A1 CEU support
             [6/7] ARM: shmobile: defconfig: Enable ADV7612 CEC support
             [7/7] ARM: shmobile: defconfig: Enable RZ/A1H RTC support

Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
