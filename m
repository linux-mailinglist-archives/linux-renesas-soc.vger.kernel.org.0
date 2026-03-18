Return-Path: <linux-renesas-soc+bounces-29775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uD7VJLylummaaAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 14:16:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0198E2BC095
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 14:16:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B8C1300FECB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746323793BA;
	Wed, 18 Mar 2026 13:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="kClG5K0v";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ojjzm/PG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE2E3B894E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 13:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773839597; cv=none; b=rwO5kJSX+ribZlCuh9Gb/HsaiV5K5tpISXGRel9wL9bKv245/MSY1jeS3TeqaXil2I26Powz5drz/HYZxOtyk+5/h7j/c34t7bPedM3yIwYyvJWxsZJR8CrKCrJWnCnAjttg8YZLCv1xNgGoKrKvCFJTtM4aOu35S/+pnxsrIBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773839597; c=relaxed/simple;
	bh=NX0i+ij86deX8RbTokJUQeqDzJfLPrMx1aezo1r00rE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=dpGYYyYOhRlTr9IklaCdGJVRfmt4s/ScVw4bq6FLOCcoH9d2k/S+r//Q/K7D9RR/YpTsXfVFWEXLPkKSQMYZSAp40VUd1HHlm1DHZ98E2QHTNeaZ7tBM6fzVRIEOf3kW42ERGBBC5DUw041JNJn+9PGaW058Og2V9n+HI2RMktQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=kClG5K0v; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ojjzm/PG; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 22852140003C;
	Wed, 18 Mar 2026 09:13:15 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 18 Mar 2026 09:13:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773839595;
	 x=1773925995; bh=VlgYJgsDCBdT6+klGD6mIBOkkF0hpYpPSTTnp614c+0=; b=
	kClG5K0voMFVJe0RdNsGoElR6tTjdN/4t57vRI3Wtb1SlFpF/hIhH8yS7ZzEMXnD
	MI+mU0h/Ee5SHKY3oaGxImASkOql/1Tnt+RzVEIJ9mWTVEYS2jylWyR9D49uY0PD
	7bl3uuHGKdo1IDX3KGp94T3Icw6buy2YJPnk8z5Ngr6AA7LnSDDaaZUUCvkViJkp
	A1WzyQ1OXDrc/vp+D0LqxylrdpiKCm0SQWBEFQ4Uy4k/mgrbjeh6a18dirz8zzyL
	jkOyxjF4WZumQZW4ic91+5vMyH2GOYo2ZMwBh9XDFglMOTS52OxxuQ4q9cOi4g2z
	HgaBZW6d5nWm0aBJSP/usg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773839595; x=
	1773925995; bh=VlgYJgsDCBdT6+klGD6mIBOkkF0hpYpPSTTnp614c+0=; b=o
	jjzm/PGl3extuXmk3Ru6u9xenEiU1GUWpuhOjCo1Lc22KCc2phDp9vgElzQAE2sJ
	oC4DZaC0cK4Blf3ex/7qxER9oB3c/PVnrBB03e+Itj70lJYxfUHwo3WNpKsh6dlw
	ambVa59LOZau1IIJ0ZJGKc5PcXCgYGD0X/yhOjz4DWJokcf/RwotR7hxiSguA0MI
	bcyuFstn50Jaq8qAIrrgFw5pmk+TT4XYQdVnGEHoXa4eo9IZt7qOWZmsFIbvJo+8
	d4KlIVBBarm4JIpTeaDXhLcrJBALq0I+JSyJQwq6g62SkeFHB6Kjon5af7fse6KF
	6GyOBEmUJYZv3cUGfPypg==
