Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A84E91E41ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2020 14:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbgE0MUn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 May 2020 08:20:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:32934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726785AbgE0MUn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 May 2020 08:20:43 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590582043;
        bh=afmzRvGjIATJxAT6nhSJO6+t5omPQfpFP1UBQU++VL4=;
        h=Subject:From:Date:To:From;
        b=vZ4f7Uk0ApEh996Nx+PTJojWUSVOTKm3pJ7tWCLwF14v3MEBoFYWp5DEhUnUFkIGN
         kzLNFwGgXBAdJQWxtdGZVvH+0ZBdETCAfsCjXtO+eWt6s5eZ5eyAcVHW1nm6Kl/0f7
         j0t3cuwirWI+1tCTVFMyV/D9sD7TPfCrhezoo4I8=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159058204348.707.7276207514241878274.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 27 May 2020 12:20:43 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v5] media: rcar-vin: Enable MEDIA_BUS_FMT_SRGGB8_1X8 format (2020-05-27T12:16:47)
  Superseding: [v4] media: rcar-vin: Enable MEDIA_BUS_FMT_SRGGB8_1X8 format (2020-04-15T10:19:07):
    [v4,1/3] media: rcar-vin: Invalidate pipeline if conversion is not possible on input formats
    [v4,2/3] media: rcar-vin: Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format
    [v4,3/3] media: rcar-csi2: Add support for MEDIA_BUS_FMT_SRGGB8_1X8 format


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
