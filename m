Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC93121F35C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2020 16:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbgGNOAq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Jul 2020 10:00:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:37076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbgGNOAq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Jul 2020 10:00:46 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594735246;
        bh=ICtTlO9Acy6HtQ1v1t1Ytavi6yhvX9/tEDcehzFBdtU=;
        h=Subject:From:Date:To:From;
        b=uxMPpNTxaajfI5k76+uenQmb/OByxoc0LcVofwXc1ozyjx1DN3px123ehv5Bh2shb
         wLMAd4nRpzY9Hak+ITsSORtsoRGSZDr33qrih9anQzq3tkAYRY9az8CLjW2gD49mZ7
         FE+AnoLyijDZoLOadSbjJ/3kIu+CNyMhEB4o/XEc=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159473524629.19079.11406680159444423853.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 14 Jul 2020 14:00:46 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v6] v4l2-subdev: Introduce [g|s]et_mbus_format pad op (2020-07-14T13:58:03)
  Superseding: [v5] v4l2-subdev: Introduce [g|s]et_mbus_format pad op (2020-06-16T14:12:35):
    [v5,01/10] media: v4l2-subdev: Introduce [get|set]_mbus_config pad ops
    [v5,02/10] media: i2c: Use the new get_mbus_config pad op
    [v5,03/10] media: i2c: ov6650: Use new [get|set]_mbus_config ops
    [v5,04/10] media: pxa_camera: Use the new set_mbus_config op
    [v5,05/10] media: v4l2-subdev: Remove [s|g]_mbus_config video ops
    [v5,06/10] staging: media: imx: Update TODO entry
    [v5,07/10] media: i2c: adv748x: Adjust TXA data lanes number
    [v5,08/10] media: i2c: adv748x: Implement get_mbus_config
    [v5,09/10] media: rcar-csi2: Negotiate data lanes number


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
