Return-Path: <linux-renesas-soc+bounces-29772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBswIv+gumlSZwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:56:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D26C2BBDFF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 13:56:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9965C300601F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 12:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2C6304BBC;
	Wed, 18 Mar 2026 12:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="fj1yedZZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Go0Tmic2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F59138C2C5
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 12:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773838586; cv=none; b=ZrUIYHSYEaGLhqjcMN4PTn/aV3oTN0OCbht5PYIU4lS/osz4GZWJG26hu1MWAbnqRdVM/IW8t7pLaWDR2PAIZ3IyZNerTSss0p3L8Fz8dCaCz/mqITaFINtQT73m1uci/1R5E+ukfpBOU66pcvKApRNb0WwZid6bCqKuW5ee3hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773838586; c=relaxed/simple;
	bh=E2gDVdBf8vYj/9XIGSo1VxrdprNzeKDUTi71mw64Vc4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=owXfCIiE4ShJ+R9jGIU7OBS4kkyIxLSjn2NCbp37GfKg68wPPkGbmysxrdzA0Vmso2zS+hm/rA+CbKqRGloyXzCdrN1Ab1TyE/2WOge6vZEkyZDgCLktc1OUgEDADkw21np+yx0M8YnYHXrqq+NOunXPeXtO7D9EEWVJTmG+xsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=fj1yedZZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Go0Tmic2; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 727F3140025B;
	Wed, 18 Mar 2026 08:56:23 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 18 Mar 2026 08:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773838583;
	 x=1773924983; bh=N/yl142uki4yhzbHevTmfD49HrneXqML6XD8ozlyd+4=; b=
	fj1yedZZ3bklSeX2boCjOTKnl+3E++OiUD7mCbjJObAGqP6bioFhaJFdolap+Ogy
	Dyfdajuw1ExQKctJZfT0aHTab33oRqjnhCpWpHOk7sfu+KephGKnDnvSDfGXxd6U
	xQZzR88Y56VQEFZPfk5HoP6JFUoWvSPp2wFkQQEzSr88w1Tuni4zhq362R8ILLSQ
	ljIGcMAStxDM40IEOG0SfWUTBgJRKwih+VdV3wH29RGJzTMuD95tmFBb0d37FA41
	8EJdgUueudiEyPANh9/oib57LtokQGascD/dt+Ujygqgv//j7MQ/Xj4Nh4qLLGJ8
	a85/LEqwFbdIo8DG/5B+Cw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773838583; x=
	1773924983; bh=N/yl142uki4yhzbHevTmfD49HrneXqML6XD8ozlyd+4=; b=G
	o0Tmic2L9YVdTtd9JXwlo5jGFlrIYDuRmdT6IfSrlVFXKzGrvZOFy5PuSUUdQVLk
	t4AUCDfwdWn/J6qZ5mBSGcWUHN2dxiixyhyry4m4uGGLN5s7VEkyXCCz5agcrPX1
	1aGIVTFdtSM64fU4wvsG9DoqoUCZ+Tc90cvfhbi6bdv9y9S0WfnCHIxUfXFSbbrz
	5aj43cGb/Go/XhlrOB1NspONSNMMDhoN6DjKuhUEVq+Jxd2UlpptEGKtt5eqYZz8
	wavhUZmEGGLO5XeB9E6eCmIK9WlMToPxdPXNeKNhmnJjNjVdelIahSfYWH7iBdvP
	Mwiaxcf7JC/KASYPfSUFA==
X-ME-Sender: <xms:96C6aT1zsWSfpHxmEt118hSnPRiBuiYkoakqHN4jmCzOYRQ1tc4glA>
    <xme:96C6ac6y4Uoh9QFqoQo0KLvKj68Rj31gyg3_CjitMzCldrJz9dUadOOVcOHTGIVoq
    rI49Hqq4ItO5ZXUFP8nUuzNVDpVHwY1qSBXFazqKXWB7hwLGh9YgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegudelucetufdoteggodetrf
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
X-ME-Proxy: <xmx:96C6aUnaLSipjssmpRnXYYslYJi1jXQPcNXqo-Y_D6K-IW9s_VPdPQ>
    <xmx:96C6aWZnownml55EqYPNmPWYS1R_CRFCHwEe4mBZ4kItZFYMdYLnCw>
    <xmx:96C6aWR_nja4qvQf4_HFwKbC9P7W0rFrR3YVWC1lI-qJsMWcFHPbkg>
    <xmx:96C6aQvLrN2euPHwKAxbs5mHhXy6a7YVlwBYMO_SOYnMM5_SE2f38g>
    <xmx:96C6affpgjzeJlSCDUynxvWF7vdqudtG5g3CmZyC6nDCUzIo9VjcdgG4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2F31F70006B; Wed, 18 Mar 2026 08:56:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AYTw_54MFalk
Date: Wed, 18 Mar 2026 13:56:02 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Konstantin Ryabitsev" <mricon@kernel.org>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>,
 "Magnus Damm" <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Message-Id: <a4cad30f-0f29-4bf6-b69d-a38ebe05828c@app.fastmail.com>
In-Reply-To: <0234dc75-b042-4408-bbad-a777c0bddb3f@kernel.org>
References: <cover.1773399669.git.geert+renesas@glider.be>
 <20260317-spirited-mahogany-swift-b1ac53@quoll>
 <CAMuHMdX4wKWPvRR=BBAr+1wAK2ZmW3kKxEN4W_vwNyGuzB=-gw@mail.gmail.com>
 <0234dc75-b042-4408-bbad-a777c0bddb3f@kernel.org>
Subject: Re: [GIT PULL 0/4] Renesas SoC updates for v7.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,gmail.com,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29772-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,messagingengine.com:dkim,arndb.de:dkim]
X-Rspamd-Queue-Id: 8D26C2BBDFF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026, at 10:11, Krzysztof Kozlowski wrote:
> On 17/03/2026 09:46, Geert Uytterhoeven wrote:
>
> @Konstantin,
> I use modified Rob's script to go over patch/pull queue in Patchwork:
> https://patchwork.kernel.org/project/linux-soc/list/?state=*
>
> I deal with them one-by-one, so when I finish merging, I want to be sure
> that Patchwork status is updated, thus through the script I mark it
> "Accepted".
> Like this one:
> https://patchwork.kernel.org/project/linux-soc/patch/cover.1773399675.git.geert+renesas@glider.be/
>
> Around then - can be just before or after - I push the updated branch to
> git.kernel.org. I fear that because the pull is manually updated in
> Patchwork to "Accepted", pw-bot ignores it and does not send the
> notification.
>
> Is it feasible to change pw-bot so it will notify even if it is marked
> as "Accepted"? Or any ideas how to change the flow to have both:
> A. pw-bot reply,
> B. Be 100% sure that Patchwork status is updated (allow my manual update
> via script)?

In my experience, the pw-bot reply always happens at the same time as
the update in the patchwork state, we either get both or nothing.

The way I've used it in the past was to let pw-bot handle the replies.
If anything was missing htere, I would know that I had to send a
manual reply and update the status.

I suspect that setting the status to Accepted first would stop this
from working, but right now the pwbot interaction appears to be
broken regardless of the status update, i.e. it only handles
patches but not pull requests at all.

Konstantin, this seems to have broken around the time you modified
pwbot to handle git:// URL rewrites earlier this year. Previously
it only ever caught commit messages that had the exact same URL
as the pull request message, IIRC you said that it should now handle
the case where a git:// URL gets turned into a https:// one, but
the actual result appears to be that no pull requests get matched
at all.

    Arnd

