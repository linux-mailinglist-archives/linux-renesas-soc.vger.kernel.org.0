Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29CD147F03
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 12:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727625AbfFQKAR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 06:00:17 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:38810 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727545AbfFQKAR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 06:00:17 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E17D925AED3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2019 20:00:15 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id E600894024A; Mon, 17 Jun 2019 12:00:13 +0200 (CEST)
Date:   Mon, 17 Jun 2019 12:00:13 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: [ANNOUNCE] Renesas tree closing for v5.3
Message-ID: <20190617100008.zyg6y6qdtwetbtid@verge.net.au>
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

I would like to stop accepting non-bug-fix patches for v5.3 on Wednesday
17th April (this week) and get the last pull requests posted by the end of
next week.  This is in order for them to be sent before the release of
v5.2-rc6, the deadline set by the ARM SoC maintainers.  As patches should
ideally progress from the renesas tree into linux-next before sending pull
requests there is a few days lead time involved.

Once the tree has closes for v5.3 it is intended that patches
will start being accepted for v5.4.

Thanks,
Simon
