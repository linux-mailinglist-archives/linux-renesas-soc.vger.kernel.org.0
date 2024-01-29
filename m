Return-Path: <linux-renesas-soc+bounces-1955-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF438414C6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 22:00:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D26D91C24BE1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 21:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2AE15697F;
	Mon, 29 Jan 2024 21:00:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A470158D64;
	Mon, 29 Jan 2024 21:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706562013; cv=none; b=Q46b3tNVVP9eGHzpyIpXarpV84BOfWFGAiD5yGlMUdduDs2PruwSPyYSn1h2D4PxY7uabZXrIXuF+jyNtiVAcKpEHZjv8F1nP6MotVFRidTsouZR8dzX266NyHlDHoKoAZkzoN6mvIcXzLVeNeiGDXdy8l6o+REDSY4jOc6l2Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706562013; c=relaxed/simple;
	bh=tPgnNn201mmzQ6a9AU8UOnhIFEtELsHdB3AGTb9dn9Y=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=UXBW35m4iSNLozFARcGnH/rV3PfEY1a+VkQ3PXUHwF4mwtHhzyYw7sjgaQvev+lTZf7Ejj5LZGTvUgmb+2AC0Qf/dN3i4XhBLQG5/tduHDvLjeoSgtReY4DXZU7YjPHmJqty98lpHRNEFCWePD9B8PZACSiTzExgqDTGMQy1bWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.105] (178.176.76.250) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 29 Jan
 2024 23:59:54 +0300
Subject: Re: [PATCH net-next v2 1/2] ravb: Add Rx checksum offload support
To: Biju Das <biju.das.jz@bp.renesas.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, nikita.yoush
	<nikita.yoush@cogentembedded.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
References: <20240124102115.132154-1-biju.das.jz@bp.renesas.com>
 <20240124102115.132154-2-biju.das.jz@bp.renesas.com>
 <e27edbff-8fa9-339a-4e6d-d72776286aa6@omp.ru>
 <TYCPR01MB112690D34DFFCFA876203A539867A2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <05cbba41-2927-e4fd-cb00-d3f40d92830f@omp.ru>
Date: Mon, 29 Jan 2024 23:59:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <TYCPR01MB112690D34DFFCFA876203A539867A2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.0, Database issued on: 01/29/2024 20:46:53
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 183024 [Jan 29 2024]
X-KSE-AntiSpam-Info: Version: 6.1.0.3
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.76.250 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.176.76.250 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.76.250
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 01/29/2024 20:50:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 1/29/2024 7:20:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 1/26/24 1:15 AM, Biju Das wrote:

> Hi Sergey Shtylyov,

   Hi! :-)

> Thanks for the feedback.

   Not at all!

>> -----Original Message-----
>> From: Sergey Shtylyov <s.shtylyov@omp.ru>
>> Sent: Thursday, January 25, 2024 8:42 PM
>> Subject: Re: [PATCH net-next v2 1/2] ravb: Add Rx checksum offload support

[...]

>>> We can test this functionality by the below commands
>>>
>>> ethtool -K eth0 rx on --> to turn on Rx checksum offload ethtool -K
>>> eth0 rx off --> to turn off Rx checksum offload
>>>
>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>> [...]
>>
>>> diff --git a/drivers/net/ethernet/renesas/ravb.h
>>> b/drivers/net/ethernet/renesas/ravb.h
>>> index e0f8276cffed..a2c494a85d12 100644
>>> --- a/drivers/net/ethernet/renesas/ravb.h
>>> +++ b/drivers/net/ethernet/renesas/ravb.h
>>> @@ -44,6 +44,9 @@
>>>  #define RAVB_RXTSTAMP_TYPE_ALL	0x00000006
>>>  #define RAVB_RXTSTAMP_ENABLED	0x00000010	/* Enable RX timestamping
>> */
>>>
>>> +/* GbEthernet TOE hardware checksum values */
>>> +#define TOE_RX_CSUM_OK	0x0000
>>
>>    As I said before, this is hardly needed...
> 
> It is needed to match with the Checksum status as mentioned in the hardware manual.

   I think you can just compare to 0... ISTR that checksumming result
