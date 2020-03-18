Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32DFC189D2B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2020 14:40:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbgCRNkh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Mar 2020 09:40:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:38276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726796AbgCRNkh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Mar 2020 09:40:37 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584538837;
        bh=eEc6cCIvXU3IDzUGS1RDVHASAPEDmll8psGuNUlWD38=;
        h=Subject:From:Date:To:From;
        b=zRPBlCWTL913LkJvaLKcZdiLoRJPFTRC9V2a5HXNoIliJ8YJxv+7B+M6NPw34okGv
         ecu4RgeHGjOE4hT9puUkmIjxBbOWWH+D6KP8FiybzIEnpyDpMQSfDs+tqq8JUzJ7U4
         Z/MDNqQ1OwfN9iXChHKiRS/ssRfQreu+fZK1Jsl8=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158453883700.28917.14975690180732652117.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 18 Mar 2020 13:40:37 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v5] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC (2020-03-18T13:25:09)
  Superseding: [v3] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC (2020-01-12T23:24:53):
    [v3,1/5] v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
    [v3,2/5] rcar-vin: Use default VIDIOC_{G,S}_{INPUT,OUTPUT} handler
    [v3,3/5] staging/intel-ipu3: Use default VIDIOC_{G,S}_{INPUT,OUTPUT} handler
    [v3,4/5] rcar-vin: Make use of V4L2_CAP_IO_MC
    [v3,5/5] staging/intel-ipu3: Make use of V4L2_CAP_IO_MC


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
