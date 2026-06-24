Return-Path: <linux-renesas-soc+bounces-34391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AuZUN9aqO2o1bAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 12:00:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D206BD244
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 12:00:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jSGOtOI0;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 502D6300381A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2026 10:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2936739E194;
	Wed, 24 Jun 2026 10:00:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD302EC09B;
	Wed, 24 Jun 2026 10:00:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782295245; cv=none; b=MZMoiQ2YtwLreznXRYOZwLypW0NiFPya5Shk4G1zd5nb9yLcJON/2Q3/DUWwEz2jy8h+M3dbdX/ux7fbiAWmskuzzjpCNmkWyhyUpWuKd676DTLgCXdG8sjlTYCQW7g+sTwu7Xt81ZmI7xPesu0v5cFTTvjXfY3dhlsHwOojxP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782295245; c=relaxed/simple;
	bh=laTEffQu30ENoYzjovYORHbl9BxWdJGeaSxlz4Xl57A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MkDOoWwAWYo03XndIU4yP+U5z272cXdKPzP/2UbmBk3UH14xW0+NrlKUcRtrCO7drupG4Bi3nYj00syjxVJmSLIJbP2ccNI4P7Ao2GlqZYGjnrGbQNS1mKX5Qs+nB0HD73fEgA8OsJ5oeDU0dxO8RgN3bMGNwweq0kDbwKlBNTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jSGOtOI0; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFC421F000E9;
	Wed, 24 Jun 2026 10:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782295243;
	bh=KCBCcLI4z64/enVUt80uUXPXbpZwxYqu1B2K9/j6Eck=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jSGOtOI0OQWcvhb3He4KRUJKYASR7yA1NR2t34B0f9KLFQ14xn1eZ7rCb2XhZRhDH
	 C/yQeD3RH8WHo+my/SvzFRw0Pxx+BF3F4p375EuwBvP5TVTTBYV1bkmmwQ4e+sb9oZ
	 XA/s7cBuqJqNvrUQA8XQDQJnULe15MNsjiB4dCMnzUFofq+93afFSCf9eCff2CVJFH
	 Qc8kbN6JI8MUYZd4LQRfSNrYKCGxe+iKYmkqzIirZIT6aKcrTtjfFAFOUg3n88HzPF
	 1/xMkWN5d+dkA1qYeYEGJ0z+z46hS/DhoEultmRdszSCZcE0HiOxuccXvTAwos/w/U
	 8rV3L/vIKtIYQ==
Message-ID: <610f349f-b88a-440c-bae2-14199d047d12@kernel.org>
Date: Wed, 24 Jun 2026 12:00:36 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: renesas,versaclock7: Update
 maintainer
To: Biju Das <biju.das.jz@bp.renesas.com>, "biju.das.au"
 <biju.das.au@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Alex Helms <alexander.helms.jy@renesas.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>,
 Brian Masney <bmasney@redhat.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
 <20260624-advanced-pink-dinosaur-ebe720@quoll>
 <TY3PR01MB11346659E1A238C232E29946686ED2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <77976912-b0b0-4e08-ad9c-5080c4d8adcc@kernel.org>
 <TY3PR01MB11346A6077B4F7380078EA3B486ED2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <TY3PR01MB11346A6077B4F7380078EA3B486ED2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-34391-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[bp.renesas.com,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:biju.das.au@gmail.com,m:geert+renesas@glider.be,m:alexander.helms.jy@renesas.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:bmasney@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[glider.be,renesas.com,baylibre.com,kernel.org,gmail.com,redhat.com,vger.kernel.org,bp.renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RSPAMD_EMAILBL_FAIL(0.00)[linux-renesas-soc@vger.kernel.org:query timed out,krzk@kernel.org:query timed out,mo_sjpbuq.mail.gmail.com:query timed out,biju.das.jz.bp.renesas.com:query timed out];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32D206BD244

On 24/06/2026 11:59, Biju Das wrote:
> Hi Krzysztof Kozlowski,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: 24 June 2026 10:52
>> Subject: Re: [PATCH] dt-bindings: clock: renesas,versaclock7: Update maintainer
>>
>> On 24/06/2026 11:46, Biju Das wrote:
>>> Hi Krzysztof Kozlowski,
>>>
>>>> -----Original Message-----
>>>> From: Krzysztof Kozlowski <krzk@kernel.org>
>>>> Sent: 24 June 2026 10:42
>>>> Subject: Re: [PATCH] dt-bindings: clock: renesas,versaclock7: Update
>>>> maintainer
>>>>
>>>> On Tue, Jun 23, 2026 at 05:20:37PM +0100, Biju wrote:
>>>>> From: Biju Das <biju.das.jz@bp.renesas.com>
>>>>>
>>>>> Alex's email is bouncing. Update the maintainers list with my
>>>>> contact details to take over the schema maintenance.
>>>>>
>>>>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>>>>> ---
>>>>> Ref [1]
>>>>> [1] https://lore.kernel.org/all/ajqWevofEJ3fv856@redhat.com/
>>>>> ---
>>>>>  .../devicetree/bindings/clock/renesas,versaclock7.yaml          | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> Please also update MAINTAINERS file.
>>>
>>> It is taken care in [1]
>>>
>>> [1]
>>> https://lore.kernel.org/all/CAMuHMdW0-WsZuuc7PoVNC5DBUoY9dP+ULmGTQ76VW
>>> MO_SjpbuQ@mail.gmail.com/
>>
>> Just squash them together.
>>
>> When you fix such issue like wrong email, fix it everywhere, not just one-by-one where the maintainers
>> need to poke you to fix in other places as well. It is generic rule for bugs as well. The wrong email
>> address is the most obvious example here, because it is also extremely easy. Just use git grep.
> 
> Ok, but both patches were already queued by Geert for 7.3.
> 
> The MAINTAINERS file patch is 9 months old patch.


Hm? How or what exactly is 9 months old? I did `git grep` now and I
still see old email entry in next-20260619

Best regards,
Krzysztof

