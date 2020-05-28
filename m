Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37DA81E5A79
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 May 2020 10:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgE1IM6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 May 2020 04:12:58 -0400
Received: from de-out1.bosch-org.com ([139.15.230.186]:43264 "EHLO
        de-out1.bosch-org.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgE1IM5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 May 2020 04:12:57 -0400
Received: from fe0vm1649.rbesz01.com (unknown [139.15.230.188])
        by si0vms0216.rbdmz01.com (Postfix) with ESMTPS id 49XgRm2wcZz1XLm4c;
        Thu, 28 May 2020 10:12:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=key3-intmail; t=1590653572;
        bh=pdmJM+KGuLm0R3RCE7rw/DBcki8Gr6onPr7aKW72u1Q=; l=10;
        h=Subject:From:From:Reply-To:Sender;
        b=fYSAFCTs5GYH0M/LoxP8OxPyCuGMq7pi7XuRyGS/L1bF5+Knhbuf/nL8OBH9LS7RZ
         /3x86WgTvSnDHzVf+ie/x/TIw4BRILfOV77yefOxGAgJQtwA5dI55ADlEK5RR1cgWG
         5ktKkuR7eMpVaTwpteIKW5LaqVcYNydlTV05zNwY=
Received: from fe0vm1741.rbesz01.com (unknown [10.58.172.176])
        by fe0vm1649.rbesz01.com (Postfix) with ESMTPS id 49XgRm2kTSz2c1;
        Thu, 28 May 2020 10:12:52 +0200 (CEST)
X-AuditID: 0a3aad15-e81ff700000001dd-d6-5ecf728425a5
Received: from fe0vm1651.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by fe0vm1741.rbesz01.com (SMG Outbound) with SMTP id 4C.88.00477.4827FCE5; Thu, 28 May 2020 10:12:52 +0200 (CEST)
Received: from SI-HUB2000.de.bosch.com (si-hub2000.de.bosch.com [10.4.103.108])
        by fe0vm1651.rbesz01.com (Postfix) with ESMTPS id 49XgRm1zmZzvl7;
        Thu, 28 May 2020 10:12:52 +0200 (CEST)
Received: from [10.142.104.19] (10.142.104.19) by SI-HUB2000.de.bosch.com
 (10.4.103.108) with Microsoft SMTP Server id 15.1.1979.3; Thu, 28 May 2020
 10:12:51 +0200
Subject: Re: [PATCH v2] ravb: On timeout disable IRQs to stop processing
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        <linux-renesas-soc@vger.kernel.org>
CC:     <Shashikant.Suguni@in.bosch.com>
References: <20200518045452.2390-1-dirk.behme@de.bosch.com>
 <a5462fe0-2bab-8da9-7b30-9bb9f7784d8a@cogentembedded.com>
From:   "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
Message-ID: <ac640ae4-e5ba-59b3-d510-42de1b54ee75@de.bosch.com>
Date:   Thu, 28 May 2020 10:12:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <a5462fe0-2bab-8da9-7b30-9bb9f7784d8a@cogentembedded.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.142.104.19]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsXCZbVWVrel6HycwclPohZbX75jsjiz6ha7
        A5PHg6n/mTw+b5ILYIrisklJzcksSy3St0vgymh8NZGt4IphxbFl31gbGD9qdTFyckgImEgs
        OTyNpYuRi0NIYAaTxPltK5ghnD2MErtXfWCHcJYzSmzeO5mti5GDQ1jAQ+L6Rk4QU0QgXuLP
        HAmQQcwCKhKdr7YygdhCAuUSB6f1sILYbAJmEq+XzGIEsXkF7CXWTnzGAmKzCKhKPHi6CMwW
        FUiS+H9nHRNEjaDEyZlPwOKcAm4Sm6csYoSYbyExc/55KFtc4taT+UwQtrxE89bZzBDPKEqs
        n/KabQKj0Cwko2YhaZ+FpH0WkvYFjCyrGEXTUg3Kcg3NTQz1ipJSi6sMDPWS83M3MUKCW3QH
        453uD3qHGJk4GA8xSnAwK4nwOp09HSfEm5JYWZValB9fVJqTWnyIUZqDRUmcV4VnY5yQQHpi
        SWp2ampBahFMlomDU6qByXS+un+40B020WOG8S83J3z8czE5b43AnKqrBxi8M3vm9KmbHKly
        vqUS/y42n+v1XstIwXfvHtmb7X6xfe6UXzXX32vKv5qkkXJMfNP7KTt1vZsfmUufOZ41Q3Ht
        gwY9axWDTu/tDI+UFV9a/Z0Q8ImL2z7ir2nACq6bX6rmcL+c2vNnx5SlFzedz3ycah/4T2yq
        fJjPQftPjK0md+/PCDh395rioTlBNx52BDNtmig0p+PWle4Kh4UZAjPKMn3qJ5//7eRR6KP5
        rrtzQ7TFGZ+1UpKN9z1X8jV8OnvYdYUerzb/pZDlweufBOx2V7hja5AqdJKvcuo/7V977vec
        Ff6/v/M11+ZfD+0epS68uE+JpTgj0VCLuag4EQDKtq2Y3QIAAA==
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



