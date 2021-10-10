Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6E6428024
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Oct 2021 11:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbhJJJPq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 10 Oct 2021 05:15:46 -0400
Received: from mxout03.lancloud.ru ([45.84.86.113]:35960 "EHLO
        mxout03.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbhJJJPp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 10 Oct 2021 05:15:45 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout03.lancloud.ru 0E9BF20A80FF
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
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <eefb62c7-d200-78d5-9268-d84b75c753c3@omp.ru>
Date:   Sun, 10 Oct 2021 12:13:39 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB5922B0A86C654401D7B719E086B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT01.lancloud.ru (fd00:f066::141) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10.10.2021 10:27, Biju Das wrote:

[...]
>>> The DMAC and EMAC blocks of Gigabit Ethernet IP found on RZ/G2L SoC
>>> are similar to the R-Car Ethernet AVB IP.
>>>
>>> The Gigabit Ethernet IP consists of Ethernet controller (E-MAC),
>>> Internal TCP/IP Offload Engine (TOE)  and Dedicated Direct memory
>>> access controller (DMAC).
>>>
>>> With a few changes in the driver we can support both IPs.
>>>
>>> This patch series is aims to add functional support for Gigabit
>>> Ethernet driver by filling all the stubs except set_features.
>>>
>>> set_feature patch will send as separate RFC patch along with
>>> rx_checksum patch, as it needs detailed discussion related to HW
>> checksum.
>>>
>>> Ref:-
>>>
>>> https://jpn01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatc
>>> hwork.kernel.org%2Fproject%2Flinux-renesas-soc%2Flist%2F%3Fseries%3D55
>>> 7655&amp;data=04%7C01%7Cbiju.das.jz%40bp.renesas.com%7C25bc7b9155d8402
>>> a191808d98b5ae62f%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C6376940
>>> 44814904836%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMz
>>> IiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Vktj5v0GvrNf%2BDNIFs
>>> e6xjCUm6OjtzwHvK3q8aG1E5Y%3D&amp;reserved=0
>>>
>>> RFC->V1:
>>>   * Removed patch#3 will send it as RFC
>>>   * Removed rx_csum functionality from patch#7, will send it as RFC
>>>   * Renamed "nc_queue" -> "nc_queues"
>>>   * Separated the comment patch into 2 separate patches.
>>>   * Documented PFRI register bit
>>>   * Added Sergy's Rb tag
>>
>>     It's Sergey. :-)
> 
> My Bad. Sorry will taken care this in future. I need to send V2, as accidentally I have added 2 macros in patch #6
> As part of RFC discussion into v1. I will send V2 to remove this.

    I'm not seeing patches #2, #4, and #9 in my inboxes... :-/

> Regards,
> Biju

MBR, Sergey
