Return-Path: <linux-renesas-soc+bounces-32553-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sALTAc7qA2qzAQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32553-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 05:06:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC7F52C998
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 05:06:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0EB843001072
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 03:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A9F438E8CB;
	Wed, 13 May 2026 03:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lxuzGXJY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3233B2DC350;
	Wed, 13 May 2026 03:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778641483; cv=none; b=Ngc8fpjWGl4JvK2BU8GIa+xMwiq7sHyopY3GcTCi+XEUxq7O/4ADEizJe78Wd6+IC3x9xUDs28HFcUMv6Knza0LXSnjbyHvL0d8N7wXzRLzkaiVVwEQEgcA3Wmcsk+alm0bKtmUKZS+Fi0sW+6Gv0R1YLB/X8Aj2jJK7OhWKFbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778641483; c=relaxed/simple;
	bh=LHWj/Yo9I0tGpb2nw+/jL4FGaK4wCeoS7AnfcacE584=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C5d5Fap8dO1dc2KAFLqY3dqT5gvqrBszvzZUCCLIZw+d+wTdj1Earn+JM0mtSaoNEJQWFsfPUc5FlpFKXMHiL7RQhuxYq4CZRj5rsNVWbYR/84D95J3hjsTGYEEDi8+GYR/SM8mfX0bZLDtJV/MP8jtTEaT29RFy3KVUZXrLoAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lxuzGXJY; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gFdbl6PsCz9vDp;
	Wed, 13 May 2026 05:04:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778641475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kK9d3ZvVKNoGYZSkiMBYoDg4t9ccaUY0WVOAwtSkcbY=;
	b=lxuzGXJYotgpr9YTwC4uq5ONN+785yc6vgi7uwcodBSDpoaVZjPeTwF4yYljUnRQiMqyWX
	rsrf2/0Tp1NzL62c7IRLYm9iIXziAvpUlRgWGjsAagBT5Tbz3pA6Z0vu8PiReLo7lm+m2o
	q1iVrvSkZRbX8XKr6w38N48bjEsZq2k85tdvD1KYuDTdGnqmhnx7rWeZq2QGu7TkOnRqrU
	rZlplKUys1wFYBv4oUk20YBpz1Ex8a1SFrThByw1GYkWGxXl7cNRn2JUWI/YS9r8Ir7fGv
	fQaAgZks9BIPAGPp5j2GS26kU5w3JdIgshkxXRmxTp5k9eq9zQk2jYUWlEc8rw==
Message-ID: <4dd30518-1e20-45b8-b3b9-994f6cb3f25b@mailbox.org>
Date: Wed, 13 May 2026 05:01:12 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] PCI: rcar-gen4: Limit Max_Read_Request_Size and
 Max_Payload_Size to 256 Bytes
To: Koichiro Den <den@valinux.co.jp>
Cc: linux-pci@vger.kernel.org, stable@vger.kernel.org,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Manivannan Sadhasivam
 <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260425233845.459175-1-marek.vasut+renesas@mailbox.org>
 <oeb2uiudm7afzzzy3f5rykzctfnxlsydit6ww5raohcbxo3v34@hmnqr2ud42kq>
 <66d050f4-5d21-43e0-af8e-39a0d6c4b0ec@mailbox.org>
 <wpv2alxxrf5jtdyoz5kpry6446srz2k7jc3lbwuwwbfvswjuce@i75vxrpxw4ox>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <wpv2alxxrf5jtdyoz5kpry6446srz2k7jc3lbwuwwbfvswjuce@i75vxrpxw4ox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: h4afhqz6czuhp538apcbdzd3e6zdmmqq
X-MBO-RS-ID: bdae9c0e2e6b95635c5
X-Rspamd-Queue-Id: CFC7F52C998
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32553-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,google.com,glider.be,gmail.com,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 5/11/26 4:20 PM, Koichiro Den wrote:

Hello Den-san,

