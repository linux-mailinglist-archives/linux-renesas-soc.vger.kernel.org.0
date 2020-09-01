Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E840259B70
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Sep 2020 19:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732515AbgIARBx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Sep 2020 13:01:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:40858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729495AbgIAPUk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Sep 2020 11:20:40 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598973640;
        bh=wzTZqlbF8rm1jDG8uJRGVtlQEGRK1ynXxDKVgXyIMH0=;
        h=Subject:From:Date:To:From;
        b=Cy3OLL+W8AmTdAebDIBzCA6g9bVzS4VIto366SRNCBZu0TqvAXCUlXdvBEN2F28Xc
         c/jtXdIiPnlTX/nmwVmIsWXyDu6Uqul1C0h8XNpIltz6OBIA3FV+/2yYqtPdoPZbMC
         W1FfTf5lJ9bUEVjpBhpKo4WB1+ywXP8BPPuapu+k=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159897364058.11004.5352607327572918303.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 01 Sep 2020 15:20:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] renesas_sdhi: fix hang when SCC loses its clock (2020-09-01T15:02:50)
  Superseding: [v1] renesas_sdhi: fix hang when SCC loses its clock (2020-06-04T11:20:39):
    [1/2] mmc: core: when downgrading HS400, callback into drivers earlier
    [2/2] mmc: renesas_sdhi: keep SCC clock active when tuning


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
