Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A02951BD76F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2020 10:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726484AbgD2Ikk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Apr 2020 04:40:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:45420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726345AbgD2Ikk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Apr 2020 04:40:40 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588149640;
        bh=GbjhezGCYonpZxxz2BVdk9gNTKQOsFo22lptFU5tozY=;
        h=Subject:From:Date:To:From;
        b=qkLIQ+/FyClqp5UAq1PxPbiBUMQGmWnk1YM75Nj1w0Xh7CivvVJT22XpYrTbDtun9
         V+EZ9EMkqgqpJO8RhaRo8wy4pM1isUqUZAGyVI54ZG/+UP58wgH9zj0aTcFAV0S1UE
         H33k+xe+X5oEYIjDBPmLNXP7760ikmrc3rZJM9wg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158814964052.5283.3024618436979643446.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 29 Apr 2020 08:40:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v6] ARM: boot: Obtain start of physical memory from DTB (2020-04-29T08:21:20)
  Superseding: [v5] ARM: boot: Obtain start of physical memory from DTB (2020-04-15T15:34:09):
    [v5] ARM: boot: Obtain start of physical memory from DTB


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