>>> 2. Did you also happen to test V4H/V4M in endpoint (EP) mode, with the local
>>>      eDMA engine issuing MRd requests toward host memory?
>>
>> I was not able to test this configuration.
>>
>> Is it possible to perform this test with a single device, by having the eDMA
>> do local-memory-read-to-local-memory-write transfers, maybe using
>> PIPE_LOOPBACK/LOOPBACK_ENABLE bits, or do I need two devices with NTB
>> connection between them ?
>>
>> In case it is the later, could you please briefly describe the S4 NTB setup
>> you use, so I could try to replicate it locally ?
> 
> My setup was a two-board setup:
> 
>    S4 Spider as RC <-> S4 Spider as EP, connected with OCuLink.
> 
> It is unfortunately not a small standalone reproducer. The setup was based on
> the following RFC v4 series:
> 
>    [RFC PATCH v4 00/38] NTB transport backed by PCI EP embedded DMA
>    https://lore.kernel.org/all/20260118135440.1958279-1-den@valinux.co.jp/
> 
> In particular, the workaround patch I used in the RFC series was:
> 
>    [RFC PATCH v4 31/38] NTB: epf: Add per-SoC quirk to cap MRRS for DWC eDMA (128B for R-Car)
>    https://lore.kernel.org/all/20260118135440.1958279-32-den@valinux.co.jp/
> 
> Note that in that workaround I only capped MRRS (i.e. I did not add an MPS cap).
> At least in that setup, avoiding 256B MRd requests was enough to make the
> visible corruption disappear.

I have been investigating the MPSS/MPS/MRRS a bit deeper. I did not make 
the connection between your last observation in your previous email, 
which already hinted at what the issue might be, the MPSS bitfield, 
TYPE00 and TYPE01 accesses until today and one more nudge from 
Manivannan in the MPSS direction. Thank you both for those two items.

It seems that for S4, the latest documentation rev.1.30 indicates 
EXPCAP1F MPSS as read-write and configurable between 128B and 256B for 
TYPE00 (EP) access , but read-only and set to fixed 128B for TYPE01 (RC) 
access .

If the S4 PCIe in RC mode is only capable of 128B long TLPs and in EP 
mode is capable of 128B or 256B long TLPs, this might explain why you 
observe corruption with 256B long TLPs between two S4 Spiders. The S4 
Spider in EP mode might work just fine with another RC which can do 256B 
long TLPs.

