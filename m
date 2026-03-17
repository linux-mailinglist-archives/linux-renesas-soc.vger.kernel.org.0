Return-Path: <linux-renesas-soc+bounces-29551-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIv2OsAbuWm+qwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29551-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:15:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B962A6543
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 10:15:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 979F93075F40
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 09:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DE44359A97;
	Tue, 17 Mar 2026 09:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fvfH09Ox"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE97235836F;
	Tue, 17 Mar 2026 09:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773738701; cv=none; b=bzD6KgEUOrGJ77xaULTY5YQvaH+qwDtssxNdpFC506J78fFgCyQfceS1f/zaW0S2SDRAC7aRBEMLd9GDvmJK125KartK6iFgL7zkLDluj8x4Snsqj5BNNz9b2bT5k9LNJ183jvQN17vTeaKGkWq5SMF9+skYnQupjD83wf7aQuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773738701; c=relaxed/simple;
	bh=BzmkYmqk+b2RtlUzCdKWXMzHPnRFieI71IicbZl0NgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZvG1WOyJNeIhy+vYvS+55xSUfIN5bCFSwcAmD9KJTXNNfZLipe2Q2Ej0F9krBR7VJAQEVziiWdo9PRaDt59Fk4ZMyt25J9AD+sDyxb5e0i69fZCdf4rHUeBeZr9bLwCL8y7Enp/XFOAFHfq0thE+FtgHeUGNR6rfJ4O9iQ/lzE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvfH09Ox; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2DCBC4CEF7;
	Tue, 17 Mar 2026 09:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773738700;
	bh=BzmkYmqk+b2RtlUzCdKWXMzHPnRFieI71IicbZl0NgE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fvfH09OxPAvRaBYMrJKcAXFUYB48JQx8i2ukLbEZCkgje2HfdhFxCuK/C/Ngafy8i
	 tG6asppJKODyIRXkzx+NgYSs5bVDQV7f+WMGerog6qN8/Uj95V8QLlWstuwJODkP0R
	 +Pgmb53IiI+WrsKw/HZN90LCqq3HmjV52/r6RojY5/b/PgO3woqQEm2zJfIn5pTVpF
	 NIf6lUc6tpw7lDttMWrSDt/47CjNZA2LIZaCTAILNyygh9ptM/Oz/9kazsu/He5scB
	 Zazt6GeX7QFAnztzYmfAHUykXFdep+kJvbkOcCLIXLwi0bKjSQUYnpwARle1dOyPQ3
	 yuOKGE1VuRWlg==
Message-ID: <0234dc75-b042-4408-bbad-a777c0bddb3f@kernel.org>
Date: Tue, 17 Mar 2026 10:11:37 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL 0/4] Renesas SoC updates for v7.1
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Konstantin Ryabitsev <mricon@kernel.org>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org
References: <cover.1773399669.git.geert+renesas@glider.be>
 <20260317-spirited-mahogany-swift-b1ac53@quoll>
 <CAMuHMdX4wKWPvRR=BBAr+1wAK2ZmW3kKxEN4W_vwNyGuzB=-gw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAMuHMdX4wKWPvRR=BBAr+1wAK2ZmW3kKxEN4W_vwNyGuzB=-gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,gmail.com,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-29551-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 38B962A6543
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 17/03/2026 09:46, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Tue, 17 Mar 2026 at 09:33, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Fri, Mar 13, 2026 at 12:12:56PM +0100, Geert Uytterhoeven wrote:
>>> This is my first pull request for the inclusion of Renesas SoC updates
>>> for v7.1.
>>>
>>> It consists of 4 parts:
>>
>> I think pw-bot did not reply to any of these pulls, but I applied now
>> all of them.
> 
> That is correct: no replies from the pw-bot.
> renesas-dts-for-v7.1-tag1 does not seem to be in soc/for-next yet,
> perhaps you forgot to push? No need to confirm if that is true,

I pushed for-next a bit after this email.

The workflow is far from optimal, because it has two stages:
1. Iterate over each pull email, check, merge and eventually push only
this branch,

2. Merge to for-next and document the merges for internal
accounting/tracing. I guess I could merge it after each stage (1) above.

The bigger problem is lack of replies from pw-bot.


@Konstantin,
I use modified Rob's script to go over patch/pull queue in Patchwork:
https://patchwork.kernel.org/project/linux-soc/list/?state=*

I deal with them one-by-one, so when I finish merging, I want to be sure
that Patchwork status is updated, thus through the script I mark it
"Accepted".
Like this one:
https://patchwork.kernel.org/project/linux-soc/patch/cover.1773399675.git.geert+renesas@glider.be/

Around then - can be just before or after - I push the updated branch to
git.kernel.org. I fear that because the pull is manually updated in
Patchwork to "Accepted", pw-bot ignores it and does not send the
notification.

Is it feasible to change pw-bot so it will notify even if it is marked
as "Accepted"? Or any ideas how to change the flow to have both:
A. pw-bot reply,
B. Be 100% sure that Patchwork status is updated (allow my manual update
via script)?


Best regards,
Krzysztof

