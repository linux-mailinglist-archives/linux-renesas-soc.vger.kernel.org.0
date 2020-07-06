Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A19482159BE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jul 2020 16:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729195AbgGFOkv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jul 2020 10:40:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:50318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729140AbgGFOkv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jul 2020 10:40:51 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594046450;
        bh=FCLb4ZgV8MIYITCOQifec2ba38eiagRt4aYgs1TITuA=;
        h=Subject:From:Date:To:From;
        b=cmJUbIEgf3YnqGig2tcR2AWiwoBMhc0R11AAEaY+x5UMHlyD9Wmvd5Gb7Fp/icivc
         jnYxzHAG46IbK5LHzaxvDw1gGdrFY7S2kdYdzFMJaOkbrQq9QRI3/umRL3o4wGF6sT
         oMvMdmACifqWhDiq6gBjNGh7/qeNUmlZrdEz4W5s=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159404645088.7684.7357178429343085704.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 06 Jul 2020 14:40:50 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] ravb: Add support for explicit internal clock delay configuration (2020-07-06T14:35:22)
  Superseding: [v1] ravb: Add support for explicit internal clock delay configuration (2020-06-19T19:15:49):
    [PATCH/RFC,1/5] dt-bindings: net: renesas,ravb: Document internal clock delay properties
    [PATCH/RFC,2/5] ravb: Split delay handling in parsing and applying
    [PATCH/RFC,3/5] ravb: Add support for explicit internal clock delay configuration
    [PATCH/RFC,4/5] arm64: dts: renesas: rcar-gen3: Convert EtherAVB to explicit delay handling
    [PATCH/RFC,5/5] arm64: dts: renesas: rzg2: Convert EtherAVB to explicit delay handling


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
