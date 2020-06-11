Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5E81F6C15
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2020 18:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbgFKQUk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Jun 2020 12:20:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:60060 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725782AbgFKQUk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Jun 2020 12:20:40 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591892440;
        bh=Ft7mNhAe4nANqwizRX8DwX1JBU0kn9CaT547nkFfMbA=;
        h=Subject:From:Date:To:From;
        b=TFwdRHIwh2Oxl0xY68va5H7ojwbHlM7evcx/aYEoZbv+SGbAhbB1pg2SODXGeaYQz
         vtOjXe1zZNFWkKB8OfAsCaUdulISOJX9ynglMBX3MI+GWquCFs0iA+oivY8puXzQWS
         F/mYRYevqHBzf/pQ3HkQDH4nhggIFhnAbwGRkT/I=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159189244017.704.11502669910200080396.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 11 Jun 2020 16:20:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] v4l2-subdev: Introduce [g|s]et_mbus_format pad op (2020-06-11T16:16:42)
  Superseding: [v3] v4l2-subdev: Introduce [g|s]et_mbus_format pad op (2020-05-14T16:45:31):
    [v3,1/8] media: v4l2-subdv: Introduce get_mbus_config pad op
    [v3,2/8] media: i2c: Use the new get_mbus_config pad op
    [v3,3/8] media: i2c: ov6650: Use new [g|s]_mbus_config op
    [v3,4/8] media: pxa_camera: Use the new set_mbus_config op
    [v3,5/8] media: v4l2-subdev: Deprecate g_mbus_config video op
    [v3,6/8] media: i2c: adv748x: Adjust TXA data lanes number
    [v3,7/8] media: i2c: adv748x: Implement get_mbus_config
    [v3,8/8] media: rcar-csi2: Negotiate data lanes number


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
