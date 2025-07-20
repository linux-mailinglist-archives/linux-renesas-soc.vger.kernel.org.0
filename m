Return-Path: <linux-renesas-soc+bounces-19592-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBDFB0B81E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Jul 2025 22:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8616B1895C73
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Jul 2025 20:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7C320D51C;
	Sun, 20 Jul 2025 20:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UvTqpPD1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C821198E9B;
	Sun, 20 Jul 2025 20:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753042085; cv=none; b=WyhztM4FdIF8tFBal7oDgBvhpCxr0/TUqY2XYtQydqBkCkd8vAP9Tk8KjY3OhGll/Ynd2eRWl3yAbRXdFZgPXR2qqrEyM9aByItqwDJB/FcHd2aH9317UtzQG/j2KNP9ujGbGS7O7LrrehY1HoNIUFbo/nB0/L/Tq6KOiceO6+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753042085; c=relaxed/simple;
	bh=HE5XfTbqoBFUbJB80+/8sdW4W7hcnSgLwxV3XXsUcw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oSwr4Qs0iJkApKWRObQlYHZuKWiT2oq0hoPss6dZboODq1P12guRX6c6eBw6zm9JBqRZnFNwSudXHRnqKf4uI61MSzsBvG2NJtWEtvGN7ASpWCOv+21mTzF4vmP3zStzUn12eD+rk2O1PMulvIxyjBwJGgALhe4TiZuEfngpPC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UvTqpPD1; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4blZMh3GvHz9sjY;
	Sun, 20 Jul 2025 22:08:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753042080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f2mnKQ0A6cmyOjTY4uC1w0qQca4Edbna8BbLEyyk48c=;
	b=UvTqpPD17fL7QiwSGNffDuWHFM1alqTcV7ulBZJ5x7levFeT5zhMBeVDu1BxlQyPqUM9fd
	ec3XL+nE7uWwsy9HoSE//tfpSFIXmpCNBUmtAX+yKE4A5NbIDVvF7K/176pgbYvejeUBls
	O/Rws2O/OqwfdsMgE/xjLgS8o1LQwnqY4PIUkmf8lja+l+6iZFqq9GCmNvH7WMXiUzPCJ2
	UIOTNsIXhpdyBTC8fENyPEiPZLr8ROctIsem9uMY0wd0ogKLyzh53VVuUuphft90EqjTzK
	+94MCqtUMdvnoTFXbZA/JLuI/9c+DSw8SU/pM1Qid8DakkMenS9SBNRU3qo2Hg==
Message-ID: <9ba974d7-456d-4255-bb74-cfd1998a43ae@mailbox.org>
Date: Sun, 20 Jul 2025 22:07:57 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Document after shutdown
 fan settings
To: Rob Herring <robh@kernel.org>
Cc: linux-hwmon@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250629220301.935515-1-marek.vasut+renesas@mailbox.org>
 <20250708155058.GA477029-robh@kernel.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20250708155058.GA477029-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: am9qc1c5pjaufgrd1fewytyoucn99ho8
X-MBO-RS-ID: 9153788d8f5d9aa425f

On 7/8/25 5:50 PM, Rob Herring wrote:
> On Mon, Jun 30, 2025 at 12:02:08AM +0200, Marek Vasut wrote:
>> Document fan-shutdown-percent property, used to describe fan RPM in percent
>> set during shutdown. This is used to keep the fan running at fixed RPM after
>> the kernel shut down, which is useful on hardware that does keep heating
>> itself even after the kernel did shut down, for example from some sort of
>> management core.
> 
> This sounds more like "don't ever let the fan go below this RPM" or
> "don't ever turn off the fan". IOW, it is more than just shutdown.

This property is literally only used during/after shutdown , this does 
not limit or affect fan RPM during runtime in any way.

Also, sorry for the late reply.

>> diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
>> index 8b4ed5ee962f..a84cc3a4cfdc 100644
>> --- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
>> @@ -31,6 +31,15 @@ properties:
>>         it must be self resetting edge interrupts.
>>       maxItems: 1
>>   
>> +  fan-shutdown-percent:
>> +    description:
>> +      Fan RPM in percent set during shutdown. This is used to keep the fan
>> +      running at fixed RPM after the kernel shut down, which is useful on
>> +      hardware that does keep heating itself even after the kernel did shut
>> +      down, for example from some sort of management core.
>> +    minimum: 0
>> +    maximum: 100
>> +
>>     fan-stop-to-start-percent:
>>       description:
>>         Minimum fan RPM in percent to start when stopped.
>> -- 
>> 2.47.2
>>


-- 
Best regards,
Marek Vasut

