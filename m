Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB6A6202E74
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2020 04:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbgFVCkk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Jun 2020 22:40:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:42056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726659AbgFVCkk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Jun 2020 22:40:40 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592793639;
        bh=2Ezv++cNrNZkh+e9jZW8Syl/hF2z9+bIzoYetAyLnwI=;
        h=Subject:From:Date:To:From;
        b=PLIyBUf14L9dvPPc9VUkY+nKhDZTpfSuqNljMgCv5e40VrEbatTxV5uO+cszr0ghP
         4WtEKmwvDiQsM+fQc5nEnB6X/w05k8kk0ksaVPYijZ50d9+66nc3Z0o/MMQVPvV5QI
         aw9nZrsCBfJSOHN0TAUaqTckIjW7ZL0UQFl3YzeM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159279363992.29620.1792049771169134426.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 22 Jun 2020 02:40:39 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] treewide: fix _mmc_suspend() on PSCI (2020-06-22T02:24:57)
  Superseding: [v2] treewide: fix _mmc_suspend() on PSCI (2020-06-19T11:29:01):
    [PATCH/RFC,v2,1/2] firmware: psci: call pm_set_suspend_via_firmware()
    [PATCH/RFC,v2,2/2] mmc: core: Call mmc_power_off_nofity() if pm_suspend_via_firmware()


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
