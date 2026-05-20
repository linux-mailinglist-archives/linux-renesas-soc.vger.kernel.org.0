Return-Path: <linux-renesas-soc+bounces-32866-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Fy5BdinDWpr1AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32866-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 14:23:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C7658D90E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 14:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 48562300146D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 12:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9CB3DBD49;
	Wed, 20 May 2026 12:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bjOYa5h9";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Bi7lvDu2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C42348477;
	Wed, 20 May 2026 12:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779279814; cv=none; b=mFMl2BzjKourz7qzGRf/nFfUDE01kIZuZM3L46gB9fTANq901P4tFEwI7lZeuwZ+vNAUd6hkgice52BOK/Q3tbb4DgXpC2ndzOX36UpD+I7rvKNPJdR7FUjjT7/nJW8ohJSzF81vcUz7ueeLbvcu6D9bHZ9nyEUHLehY5P6WJSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779279814; c=relaxed/simple;
	bh=yabr+mLnYjmJrDFUlbTeYhy8DvjYmQ6CTk0VkDwu5uM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NbK3yn/iTtApb3jFi/fg79gUsBmMWXOAjsB04UHZFFISZAS4sYrh+ilnL9grjGrgf8CX7owwZZHtFJg6QNemCO5n85QT/G13bCLmaRuYZiU7vOxtb3b6rp2a/v9XUH9Ob9kIXGl4ZhL1FtNNcgqiI4J875oQYsLDQvaJMd9L43k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bjOYa5h9; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Bi7lvDu2; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gL9gH07Hcz9v3M;
	Wed, 20 May 2026 14:23:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779279803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p6+Z1xD4o7CkUQDqcKl9QTF25+NgkTJNZQXpxfZDUNI=;
	b=bjOYa5h9y02MEQY0wtwHTa3PStB84Uy2fkrom05BnQG7mx65d7oUV24p8Oa68cAC5/OJPU
	F15sZM4hgUqN5IYJoDlPXl1Ad7I/8iiKKjtdAtdbppqtgR5TFKx/y1ngoNv3v45b9uWncV
	uavCPYOdLMYA7FzxvQfMct6tXnwsGEpigK9X5yh95q90+xMd8p5knGoEc+/zB6Ytv6hn1F
	DlDXXgHz7MWnZ0rteow2lD7FCgx1tQx7e2CdaRDmYA0nhqv06JkeB0slfqbddIgYXH2KPx
	mbKDRlz/Bu+yPwZIlCHP9HpBnjk8KzN9RiP3fQLPBO0SLBepww+YLzh6WaQ+CA==
Message-ID: <b0281409-a9dc-42ba-af02-a10e48b8b39b@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779279801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p6+Z1xD4o7CkUQDqcKl9QTF25+NgkTJNZQXpxfZDUNI=;
	b=Bi7lvDu2nYdYbB1ExY8xoc9BqNaFAcgZ0vZrIrt34XBHaAE15oIW+gS+BfiY8bI0dQNX6m
	Hl/KQlDIEAKwjqw1AVdt0DoZ9DU2A6Y7SDfxmDgnxOsPXd/YDcT0STcmcG/vVZuYM53d0G
	+q9SHnsCj09FcSGzD0cUwEmANGKLFJ/rITHKJNNrfUp7/f4Y7JJibw8wZE5ifuXeHKJ5B2
	BD+73dhSG9IbwpxBqcfOf3yKeVsSaB5lewuiRXYGrOUtuaFuPodZeDp/RFIal1MWUKyJMy
	7qe75cvzN+LPZF/iC42FewR6rBUBp+tUQTYyUheWNOpXSY+XaE6jmryscHd+ow==
Date: Wed, 20 May 2026 14:23:15 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] PCI: rcar-host: Remove unused LIST_HEAD(res)
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260520091111.67666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUpa_R0C70eJjS6urpSx3jtcVnbjZ8K0OvhO25Bx1-u4g@mail.gmail.com>
 <CA+V-a8t1osQxWOn2Veyjmy2kquKn7XvTbX9h7uGXtTje4N2Jmw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CA+V-a8t1osQxWOn2Veyjmy2kquKn7XvTbX9h7uGXtTje4N2Jmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: k3997pbgcumjtqogyk96yz5fzm6y4dxo
X-MBO-RS-ID: f88f901e2e49ac6810e
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32866-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mailbox.org,renesas.com,kernel.org,google.com,glider.be,gmail.com,vger.kernel.org,bp.renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,glider.be:email,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Queue-Id: A7C7658D90E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 12:04 PM, Lad, Prabhakar wrote:
> Hi Geert,
> 
> Thank you for the review.
> 
> On Wed, May 20, 2026 at 10:20 AM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>>
>> Hi Prabhakar,
>>
>> On Wed, 20 May 2026 at 11:11, Prabhakar <prabhakar.csengg@gmail.com> wrote:
>>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>>
>>> Remove the unused LIST_HEAD(res) declaration from
>>> rcar_pcie_hw_enable().
>>>
>>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>>
>> Thanks for your patch!
>>
>>> --- a/drivers/pci/controller/pcie-rcar-host.c
>>> +++ b/drivers/pci/controller/pcie-rcar-host.c
>>> @@ -346,7 +346,6 @@ static void rcar_pcie_hw_enable(struct rcar_pcie_host *host)
>>>          struct rcar_pcie *pcie = &host->pcie;
>>>          struct pci_host_bridge *bridge = pci_host_bridge_from_priv(host);
>>>          struct resource_entry *win;
>>> -       LIST_HEAD(res);
>>>          int i = 0;
>>>
>>>          /* Try setting 5 GT/s link speed */
>>
>> Indeed, this was never used since its introduction in commit
>> ce351636c67f75a9 ("PCI: rcar: Add suspend/resume").
>>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>
>> Since this does not seem to cause a warning, even with W=2 (TBH,
>> I had expected some shadowing warning), no Fixes-tag is needed?
>>
> It does actually,
> drivers/pci/controller/pcie-rcar-host.c: In function ‘rcar_pcie_hw_enable’:
> drivers/pci/controller/pcie-rcar-host.c:357:34: warning: declaration
> of ‘res’ shadows a previous local [-Wshadow]
>    357 |                 struct resource *res = win->res;
> 
> So, I'll respin it with the fixes tag added.
I think Fixes tag would be appropriate here, since the variable is 
redefined in the same function, which is confusing.

Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thank you !

