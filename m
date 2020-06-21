Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 861C020278B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Jun 2020 02:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728524AbgFUAUn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 20 Jun 2020 20:20:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:54018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728520AbgFUAUn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 20 Jun 2020 20:20:43 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592698843;
        bh=NbXn8/fQtqkZKXqWZuxArP8GsB3qAvnOhcWYTKVufCY=;
        h=Subject:From:Date:To:From;
        b=yoTZ/hPbEwTbMm9ZyajuxRWz9vQec+3Gggu3zae24ww0NWdqCezFuyZYOJxcudUG3
         Is0efjFUEWCUGOP5dpgpS/MWret5Dyt+2X/mqVxBm0ZOpFsw0RS2wErENdBHz4EnMK
         vcCQDI+0mVD7UtyWTEvUkPyqO6Q9UtynJrWfYHuc=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159269884317.20016.8008934498320385479.git-patchwork-housekeeping@kernel.org>
Date:   Sun, 21 Jun 2020 00:20:43 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] media: v4l2-async: Accept endpoints and devices for fwnode matching (2020-06-21T00:00:25)
  Superseding: [v2] media: v4l2-async: Accept endpoints and devices for fwnode matching (2020-03-18T00:25:03):
    [v2,1/4] media: v4l2-async: Accept endpoints and devices for fwnode matching
    [v2,2/4] media: v4l2-async: Pass notifier pointer to match functions
    [v2,3/4] media: v4l2-async: Log message in case of heterogenous fwnode match
    [v2,4/4] media: v4l2-async: Don't check fwnode name to detect endpoint


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