should indeed be 0 for a good IP header, so this # does not seem device
specific...

>> [...]
>>> diff --git a/drivers/net/ethernet/renesas/ravb_main.c
>>> b/drivers/net/ethernet/renesas/ravb_main.c
>>> index 0e3731f50fc2..59c7bedacef6 100644
>>> --- a/drivers/net/ethernet/renesas/ravb_main.c
>>> +++ b/drivers/net/ethernet/renesas/ravb_main.c
[...]
>>> +{
>>> +	bool rx_enable = ndev->features & NETIF_F_RXCSUM;
>>> +	u32 csr0;
>>> +
>>> +	if (!rx_enable)
>>> +		return;
>>> +
>>> +	csr0 = ravb_read(ndev, CSR0);
>>
>>    Why read it here, if we'll write a constant to this reg at the end of
>> ravb_emac_init_gbeth()?
> 
> The correct flow is
> 
> Disable tx/rx
> Enable Checksum
> Reenable Tx/rx if it is already enabled.

   Yeah, I figured. :-) However I can't find this flow in the RZ/G2L[C]
user's manual...

>>> +	ravb_write(ndev, csr0 & ~(CSR0_RPE | CSR0_TPE), CSR0);
>>
>>    We can just write 0 here, no?
> 
> See above.

   I have to repeat: either don't do read/modife/write CSR0 accesses here
or remove the below line from ravb_emac_init_gbeth():

	ravb_write(ndev, CSR0_TPE | CSR0_RPE, CSR0);

   Well, I think this line should be removed in any case -- we shouldn't
enable RX/TX checksumming in CSR0 if we don't also set up CSR1/2...

[...]
>>> +
>>> +	ravb_write(ndev, csr0, CSR0);
>>
>>     I think we should move:
>>
>> 	ravb_write(ndev, CSR0_TPE | CSR0_RPE, CSR0);
>>
>> from ravb_emac_init_gbeth() here...
> 
> I am providing flexible options here.

   I don't get it... what flexibility do you mean?

