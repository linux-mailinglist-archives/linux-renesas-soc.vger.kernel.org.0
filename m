Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C94414BFC0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 19:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730056AbfFSRgE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 13:36:04 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:49120 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726330AbfFSRgD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 13:36:03 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D4BEA25B262
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2019 03:36:01 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id F3561E22074; Wed, 19 Jun 2019 19:35:57 +0200 (CEST)
Date:   Wed, 19 Jun 2019 19:35:57 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: [ANNOUNCE] Renesas tree closed for v5.3
Message-ID: <20190619173557.rsdr5xyvgyshlfku@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organisation: Horms Solutions Ltd.
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

I would like to stop accepting non-bug-fix patches for v5.3 and get
the last pull requests posted by the end of this week. This is in order
for them to be sent before the release of v5.2-rc6, the deadline set by the
ARM SoC maintainers.  As patches should ideally progress from the renesas
tree into linux-next before sending pull requests there is a few days lead
time involved.

I have tried to accept all patches that I felt were ready, but I did feel
that those currently marked as under review on patchwork need a bit more
time, if only for review by people other than myself.

It is intended that patches will be queued up v5.4 as they become ready.

