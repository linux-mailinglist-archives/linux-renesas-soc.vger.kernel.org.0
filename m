Return-Path: <linux-renesas-soc+bounces-29565-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIScED4fuWmergEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29565-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:30:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 237A32A6C1C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ADCB43035E1D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA9639B977;
	Tue, 17 Mar 2026 09:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i39UqYTF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9DB39B49F;
	Tue, 17 Mar 2026 09:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739794; cv=none; b=JOTulsr/p9HOo/g9fhgg4I54XCHEGIvw+GQJCTWpCg5vHOJRnemQV0SpTolPbUuqdXI5ouR8b4NhX7ktEQKV85QD9FRsVasbHkdGVcs/hTedxStQsLZD1eju146udy/Ik2vVm3/5isUSBA0hIWlGYpoGi1IAw7Zzv0CVcS7GOc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739794; c=relaxed/simple;
	bh=in4VyGB0AnZoJApG7MiVWwveHRL9EwDvdLfCcNsaZGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XnolMluZF9lXAepor2mzQaTUF5cGxTVpzyAK67h3kWo99lFgg7+BlBEmOjMPbM3E1xuXICpqHcfZ0DfYOo3/pF4I0pi8dx4DhdKhXM+REc/K9x4qExP2ohsfBZcgzXPT8Cp9ChjZ/KUiiF5HzwWXukAk3Rx37zAp1DiEjUun8Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i39UqYTF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE5BC4CEF7;
	Tue, 17 Mar 2026 09:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773739793;
	bh=in4VyGB0AnZoJApG7MiVWwveHRL9EwDvdLfCcNsaZGU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i39UqYTFvobLTkeCKufdsA1I3JxL/zcQTHqm6KuPXpZHqGFkThQJ9YKm/HgZnImIW
	 Ua5xiZPdb4qzSJpv+0FxyougBPylpOM64SdwSaQDJA1QDIdvATRsr7esppoLrDfeap
	 LF4uPV09LG9A31CZZ9CTw3yZdhoWkHVqlBH5HcwGc4s15t0HvtZZm2Z0GBDHYqePzs
	 P4H6KFnx0R7aHj9XsO9yl0h7Uog2UbK7E9Qc9hIWNIpqnYe/ou3RojZTy+ShDXAnzg
	 dNVM+UOqQG4pTCE8YqZjYsMd7RmncJTKks4a1oMuCfOKkCocOQ2OskTtc/dQDqPRiJ
	 jC85qAyB4hKuA==
Message-ID: <bdefa3d7-353c-4aa1-a013-685b46773fe7@kernel.org>
Date: Tue, 17 Mar 2026 10:29:50 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 3/4] Renesas DT binding updates for v7.1
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: soc@lists.linux.dev, Magnus Damm <magnus.damm@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <cover.1773399669.git.geert+renesas@glider.be>
 <cover.1773399673.git.geert+renesas@glider.be>
 <20260314-quick-gray-saluki-0f96ff@quoll>
 <CAMuHMdXJx14SDXq7oQ-m-576GRQztRybs1HSinzf03ttvF3c_g@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAMuHMdXJx14SDXq7oQ-m-576GRQztRybs1HSinzf03ttvF3c_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29565-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,lists.infradead.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 237A32A6C1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16/03/2026 09:51, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> Thanks for your comments!
> 
> On Sat, 14 Mar 2026 at 12:09, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Fri, Mar 13, 2026 at 12:12:59PM +0100, Geert Uytterhoeven wrote:
>>> Renesas DT binding updates for v7.1
>>>
>>>   - Document RZ/G3L SoC variants, the RZ/G3L SYSC block, and RZ/G3L
>>>     SMARC SoM and Carrier-II EVK boards.
>>>
>>> ----------------------------------------------------------------
>>> Biju Das (2):
>>>       dt-bindings: soc: renesas: Document RZ/G3L SoC variants, SMARC SoM and Carrier-II EVK
>>
>> This is DTS branch patch.
> 
> It is a DT bindings patch.

I speak about branches. You quoted submitting patches in DT, but that is
implied. I already know it, I was making changes there and I already use
that document as arguments in multiple discussion, so please assume I
know it and my comments reflect that knowledge. I actually assumed that
you also knew it.

DT binding patch should go with the patch using the binding. So DT
binding for board is clearly a DTS branch patch.

> 
>>>       dt-bindings: soc: renesas: renesas,rzg2l-sysc: Document RZ/G3L SoC
>>
>> This is drivers. Splitting it into additional branch is not making it
>> easier. I don't know where is this supposed to be merged. I will take it
>> to drivers, but in the future, please do not put DTS bindings into
>> driver bindings.
> 
> This is also a DT bindings patch.

But for which code? Driver or DTS?

> 
> DT bindings are soft dependencies for drivers and DTS.
> DT binding definitions (I don't have any this time) are hard
> dependencies for drivers, DTS, and examples and DT bindings.
> Arnd merges dt-bindings PRs in the soc DTS branch.

Then this should not be a separate branch, because:

1. No benefits - you did not solve any soft dependency. Your DTS branch
is non-bisectable from dtbs_check point of view and you as maintainer of
that tree should try to make it bisectable, meaning: "bindings go before
user" like explained in what you quoted further.

And please also read rest of submitting patches, although it is in part
for "submitters" but explains the concept:

" 5) The Documentation/ portion of the patch should come in the series
before the code implementing the binding."

"6) Any compatible strings used in a chip or board DTS file must be
previously documented in the corresponding DT binding file"

Previously means "before", so your DTS branch is failing above.

2. It is additional effort to handle this, because instead of merging
one branch, I need to merge two.

> 
>> See also submitting patches in DT dir.
> 
> So the second commit is subject to II.3:
> 
>   3) For a series going through multiple trees, the binding patch should be
>      kept with the driver using the binding.
> 
> In this particular case, I could have included it in my drivers branch.
> Where do I put SoC-specific DT binding changes that are not picked
> up by anyone else (I don't have any this time)?

What is "SoC-specific"? You put the DT binding with the user, that was
always the rule and that is implied by submitting patches. If you do not
have any user, why would you pick that up?

Best regards,
Krzysztof

