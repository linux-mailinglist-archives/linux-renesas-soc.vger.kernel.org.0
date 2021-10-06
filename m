Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D006D4247F5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 Oct 2021 22:32:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbhJFUeK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 6 Oct 2021 16:34:10 -0400
Received: from mxout04.lancloud.ru ([45.84.86.114]:53004 "EHLO
        mxout04.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229737AbhJFUeJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 16:34:09 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout04.lancloud.ru 1F2CA20A7F44
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [RFC 07/12] ravb: Fillup ravb_rx_gbeth() stub
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
CC:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sergey Shtylyov <s.shtylyov@omprussia.ru>,
        "Adam Ford" <aford173@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Yuusuke Ashizuka <ashiduka@fujitsu.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211005110642.3744-1-biju.das.jz@bp.renesas.com>
 <20211005110642.3744-8-biju.das.jz@bp.renesas.com>
 <63592646-7547-1a81-e6c3-5bac413cb94a@omp.ru>
 <OS0PR01MB592295BD59F39001AC63FD3886B09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <7c31964b-8cde-50c5-d686-939b7c5bd7f0@omp.ru>
Date:   Wed, 6 Oct 2021 23:32:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB592295BD59F39001AC63FD3886B09@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10/6/21 11:22 PM, Biju Das wrote:

[...]
>>> Fillup ravb_rx_gbeth() function to support RZ/G2L.
>>>
>>> This patch also renames ravb_rcar_rx to ravb_rx_rcar to be consistent
>>> with the naming convention used in sh_eth driver.
>>>
>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>> Reviewed-by: Lad Prabhakar
>>> <prabhakar.mahadev-lad.rj@bp.renesas.com>[...]
>>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c
>>> b/drivers/net/ethernet/renesas/ravb_main.c
>>> index 37164a983156..42573eac82b9 100644
>>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>>> @@ -720,6 +720,23 @@ static void ravb_get_tx_tstamp(struct net_device
>> *ndev)
>>>  	}
>>>  }
>>>
>>> +static void ravb_rx_csum_gbeth(struct sk_buff *skb) {
>>> +	u8 *hw_csum;
>>> +
>>> +	/* The hardware checksum is contained in sizeof(__sum16) (2) bytes
>>> +	 * appended to packet data
>>> +	 */
>>> +	if (unlikely(skb->len < sizeof(__sum16)))
>>> +		return;
>>> +	hw_csum = skb_tail_pointer(skb) - sizeof(__sum16);
>>
>>    Not 32-bit? The manual says the IP checksum is stored in the first 2
>> bytes.
> 
> It is 16 bit. It is on last 2 bytes.

   So you're saying the manual is wrong?

>>
>>> +
>>> +	if (*hw_csum == 0)
>>
>>    You only check the 1st byte, not the full checksum!
> 
> As I said earlier, "0" value on last 16 bit, means no checksum error.

   How's that? 'hw_csum' is declaread as 'u8 *'!

>>> +		skb->ip_summed = CHECKSUM_UNNECESSARY;
>>> +	else
>>> +		skb->ip_summed = CHECKSUM_NONE;
>>
>>   So the TCP/UDP/ICMP checksums are not dealt with? Why enable them then?
> 
> If last 2bytes is zero, means there is no checksum error w.r.to TCP/UDP/ICMP checksums.

   Why checksum them independently then?

> RZ/G2L checksum part is different from R-Car Gen3. There is no TOE block at all for R-Car Gen3.
> 
> Regards,
> Biju

[...]

MBR, Sergey
