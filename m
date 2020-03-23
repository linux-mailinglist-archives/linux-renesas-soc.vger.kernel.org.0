Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2511B18EEF1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2020 06:00:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbgCWFAk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Mar 2020 01:00:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:33140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725838AbgCWFAk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Mar 2020 01:00:40 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584939639;
        bh=5xGqRx4YVOLRa9NtnNYy8Bt8R1jfiP1Ge4kgLP4XzCQ=;
        h=Subject:From:Date:To:From;
        b=z/s8dJlPViS0RBsskrNXDErKuT7OllMdTEqqz1n5qR7YBfmy6p6wKEiizYTuS1G60
         S4JoW0jxQkruqpa1jiR48QuSnOcMTrSfVnbJ0IcdowCq/wGqqbUdfCGj0SnGI1KjD3
         yUrBGLNYJLhOVZXlijtB1/I0po9zVmFGSju+vl/I=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158493963978.6079.12412398910553263678.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 23 Mar 2020 05:00:39 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] media: rcar-csi2: Correct the selection of hsfreqrange (2020-03-23T04:48:44)
  Superseding: [v3] media: rcar-csi2: Correct the selection of hsfreqrange (2020-03-20T08:00:05):
    [v3] media: rcar-csi2: Correct the selection of hsfreqrange


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
