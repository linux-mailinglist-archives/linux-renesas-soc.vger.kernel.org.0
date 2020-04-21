Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46B511B28DF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2020 16:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728717AbgDUOAo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Apr 2020 10:00:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:58830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728285AbgDUOAn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Apr 2020 10:00:43 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587477643;
        bh=6RMsTF+2z+zocVNMnzSGYCoiMEMxdQo3Uu/Zs4GEygs=;
        h=Subject:From:Date:To:From;
        b=JPsUTEDHzC1ydUNv1QoyZmSUEST69spOdGiplOb7N1PyXZkHvw/Hou65epPnDayNY
         VkJ5ry0WuXT+L85GRtUk4xkrkNWz1ejHubi6ciPjQSxopkM2ZgoEmjVuA0ql7e5yA2
         TghyvlBUlKRuKt+1x31f84C0LMfbQGl0fYIg9KI0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158747764349.24548.4790783976886671479.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 21 Apr 2020 14:00:43 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v8] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC (2020-04-21T13:57:37)
  Superseding: [v7] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC (2020-04-13T20:23:48):
    [v7,1/6] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
    [v7,2/6] ivtv-ioctl.c: Do not initialize the reserved field of struct v4l2_fmtdesc
    [v7,3/6] media: v4l2: Extend VIDIOC_ENUM_FMT to support MC-centric devices
    [v7,4/6] rcar-vin: Make use of V4L2_CAP_IO_MC
    [v7,5/6] staging/intel-ipu3: Make use of V4L2_CAP_IO_MC
    [v7,6/6] vimc: Make use of V4L2_CAP_IO_MC


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
