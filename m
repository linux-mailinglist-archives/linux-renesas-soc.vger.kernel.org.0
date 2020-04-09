Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1501A307A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Apr 2020 09:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbgDIHwV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Apr 2020 03:52:21 -0400
Received: from de-out1.bosch-org.com ([139.15.230.186]:55426 "EHLO
        de-out1.bosch-org.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbgDIHwV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Apr 2020 03:52:21 -0400
Received: from fe0vm1650.rbesz01.com (unknown [139.15.230.188])
        by si0vms0216.rbdmz01.com (Postfix) with ESMTPS id 48yYJf53Fqz1XLm4Y;
        Thu,  9 Apr 2020 09:52:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=key3-intmail; t=1586418738;
        bh=BtJRNwRAyEkmeHBCpZdNfLdAWJrJzlNgVgmbK5HnSR8=; l=10;
        h=From:Subject:From:Reply-To:Sender;
        b=Dmn/VPU86LbdUd8Cmzo+dr4KJfd+zYf9nt+sK5i9xfBmhJ8R0a4yhxW9N4PMiqu41
         eSB7mgdoaVlAq+MTH+4ePeKwJGp72eLXTOcn5ymPq3gFb7HFfUQOW1x6l6vlEhcidS
         6Ro3YIQAzgQUBSfd4eofu7qNJ9SpblWY224Dwi+Y=
Received: from si0vm02576.rbesz01.com (unknown [10.58.172.176])
        by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 48yYJf4lnZz2hW;
        Thu,  9 Apr 2020 09:52:18 +0200 (CEST)
X-AuditID: 0a3aad0d-8f3ff700000068f0-db-5e8ed4328811
Received: from fe0vm1651.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by si0vm02576.rbesz01.com (SMG Outbound) with SMTP id 6B.0E.26864.234DE8E5; Thu,  9 Apr 2020 09:52:18 +0200 (CEST)
Received: from SI-HUB2000.de.bosch.com (si-hub2000.de.bosch.com [10.4.103.108])
        by fe0vm1651.rbesz01.com (Postfix) with ESMTPS id 48yYJf38DDzvl6;
        Thu,  9 Apr 2020 09:52:18 +0200 (CEST)
Received: from HI-Z0EVG.hi.de.bosch.com (10.34.218.219) by
 SI-HUB2000.de.bosch.com (10.4.103.108) with Microsoft SMTP Server id
 15.1.1979.3; Thu, 9 Apr 2020 09:52:18 +0200
From:   Dirk Behme <dirk.behme@de.bosch.com>
To:     <linux-renesas-soc@vger.kernel.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC:     <geert+renesas@glider.be>, <dirk.behme@de.bosch.com>,
        <Shashikant.Suguni@in.bosch.com>
Subject: [PATCH] [RFC] ravb: On timeout disable IRQs to stop processing
Date:   Thu, 9 Apr 2020 09:52:15 +0200
Message-ID: <20200409075215.3808-1-dirk.behme@de.bosch.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.34.218.219]
X-Brightmail-Tracker: H4sIAAAAAAAAA22Sb0xTVxjGOfeWcqlcuJQiLx2oK84sbGWlBWED2ZYlSKLTbWbLskC1jDva
        AW3TWwTZBxDRuSIdkA2hSCEoY4MaGuWPgIO1xkSQuYqECiyAhrjSEDFxOAgw1qYg/bBv732e
        83ufc55cAuf+7McnFEotrVHKcgVsDovzztVIoXhMLxU1PNmV2FBfjRK75p9iiSNtk37v4Wmz
        P25gaVW/C9OeX9v1Ef4FJzmLzlWcpDVvpZzgyGvtP2HqSXFh6aM2rAQtvqFD/gRQcTD927iv
        DnEILlWHwYMnjX6ej5sIzlsaN50OBCs1w7gbYVPR0Ft53s8986jjUGYuY7tnnEqHlqkHLp0g
        QqiD0L0gc8ssai/0znf7umeSSoK7Zy+zPcm7oaZdh3n0YBiqm2N51uyGM131uGcGsDgcuOf8
        q2Ay9PpWoiCDF2LwQgxeSBPC29BORiE6mScSxyfsj9Fk0kyRKDbmS1XeNeRpkryBenXPYqwI
        I5AVxROYIJQcvqWXcgMzVVmn5DJGflyTn0szAj5ZvPBdBjfkpczkZ+YpGEahUloRELiARx4q
        rZByySzZqSJao/JgVvQKwRKEkaGcb6RcKlumpXNoWk1rttwkghAAaRh1BQZr6Gy68CtFrnbL
        FkSSyMfHh7vT2/GOxQh/K5IQAa5sh821gmTUsjxGkb2Jh3tw7pa6jQ6jD4hV85VmnMtSqpQ0
        P4zkua9AuU/K85Uvb8CPIMXtrkeFehnbW5zIjggkCCFj77vgANc/up0NZIm7ruBNcRsSX3Yx
        1PUgaF7PBWOpBow3lhB0NNoxqLc5MVie/RaHydUVHEzmEhactVeyYPlCFQs6b5eywdB/gQ1r
        PWY23DFOs6F2qd8fHjbZOOAYuRMAU/fuB8DYi79IGPq7LBC+76nmwrLJwYOVwZJQGDhXEQob
        7TqA57dqAYYs1nBYW58Nh6mR2xGwZpmKAOOLXyLB/M/cHqerVsxV63hmubtWrUz7P7Vuqttv
        45dgUfpnkvDi8o2HfIFP/6C0b8ymG9iXcqyTeF1vnFEXpb7v/PrxaHpWwf6PC3JOdO2YT0mJ
        UbaOvHtEePGu8cofcZGDQfZ/RY0552IyFjseO8onQ+Klk486M6Bf3WHLKAg8zU6VfXipT3+0
        L/Vw96H+0eSFoDBT7cx0yycHkxEdx3MUoaP7inpmlqJnrg8kZVUdsbyddEAy8atu3Jq9pzCw
        iUMWfMpGrUi9Wu2skIgkorkdn9c0P7WN198LS5v/bKnhmNO2KCm+uvqDqVXJEibPyfWvna5Q
        8Q9MT6yfwQMXSEtU1M1q85973wxIXZ5It9cJfTUJFTqRKUFrQhdbEqoELEYui43GNYzsP51Z
        1R+7BAAA
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Analyzing [1] it seems there is a race condition where ravb_start_xmit()
can be called from interrupt while tx skbuffs are being torn down in
the scheduled timeout handling. The actual timeout work is done in
ravb_tx_timeout_work() during which the tx skbuffs are torn down via
invocations of ravb_ring_free(). But there seems to be no flag to tell
the driver it is shutting down so it continues to use the ring buffer
when it should not.

