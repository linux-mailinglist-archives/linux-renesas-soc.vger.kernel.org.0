Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 050172198F4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2020 09:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgGIHAu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Jul 2020 03:00:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:55540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726119AbgGIHAu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Jul 2020 03:00:50 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594278049;
        bh=T5qHEZ1itAfqKUh+KGv9HlLQrfuuYsuwC3zntWfIKoM=;
        h=Subject:From:Date:To:From;
        b=YsrFp6NuHjlP2EIR3E8ZO8yaoFJe42Ec7+dy8gICZ6SqYlzFaY5Xejc2KU8SxpO2T
         HRfpOR9gbk/oFKcCMwwqQsZQbXqGB9x2iRvqDUG5I/iqeKDPYumBd8iao8gqZMgmsJ
         W1H+VXHlajdSTbHF/BgNhbLu4o2pVwdjCkpVywzE=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159427804991.6183.6401210535652126986.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 09 Jul 2020 07:00:49 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] PCI: rcar: Fix runtime PM imbalance on error (2020-07-09T06:43:56)
  Superseding: [v2] PCI: rcar: Fix runtime PM imbalance on error (2020-06-07T09:31:33):
    [v2] PCI: rcar: Fix runtime PM imbalance on error


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
