Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6658FAE5F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2019 11:20:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfKMKUw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 05:20:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:53326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726340AbfKMKUv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 05:20:51 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573640451;
        bh=3bYBr1ZH7kaHYj8iNDZvViQ28dW3SBpI/m0+encuV84=;
        h=Subject:From:Date:To:From;
        b=VmGeWlUTcJexnt2NySnc5ayxrfeSRo/NQZUmoAjujdsiewlRH4dz6RDXfhbgL3Xae
         O12j/Z+lJrMpulrKLT1P9HbS2dKhm62knvvXIb18GQRdNTK9r9W9l4O54Ds3r2inYT
         qMUEUEUShnwTurt9mJZarwimqMGBR+H7ATVUc0+I=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157364045147.17627.16917487911066458129.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 13 Nov 2019 10:20:51 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v7] drm: rcar-du: Add Color Management Module (CMM) (2019-11-13T10:05:49)
  Superseding: [v6] drm: rcar-du: Add Color Management Module (CMM) (2019-10-16T08:55:40):
    [v6,1/8] dt-bindings: display: renesas,cmm: Add R-Car CMM documentation
    [v6,2/8] dt-bindings: display, renesas,du: Document cmms property
    [v6,3/8] drm: rcar-du: Add support for CMM
    [v6,4/8] drm: rcar-du: kms: Initialize CMM instances
    [v6,5/8] drm: rcar-du: crtc: Control CMM operations
    [v6,6/8] drm: rcar-du: crtc: Register GAMMA_LUT properties
    [v6,7/8] arm64: dts: renesas: Add CMM units to Gen3 SoCs
    [v6,8/8] drm: rcar-du: kms: Expand comment in vsps parsing routine


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