X-ME-Sender: <xms:6qS6aRqC8tA0UQnXmsSOIx5He35Iiax4kg8YacnNc0uwtcfXJVq1DA>
    <xme:6qS6aeeUqy9TA5xlvVp1MxLDU7LOOGeQ3qqZ1kBuvwRIRkS9GldZDIo9EmiM8_4C_
    wyguBtZY47yILg5JthWCa8gwBJw0csllrPIOjlJFnYr2NxoetosFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegvddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfefhheetffduvdfgieeghfejtedvkeetkeejfeekkeelffejteevvdeghffhiefh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmrghgnhhushdrug
    grmhhmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehmrhhitghonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepsh
    hotgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrtheslhhinhhugidqmhei
    kehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsth
    hsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishhtshdrlhhi
    nhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsohgtsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:6qS6aYaDyvZetvab10yx898IsxA_bWHRqm1CTquLmC0OWS7Ltmr3lQ>
    <xmx:6qS6aV9EoKxCH56LXprt-icmkrdYqEXlxKi4nkhRIm7tCQ7StOxMtQ>
    <xmx:6qS6aWlLXG4mQC5mXxW8inX558QE4fqGoj_31wK9OCM6lraLP_9NXQ>
    <xmx:6qS6aSwnZYmhkb15Yr5k5oxtfuH0yun27qAg4ObX_dJChhj9faFP_A>
    <xmx:66S6adQSB0rgHb7crFvRUEGrUS2Gm5T2u2Bz7sUZvVd2ALXppk-lCZPB>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D2CD4700069; Wed, 18 Mar 2026 09:13:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AYTw_54MFalk
Date: Wed, 18 Mar 2026 14:12:44 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Konstantin Ryabitsev" <mricon@kernel.org>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>,
 "Magnus Damm" <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Message-Id: <d8365648-2ee2-40fe-b6fa-c52ed5e42f44@app.fastmail.com>
In-Reply-To: <a4cad30f-0f29-4bf6-b69d-a38ebe05828c@app.fastmail.com>
References: <cover.1773399669.git.geert+renesas@glider.be>
 <20260317-spirited-mahogany-swift-b1ac53@quoll>
 <CAMuHMdX4wKWPvRR=BBAr+1wAK2ZmW3kKxEN4W_vwNyGuzB=-gw@mail.gmail.com>
 <0234dc75-b042-4408-bbad-a777c0bddb3f@kernel.org>
 <a4cad30f-0f29-4bf6-b69d-a38ebe05828c@app.fastmail.com>
Subject: Re: [GIT PULL 0/4] Renesas SoC updates for v7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,gmail.com,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29775-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 0198E2BC095
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026, at 13:56, Arnd Bergmann wrote:
> On Tue, Mar 17, 2026, at 10:11, Krzysztof Kozlowski wrote:
>> On 17/03/2026 09:46, Geert Uytterhoeven wrote:
>>
>> @Konstantin,
>> I use modified Rob's script to go over patch/pull queue in Patchwork:
>> https://patchwork.kernel.org/project/linux-soc/list/?state=*
>>
>> I deal with them one-by-one, so when I finish merging, I want to be sure
>> that Patchwork status is updated, thus through the script I mark it
>> "Accepted".
>> Like this one:
>> https://patchwork.kernel.org/project/linux-soc/patch/cover.1773399675.git.geert+renesas@glider.be/
>>
>> Around then - can be just before or after - I push the updated branch to
>> git.kernel.org. I fear that because the pull is manually updated in
>> Patchwork to "Accepted", pw-bot ignores it and does not send the
>> notification.
>>
>> Is it feasible to change pw-bot so it will notify even if it is marked
>> as "Accepted"? Or any ideas how to change the flow to have both:
>> A. pw-bot reply,
>> B. Be 100% sure that Patchwork status is updated (allow my manual update
>> via script)?
>
> In my experience, the pw-bot reply always happens at the same time as
> the update in the patchwork state, we either get both or nothing.
>
> The way I've used it in the past was to let pw-bot handle the replies.
> If anything was missing htere, I would know that I had to send a
> manual reply and update the status.
>
> I suspect that setting the status to Accepted first would stop this
> from working, but right now the pwbot interaction appears to be
> broken regardless of the status update, i.e. it only handles
> patches but not pull requests at all.
>
> Konstantin, this seems to have broken around the time you modified
> pwbot to handle git:// URL rewrites earlier this year. Previously
> it only ever caught commit messages that had the exact same URL
> as the pull request message, IIRC you said that it should now handle
> the case where a git:// URL gets turned into a https:// one, but
> the actual result appears to be that no pull requests get matched
> at all.

Update: this one did get marked as 'Accepted' by pwbot, and
it sent the reply, so either it's back to working correctly,
or there is something else that makes it only work sometimes:

https://patchwork.kernel.org/project/linux-soc/patch/20260316074150.GA2474723@rayden/

     Arnd

