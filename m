Return-Path: <linux-renesas-soc+bounces-31906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uElCFi3g92lfnQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 01:54:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6214B7CB0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 04 May 2026 01:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0AEAE3001313
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 May 2026 23:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D893CEBA9;
	Sun,  3 May 2026 23:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="D0zo53Qs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9048B2F290A;
	Sun,  3 May 2026 23:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777852458; cv=none; b=N0fUN6u4toP07cYhk6wdzL3RC5S7XQWny9aJBN0iiXbmZuJw4y7/CNMakikupLImVrRTx21B/i0lFEJGQBIn7Qeh3l3WRevvTBoW5ZczKo+ZWNxkPAWg6um2ryyX4EdVIJZdj52/BXDg45CMsapjRghRbKafCSYGEdoJz4FQ6Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777852458; c=relaxed/simple;
	bh=+/9ZPV3Ls9eTRutrc+DL0VDyzqbT5fjfYQVWFfKkG5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W2m39Wg3SXhfFZP4qPG6dXSEl558iYaNBYq7A6rG1deo+dSB6W2iHQRzo2JMFk1zT6C7jNVZnGo3kNp5Sv+kofga7Ncz8Dwe38gQ1eWmRM+Dk+6f3Z1r4IGU1dG+yjIsAEh8hAiNxzKE1ReDXgJOP2kzADapRIx62rBiaCjgAeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=D0zo53Qs; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g81p65LJmz9tG7;
	Mon,  4 May 2026 01:54:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777852446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gbT4vaB0sGuZY+4GMUSVBAGk/Ihyd7fLiazH/3ZH0s8=;
	b=D0zo53Qsh702xSh0m5k8p4O2pTS+UgiX1AGKooGRUl3H87e9zen1B6sH4XZM+UJKY6cHNB
	EikRdJLcIXX1VuhyFoIoDgjOOtkli0U4epL9avpopoWM4Ze4vMM3lVVf0uvGt2J2imgFlQ
	WHUS+BUt1L0q1veGiHrdFHDzWMyCCM7OzuoOdAWuK5jJtG7STZaix5SC0Ui6Eyg85SIUh7
	wGuwgS5BJky592LuAJhqAuKgbVQVzBnDF7+j5yf2kPDHCns/TzObUHrlnVrI9QWzcvK5Lc
	OEi0SfjVH7NaN1MXNGx/B/cGQ+vwBf+KHt3wOgqJ5u1v68fJkRJ24og2XD3iew==
Message-ID: <66d050f4-5d21-43e0-af8e-39a0d6c4b0ec@mailbox.org>
Date: Mon, 4 May 2026 01:54:01 +0200
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
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <oeb2uiudm7afzzzy3f5rykzctfnxlsydit6ww5raohcbxo3v34@hmnqr2ud42kq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: af6812f820f262f57a6
X-MBO-RS-META: 5w83fjf7ysioag1tbj4ec9i8bw4c39he
X-Rspamd-Queue-Id: 0D6214B7CB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31906-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On 4/28/26 9:00 AM, Koichiro Den wrote:

Hello Den-san,

> The patch makes sense to me. Let me ask two questions:
> 
> 1. Could r8a779f0 (R-Car S4-8) be handled as well, perhaps by adding a separate
>     .additional_common_init() implementation for it?
> 
>     As far as I can see, the r8a779f0 match data currently does not use
>     rcar_gen4_pcie_additional_common_init().

I will address this one in V2, thank you for pointing that out.

> 2. Did you also happen to test V4H/V4M in endpoint (EP) mode, with the local
>     eDMA engine issuing MRd requests toward host memory?

I was not able to test this configuration.

Is it possible to perform this test with a single device, by having the 
eDMA do local-memory-read-to-local-memory-write transfers, maybe using 
PIPE_LOOPBACK/LOOPBACK_ENABLE bits, or do I need two devices with NTB 
connection between them ?

In case it is the later, could you please briefly describe the S4 NTB 
setup you use, so I could try to replicate it locally ?

> Your commit message
>     describes an NVMe device as the requester, but I'm wondering whether the same
>     256B limit was also verified for the R-Car EP DMA requester path.

This part I currently can not answer, I'm sorry.

...

I made the following two observations in the meantime.

First, I wrote two SSDs, Crucial P5 Plus SSD without HMPRE (without host 
memory buffer) and XPG GAMMIX P55 with HMPRE (with host memory buffer) 
with 4 GiB of random data on another system (iMX8M Plus, ARM64 with DWC 
PCIe controller too), then I did a read back and compared the data, the 
writen and read-back data matched.

Then I plugged both SSDs into V4H Sparrow Hawk _without_ this patch, and 
I did read back of data:

- Crucial P5 Plus SSD without HMPRE (without host memory buffer)
   -> Data read back match data written on iMX8M Plus, OK
