Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A93926E319
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Sep 2020 20:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgIQSA7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Sep 2020 14:00:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:48912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726601AbgIQSAr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 14:00:47 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600365647;
        bh=7kp/Rft+Wp4zXalwc+bF1+TBkl3Q4FlGqVIFT7TgGPk=;
        h=Subject:From:Date:To:From;
        b=p200FeUusOUQvnUJ7uny5ioGh7+0CD03LT6k89AYP2CrULm5qWi0O1RgkC+Xon50v
         MVaT/C/l6ZDyrb2GNusEQEVm8d33jK1YClQFYYdaUGuNtggn8lXvpP6ngHolPNvdvi
         JT4Pyft/NsGaSHYkT1IB8pDVTJVqgfuvd2UAR6qU=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160036564754.29915.17164770983832348767.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 17 Sep 2020 18:00:47 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v6] media: i2c: ov772x: Enable BT.656 mode and test pattern support (2020-09-17T17:42:23)
  Superseding: [v5] media: i2c: ov772x: Enable BT.656 mode and test pattern support (2020-09-15T17:42:32):
    [v5,1/3] media: i2c: ov772x: Parse endpoint properties
    [v5,2/3] media: i2c: ov772x: Add support for BT.656 mode
    [v5,3/3] media: i2c: ov772x: Add test pattern control


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
