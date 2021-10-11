Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D618428CA8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Oct 2021 14:08:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236492AbhJKMKT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Oct 2021 08:10:19 -0400
Received: from mxout04.lancloud.ru ([45.84.86.114]:60818 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236508AbhJKMKQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 08:10:16 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru B66042111ED5
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 00/14] Add functional support for Gigabit Ethernet driver
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
CC:     Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "Andrew Lunn" <andrew@lunn.ch>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Adam Ford" <aford173@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
References: <20211009190802.18585-1-biju.das.jz@bp.renesas.com>
 <ccdd66e0-5d67-905d-a2ff-65ca95d2680a@omp.ru>
 <OS0PR01MB5922B0A86C654401D7B719E086B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <eefb62c7-d200-78d5-9268-d84b75c753c3@omp.ru>
 <6a57ab4e-3681-6a47-c47b-fd7ad022d239@omp.ru>
 <OS0PR01MB5922FA0C0B34CF86286F518686B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <deecd659-f9e7-0ab1-d898-8d3d196862c5@omp.ru>
 <OS0PR01MB592231245B070634A3449C6E86B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <fac46880-ec04-0c7d-1746-e0c1a1e270ad@omp.ru>
Date:   Mon, 11 Oct 2021 15:08:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB592231245B070634A3449C6E86B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10/10/21 1:31 PM, Biju Das wrote:

[...]
>>>>>>>> The DMAC and EMAC blocks of Gigabit Ethernet IP found on RZ/G2L
>>>>>>>> SoC are similar to the R-Car Ethernet AVB IP.
>>>>>>>>
>>>>>>>> The Gigabit Ethernet IP consists of Ethernet controller (E-MAC),
>>>>>>>> Internal TCP/IP Offload Engine (TOE)  and Dedicated Direct memory
>>>>>>>> access controller (DMAC).
>>>>>>>>
>>>>>>>> With a few changes in the driver we can support both IPs.
>>>>>>>>
>>>>>>>> This patch series is aims to add functional support for Gigabit
>>>>>>>> Ethernet driver by filling all the stubs except set_features.
>>>>>>>>
>>>>>>>> set_feature patch will send as separate RFC patch along with
>>>>>>>> rx_checksum patch, as it needs detailed discussion related to HW
>>>>>>> checksum.
>>>>>>>>
>>>>>>>> Ref:-
>>>>>>>>
>>>>>>>> https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2
>>>>>>>> Fp
>>>>>>>> atc
>>>>>>>> hwork.kernel.org%2Fproject%2Flinux-renesas-soc%2Flist%2F%3Fseries
>>>>>>>> %3
>>>>>>>> D55
>>>>>>>> 7655&amp;data=04%7C01%7Cbiju.das.jz%40bp.renesas.com%7C25bc7b9155
>>>>>>>> d8
>>>>>>>> 402
>>>>>>>> a191808d98b5ae62f%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C63
>>>>>>>> 76
>>>>>>>> 940
>>>>>>>> 44814904836%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV
>>>>>>>> 2l
>>>>>>>> uMz
>>>>>>>> IiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Vktj5v0GvrNf%2B
>>>>>>>> DN
>>>>>>>> IFs
>>>>>>>> e6xjCUm6OjtzwHvK3q8aG1E5Y%3D&amp;reserved=0
>>>>>>>>
>>>>>>>> RFC->V1:
>>>>>>>>    * Removed patch#3 will send it as RFC
>>>>>>>>    * Removed rx_csum functionality from patch#7, will send it as
>>>>>>>> RFC
>>>>>>>>    * Renamed "nc_queue" -> "nc_queues"
>>>>>>>>    * Separated the comment patch into 2 separate patches.
>>>>>>>>    * Documented PFRI register bit
>>>>>>>>    * Added Sergy's Rb tag
>>>>>>>
>>>>>>>      It's Sergey. :-)
>>>>>>
>>>>>> My Bad. Sorry will taken care this in future. I need to send V2, as
>>>>>> accidentally I have added 2 macros in patch #6 As part of RFC
>>>>>> discussion into v1. I will send V2 to remove this.
>>>>>
>>>>>      I'm not seeing patches #2, #4, and #9 in my inboxes... :-/
>>>>
>>>>      Seeing them now in the linux-renesas-soc folder in the GMail
>> account.
>>>> But they should have landed on the OMP account too. :-/
>>>
>>> Can you please confirm latest series[1] lands on your OMP account?
>>> [1]
>>> https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatc
>>> hwork.kernel.org%2Fproject%2Fnetdevbpf%2Flist%2F%3Fseries%3D560617&amp
>>> ;data=04%7C01%7Cbiju.das.jz%40bp.renesas.com%7C4ba52eb2327b42fb997c08d
>>> 98bd48373%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C637694567141278
>>> 405%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi
>>> I6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=LyurKu2sR%2BujQkts4LRyLMfPxw
>>> 7xmjON91zgS7f5Ktg%3D&amp;reserved=0
>>
>>     No, as I've told you already. Was unclear again. :-)
> 
> Which patch doesn't have OMP account?

    As I said, #2, #4, and #9.

> I am sure, I have added your OMP account 
> As first cc list in the latest series.

   Still not seeing them in v2.

> Regards,
> Biju

MBR, Sergey