Fix this by disabling the interrupts in the timeout handler.

[1]

-- cut --
ravb e6800000.ethernet ethernet: transmit timed out, status 00000000, resetting...
ravb e6800000.ethernet ethernet: failed to switch device to config mode
Unable to handle kernel NULL pointer dereference at virtual address 00000018
Mem abort info:
  Exception class = DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
Data abort info:
  ISV = 0, ISS = 0x00000046
  CM = 0, WnR = 1
user pgtable: 4k pages, 48-bit VAs, pgd = ffff80065622f000
[0000000000000018] *pgd=00000006962a7003
, *pud=00000006962a8003
, *pmd=0000000000000000
Internal error: Oops: 96000046 [#1] PREEMPT SMP
Modules linked in:
...
Process Thread1 (pid: 3132, stack limit = 0xffff000027dd0000)
CPU: 2 PID: 3132 Comm: Thread1 Tainted: G        WC 4.14.130-ltsi-g28acae87 #1
Hardware name: Board based on r8a7796 (DT)
task: ffff80064f2aaa00 task.stack: ffff000027dd0000
PC is at ravb_start_xmit+0x138/0x5a0
LR is at ravb_start_xmit+0x40/0x5a0
pc : [<ffff0000084d6324>] lr : [<ffff0000084d622c>] pstate: 600001c5
sp : ffff000027dd3550
x29: ffff000027dd3550
x28: 0000000000000076
x27: ffff80061035ff00
x26: ffff000027dd3694
x25: ffff80069624f800
x24: ffff80069624f000
x23: 0000000000000003
x22: 0000000000000001
x21: ffff80069624f000
x20: 0000000000000000
x19: ffff80069624f000
x18: 0000000000000014
x17: 0000ffff9b90ddb0
x16: ffff00000867d07c
x15: 0000155107b31031
x14: 000409000c000000
x13: 0000000003000001
x12: 0100050010000001
x11: 0000000003000001
x10: 0100010010000001
x9 : 20000000000000c0
x8 : 0000000000000000
x7 : ffff8006656f9388
x6 : 0000000000000002
x5 : 0000000000000000
x4 : ffff8006656f929c
x3 : ffff000027dd3694
x2 : 0000000000000018
x1 : 0000000000000000
x0 : 0000000000000003
Call trace:
Exception stack(0xffff000027dd3410 to 0xffff000027dd3550)
3400:                                   0000000000000003 0000000000000000
3420: 0000000000000018 ffff000027dd3694 ffff8006656f929c 0000000000000000
3440: 0000000000000002 ffff8006656f9388 0000000000000000 20000000000000c0
3460: 0100010010000001 0000000003000001 0100050010000001 0000000003000001
3480: 000409000c000000 0000155107b31031 ffff00000867d07c 0000ffff9b90ddb0
34a0: 0000000000000014 ffff80069624f000 0000000000000000 ffff80069624f000
34c0: 0000000000000001 0000000000000003 ffff80069624f000 ffff80069624f800
34e0: ffff000027dd3694 ffff80061035ff00 0000000000000076 ffff000027dd3550
3500: ffff0000084d622c ffff000027dd3550 ffff0000084d6324 00000000600001c5
3520: ffff00000921d008 ffff8006159b0d00 0000ffffffffffff ffff0000084d622c
3540: ffff000027dd3550 ffff0000084d6324
[<ffff0000084d6324>] ravb_start_xmit+0x138/0x5a0
[<ffff000008699d60>] dev_hard_start_xmit+0xa8/0x24c
[<ffff0000086c51c0>] sch_direct_xmit+0xb0/0x1a8
[<ffff0000086c54cc>] __qdisc_run+0x214/0x2ec
[<ffff00000869a348>] __dev_queue_xmit+0x35c/0x5b4
[<ffff00000869a5b0>] dev_queue_xmit+0x10/0x18
[<ffff000000b9765c>] register_vlan_dev+0xc74/0x10f8 [8021q]
[<ffff000008699d60>] dev_hard_start_xmit+0xa8/0x24c
[<ffff00000869a438>] __dev_queue_xmit+0x44c/0x5b4
[<ffff00000869a5b0>] dev_queue_xmit+0x10/0x18
[<ffff0000086a5b9c>] neigh_connected_output+0xc0/0xe4
[<ffff0000086d6bd8>] ip_finish_output2+0x3c0/0x3fc
[<ffff0000086d8178>] ip_finish_output+0xf8/0x1c4
[<ffff0000086d8b74>] ip_mc_output+0x258/0x308
[<ffff0000086d8400>] ip_local_out+0x44/0x54
[<ffff0000086d9594>] ip_send_skb+0x1c/0xa8
[<ffff0000086fea4c>] udp_send_skb+0x11c/0x244
[<ffff000008701084>] udp_sendmsg+0x534/0x6bc
[<ffff00000870b390>] inet_sendmsg+0x40/0xe0
[<ffff00000867b588>] sock_sendmsg+0x3c/0x58
[<ffff00000867bf18>] ___sys_sendmsg+0x228/0x278
[<ffff00000867d03c>] __sys_sendmsg+0x58/0x98
[<ffff00000867d08c>] SyS_sendmsg+0x10/0x20
Exception stack(0xffff000027dd3ec0 to 0xffff000027dd4000)
3ec0: 0000000000000012 0000ffff8a7fdf18 0000000000004000 0000000000000000
3ee0: 0000ffff8a7ff258 0000ffff8a7ff150 0000ffff8a7ff840 0000000000000000
3f00: 00000000000000d3 0100010010000001 0000000003000001 0100050010000001
3f20: 0000000003000001 000409000c000000 0000000000000047 0000155107b31031
3f40: 0000ffff9b67dfb8 0000ffff9b90ddb0 0000000000000014 0000000000004000
3f60: 0000000000000012 0000ffff8a7fdf18 0000ffff780017b0 0000000000004000
3f80: 0000000000000010 0000000000000001 0000ffff8a7fdf00 0000ffff9000b770
3fa0: 0000000000000012 0000ffff8a7fde60 0000ffff9b90de10 0000ffff8a7fde60
3fc0: 0000ffff9b90de28 0000000080000000 0000000000000012 00000000000000d3
3fe0: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[<ffff0000080832c0>] el0_svc_naked+0x34/0x38
Code: d37d7c01 d37d7c02 f90037a1 f9445f01 (f822683b)
---[ end trace eabda93d178d5bcb ]---
Kernel panic - not syncing: Fatal exception in interrupt
SMP: stopping secondary CPUs
Kernel Offset: disabled
CPU features: 0x1802004
Memory Limit: 6144 MB
-- cut --

Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
---
 drivers/net/ethernet/renesas/ravb_main.c | 5 +++++
 1 file changed, 5 insertions(+)


Note: This patch is marked as RFC as it is completely untested. I'm
      no ravb expert and just made the change based on the conclusion
      from the given kernel panic. If this conclusion is stupidly wrong
      and/or anybody has a better idea, that would be highly appreciated!

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 067ad25553b9..0f91ab41b22b 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1447,6 +1447,11 @@ static void ravb_tx_timeout_work(struct work_struct *work)
 
 	netif_tx_stop_all_queues(ndev);
 
+	/* Disable interrupts by clearing the interrupt masks. */
+	ravb_write(ndev, 0, RIC0);
+	ravb_write(ndev, 0, RIC2);
+	ravb_write(ndev, 0, TIC);
+
 	/* Stop PTP Clock driver */
 	if (priv->chip_id == RCAR_GEN2)
 		ravb_ptp_stop(ndev);
-- 
2.20.0

