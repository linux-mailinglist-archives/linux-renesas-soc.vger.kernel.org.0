Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC6B1543A4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Feb 2020 13:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727511AbgBFMAh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Feb 2020 07:00:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:42518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727111AbgBFMAh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Feb 2020 07:00:37 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580990437;
        bh=6h90ulHoaViYe2tzxQNwGTRBu3wQ7su69ktEKkyynpI=;
        h=Subject:From:Date:To:From;
        b=1pb58qwqQ8cEEVWjD4M2VDkdZ7Pbe0cZcNM7nncUVuZE6Fgv/35Gfd6EYKeibXcED
         MO1eI3GqGLWgOb+IuMQFFaoVt3WZXgZ9crjb1BUspUvUHsozQKL0Y+zdv6wQ73LQgm
         pA2PdRhVuVp/URo42t6UK2/jIG7Pia5XuTTpYfis=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158099043703.22686.4712878564328909644.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 06 Feb 2020 12:00:37 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] USB: hub: Fix the broken detection of USB3 device in SMSC hub (2020-02-06T11:49:23)
  Superseding: [v3] USB: hub: Fix the broken detection of USB3 device in SMSC hub (2020-02-04T17:44:13):
    [v3] USB: hub: Fix the broken detection of USB3 device in SMSC hub


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
