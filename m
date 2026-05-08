Return-Path: <linux-renesas-soc+bounces-32287-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DVXIz7U/Wl2jgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32287-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 14:17:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3034A4F63B9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 14:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CFB7300914E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2026 12:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03881386423;
	Fri,  8 May 2026 12:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="igUGQkq1";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GdGtGgnT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1636E3DA7E0;
	Fri,  8 May 2026 12:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778242365; cv=none; b=JP1h/GepETdlelhvZOLPKAvXNgG0EwKRfYEBZljf3HrrBCRpj1icfgtA6S0hBhmaIRuyL9GzIEaly2Al6h+EEc1k6ALTvFOvuEGyR61oLwZVgTDIxICT5dkGiznBnFNMgEqm4eOIJMmQCh1r0BTffoFSde/Fcqi8Y8vexdL2M6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778242365; c=relaxed/simple;
	bh=8wQJi7Z/6oiDDjXY4PUnzHS4rctTBv4o5UzgnqFWSBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u3N+W646pcdmZm0BnxEoRSKAMDx6y6VvbcnOs1lpszqIaVtsy8wa7lxNRdk6C5sVEpV0OezQ5oQJ7sRWdXC0HYAQZiFIaDCpt9vEIDRTx+RxsKJbi2Xfm120PxnkdxNj1nmElZ+0leBhsRDNnmzD6+F1yDZMcnf2RsMlLC9IJpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=igUGQkq1; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=GdGtGgnT; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gBp0T75jZz9tqy;
	Fri,  8 May 2026 14:12:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778242362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tSZZrgOpw7cfjEQSWr1n0bcdUbY4FHu0Sk24TvUJj0A=;
	b=igUGQkq1Qgum4i5uly3XIvnas34fiFJEzCz1YSgK3g4judFZN28XucXGKTb0C5y7RSyf+G
	/jubVnTcJ/wLe9D6yOFcPHAXC1evYIt9luCy/g3IrsCjDSjkyiaZse9R2xI4dgVDuTS5RK
	T8qc5mVNDt+v7VCGALOmkwEt2QJNmnfzzyhND34pZK5IXfaFc+t5nfVqx/z4Zu7zIdYQx5
	BpG4SEFjCACMt1JpsomqcATItCbCwSDNPczkQ5f4da70920RHoKKKiOovGKdW4HYav/UMN
	9VFn+z5oNS0UL0Bv0cyYqc8YzNXTCrXwKYysz4fcRPtpd9KX017K4RlLmpEzIQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=GdGtGgnT;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <adbe4c78-2899-47e7-8529-49eb8f99666d@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778242360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tSZZrgOpw7cfjEQSWr1n0bcdUbY4FHu0Sk24TvUJj0A=;
	b=GdGtGgnTJkUqospHm6XSwRHJEXRKCDhqIib8UOwm27/2aixmEcsvbroWxpOKQScz6O+LH6
	+2D9KVeXOU70h+toSAPyI7rZwbUlzsrZBXpg8/qmW2hJwAlarlYcX1YWBjts43zXYrB82v
	Ds6Up4Bmm4XXFYU+NbQjHS5nW0ZVQ6rK3+ImRdnMamp9ktBzRu/u8+xouxBzVaUx0XNNfW
	DgX+OAW2u3qRpLeWW/XHKf2Ir5tSOKjg/Xk6FqF1dS+EmVY2lb0SJ9m3LqOSMYdVcmpXCt
	sZXsa69OB0jIvn0N5I/zcDdYU57pj8lBCkcr6LGEK36geCH9JqvJLZJkoVtqDQ==
Date: Fri, 8 May 2026 14:12:31 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH/RFC 10/14] dt-bindings: power: Document Renesas R-Car X5H
 Module Controller
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Saravana Kannan <saravanak@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1776793163.git.geert+renesas@glider.be>
 <053c312d07445517d8f9c84bfe3cc8fb72d4cd9a.1776793163.git.geert+renesas@glider.be>
 <39879eae-39dd-4b4d-9469-d238cd7d120a@mailbox.org>
 <CAMuHMdVumfXkBtxzVBY27SRngHG2eOoWP+cgbkWQDNDkAW1mOg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVumfXkBtxzVBY27SRngHG2eOoWP+cgbkWQDNDkAW1mOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: zu4rz6kobcocxfr7aqatpn5ssy85cf67
X-MBO-RS-ID: f4fb5f452a7f67cf7c3
X-Rspamd-Queue-Id: 3034A4F63B9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32287-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[glider.be,kernel.org,arm.com,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Action: no action

On 5/8/26 9:47 AM, Geert Uytterhoeven wrote:

Hello Geert,

> On Thu, 7 May 2026 at 23:53, Marek Vasut <marek.vasut@mailbox.org> wrote:
>> On 4/21/26 8:11 PM, Geert Uytterhoeven wrote:
>>> +  '#power-domain-cells':
>>> +    description: |
>>> +      - The first power domain specifier cell must be either the Module
>>> +        Power Domain Gating (MPDG) register index (0x00-0x3f) from the
>>> +        datasheet, or a Power Domain number, as defined in
>>> +        <dt-bindings/power/renesas,r8a78000-mdlc.h>,
>>> +      - The second power domain specifier cell must be the module number
>>> +        (0x00-0xff), composed of the Module System Reset (MSRES) register index
>>> +        in the high nibble, and the Module Reset Destination bitfield index in
>>> +        the low nibble.
>>> +    const: 2
>>> +
>>> +  '#reset-cells':
>>> +    description:
>>> +      The single reset specifier cell must be the module number (0x00-0xff).
>>> +    const: 1
>> Just one more question -- the power-domain-cells second cell and
>> reset-cells are always going to be identical values, correct ? If so, it
> 
> Yes they are.
> 
>> would be nice to keep the description: aligned, and maybe even indicate
>> in the description that those two values have to be the same.
> 
> I thought that was obvious (but apparently it is not)? The descriptions
> are identical, except for the latter not explaining again what a module
> number is composed of...

Please do spell it out in the document, this is a complicated topic and 
every little bit of extra clarity helps.

Thank you !
-- 
Best regards,
Marek Vasut