- XPG GAMMIX P55 with HMPRE (with host memory buffer)
   -> Data read back match data written on iMX8M Plus, OK

Then I wrote 512 Byte of data into the Crucial P5 Plus SSD without HMPRE 
on V4H Sparrow Hawk and did read back again.
   -> Data read back does NOT match data written, NG

That would indicate that:
- WRITE transfers from SSD to DRAM are OK
- READ transfers from DRAM to SSD are corrupted at 256 Bytes boundary

That would indicate that we need _at_least_ the 256 Bytes limit, likely 
on both MPS and MRRS.

Second, I got a report of another SSD for which this patch is not 
sufficient. I currently do not have access to that SSD, but I will ask 
for access and investigate. That may shed some light on the 128 Byte 
limit below.

> (*) The background for my question 2:
> 
>     I only have access to S4 Spider boards. In my RC <-> EP setup, where the EP
>     side uses the local eDMA engine to issue MRd requests toward the RC, 256-byte
>     MRd requests still appear to corrupt the transferred data.

Is the corruption deterministic in some way, i.e. are the same bytes of 
the transferred data corrupted every time, or is the corruption "random" ?

Does the corruption happen even on singular MRd transfer, or does it 
happen only when a lot of traffic is sent across the NTB link? I wonder 
if this corruption might be DRAM bandwidth related, i.e. whether the DMA 
does possibly saturate the DRAM controller with write requests and make 
the system run out of DRAM bandwidth.

> With the following
>     change on top of your patch, my DMA-read tests become stable:

[...]

>     One detail which might be important is that limiting only MPS does not appear
>     to be sufficient in my setup. MPS=128B with MRRS=256B still seems broken,
>     while MPS=128B with MRRS=128B works fine. I wonder whether this is because
>     the "MPS" term in the min(MRRS, MPS) limit for DMA read transfers may
>     effectively be tied to the DMA read buffer segment size / MPSS rather than
>     only to DevCtl.MPS. I'm not sure about this yet though.

I think setting MPS=128B MRRS=256B only leads to the transfer being 
split into 2 x 128B TLPs sent across the PCIe link, but in the end, 2 x 
128 Bytes of data are received (in some order) into the read segment 
buffer and reordered, and 1 x 256 Bytes are written from read segment 
buffer into the memory as a single write.

In case of MPS=256B MRRS=256B, only one 256B TLP is sent across the 
link, 1 x 256 Bytes of data are received into the read segment buffer 
with no reordering necessary, and 1 x 256 Bytes are still written from 
read segment buffer into the memory as a single write.

=> For MPS=128B/MPS=256B and MRRS=256B, there is difference in the
    transfer format between PCIe and DMA, but there is no difference
    between DMA and DRAM .

But in case of MRRS=128B and transfer of 256 Bytes, 2 x 128 Bytes of 
data are received into (separate? (*)) entries in read segment buffer, 
and 2 x 128 Bytes are written from (separate?) entries in read segment 
buffer into the memory as two separate writes . Could this different 
memory write pattern be responsible for the (lack of) corruption ?

Do you know whether the data are corrupted on the PCIe-to-DMA side (when 
the data are received from the PCIe side and written into the read 
buffer segment) or on the DMA-to-DRAM side (on read from read segment 
buffer or on write into DRAM) ?

(*) Since the read segment buffer has 16 x 256 Byte segments, with 16 
DMA tags and never more than 16 MRd requests in flight, I think it is 
likely that each MRd data land in separate read segment buffer segment. 
But this information comes from another datasheet, not V4H one.

>     One more thing I noticed in the manuals:
> 
>       R-Car S4 R19UH0161EJ0130 Rev.1.30 Jun. 16, 2025:
>         Type00 MPSS initial = 256B, PCI R, Internal R/W
>         Type01 MPSS initial = 128B, PCI R, Internal R
> 
>       R-Car V4H R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025
>         Type00 MPSS initial = 256B, PCI R, Internal R
>         Type01 MPSS initial = 128B, PCI R, Internal R/W
> 
>     I'm still unsure, but this difference might be relevant. In particular, in
>     V4H/V4M RC mode your patch programs DevCtl.MPS to 256B, but does not change
>     Type01 MPSS. I wonder if the Type01 MPSS should also be updated to 256B first
>     on SoCs where the manual says it is writable from the internal bus, or if I'm
>     missing something here.

This is a very good point.

The R-Car S4 RM Rev.1.20 lists Type00 MPSS as Internal R and Type01 MPSS 
as Internal R/W. This was updated in RM Rev.1.30 to Type 00 Internal R/W 
and Type 01 Internal R. It is possible this change is going to be added 
into the V4H RM in the future too. That would likely imply, that Type01 
MPSS is not programmable.

I don't think Type1 affects RC operation, but does it affect NTB ?

[...]

Thank you for your help!

-- 
Best regards,
Marek Vasut

