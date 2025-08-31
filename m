Return-Path: <linux-renesas-soc+bounces-21098-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C253EB3D4D3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 Aug 2025 21:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 352531899B3C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 31 Aug 2025 19:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D44A5274FDB;
	Sun, 31 Aug 2025 19:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Art1loHR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267FB6BB5B;
	Sun, 31 Aug 2025 19:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756667633; cv=none; b=RpDCntmu6O1QHJ30g+MQjv3T6/UZVkWa319erBo3D0v9rd3G81kIjggHnrNnw0P/u1rC8jAHQDDUDhcIOgg0aAxVbqqLtpr4xONwnZncWXlrSUmaiaJIZKgiDB/mps6GxifSVTaZwjoF193x6W9ZBAMwhxomOvoBCiLp/gP9ots=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756667633; c=relaxed/simple;
	bh=Zz4CiUJdKuLyzsVTw2sNXXRL7PXg2USqZieTjhOOOcw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=EE5yP621zuHLYBKDruTTlsC4U044acB6BBSTnI4Rjun0A5sYt43/YpqHJ2iufPcQJafvbrWmpDeTpkpf5upLKr0fUNvxjs8pz0itf6GAyrXD6DDZ97iGOz+Sus5oe/9pfSI1+sh+ZeyXpTWs/zZe7Jf3suuPha5uVzGyu4vTyGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Art1loHR; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cFM9m4kSzz9t9F;
	Sun, 31 Aug 2025 21:13:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1756667628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AycHrkg/XYaDgntfqnuFWHGSamym4f2b+3dyVHsp2q0=;
	b=Art1loHRFv8VlbHiEEu0hzi6VMeux4pKZQpv9cfS5Qr+xG4ryooYiTd64BdbbpJatbXuHf
	h8xA1VJcWBv4cAkXiwiuoge0yG1r57PL9+vUJYK2MCl/I164yQ9zRU3JML23a3lFUnWHTv
	c8C7eShj13ZPqDpO2pzbQLxs7yPL1GJcZ3k8bczeLVZQqSfKbXuzpj2WRuSLy6pRtYWZTb
	ImtCPUW+pS0uZgUX/VkVaxEoNeOb6A16EToiMWyzq7z9+Dmr6yLd578j+tUip8u1edbshe
	yI5Vj9TQ0G9Ljhr3qb3WzW2WYnnughwD7Xn8UNCwDpTk1gQuTafoSzTqSgAP3Q==
Message-ID: <4aa7dcb5-fada-43dc-b9e1-b51bb328fc02@mailbox.org>
Date: Sun, 31 Aug 2025 21:13:45 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Document after shutdown
 fan settings
From: Marek Vasut <marek.vasut@mailbox.org>
To: Rob Herring <robh@kernel.org>
Cc: linux-hwmon@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250629220301.935515-1-marek.vasut+renesas@mailbox.org>
 <20250708155058.GA477029-robh@kernel.org>
 <9ba974d7-456d-4255-bb74-cfd1998a43ae@mailbox.org>
Content-Language: en-US
In-Reply-To: <9ba974d7-456d-4255-bb74-cfd1998a43ae@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 5a7321e9d93bb22678b
X-MBO-RS-META: ybeo1azraad6ggm91srmjbu1j6tmzrpy

On 7/20/25 10:07 PM, Marek Vasut wrote:
> On 7/8/25 5:50 PM, Rob Herring wrote:
>> On Mon, Jun 30, 2025 at 12:02:08AM +0200, Marek Vasut wrote:
>>> Document fan-shutdown-percent property, used to describe fan RPM in 
>>> percent
>>> set during shutdown. This is used to keep the fan running at fixed 
>>> RPM after
>>> the kernel shut down, which is useful on hardware that does keep heating
>>> itself even after the kernel did shut down, for example from some 
>>> sort of
>>> management core.
>>
>> This sounds more like "don't ever let the fan go below this RPM" or
>> "don't ever turn off the fan". IOW, it is more than just shutdown.
> 
> This property is literally only used during/after shutdown , this does 
> not limit or affect fan RPM during runtime in any way.

How can we proceed here ?

