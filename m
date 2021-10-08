Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36DCB426FD6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Oct 2021 20:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239577AbhJHSBu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Oct 2021 14:01:50 -0400
Received: from mxout01.lancloud.ru ([45.84.86.81]:44076 "EHLO
        mxout01.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238085AbhJHSBt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 14:01:49 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout01.lancloud.ru 4CB102090321
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
 <7c31964b-8cde-50c5-d686-939b7c5bd7f0@omp.ru>
 <OS0PR01MB5922239A85405F807AE3C79A86B19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <04dea1e6-c014-613d-f2f9-9ba018ced2a3@omp.ru>
 <OS0PR01MB5922BCF31F520F8F975606B286B19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922165EFE14E02388B34F4086B29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <52f0d801-9750-dbd6-7ba0-258a324208cf@omp.ru>
Date:   Fri, 8 Oct 2021 20:59:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB5922165EFE14E02388B34F4086B29@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10/8/21 9:46 AM, Biju Das wrote:

[...]
>>>>>>>> Fillup ravb_rx_gbeth() function to support RZ/G2L.
>>>>>>>>
>>>>>>>> This patch also renames ravb_rcar_rx to ravb_rx_rcar to be
>>>>>>>> consistent with the naming convention used in sh_eth driver.
>>>>>>>>
>>>>>>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>>>>>> Reviewed-by: Lad Prabhakar
>>>>>>>> <prabhakar.mahadev-lad.rj@bp.renesas.com>[...]
>>>>>>>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c
>>>>>>>> b/drivers/net/ethernet/renesas/ravb_main.c
>>>>>>>> index 37164a983156..42573eac82b9 100644
>>>>>>>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>>>>>>>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>>>>>>>> @@ -720,6 +720,23 @@ static void ravb_get_tx_tstamp(struct
>>>>>>>> net_device
>>>>>>> *ndev)
>>>>>>>>  	}
>>>>>>>>  }
>>>>>>>>
>>>>>>>> +static void ravb_rx_csum_gbeth(struct sk_buff *skb) {
>>>>>>>> +	u8 *hw_csum;
>>>>>>>> +
>>>>>>>> +	/* The hardware checksum is contained in sizeof(__sum16) (2)
>>> bytes
>>>>>>>> +	 * appended to packet data
>>>>>>>> +	 */
>>>>>>>> +	if (unlikely(skb->len < sizeof(__sum16)))
>>>>>>>> +		return;
>>>>>>>> +	hw_csum = skb_tail_pointer(skb) - sizeof(__sum16);
[...]
>>>> Please check the section 30.5.6.1 checksum calculation handling> And
>>>> figure 30.25 the field of checksum attaching field
>>>
>>>    I have.
>>>
>>>> Also see Table 30.17 for checksum values for non-error conditions.
>>>
>>>> TCP/UDP/ICPM checksum is at last 2bytes.
>>>
>>>    What are you arguing with then? :-)
>>>    My point was that your code fetched the TCP/UDP/ICMP checksum ISO
>>> the IP checksum because it subtracts sizeof(__sum16), while should
>>> probably subtract sizeof(__wsum)
>>
>> Agreed. My code missed IP4 checksum result. May be we need to extract 2
>> checksum info from last 4 bytes.  First checksum(2bytes) is IP4 header
>> checksum and next checksum(2 bytes)  for TCP/UDP/ICMP and use this info
>> finding the non error case mentioned in  Table 30.17.
>>
>> For eg:-
>> IPV6 non error-condition -->  "0xFFFF"-->IPV4HeaderCSum value and "0x0000"
>> TCP/UDP/ICMP CSUM value
>>
>> IPV4 non error-condition -->  "0x0000"-->IPV4HeaderCSum value and "0x0000"
>> TCP/UDP/ICMP CSUM value
>>
>> Do you agree?

> What I meant here is some thing like below, please let me know if you have any issues with
> this, otherwise I would like to send the patch with below changes.
> 
> Further improvements can happen later.
> 
> Please let me know.
> 
> +/* Hardware checksum status */
> +#define IPV4_RX_CSUM_OK                0x00000000
> +#define IPV6_RX_CSUM_OK                0xFFFF0000

   Mhm, this should prolly come from the IP headers...

[...]
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index bbb42e5328e4..d9201fbbd472 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -722,16 +722,18 @@ static void ravb_get_tx_tstamp(struct net_device *ndev)
>  
>  static void ravb_rx_csum_gbeth(struct sk_buff *skb)
>  {
> -       u16 *hw_csum;
> +       u32 csum_result;

   This is not against the patch currently under investigation. :-)

> +       u8 *hw_csum;
>  
>         /* The hardware checksum is contained in sizeof(__sum16) (2) bytes
>          * appended to packet data
>          */
> -       if (unlikely(skb->len < sizeof(__sum16)))
> +       if (unlikely(skb->len < sizeof(__wsum)))

   I think this usage of __wsum is valid (I remember that I suggested it). We have 2 16-bit checksums here
covered by that, not a 32-bit sum...

>                 return;
> -       hw_csum = (u16*)(skb_tail_pointer(skb) - sizeof(__sum16));
> +       hw_csum = skb_tail_pointer(skb) - sizeof(__wsum);
> +       csum_result = get_unaligned_le32(hw_csum);
>  
> -       if (*hw_csum == 0)
> +       if (csum_result == IPV4_RX_CSUM_OK || csum_result == IPV6_RX_CSUM_OK)

   I don't think there's a hard-and-fast way to differentiate the valid packet just from
the 2 16-bit checksums...

[...]
>>>>>>>> +
>>>>>>>> +	if (*hw_csum == 0)
>>>>>>>
>>>>>>>    You only check the 1st byte, not the full checksum!
>>>>>>
>>>>>> As I said earlier, "0" value on last 16 bit, means no checksum
>> error.
>>>>>
>>>>>    How's that? 'hw_csum' is declared as 'u8 *'!
>>>>
>>>> It is my mistake, which will be taken care in the next patch by
>>>> using
>>> u16 *.

   That won't do it, I'm afraid...

   From an IRC discuassion on IRC we concluded that we don't need to check the checksum's
value, we just need to store it for the upper layers to catch the invalid sums...

[...]

MBR, Sergey
