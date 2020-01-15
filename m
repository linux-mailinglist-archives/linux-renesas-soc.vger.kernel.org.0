Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B770F13B8E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2020 06:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbgAOFUf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jan 2020 00:20:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:58586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725957AbgAOFUe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jan 2020 00:20:34 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579065634;
        bh=OZjwwfDj8UWNoo262THjPdIJFUdmrO96xMDfijlC1Xo=;
        h=Subject:From:Date:To:From;
        b=mNF3B1XWMkeXePooP+7CzIR3zkb3BcQ4KSPhK4QfegFW04oEc+C6RLIARp3GJ6bXB
         yAEKrctWsHdCX/44NWeIkuH5zzWwCgP5hbEZVI/P+iBCeoVmEA7t+NlxtkOxYLkRaV
         deKAJeglgpG4jrJ1YoKJWn3Gy33UrGnFGF5DUK/8=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157906563441.28791.14496490488184417190.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 15 Jan 2020 05:20:34 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] ARM: dts: renesas: Add missing ethernet PHY reset GPIO on Gen2 reference boards (2020-01-15T05:12:25)
  Superseding: [v1] ARM: dts: renesas: Add missing ethernet PHY reset GPIO on Gen2 reference boards (2020-01-12T19:13:15):
    [RFC] ARM: dts: renesas: Add missing ethernet PHY reset GPIO on Gen2 reference boards


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
