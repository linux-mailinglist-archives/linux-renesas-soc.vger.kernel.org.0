Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF6BF26CD8E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 23:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726298AbgIPVBW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Sep 2020 17:01:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:41722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726506AbgIPVAr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 17:00:47 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600290046;
        bh=Y+QwZLzkpr7CMdb2Whe+5i+8C+mW/g40WAoQyGw6mrA=;
        h=Subject:From:Date:To:From;
        b=SL3MBaG4wxkvsnGb9fuSvLIYvlTidiMBe0qlWeaW69EkDVvxBD3Bx7RmAAaJrPfQv
         SLai1oD0qPIxQydFJyvR5BQoEBodY+E2uDhX8vNcORuq2w8k7lMfHLarb0bQQdzKIH
         TvXlDzQ8smCH8C2x5QEKatd1tjkd4Eh1YNsRB0PU=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160029004676.30271.5265706871638675638.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 16 Sep 2020 21:00:46 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] media: i2c: max9286: Fix async subdev size (2020-09-16T14:27:19)
  Superseding: [v2] media: i2c: max9286: Fix async subdev size (2020-09-15T12:39:14):
    [v2] media: i2c: max9286: Fix async subdev size


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
