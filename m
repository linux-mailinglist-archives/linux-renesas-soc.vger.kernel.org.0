Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F05B41D228B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2020 01:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732062AbgEMXAm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 May 2020 19:00:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:38136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731815AbgEMXAm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 May 2020 19:00:42 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589410842;
        bh=lmfEPmxjgFWtBYQDFxmMtVP0dMaszkkm4aX3Y7VLruw=;
        h=Subject:From:Date:To:From;
        b=Bsw9lpMExzBdR81w4zH1mylMT6TmTyFoZE2fmdqqOokdQiH9OIX4PpfncqTsOi5n0
         8cqzwsqs2QO8kmmR9VdwoDD/DdEwfxGUlPifmTWYZwcZZH/fmgEqNedY2ul7oa530a
         kTiU3JKrtmoR97pbG/mQlpjcEg/vewqJ5x3WHoeg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158941084199.20991.17473035794801317989.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 13 May 2020 23:00:41 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] drm: plane: Verify that no or all planes have a zpos property (2020-05-13T22:58:35)
  Superseding: [v1] drm: plane: Verify that no or all planes have a zpos property (2020-04-04T18:12:53):
    drm: plane: Verify that no or all planes have a zpos property


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
