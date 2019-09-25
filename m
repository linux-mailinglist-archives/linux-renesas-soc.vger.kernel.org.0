Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EDDF9BDF0B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Sep 2019 15:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391614AbfIYNdA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Sep 2019 09:33:00 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:58567 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391613AbfIYNdA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Sep 2019 09:33:00 -0400
IronPort-SDR: S3GEvS/c5joOftr2zCT8j1JB/1bsRN84+3LAkZwptHkFSzFGVUs3+n1zRe8lhr+sjI5Tbv1fx0
 rNQjuQ+mVNwnMOFO01VujnZzPPMaOJ1GHS5jB+IjoZ8lBtlULlkXT1AxWWYPAKzav3iAAkRL3S
 tJZMwyljxMr+B2misWdabCMD1U3QiUYNfe8Uljr4t2n2UA2ImyFGEX/GsYcpUp4NrFjI0eKLvS
 ryOVJVLqzWXLwt0R72VufjYw0r/+HrAjAZ8fy2cBPYLRlw0OO7zYBhHWbYaDSxxp/ryUhFAt1V
 uUU=
X-IronPort-AV: E=Sophos;i="5.64,548,1559548800"; 
   d="scan'208";a="41625381"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa2.mentor.iphmx.com with ESMTP; 25 Sep 2019 05:32:59 -0800
IronPort-SDR: VBiUJnzZLB/6RpjsCA5Q3ptfHMJzgF/pqiUrp1Hl0Bz8qHBuDaOhqW5xSB18lF7UB27iBiCFBe
 hbXFnjcjuPQ/A/Y4Y8nGrnPAAdJsA0HL3EZlv+Br807DF3C0lJXKg3KINCHqzPJmvSnmHYwmfW
 yFNbe6+xO+Uvsi6D/DF5ShJke/Cw1g5evCNpIuRbEX9kMx1v2PrN4msYwWbKi3Q794eaiLgy4Q
 gZjjsPC5ntRAFXXKptAnvT13k6jHaymARZk3sHpohjdkCq7uhH8k/8JPkYmnCPQMN/WcndaVou
 vzI=
Date:   Wed, 25 Sep 2019 15:32:42 +0200
From:   Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
To:     <fweisbec@gmail.com>, <tglx@linutronix.de>, <mingo@kernel.org>,
        <peterz@infradead.org>
CC:     <erosca@de.adit-jv.com>, <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH V2 1/1] tick: broadcast-hrtimer: Fix a race in bc_set_next
Message-ID: <20190925133242.GA4188@bala-ubuntu>
References: <alpine.DEB.2.21.1909232041080.1934@nanos.tec.linutronix.de>
 <20190925115541.1170-1-balasubramani_vivekanandan@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190925115541.1170-1-balasubramani_vivekanandan@mentor.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

+ Peter Zijlstra, linux-renesas-soc

