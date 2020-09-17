Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B63B026E086
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Sep 2020 18:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728451AbgIQQVy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Sep 2020 12:21:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:37240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728448AbgIQQUv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 12:20:51 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600359645;
        bh=7iXEFBYHJrPnOw66ShZofl18/Xnd4qVbQc2h/BSFyjY=;
        h=Subject:From:Date:To:From;
        b=SwBS57F4PGmhF0A/KAq3yumW4POhXZhd7+CX6bTR1xHEU/aDwxnwTl6HgtBSPW3NW
         2aW/Yo2dcdWkZJv0JjlNFq/J96QlmbBmLHN5z4JQUoh7DMG+4WA0kr4Z+HBaNByERW
         0U1WBmXWm/GS3/RAqo9f/vI9q+j+jc0tjrGaMpPU=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160035964546.14442.4764871674211140342.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 17 Sep 2020 16:20:45 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] media: v4l2-fwnode: Return -EINVAL for invalid bus-type (2020-09-17T16:08:47)
  Superseding: [v1] media: v4l2-fwnode: Return -EINVAL for invalid bus-type (2020-09-15T15:55:44):
    media: v4l2-fwnode: Return -EINVAL for invalid bus-type


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
