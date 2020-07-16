Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E49292225FC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jul 2020 16:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728345AbgGPOkp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Jul 2020 10:40:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:56860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728237AbgGPOkp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Jul 2020 10:40:45 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594910445;
        bh=p/5MheqAR1e5KRzYVePypjOzvbUgBvsKXzYrU26uXKU=;
        h=Subject:From:Date:To:From;
        b=2jSqwHvQDTth65XDDzDwRWfMQYzMsninlbgAcuUPCe3RD/EN9htTu6GHMXtr6MJaX
         W5a0ZH+3VNpSc8+RcZO5sDTHyaxHJ3V822C05RVTpG6+WTX+0Mk8VjInLWRq5dumVt
         Frr2G268QsZrZNfbyPhTPraah8r1zsy9jBkU5YQg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159491044515.5815.129337417536378371.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 16 Jul 2020 14:40:45 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v7] v4l2-subdev: Introduce [g|s]et_mbus_format pad op (2020-07-16T14:27:03)
  Superseding: [v6] v4l2-subdev: Introduce [g|s]et_mbus_format pad op (2020-07-14T13:58:03):
    [v6,1/9] media: v4l2-subdev: Introduce [get|set]_mbus_config pad ops
    [v6,2/9] media: i2c: Use the new get_mbus_config pad op
    [v6,3/9] media: i2c: ov6650: Use new [get|set]_mbus_config ops
    [v6,4/9] media: pxa_camera: Use the new set_mbus_config op
    [v6,5/9] media: v4l2-subdev: Remove [s|g]_mbus_config video ops
    [v6,6/9] staging: media: imx: Update TODO entry
    [v6,7/9] media: i2c: adv748x: Adjust TXA data lanes number
    [v6,8/9] media: i2c: adv748x: Implement get_mbus_config
    [v6,9/9] media: rcar-csi2: Negotiate data lanes number


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
