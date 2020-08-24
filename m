Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF8924F248
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Aug 2020 08:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726024AbgHXGAk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Aug 2020 02:00:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:35480 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbgHXGAk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Aug 2020 02:00:40 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598248840;
        bh=hnQObuTCmEQuEGNd7VBcV8jM2fouSMWokqZHdePwEDw=;
        h=Subject:From:Date:To:From;
        b=KuWl7jeO3JFzCWibytjsJb8tk+8xxQ32jfpLP6ssikkgFO9rh5rTcgzq64RBkNY1o
         h5f7oUUjHKbAu+Okntl2oAhcZN3h7jlotLABbsuWE1N93M747AISLsKBHo5AD5HMvh
         Ao7UpwCuByrUY5vPGtSEdeZl122RvcnCeTbCf2Dw=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159824883998.8703.15968790175404839636.git-patchwork-housekeeping@kernel.org>
Date:   Mon, 24 Aug 2020 06:00:39 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] pinctrl: sh-pfc: collect Renesas related CONFIGs in one place (2020-08-24T05:49:20)
  Superseding: [v3] pinctrl: sh-pfc: collect Renesas related CONFIGs in one place (2020-08-24T02:29:28):
    [v3,1/4] pinctrl: sh-pfc: tidyup Emma Mobile EV2
    [v3,2/4] pinctrl: sh-pfc: collect Renesas related CONFIGs in one place
    [v3,3/4] pinctrl: sh-pfc: align driver description title
    [v3,4/4] pinctrl: sh-pfc: tidy up driver description title


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