[...]
>>> @@ -734,6 +755,32 @@ static void ravb_get_tx_tstamp(struct net_device
>> *ndev)
>>>  	}
>>>  }
>>>
>>> +static void ravb_rx_csum_gbeth(struct sk_buff *skb) {
>>> +	__wsum csum_ip_hdr, csum_proto;
>>> +	u8 *hw_csum;
>>> +
>>> +	/* The hardware checksum status is contained in sizeof(__sum16) * 2
>> = 4
>>> +	 * bytes appended to packet data. First 2 bytes is ip header csum
>> and
>>> +	 * last 2 bytes is protocol csum.
>>> +	 */
>>> +	if (unlikely(skb->len < sizeof(__sum16) * 2))
>>> +		return;
>>> +
>>> +	hw_csum = skb_tail_pointer(skb) - sizeof(__sum16);
>>> +	csum_proto = csum_unfold((__force
>>> +__sum16)get_unaligned_le16(hw_csum));
>>> +
>>> +	hw_csum -= sizeof(__sum16);
>>> +	csum_ip_hdr = csum_unfold((__force
>> __sum16)get_unaligned_le16(hw_csum));
>>> +	skb_trim(skb, skb->len - 2 * sizeof(__sum16));
>>> +
>>> +	/* TODO: IPV6 Rx csum */
>>> +	if (skb->protocol == htons(ETH_P_IP) && csum_ip_hdr ==
>> TOE_RX_CSUM_OK &&
>>> +	    csum_proto == TOE_RX_CSUM_OK)
>>> +		/* Hardware validated our checksum */
>>> +		skb->ip_summed = CHECKSUM_UNNECESSARY;
>>
>>    Don't we need to set skb->csum_level?
> 
> As per my knowledge, it is not needed. I may be wrong. Why do you
> think it is needed?

 *   CHECKSUM_UNNECESSARY is applicable to following protocols:
 *     TCP: IPv6 and IPv4.
 *     UDP: IPv4 and IPv6. A device may apply CHECKSUM_UNNECESSARY to a
 *       zero UDP checksum for either IPv4 or IPv6, the networking stack
 *       may perform further validation in this case.
 *     GRE: only if the checksum is present in the header.
 *     SCTP: indicates the CRC in SCTP header has been validated.
 *     FCOE: indicates the CRC in FC frame has been validated.
 *
 *   skb->csum_level indicates the number of consecutive checksums found in
 *   the packet minus one that have been verified as CHECKSUM_UNNECESSARY.
 *   For instance if a device receives an IPv6->UDP->GRE->IPv4->TCP packet
 *   and a device is able to verify the checksums for UDP (possibly zero),
 *   GRE (checksum flag is set) and TCP, skb->csum_level would be set to
 *   two. If the device were only able to verify the UDP checksum and not
 *   GRE, either because it doesn't support GRE checksum or because GRE
 *   checksum is bad, skb->csum_level would be set to zero (TCP checksum is
 *   not considered in this case).

   It would seem we should set this field to 1 if the TCP/UDP checksum
was successfully verified?

>> [...]
>>> @@ -2337,8 +2388,32 @@ static void ravb_set_rx_csum(struct net_device
>>> *ndev, bool enable)  static int ravb_set_features_gbeth(struct
>> net_device *ndev,
>>>  				   netdev_features_t features)
>>>  {
>>> -	/* Place holder */
>>> -	return 0;
>>> +	netdev_features_t changed = ndev->features ^ features;
>>> +	struct ravb_private *priv = netdev_priv(ndev);
>>> +	unsigned long flags;
>>> +	u32 csr0;
>>> +	int ret;
>>> +
>>> +	spin_lock_irqsave(&priv->lock, flags);
>>> +	csr0 = ravb_read(ndev, CSR0);
>>> +	ravb_write(ndev, csr0 & ~(CSR0_RPE | CSR0_TPE), CSR0);
>>> +	ret = ravb_wait(ndev, CSR0, CSR0_RPE | CSR0_TPE, 0);
>>> +	if (ret)
>>> +		goto err_wait;
>>
>>    I don't understand: why do you clear the CSR0 bits even if (changed &
>> NETIF_F_RXCSUM) is 0? This looks very wrong...
> 
> I made the code simple. Can you please suggest a much simpler way than this?

   Of course, I can. I don't think clearing CSR0.TPE makes sense if you
only modify CSR2, and clearing CSR0.RPE makes sense if you only modify CSR1...

>>> +
>>> +	if (changed & NETIF_F_RXCSUM) {
>>> +		if (features & NETIF_F_RXCSUM)
>>> +			ravb_write(ndev, CSR2_ALL, CSR2);
>>> +		else
>>> +			ravb_write(ndev, 0, CSR2);
>>> +	}
>>
>>    I think you should put that into a separate function, like is done for
>> the EhterAVB...
> 
> you mean add this if else block to separate function?? Can you please elaborate??

   No, you need to 1st clear CSR0.{RPE|TPE}, then set up CSR1/2, then restore
CSR0... something like that.

>> [...]
>>> @@ -2518,6 +2593,8 @@ static const struct ravb_hw_info gbeth_hw_info = {
>>>  	.emac_init = ravb_emac_init_gbeth,
>>>  	.gstrings_stats = ravb_gstrings_stats_gbeth,
>>>  	.gstrings_size = sizeof(ravb_gstrings_stats_gbeth),
>>> +	.net_hw_features = NETIF_F_RXCSUM,
>>> +	.net_features = NETIF_F_RXCSUM,
>>
>>    What about NETIF_F_IP_CSUM, BTW?
> 
> Why is it needed? Can you please clarify?

   Ignore me -- this one seems to be used for the TX path.
   I just had to learn how the checksum offloading works while reviewing
your patches... :-)

> Cheers,
> Biju

MBR, Sergey

