Return-Path: <linux-renesas-soc+bounces-35264-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z1r9MnmXV2pcXgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35264-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 16:21:45 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F2775F4E5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 16:21:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="F/V3v9ut";
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=N6c52Re9;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35264-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35264-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=mailbox.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D23D324EF95
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 14:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97F837DEBE;
	Wed, 15 Jul 2026 14:11:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA8137DEBB;
	Wed, 15 Jul 2026 14:10:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124661; cv=none; b=bDlPCXiEbh5uGMsaDrVlQCq+jV51XFBrt/UXYUpLcAeNs9/Z+TXOwcVRTbSejw+PXLw4+H+rTrtzkaII1lXO/FA7yN5yYg4jXgT7TINhVqsL8VVdHu0l47PNFvuWJ2vCnvm+zlkNzyvjVhQI7YNlLzC/HPu8lbrt9tnJySxW+U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124661; c=relaxed/simple;
	bh=mjO1eLJTzvr5we4SILqTlLNZXZyPr7noZAruO5jj37s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=flVugeGgDhWEt38BydIImQzVemrbDVFCP3f8ZU6BATPdPUrfxAVEDpfScjgIcFd/zUBpWU58xbEeaaxuZHaM/XYzxFxz6QvKQ3KUU3XQCKu5YsdgdZ+e3Y3T82uuUG9uQsH5/Lct6HM0fV38F5Pcc2ePt8SrrU9jzEm5pqWKtqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=F/V3v9ut; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=N6c52Re9; arc=none smtp.client-ip=80.241.56.172
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4h0dPX65yPzMlH0;
	Wed, 15 Jul 2026 16:10:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784124656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sWcJy8AVXvzucJnbuxsBlK4QMspmeRMnc/T8cZju6zI=;
	b=F/V3v9ut4Fa/W0qdgPuLDMrZa8vo+KfIr+ksNlDIBXglbUylOvdCqFz0FStzmwuriUxZAG
	Hoe7+6MfFp2vhIIpPVjjCDl3ywqoEh+R6qSN3eu2UVANZz4CIWOjjkB/SYDmqA8gt8at5M
	pl/tOi9uoNnxrrOCeLOAloBJmufOwr+29yU40MP3FIjnZmFRmjTKvAHNBzpTONxHh2xlmL
	XalExZfLK2g9fdLWw5W4lOOZsdOB9PHxM5vMwz15mqjXlMPnHqoR7TAeJcSGRc5xPcqhOG
	PJgyOuu9WmN29nXzzM94drty95cmLylGRWwhz7xDCf3bgr1Dj2RXxyK814P8kQ==
Message-ID: <e0e9e2c7-b125-4200-884b-933cc1ea6b2a@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1784124655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sWcJy8AVXvzucJnbuxsBlK4QMspmeRMnc/T8cZju6zI=;
	b=N6c52Re9g/S8W0C50YNI/VnO25lBmCiT3pzg7Arg9HRNCRZ7a/iF2/BWvohnI0kGjpm6nT
	mor+P2e80rkyO67xNEJBMc54VDsQDonKo/0FJM3BW8GjTdBXQgltedDzhRl8DOZuUbGqK+
	rUt1Ex5jW59dICVYrgPXzLgP2EtrOpaS3KevmBYpiI6OGYWW37ojfcq/4y5t6nj/KWzytD
	vtlEx3wskXPWB7TZg6a+Phpsvbo4IBenxpoOQ+Q/B0yoaEng7pFk+j83YGTcOzYo/Qj32S
	ZuttVNnxNUwRYKfH4L1HVF1anPYScQTipghFKUUPpLS+Yyh96Aric0SBiiWrzw==
Date: Wed, 15 Jul 2026 16:10:48 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] PCI: rcar-gen4: Isolate driver to ARM64
To: Manivannan Sadhasivam <mani@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-pci@vger.kernel.org,
 kernel test robot <lkp@intel.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260714131957.38067-1-marek.vasut+renesas@mailbox.org>
 <20260714211030.GA1412991@bhelgaas>
 <jipy4hvsmksv6fy352y23sjdnutpkqoi2577qp5vymqqggiscz@cnx2vijnhvh4>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <jipy4hvsmksv6fy352y23sjdnutpkqoi2577qp5vymqqggiscz@cnx2vijnhvh4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 431aabb15f8d3f0014e
X-MBO-RS-META: 3nwked576sj6tfybptqfskq4fgtauqm4
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35264-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mani@kernel.org,m:helgaas@kernel.org,m:marek.vasut+renesas@mailbox.org,m:linux-pci@vger.kernel.org,m:lkp@intel.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mailbox.org:dkim,mailbox.org:email,mailbox.org:mid,mailbox.org:from_mime,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22F2775F4E5
X-Rspamd-Action: no action

On 7/15/26 4:03 PM, Manivannan Sadhasivam wrote:
> On Tue, Jul 14, 2026 at 04:10:30PM -0500, Bjorn Helgaas wrote:
>> On Tue, Jul 14, 2026 at 03:19:27PM +0200, Marek Vasut wrote:
>>> The driver includes linux/irqchip/arm-gic-v3.h which pulls in headers
>>> which are available only on ARM and ARM64, on other architectures the
>>> headers are not present and the driver fails to build. This driver is
>>> used only on ARM64 hardware, isolate its build only to ARM64 to avoid
>>> build failures on other architectures.
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202607100310.iQw5m9Uo-lkp@intel.com/
>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>
>> Mani, I assume you'll squash this into 89bded511a66 ("PCI: rcar-gen4:
>> Configure AXIINTC if iMSI-RX is not used") so it's connected to the
>> addition of the linux/irqchip/arm-gic-v3.h include and there's no
>> bisection hole?
>>
> 
> Yes, squashed now!
Thank you both.