I still do not understand one more observation -- if I configure V4H 
PCIe as RC, and read out EXPCAP1F register MPSS field, it reads as 256B 
(value 3'b001). I would expect EXPCAP1F register MPSS field to read out 
as (default) 128B in this RC case. The V4H documentation indicates 
EXPCAP1F MPSS as read-ONLY and set to fixed 256B for TYPE00 (EP) access, 
but read-WRITE and set to 128B for TYPE01 (RC) access , which I think 
might be a documentation issue. I also do not rewrite the EXPCAP1F MPSS 
in any way.

If the V4H is also capable of only 128B TLPs in RC mode, then this patch 
would require additional adjustment and would have to limit TLP length 
based on configuration -- 128B for RC, 256B for EP.

I will now ask for documentation clarification.

> At a high level, the EP side exposes the vNTB endpoint function, and the RC side
> uses the NTB data path which is backed by the EP-local eDMA through that vNTB
> function. For the RC-to-EP data path, the EP-local eDMA acts as the requester:
> it issues MRd requests toward remote RC memory, receives the CplD payloads, and
> writes the data into EP-side memory. In other words, this is a DMA read transfer
> from the point of view of the EP-local eDMA.

I understand. If the S4 EP has MPSS set to 256 Bytes (and possibly also 
MPS), but the S4 RC may (*) be limited to MPSS and MPS 128 Bytes, I 
wonder if the MRd from the EP-local DMA sent to RC might be causing 
malfunction on the RC side.

(*) to be determined, I will ask.

> I have not tried PIPE_LOOPBACK/LOOPBACK_ENABLE. Given how heavy the setup
> described above is, I am not asking you to reproduce the whole thing just for
> this patch. Also, I do not want this NTB/eDMA observation to block your v2. For
> now, please treat it as a separate observation from the RC/NVMe issue. I will
> continue the investigation on my side and let you know if I can narrow down
> where the corruption occurs.

I very much appreciate your input, and in light of it, I believe this 
patch does need an update.

As for local Oculink setup options, I already had a closer look as well.

>>> Your commit message
>>>      describes an NVMe device as the requester, but I'm wondering whether the same
>>>      256B limit was also verified for the R-Car EP DMA requester path.
>>
>> This part I currently can not answer, I'm sorry.
>>
>> ...
>>
>> I made the following two observations in the meantime.
>>
>> First, I wrote two SSDs, Crucial P5 Plus SSD without HMPRE (without host
>> memory buffer) and XPG GAMMIX P55 with HMPRE (with host memory buffer) with
>> 4 GiB of random data on another system (iMX8M Plus, ARM64 with DWC PCIe
>> controller too), then I did a read back and compared the data, the writen
>> and read-back data matched.
>>
>> Then I plugged both SSDs into V4H Sparrow Hawk _without_ this patch, and I
>> did read back of data:
>>
>> - Crucial P5 Plus SSD without HMPRE (without host memory buffer)
>>    -> Data read back match data written on iMX8M Plus, OK
>> - XPG GAMMIX P55 with HMPRE (with host memory buffer)
>>    -> Data read back match data written on iMX8M Plus, OK
>>
>> Then I wrote 512 Byte of data into the Crucial P5 Plus SSD without HMPRE on
>> V4H Sparrow Hawk and did read back again.
>>    -> Data read back does NOT match data written, NG
>>
>> That would indicate that:
>> - WRITE transfers from SSD to DRAM are OK
>> - READ transfers from DRAM to SSD are corrupted at 256 Bytes boundary
>>
>> That would indicate that we need _at_least_ the 256 Bytes limit, likely on
>> both MPS and MRRS.
>>
>> Second, I got a report of another SSD for which this patch is not
>> sufficient. I currently do not have access to that SSD, but I will ask for
>> access and investigate. That may shed some light on the 128 Byte limit
>> below.
> 
> Thank you for sharing these observations.
> Interesting, that second point may indeed help determine whether my 128B
> observation in the past is related to the same underlying issue, or is a purely
> eDMA/NTB-specific one.

Could you please have a look at the beginning of this email too ? I 
wonder if the TYPE00/TYPE01 accesses might have different TLP size 
limitations.

>>> (*) The background for my question 2:
>>>
>>>      I only have access to S4 Spider boards. In my RC <-> EP setup, where the EP
>>>      side uses the local eDMA engine to issue MRd requests toward the RC, 256-byte
>>>      MRd requests still appear to corrupt the transferred data.
>>
>> Is the corruption deterministic in some way, i.e. are the same bytes of the
>> transferred data corrupted every time, or is the corruption "random" ?
> 
> The exact corrupted values were not deterministic, but the offsets where the
> corruption occurred were fairly consistent.
> 
> Let me quote from my earlier RFC patch:
> (https://lore.kernel.org/all/20260118135440.1958279-32-den@valinux.co.jp/)
> 
>    [...]
>    * On some R-Car platforms using the Synopsys DWC PCIe + eDMA we
>    * observe data corruption on RC->EP Remote DMA Read paths whenever
>    * the EP issues large MRd requests. The corruption consistently
>    * hits the tail of each 256-byte segment (e.g. offsets
>    * 0x00E0..0x00FF within a 256B block, and again at 0x01E0..0x01FF
>    * for larger transfers).
>    [...]

I see.

>> Does the corruption happen even on singular MRd transfer, or does it happen
>> only when a lot of traffic is sent across the NTB link? I wonder if this
>> corruption might be DRAM bandwidth related, i.e. whether the DMA does
>> possibly saturate the DRAM controller with write requests and make the
>> system run out of DRAM bandwidth.
> 
> It occurred even with a single eDMA read transfer. It was not a symptom only
> observable under high load.

That rules out my hypothesis that this might be link stability related, 
or memory or interconnect pressure related. Thank you for this input.

>>> With the following
>>>      change on top of your patch, my DMA-read tests become stable:
>>
>> [...]
>>
>>>      One detail which might be important is that limiting only MPS does not appear
>>>      to be sufficient in my setup. MPS=128B with MRRS=256B still seems broken,
>>>      while MPS=128B with MRRS=128B works fine. I wonder whether this is because
>>>      the "MPS" term in the min(MRRS, MPS) limit for DMA read transfers may
>>>      effectively be tied to the DMA read buffer segment size / MPSS rather than
>>>      only to DevCtl.MPS. I'm not sure about this yet though.
>>
>> I think setting MPS=128B MRRS=256B only leads to the transfer being split
>> into 2 x 128B TLPs sent across the PCIe link, but in the end, 2 x 128 Bytes
>> of data are received (in some order) into the read segment buffer and
>> reordered, and 1 x 256 Bytes are written from read segment buffer into the
>> memory as a single write.
>>
>> In case of MPS=256B MRRS=256B, only one 256B TLP is sent across the link, 1
>> x 256 Bytes of data are received into the read segment buffer with no
>> reordering necessary, and 1 x 256 Bytes are still written from read segment
>> buffer into the memory as a single write.
>>
>> => For MPS=128B/MPS=256B and MRRS=256B, there is difference in the
>>     transfer format between PCIe and DMA, but there is no difference
>>     between DMA and DRAM .
>>
>> But in case of MRRS=128B and transfer of 256 Bytes, 2 x 128 Bytes of data
>> are received into (separate? (*)) entries in read segment buffer, and 2 x
>> 128 Bytes are written from (separate?) entries in read segment buffer into
>> the memory as two separate writes . Could this different memory write
>> pattern be responsible for the (lack of) corruption ?
>>
>> Do you know whether the data are corrupted on the PCIe-to-DMA side (when the
>> data are received from the PCIe side and written into the read buffer
>> segment) or on the DMA-to-DRAM side (on read from read segment buffer or on
>> write into DRAM) ?
> 
> Unfortunately I cannot distinguish these from software alone. I only observed
> the final destination buffer contents after the eDMA read transfer completed.

I understand.

>> (*) Since the read segment buffer has 16 x 256 Byte segments, with 16 DMA
>> tags and never more than 16 MRd requests in flight, I think it is likely
>> that each MRd data land in separate read segment buffer segment. But this
>> information comes from another datasheet, not V4H one.
>>
>>>      One more thing I noticed in the manuals:
>>>
>>>        R-Car S4 R19UH0161EJ0130 Rev.1.30 Jun. 16, 2025:
>>>          Type00 MPSS initial = 256B, PCI R, Internal R/W
>>>          Type01 MPSS initial = 128B, PCI R, Internal R
>>>
>>>        R-Car V4H R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025
>>>          Type00 MPSS initial = 256B, PCI R, Internal R
>>>          Type01 MPSS initial = 128B, PCI R, Internal R/W
>>>
>>>      I'm still unsure, but this difference might be relevant. In particular, in
>>>      V4H/V4M RC mode your patch programs DevCtl.MPS to 256B, but does not change
>>>      Type01 MPSS. I wonder if the Type01 MPSS should also be updated to 256B first
>>>      on SoCs where the manual says it is writable from the internal bus, or if I'm
>>>      missing something here.
>>
>> This is a very good point.
>>
>> The R-Car S4 RM Rev.1.20 lists Type00 MPSS as Internal R and Type01 MPSS as
>> Internal R/W. This was updated in RM Rev.1.30 to Type 00 Internal R/W and
>> Type 01 Internal R. It is possible this change is going to be added into the
>> V4H RM in the future too. That would likely imply, that Type01 MPSS is not
>> programmable.
>>
>> I don't think Type1 affects RC operation, but does it affect NTB ?
> 
> I have no evidence that Type1 affects NTB either. It was just a speculative idea
> based on the difference I saw in the manuals.
> 
> Your inference, i.e. that the S4 RM Rev.1.30 may reflect the intended access
> attributes and the V4H RM may later get a similar correction, sounds reasonable
> to me.
> 
> I had not checked the S4 RM Rev.1.20, so I missed that change. Thanks for
> pointing it out.

I have now checked 4 S4, 10 V4H, 6 V4M reference manual versions and 
there are subtle changes. I asked for clarification. If I learn 
anything, I will let you know.

I did not make the connection between your aforementioned observation, 
MPSS, and TYPE00 and TYPE01 accesses until today, now I realized there 
might be different TLP size limits for RC and EP modes.

>> [...]
>>
>> Thank you for your help!
> 
> Thank you for investigating this and for the very helpful analysis.
> I will let you know if I find anything more.

Likewise, thank you for your help !

-- 
Best regards,
Marek Vasut

