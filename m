Return-Path: <linux-renesas-soc+bounces-10516-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CA39C8311
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Nov 2024 07:26:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 547BBB23F74
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Nov 2024 06:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B261E9060;
	Thu, 14 Nov 2024 06:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bzxz5TiH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DCF2905;
	Thu, 14 Nov 2024 06:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731565595; cv=none; b=Og4T/XVUr2Mh23EMW1BROANPZ1FxxzBEf9azd29dcCLgxqu4MWTe1IfAR/wKRGEohtYRdZnk6pe2X+FEKqW7tj1EUGVp9pSGZIzjUmvVq6dpF1vU0U6FGOV2rUDcM/adpx8+Grb7E32K7A91xQFHxhpAZXhWtdX1iuzVoe3M2aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731565595; c=relaxed/simple;
	bh=D4c4tgsZGHa7ORgVq3NUUACendP3G8FfY5f2ToJ561A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XJhNcgQYRZmhkjmsQi8TyIXOHOPpDGOA5OcqLwjzMyB0onA8l4lEm1xD8B/LA9tJUXZD+6S3QbHq3twECE/67dcYToTAoE1tVwyiJA6o3cSNKI6XxJ4XkUaB6IBPPDIkw3mpXb4F+B9rXyl/Xgv7p4C0BbsD8otbPXjurdnDi4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bzxz5TiH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37736C4CECF;
	Thu, 14 Nov 2024 06:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731565593;
	bh=D4c4tgsZGHa7ORgVq3NUUACendP3G8FfY5f2ToJ561A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Bzxz5TiHPyq60oGzqJ72uHY0URSWtOe1IcbkI8xtQ4SmkoqqxiUED/cVlhjwNsLyI
	 iqwr2u9pz8PoZ35r7SlLq4vNrKy+/a2NyjJl3HlKRZmPbTX6XMJ5a3gQqNlp9KyOfg
	 f1x9XAiXjGA5fTXmpBcydFhMYCLg4mzX6aTSMyJZ6VeW49+S6euQOFP9BFopET/EEj
	 8bc7ZiMArRorPrn3mJ/M1c+j3agHMCN018Q8x0oIi8dLpQIcH568R59hqc0l3xDtbW
	 5hzNFDaOixf/J7vWCJzrDNOIZd88NlvQRrgQ0t0Q1PYRnbVF8t3/5BapjTOINgotp+
	 jbDzx7lAGDcMg==
Message-ID: <b3f67cd7-056a-43c2-98dc-e983649124ed@kernel.org>
Date: Thu, 14 Nov 2024 07:26:28 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] serial: sh-sci: Check if TX data was written to
 device in .tx_empty()
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, geert+renesas@glider.be,
 magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 gregkh@linuxfoundation.org, p.zabel@pengutronix.de, g.liakhovetski@gmx.de,
 lethal@linux-sh.org
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-serial@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, stable@vger.kernel.org
References: <20241108100513.2814957-1-claudiu.beznea.uj@bp.renesas.com>
 <20241108100513.2814957-3-claudiu.beznea.uj@bp.renesas.com>
 <530f4a8e-b71a-4db1-a2cc-df1fcfa132ec@kernel.org>
 <3711546e-a551-4cc9-a378-17aab5b426ef@tuxon.dev>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <3711546e-a551-4cc9-a378-17aab5b426ef@tuxon.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 08. 11. 24, 13:19, Claudiu Beznea wrote:
> On 08.11.2024 12:57, Jiri Slaby wrote:
>> On 08. 11. 24, 11:05, Claudiu wrote:
...
>>> --- a/drivers/tty/serial/sh-sci.c
>>> +++ b/drivers/tty/serial/sh-sci.c
>>> @@ -157,6 +157,7 @@ struct sci_port {
>>>          bool has_rtscts;
>>>        bool autorts;
>>> +    bool first_time_tx;
>>
>> This is a misnomer. It suggests to be set only during the first TX.
> 
> I chose this naming as this was the scenario I discovered it didn't work.
> Reproducible though these steps:
> 
> 1/ open the serial device (w/o running any TX/RX)
> 2/ call tx_empty()
> 
> What
>> about ::did_tx, ::performed_tx, ::transmitted, or alike?
> 
> I have nothing against any of these. Can you please let me know if you have
> a preferred one?

No, you choose, or invent even better one :). Or let AI do it for you.

>>> @@ -885,6 +887,7 @@ static void sci_transmit_chars(struct uart_port *port)
>>>            }
>>>              sci_serial_out(port, SCxTDR, c);
>>> +        s->first_time_tx = true;
>>>              port->icount.tx++;
>>>        } while (--count > 0);
>>> @@ -1241,6 +1244,8 @@ static void sci_dma_tx_complete(void *arg)
>>>        if (kfifo_len(&tport->xmit_fifo) < WAKEUP_CHARS)
>>>            uart_write_wakeup(port);
>>>    +    s->first_time_tx = true;
>>
>> This is too late IMO. The first in-flight dma won't be accounted in
>> sci_tx_empty(). From DMA submit up to now.
> 
> If it's in-flight we can't determine it's status anyway with one variable.
> We can set this variable later but it wouldn't tell the truth as the TX
> might be in progress anyway or may have been finished?
> 
> The hardware might help with this though the TEND bit. According to the HW
> manual, the TEND bit has the following meaning:
> 
> 0: Transmission is in the waiting state or in progress.
> 1: Transmission is completed.
> 
> But the problem, from my point of view, is that the 0 has double meaning.
> 
> I noticed the tx_empty() is called in kernel multiple times before
> declaring TX is empty or not. E.g., uart_suspend_port() call it 3 times,
> uart_wait_until_sent() call it in a while () look with a timeout. There is
> the uart_ioctl() which calls it though uart_get_lsr_info() only one time
> but I presumed the user space might implement the same multiple trials
> approach before declaring it empty.
> 
> Because of this I considered it wouldn't be harmful for the scenario you
> described "The first in-flight dma won't be accounted in sci_tx_empty()"
> as the user may try again later to check the status. For this reason I also
> chose to have no extra locking around this variable.

What about the below?

>>> @@ -2076,6 +2081,10 @@ static unsigned int sci_tx_empty(struct uart_port
>>> *port)
>>>    {
>>>        unsigned short status = sci_serial_in(port, SCxSR);
>>>        unsigned short in_tx_fifo = sci_txfill(port);
>>> +    struct sci_port *s = to_sci_port(port);
>>> +
>>> +    if (!s->first_time_tx)
>>> +        return TIOCSER_TEMT;
>>
>> So perhaps check if there is a TX DMA running here too?

This ^^^? Like dmaengine_tx_status()?

>>
>>>          return (status & SCxSR_TEND(port)) && !in_tx_fifo ? TIOCSER_TEMT
>>> : 0;
>>>    }
>>
>> thanks,
-- 
js
suse labs

