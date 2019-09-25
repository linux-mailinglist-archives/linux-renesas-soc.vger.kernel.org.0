Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23BD9BDFEB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2019 16:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730636AbfIYOVa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Sep 2019 10:21:30 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:59585 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726124AbfIYOVa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Sep 2019 10:21:30 -0400
IronPort-SDR: MnWQXBrBLyiRfxzkV5StlPTjLghvYM+LStaI59Qsryi1fz4KoO1W6o5Fu5PZDQ0Q4xvLPbboaS
 6PlgW6m9LqKeijdjk9VkbjsbHClX5KZ3xie+6RF3FFXLXQh1Jg5ajZOeTWy5shDuG6bCKcAGOj
 H5u2BAIAYRMIlbHT7T1xfg3tdDSGW4LtCT2/3Zk/K+YRzTryVH0CGRMuOo9UTtx++rxpubecCC
 B5zqM2trjkvCNwC2/CBkdux46HoKAX7oJAP1IZnVl0oGZo/Y2OlAeo8go+63doLKSxel1hu0Tk
 X/c=
X-IronPort-AV: E=Sophos;i="5.64,548,1559548800"; 
   d="scan'208";a="41681861"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 25 Sep 2019 06:21:29 -0800
IronPort-SDR: hqekn1t08ZqjQyEuo+SbW2dDhvXDgIu8Sa/70mJgJDo689BOFFjEqx6sxvqHqdJUjOChI6gyzJ
 i3TilqlNEwovcn6p70RXI/jPVn+z+aPYoeKNGhmfDFyEABCB7XGlSbdnkJq0c0ISzTP+tB7qJJ
 BN8llxvjg157RErRWzdpzOK3ybYbglhqxj4gjPArikKmks6zS9TyfBlXI2mzAl2AIURXr2/Rmt
 5RXfSl49wEyQ4ymkS5hhlcx6pe9a6M40v5EmuSlZKujXLQbZ5UqtF4s3LApUxHZe3Xt4fy4JQU
 qSw=
From:   Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
To:     <fweisbec@gmail.com>, <tglx@linutronix.de>, <mingo@kernel.org>,
        <peterz@infradead.org>
CC:     <balasubramani_vivekanandan@mentor.com>, <erosca@de.adit-jv.com>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 1/1] tick: broadcast-hrtimer: Fix a race in bc_set_next
Date:   Wed, 25 Sep 2019 16:20:28 +0200
Message-ID: <20190925142029.13648-1-balasubramani_vivekanandan@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190925115541.1170-1-balasubramani_vivekanandan@mentor.com>
References: <20190925115541.1170-1-balasubramani_vivekanandan@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-09.mgc.mentorg.com (139.181.222.9) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Sorry, I missed to fix few checkpatch warnings. Corrected it now


