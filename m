Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07D0825F655
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 11:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbgIGJUu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 05:20:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:34426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728141AbgIGJUu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 05:20:50 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599470450;
        bh=oUZvz7km14xJCxidFRLsSGdPQmV3/mQ4xjP6Bo3G1qE=;
        h=Subject:From:Date:To:From;
        b=q6Dd6iyn0Ks+srGBpYDRR6cTsxyJRS90l2UFq+2kegu/wHYjXPHU3+5AQeAxOxXhf
         u11cNRrjrNiLOI2zcJRuyCdG4cRS0zzndEjsXY1izuzH4XzT2FsCCtckeMgQTiI6i+
         KGwIONvzPpZeYAXmiMPa6vfskMvkoHwiPqP+QRII=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159947045015.5519.15529838769600344194.git-patchwork-summary@kernel.org>
Date:   Mon, 07 Sep 2020 09:20:50 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Patch: [v3] ravb: Fixed to be able to unload modules
  Submitter: Yuusuke Ashizuka <ashiduka@fujitsu.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=335851
  Link: <20200820094307.3977-1-ashiduka@fujitsu.com>

Patch: [v2] ravb: Fixed the problem that rmmod can not be done
  Submitter: Yuusuke Ashizuka <ashiduka@fujitsu.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=326607
  Link: <20200730100151.7490-1-ashiduka@fujitsu.com>

Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
