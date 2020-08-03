Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 366D023A3BA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Aug 2020 14:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725965AbgHCMA4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Aug 2020 08:00:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:37006 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726370AbgHCMAy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Aug 2020 08:00:54 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596456043;
        bh=Du9OQpd/VOGf/iA7IlXDEvI2jIkyD8HIhsY9DMglglQ=;
        h=Subject:From:Date:To:From;
        b=QxWgX6iK53U6LyvfC9yIIVInhCHMXDWb19QNVZAj7I2gz5tUMfol5+c3xRTuyWmH/
         nhmzH8b2DgFulQ6ANQzuLiSuu2DueTMdXliK7DuzWN/Yw1k4+NpIKSdeV5XgdJWDlJ
         UVDGkQduOp7+YcpqPdonyDfjd0ouBLXYJP/GRf9E=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159645604358.8465.16006197297804602029.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 03 Aug 2020 12:00:43 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] media: i2c: ov772x: Enable BT656 mode and test pattern support (2020-08-03T11:39:10)
  Superseding: [v1] media: i2c: ov772x: Enable BT656 mode and test pattern support (2020-07-24T15:08:14):
    [1/2] media: i2c: ov772x: Add support for BT656 mode
    [2/2] media: i2c: ov772x: Add test pattern control


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
