Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B03C51247F4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2019 14:20:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbfLRNUh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Dec 2019 08:20:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:45422 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726846AbfLRNUh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Dec 2019 08:20:37 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576675236;
        bh=ZbV/qjR7+//BgdYGc9qIvqLU5VPm+SQHVAU1Na/kbtk=;
        h=Subject:From:Date:To:From;
        b=lE9WUrH22J6mvFO1xM3AZvsWADykDNiZ/93yO5yFBTVQ6qmvZE2H+azzasCEem1ao
         86EaPRemsoQiV1VDnECrfvQZGo1xYYa4ZrngAV9DXwiW7ybOY5shxRoLtBKx/VlgpK
         x/ZREU2bX0uGI1g5KYWG/hg1OvwFpVSVCRpaeyBM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157667523690.23552.3174232654510635098.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 18 Dec 2019 13:20:36 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] clock: renesas: cpg-mssr: Fix the typo (2019-12-18T12:59:44)
  Superseding: [v1] clock: renesas: cpg-mssr: Fix the typo (2019-12-18T11:09:50):
    clock: renesas: cpg-mssr: Fix the typo


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
