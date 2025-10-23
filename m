Return-Path: <linux-renesas-soc+bounces-23509-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC08C0185E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 15:47:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FC54188B480
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 13:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0689E30595D;
	Thu, 23 Oct 2025 13:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="o9+wlKtp";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="AV+NJSsT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4525D7262D;
	Thu, 23 Oct 2025 13:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226932; cv=none; b=HNMVm69puw7iPp1tK6o0H6Sn8+P1Y+bnAYUHiBEoCyEedT/J3xRyiWDeQhj7/7m9PoPcCzwRdYmcFX6KMRbALcn+CNnt+8nSP5pkt5A++TJ178aqVfLZS7OvNOggsagldsOURa8CSGe6+cgIOitdeDJimBCPtn8kbWCvoCNSsw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226932; c=relaxed/simple;
	bh=GTtIYbhf+1LHFMd9CePCzCzU/48vsFFXnqOuRt14OHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cX0wzh/+PER2Q+PdbZ/CFj5Qv2VkC9678ujJHxfHrIPbgCUW7rQ2oSzt+RNvEYJbZlKgbwHUHHV76VWDxBNq8sMP8y8z/fRsNsls8xlTpiEpq6QwaDiZ6ZFRmPa1UGR7QjqRm0hdqgVTx98wg4hxAfDSZzWh/6hg9yNCtEU3E9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=o9+wlKtp; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AV+NJSsT; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4csnJc1Cmgz9slM;
	Thu, 23 Oct 2025 15:42:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761226928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=liOfj+w7oQQHQDinbActumCxZ7ts8b1PR9+ClEG2E04=;
	b=o9+wlKtp+2kDP0Zbjrkwnbw8gWzh21UrNc2ucsM9ov4omiyPctnbOnoSsjI0i/mc93P2K7
	Fotzk1NrnxIas6RJz6KAKgbKUfVWbPN2RXt91urKFmxXVDolED2nwYLqtussQQnOyjIl1/
	gZ6dtn6k83cUX+d3j4SmOriLX4GMLtpgabRBkDQnvaD4jPXt5b8Qh8bbGcnXQRKkeEtt0X
	tYJYT17NeaBBxiVEQhMJyl4L74bfRJzjQRDGyy6wGqYbYXRdpkR55ER3cz38+1PpCEB9BT
	hOm4II+4u95AUPJQztPhy0q076I/ktLAtnSXS4BCudy4m5+pBjZ6i1w+W8rSrg==
Message-ID: <066449c8-4bca-41f1-990e-53d7672e3c0a@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761226926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=liOfj+w7oQQHQDinbActumCxZ7ts8b1PR9+ClEG2E04=;
	b=AV+NJSsTsrmJu2xpIi8b3X4WAqCpmXBK6i7v/WDnXuzr7Gg4IKoUADsAAhOCN4rWt9UrIq
	aeIBV4emYzweIn7+H16S3dLe1TyA6HXoLfuffCUu5mSSIxvgbF12gIx5X0pE24bwHuHrZ3
	q4kaZTEt9S8/VybcH7XmQJRr9P0T3j/SDO8b/yKUll37QKvLoe4hfBUXwv0IXur9Rbmc5m
	SQVLqGyGyAT8OrUEvdENH4xHFWg0vAITTgU/Mb7kOtQ6jQtTi0pLaVcIcg/7N884H9ULy0
	VGLaHH+WAMlmevcfutwJh3GqNKUgogPGfisdha+YbyBdXzJ2s5SSPuCoLtIUBw==
Date: Thu, 23 Oct 2025 15:42:02 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
To: Sudeep Holla <sudeep.holla@arm.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <20251023-able-fervent-tortoise-e7a6df@sudeepholla>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251023-able-fervent-tortoise-e7a6df@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 2b7b03ec44f958831f6
X-MBO-RS-META: d7cbac4yirg6dmrd4f7ehr3mnryd66c3

On 10/23/25 3:16 PM, Sudeep Holla wrote:

Hello Sudeep,

>> +  arm,poll-transport:
>> +    type: boolean
>> +    description:
>> +      An optional property which unconditionally forces polling in all transports.
>> +      This is mainly mean to work around uncooperative SCP, which does not generate
>> +      completion interrupts.
>> +
> 
> Could you please clarify which platform and transport this change pertains to?

Renesas X5H with older SCP firmware , accessible via mailbox.

> Introducing a property that enforces unconditional polling across all
> platforms is not ideal - particularly if this is intended as a workaround
> for a platform- or firmware- specific issue. Such implementations often get
> replicated across platforms without addressing the root cause, leading to
> wider inconsistencies.

The root cause is being addressed already, this is meant to keep the 
older SCP version operable.

> It would be preferable to scope this behavior using the platform’s compatible
> string. This approach ensures the workaround is applied only to the affected
> platform and prevents it from being inadvertently enabled elsewhere, unless
> another platform intentionally uses the same compatible string (which seems
> unlikely).

This is not platform-specific issue. SCMI provider which fails to 
generate interrupts can appear on any platform, using either transport, 
that is why I made the property generic.

-- 
Best regards,
Marek Vasut

