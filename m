Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5AE5140ED1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2020 17:20:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729022AbgAQQUi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jan 2020 11:20:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:60182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727043AbgAQQUi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jan 2020 11:20:38 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579278037;
        bh=AMXA11nmBZ4nIo+xjLK5S1k29Jsxd2aYXAo/r4CFNGo=;
        h=Subject:From:Date:To:From;
        b=UIs98QWrZfaHoCdqMFctgllihB8asj8f1xZ6k/mvWntjhPUDCGzzB9HN0oiRpdg4x
         8t5R7fWgWE75KSOwAzGEzahf6uXYUlxHlDsKsmuPuYBYiq6DUY7OLkvmNV2sUZ32bb
         2n47Lssq7gZHT9QGE5Vr8wHkuID7kXqu8/yu81yQ=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157927803765.9990.6605889584171484852.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 17 Jan 2020 16:20:37 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] thermal: rcar_{gen3_}thermal: Remove temperature (2020-01-17T16:05:52)
  Superseding: [v2] thermal: rcar_{gen3_}thermal: Remove temperature (2020-01-17T15:22:40):
    [v2,1/2] thermal: rcar_thermal: Remove temperature bound
    [v2,2/2] thermal: rcar_gen3_thermal: Remove temperature bound


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
