Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 012921A9BA1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 13:02:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896700AbgDOLBz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Apr 2020 07:01:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:44168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896696AbgDOLBd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Apr 2020 07:01:33 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586948438;
        bh=EOoLPpHMivGWcEfCAaEZKqQ4Px9vk1x07beu9AIpGXA=;
        h=Subject:From:Date:To:From;
        b=EjGTC3cMcvXFH4FzBgxQde6pWUvrus0ORFBGeFwOsXbLzdu4y7SwtFFzUKJxbeQGx
         eY776jQ/UZIa6JL3kPJ8R0xMm3dZ65lG8fssVQhE8hNJUaC2rCVpfoqtn9cvWBR3jr
         2RVR0v22s2lbwKfw5OBNqskKdVb+G1aR1CZ1S2Os=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158694843869.27718.12909908095488914863.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 15 Apr 2020 11:00:38 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] v4l2-subdev: Introduce get_mbus_format pad op (2020-04-15T10:49:58)
  Superseding: [v1] v4l2-subdev: Introduce get_mbus_format pad op (2020-03-13T14:40:31):
    [1/4] media: i2c: adv748x: Adjust TXA data lanes number
    [2/4] media: v4l2-subdv: Introduce get_mbus_config pad op
    [3/4] media: i2c: adv748x: Implement get_mbus_config
    [4/4] media: rcar-vin: csi2: Negotiate data lanes number

Latest series: [v2] i2c: regroup documentation of bindings (2020-04-15T10:51:00)
  Superseding: [v1] i2c: regroup documentation of bindings (2020-03-30T00:22:20):
    i2c: regroup documentation of bindings


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
