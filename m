Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5C24223EFB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 17:00:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgGQPAr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 11:00:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:35028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726205AbgGQPAq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 11:00:46 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594998046;
        bh=WTpd8x8xMKfq3/tAyqjlg3mft3kEg3sv1zCYrAwMw1g=;
        h=Subject:From:Date:To:From;
        b=bxySyW5OqXjAlDAo4ucY//VVtqaT4pORzcsYoNz9KlVGMMzbS6TEhk7aQkBzmmrIh
         pov0MIiqyAfHFQxyvbaltgFwH0h15NpjFyCJm6yVULpsXPXoEfVrbi2/f71AgoFjue
         mlECuxE1TLkYt8Hkn/XeF725CYCS7QvvXR91d81c=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159499804598.26310.3989451888182299804.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 17 Jul 2020 15:00:45 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v8] v4l2-subdev: Introduce [g|s]et_mbus_format pad op (2020-07-17T14:53:14)
  Superseding: [v7] v4l2-subdev: Introduce [g|s]et_mbus_format pad op (2020-07-16T14:27:03):
    [v7,01/10] media: v4l2-subdev: Introduce [get|set]_mbus_config pad ops
    [v7,02/10] media: i2c: Use the new get_mbus_config pad op
    [v7,03/10] media: i2c: ov6650: Use new [get|set]_mbus_config ops
    [v7,04/10] media: pxa_camera: Use the new set_mbus_config op
    [v7,05/10] media: v4l2-subdev: Remove [s|g]_mbus_config video ops
    [v7,06/10] media: v4l2- mediabus: Add usage note for V4L2_MBUS_*
    [v7,07/10] staging: media: imx: Update TODO entry
    [v7,08/10] media: i2c: adv748x: Adjust TXA data lanes number
    [v7,09/10] media: i2c: adv748x: Implement get_mbus_config
    [v7,10/10] media: rcar-csi2: Negotiate data lanes number


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
