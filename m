Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 851F9421788
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Oct 2021 21:28:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239147AbhJDT3z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Oct 2021 15:29:55 -0400
Received: from mxout02.lancloud.ru ([45.84.86.82]:54658 "EHLO
        mxout02.lancloud.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239081AbhJDT3s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 15:29:48 -0400
Received: from LanCloud
DKIM-Filter: OpenDKIM Filter v2.11.0 mxout02.lancloud.ru EF3E822D1FBC
Received: from LanCloud
Received: from LanCloud
Received: from LanCloud
Subject: Re: [PATCH 10/10] ravb: Initialize GbEthernet E-MAC
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
References: <20211001150636.7500-1-biju.das.jz@bp.renesas.com>
 <20211001150636.7500-11-biju.das.jz@bp.renesas.com>
 <9e7f271f-fc49-a85a-b790-af3a9bdc4be1@omp.ru>
 <OS0PR01MB5922AD9E0E01812FC4A11E1386AE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <fc3cce12-e16b-41b2-1aeb-7ddc22e03e91@omp.ru>
Date:   Mon, 4 Oct 2021 22:27:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB5922AD9E0E01812FC4A11E1386AE9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.11.198]
X-ClientProxiedBy: LFEXT02.lancloud.ru (fd00:f066::142) To
 LFEX1907.lancloud.ru (fd00:f066::207)
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 10/4/21 10:23 PM, Biju Das wrote:

[...]
>>> Initialize GbEthernet E-MAC found on RZ/G2L SoC.
>>> This patch also renames ravb_set_rate to ravb_set_rate_rcar and
>>> ravb_rcar_emac_init to ravb_emac_init_rcar to be consistent with the
>>> naming convention used in sh_eth driver.
>>>
>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>> ---
>>> RFC->v1:
>>>  * Moved CSR0 intialization to later patch.
>>>  * started using ravb_modify for initializing link registers.
>>> ---
>>>  drivers/net/ethernet/renesas/ravb.h      | 20 +++++++--
>>>  drivers/net/ethernet/renesas/ravb_main.c | 55
>>> ++++++++++++++++++++----
>>>  2 files changed, 62 insertions(+), 13 deletions(-)
>>>
[...]
>>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c
>>> b/drivers/net/ethernet/renesas/ravb_main.c
>>> index 3e694738e683..9a4888543384 100644
>>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
>> [...]
>>> @@ -449,10 +461,35 @@ static int ravb_ring_init(struct net_device
>>> *ndev, int q)
>>>
>>>  static void ravb_emac_init_gbeth(struct net_device *ndev)  {
>>> -	/* Place holder */
>>> +	struct ravb_private *priv = netdev_priv(ndev);
>>> +
>>> +	/* Receive frame limit set register */
>>> +	ravb_write(ndev, GBETH_RX_BUFF_MAX + ETH_FCS_LEN, RFLR);
>>> +
>>> +	/* PAUSE prohibition */
>>
>>     Should be:
>>
>> 	/* EMAC Mode: PAUSE prohibition; Duplex; TX; RX */
>>
>>> +	ravb_write(ndev, ECMR_ZPF | ((priv->duplex > 0) ? ECMR_DM : 0) |
>>> +			 ECMR_TE | ECMR_RE | ECMR_RCPT |
>>> +			 ECMR_TXF | ECMR_RXF | ECMR_PRM, ECMR);
>>> +
>>> +	ravb_set_rate_gbeth(ndev);
>>> +
>>> +	/* Set MAC address */
>>> +	ravb_write(ndev,
>>> +		   (ndev->dev_addr[0] << 24) | (ndev->dev_addr[1] << 16) |
>>> +		   (ndev->dev_addr[2] << 8)  | (ndev->dev_addr[3]), MAHR);
>>> +	ravb_write(ndev, (ndev->dev_addr[4] << 8)  | (ndev->dev_addr[5]),
>>> +MALR);
>>> +
>>> +	/* E-MAC status register clear */
>>> +	ravb_write(ndev, ECSR_ICD | ECSR_LCHNG | ECSR_PFRI, ECSR);
>>> +
>>> +	/* E-MAC interrupt enable register */
>>> +	ravb_write(ndev, ECSIPR_ICDIP, ECSIPR);
>>
>>    Too much repetitive code, I think...
> 
> Can you please clarify what are the codes repetitive here?

   MAHR/MALR reading, mainly...
   The following code turned out to be different from gen2/3 indeed...

[...]

MBR, Sergey