On 18.05.2020 10:36, Sergei Shtylyov wrote:
> Hello!
> 
> On 18.05.2020 7:54, Dirk Behme wrote:
> 
>> Analyzing [1] it seems there is a race condition where ravb_start_xmit()
>> can be called from interrupt while tx skbuffs are being torn down in
>> the scheduled timeout handling. The actual timeout work is done in
>> ravb_tx_timeout_work() during which the tx skbuffs are torn down via
>> invocations of ravb_ring_free(). But there seems to be no flag to tell
>> the driver it is shutting down so it continues to use the ring buffer
>> when it should not.
>>
>> Fix this by disabling the interrupts in the timeout handler.
>>
>> [1]
>>
>> -- cut --
>> ravb e6800000.ethernet ethernet: transmit timed out, status 00000000, 
>> resetting...
>> ravb e6800000.ethernet ethernet: failed to switch device to config mode
>> Unable to handle kernel NULL pointer dereference at virtual address 
>> 00000018
>> Mem abort info:
>>    Exception class = DABT (current EL), IL = 32 bits
>>    SET = 0, FnV = 0
>>    EA = 0, S1PTW = 0
>> Data abort info:
>>    ISV = 0, ISS = 0x00000046
>>    CM = 0, WnR = 1
>> user pgtable: 4k pages, 48-bit VAs, pgd = ffff80065622f000
>> [0000000000000018] *pgd=00000006962a7003
>> , *pud=00000006962a8003
>> , *pmd=0000000000000000
>> Internal error: Oops: 96000046 [#1] PREEMPT SMP
>> Modules linked in:
>> ...
>> Process Thread1 (pid: 3132, stack limit = 0xffff000027dd0000)
>> CPU: 2 PID: 3132 Comm: Thread1 Tainted: G        WC 
>> 4.14.130-ltsi-g28acae87 #1
>> Hardware name: Board based on r8a7796 (DT)
>> task: ffff80064f2aaa00 task.stack: ffff000027dd0000
>> PC is at ravb_start_xmit+0x138/0x5a0
>> LR is at ravb_start_xmit+0x40/0x5a0
>> pc : [<ffff0000084d6324>] lr : [<ffff0000084d622c>] pstate: 600001c5
>> sp : ffff000027dd3550
>> x29: ffff000027dd3550
>> x28: 0000000000000076
>> x27: ffff80061035ff00
>> x26: ffff000027dd3694
>> x25: ffff80069624f800
>> x24: ffff80069624f000
>> x23: 0000000000000003
>> x22: 0000000000000001
>> x21: ffff80069624f000
>> x20: 0000000000000000
>> x19: ffff80069624f000
>> x18: 0000000000000014
>> x17: 0000ffff9b90ddb0
>> x16: ffff00000867d07c
>> x15: 0000155107b31031
>> x14: 000409000c000000
>> x13: 0000000003000001
>> x12: 0100050010000001
>> x11: 0000000003000001
>> x10: 0100010010000001
>> x9 : 20000000000000c0
>> x8 : 0000000000000000
>> x7 : ffff8006656f9388
>> x6 : 0000000000000002
>> x5 : 0000000000000000
>> x4 : ffff8006656f929c
>> x3 : ffff000027dd3694
>> x2 : 0000000000000018
>> x1 : 0000000000000000
>> x0 : 0000000000000003
>> Call trace:
>> Exception stack(0xffff000027dd3410 to 0xffff000027dd3550)
>> 3400:                                   0000000000000003 0000000000000000
>> 3420: 0000000000000018 ffff000027dd3694 ffff8006656f929c 0000000000000000
>> 3440: 0000000000000002 ffff8006656f9388 0000000000000000 20000000000000c0
>> 3460: 0100010010000001 0000000003000001 0100050010000001 0000000003000001
>> 3480: 000409000c000000 0000155107b31031 ffff00000867d07c 0000ffff9b90ddb0
>> 34a0: 0000000000000014 ffff80069624f000 0000000000000000 ffff80069624f000
>> 34c0: 0000000000000001 0000000000000003 ffff80069624f000 ffff80069624f800
>> 34e0: ffff000027dd3694 ffff80061035ff00 0000000000000076 ffff000027dd3550
>> 3500: ffff0000084d622c ffff000027dd3550 ffff0000084d6324 00000000600001c5
>> 3520: ffff00000921d008 ffff8006159b0d00 0000ffffffffffff ffff0000084d622c
>> 3540: ffff000027dd3550 ffff0000084d6324
>> [<ffff0000084d6324>] ravb_start_xmit+0x138/0x5a0
>> [<ffff000008699d60>] dev_hard_start_xmit+0xa8/0x24c
>> [<ffff0000086c51c0>] sch_direct_xmit+0xb0/0x1a8
>> [<ffff0000086c54cc>] __qdisc_run+0x214/0x2ec
>> [<ffff00000869a348>] __dev_queue_xmit+0x35c/0x5b4
>> [<ffff00000869a5b0>] dev_queue_xmit+0x10/0x18
>> [<ffff000000b9765c>] register_vlan_dev+0xc74/0x10f8 [8021q]
>> [<ffff000008699d60>] dev_hard_start_xmit+0xa8/0x24c
>> [<ffff00000869a438>] __dev_queue_xmit+0x44c/0x5b4
>> [<ffff00000869a5b0>] dev_queue_xmit+0x10/0x18
>> [<ffff0000086a5b9c>] neigh_connected_output+0xc0/0xe4
>> [<ffff0000086d6bd8>] ip_finish_output2+0x3c0/0x3fc
>> [<ffff0000086d8178>] ip_finish_output+0xf8/0x1c4
>> [<ffff0000086d8b74>] ip_mc_output+0x258/0x308
>> [<ffff0000086d8400>] ip_local_out+0x44/0x54
>> [<ffff0000086d9594>] ip_send_skb+0x1c/0xa8
>> [<ffff0000086fea4c>] udp_send_skb+0x11c/0x244
>> [<ffff000008701084>] udp_sendmsg+0x534/0x6bc
>> [<ffff00000870b390>] inet_sendmsg+0x40/0xe0
>> [<ffff00000867b588>] sock_sendmsg+0x3c/0x58
>> [<ffff00000867bf18>] ___sys_sendmsg+0x228/0x278
>> [<ffff00000867d03c>] __sys_sendmsg+0x58/0x98
>> [<ffff00000867d08c>] SyS_sendmsg+0x10/0x20
>> Exception stack(0xffff000027dd3ec0 to 0xffff000027dd4000)
>> 3ec0: 0000000000000012 0000ffff8a7fdf18 0000000000004000 0000000000000000
>> 3ee0: 0000ffff8a7ff258 0000ffff8a7ff150 0000ffff8a7ff840 0000000000000000
>> 3f00: 00000000000000d3 0100010010000001 0000000003000001 0100050010000001
>> 3f20: 0000000003000001 000409000c000000 0000000000000047 0000155107b31031
>> 3f40: 0000ffff9b67dfb8 0000ffff9b90ddb0 0000000000000014 0000000000004000
>> 3f60: 0000000000000012 0000ffff8a7fdf18 0000ffff780017b0 0000000000004000
>> 3f80: 0000000000000010 0000000000000001 0000ffff8a7fdf00 0000ffff9000b770
>> 3fa0: 0000000000000012 0000ffff8a7fde60 0000ffff9b90de10 0000ffff8a7fde60
>> 3fc0: 0000ffff9b90de28 0000000080000000 0000000000000012 00000000000000d3
>> 3fe0: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> [<ffff0000080832c0>] el0_svc_naked+0x34/0x38
>> Code: d37d7c01 d37d7c02 f90037a1 f9445f01 (f822683b)
>> ---[ end trace eabda93d178d5bcb ]---
>> Kernel panic - not syncing: Fatal exception in interrupt
>> SMP: stopping secondary CPUs
>> Kernel Offset: disabled
>> CPU features: 0x1802004
>> Memory Limit: 6144 MB
>> -- cut --
>>
>> Fixes: c156633f1353 ("Renesas Ethernet AVB driver proper")
>> Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> [...]
> 
>     You must post this to netdev@vget.kernel.org, else the patch won't 
> get applied, ever...


If I understood correctly, this patch is replaced by

https://patchwork.kernel.org/patch/11570217/

Best regards

Dirk


