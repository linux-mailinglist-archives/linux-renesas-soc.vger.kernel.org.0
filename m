Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAA36BF463
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2019 15:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbfIZNvV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Sep 2019 09:51:21 -0400
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:55410 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726676AbfIZNvV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Sep 2019 09:51:21 -0400
IronPort-SDR: /ovSRQvunZh27WpZGsdd0ikK/qNU++zT25mL0sLuV4saDeWEIoSl5Y8PRKwRU21Kekn5boCTko
 XwQpFdpwQjes2u2kfZ57xZj9beLcwfaTc6kBJYfGIWIbV8cSfc6OlnkDXCbTevqAXOMHXeCwMx
 5XGCXJMhVkzhamroSHLdoISYMH8VbtxWp9Wz0NPy68uEdPW+/zzLy23GDH4Lb018igg2VcwR4d
 GI1QdF7wQi4wfC9p9umMaX5K+i8fSFvKWv4e4enmnbC61JyZNwRIpU31g4vgTuMRxjChx6F6hr
 gB4=
X-IronPort-AV: E=Sophos;i="5.64,552,1559548800"; 
   d="scan'208";a="43527454"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa1.mentor.iphmx.com with ESMTP; 26 Sep 2019 05:51:20 -0800
IronPort-SDR: pzJRfO07caO5JlvQijHk+/2uO7hQxW6FTZEDHQOn4vTx7PBxocxLdRsILUTiojmncx8tk7gwmO
 SnLKUIUoVXM0orsK1J9AyMQ+v1Le5VYl5gJaD3Y4FBFdlk1AU0Go6G1MnrARnTO1BHtfE8z+mx
 LENY9R1Wz6mUEE7V8qbQh/KtFmYCcDiKpKm1+HHdRm4TCUxzvS70u6sNvC8VIe0aC28roE9pJ9
 RLSx/nk0p/r6OBoDOEExEHm/Jo7aLtNhTMQFt3sRPt1PnWhv4g6b1bva70KHsGzqaGoh/V9baF
 7lU=
From:   Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
To:     <fweisbec@gmail.com>, <tglx@linutronix.de>, <mingo@kernel.org>,
        <peterz@infradead.org>
CC:     <balasubramani_vivekanandan@mentor.com>, <erosca@de.adit-jv.com>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V3 1/1] tick: broadcast-hrtimer: Fix a race in bc_set_next
Date:   Thu, 26 Sep 2019 15:51:00 +0200
Message-ID: <20190926135101.12102-1-balasubramani_vivekanandan@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1909261144250.5528@nanos.tec.linutronix.de>
References: <alpine.DEB.2.21.1909261144250.5528@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-09.mgc.mentorg.com (139.181.222.9) To
 svr-ies-mbx-02.mgc.mentorg.com (139.181.222.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> I which way is this backtrace giving any useful information about the problem?

The intention of me including the callstack was to help anyone notice
this commit while searching using the prints from the callstack. I have
removed it if it is creating noise.

> Interesting. You claim authorship on that patch and then you put my
> SOB after yours just because you feel entitled to do so?

Apologies for that. My limited experience with sharing patches upstream
for review and fixing it, was the reason for that. I have included the
"Originally-by" in the updated patch shared.

> 1) Write a changelog which explains why the change is actually correct
Done. Please check the update. Let me know if I need to add more
details.

> 2) Not wreckage the formatting which I intentionally did for
> readability sake
Done.

> 3) Add 'Originally-by: Thomas Gleixner' or at least having the courtesy to
>    mention that this is not your work.
Done.

Regards,
Bala


