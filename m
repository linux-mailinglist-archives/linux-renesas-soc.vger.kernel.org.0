Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EFAE26CC50
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 22:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbgIPUkx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Sep 2020 16:40:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:55682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726786AbgIPUks (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Sep 2020 16:40:48 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600288847;
        bh=YqjNp7PnHo99yNayFOQCYelU0KqLrLV16G5PDmBLJjE=;
        h=Subject:From:Date:To:From;
        b=B9jpwDGYpJ5fEWvQKCW5OhSYxjXbiE6lqd7VcKEvZ5YnitmztIjcyZ7zY20YtZ766
         PaWErVuJV6DISE7TOCKhQKAC8TniByOjh7tdovwCwxI4+oIfeL5IUEngQWCrtwYThd
         KJ+MrzftT0NvKAjMFqNQgAkqsG9sBqPu7m9a7OVc=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160028884754.14946.3325080610627180182.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 16 Sep 2020 20:40:47 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] Document r8a77990 DRIF support (2020-09-16T10:59:48)
  Superseding: [v1] Document r8a77990 DRIF support (2020-09-15T13:12:15):
    [1/3] MAINTAINERS: Add Fabrizio Castro to Renesas DRIF
    [2/3] media: dt-bindings: media: renesas,drif: Convert to json-schema
    [3/3] media: dt-bindings: media: renesas,drif: Add r8a77990 support


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
