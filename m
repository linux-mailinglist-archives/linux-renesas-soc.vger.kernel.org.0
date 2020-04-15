Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 859F91AAC0F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 17:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409958AbgDOPkj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Apr 2020 11:40:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:42936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404421AbgDOPke (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Apr 2020 11:40:34 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586965234;
        bh=n0oVBoJf6WT4bJUvnnGafkL9w4iCjeEAtFQm0Vd/zZA=;
        h=Subject:From:Date:To:From;
        b=GaeVpf1s5W3+olh3DWgUP2QMstPnee2I+UBHZZEQMKOL2I8vnhkS4CGxy+BFIAk6S
         xEvsf7acQWbeJWRoQRkgwIVR9XmF1hQxrCqD9/FVYTcxGuoaQ4dcB2t9hsHkmlCKJv
         pCZW84a6x3C5/IrCYsMOFC5LpkotlxPNg5mHO9Yg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158696523425.12214.9641563768663273569.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 15 Apr 2020 15:40:34 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v5] ARM: boot: Obtain start of physical memory from DTB (2020-04-15T15:34:09)
  Superseding: [v4] ARM: boot: Obtain start of physical memory from DTB (2020-03-20T14:43:48):
    [v4] ARM: boot: Obtain start of physical memory from DTB


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
