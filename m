Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C6B2781CC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Sep 2020 09:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbgIYHka (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Sep 2020 03:40:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:48390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727135AbgIYHka (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Sep 2020 03:40:30 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601019629;
        bh=vtf5/bmctE7RFGuw8nj7vie9piKxovYrqnpOhMOCRis=;
        h=Subject:From:Date:To:From;
        b=b8JxVFRkzLYbgEIf3IC5p/YZp6ZULAgJcCqzrktt8JbjJOlUdJm/y8Pgy+HS3PMEl
         eMUEDZzbSas4xiNxmMBi8Is8qZI/Pb+6DioCb95VEtfViNiu4RZOct6GQcX8fhPuhc
         h/ayULn7otdDTjLhmmgefCNRaQTdDMv4S0Jc5jMA=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160101962981.28293.11989088934288203580.git-patchwork-summary@kernel.org>
Date:   Fri, 25 Sep 2020 07:40:29 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel (refs/heads/master):

Patch: [v2] soc: renesas: rmobile-sysc: Fix some leaks in rmobile_init_pm_domains()
  Submitter: Dan Carpenter <dan.carpenter@oracle.com>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=354217
  Link: <20200923113142.GC1473821@mwanda>

Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
