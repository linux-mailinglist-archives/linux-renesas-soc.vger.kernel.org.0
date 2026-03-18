Return-Path: <linux-renesas-soc+bounces-29773-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNxOBO+hummyZwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29773-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 14:00:31 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6CA2BBE4D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 14:00:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFD14300C910
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 12:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E089B387350;
	Wed, 18 Mar 2026 12:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="LJwZ8qoC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Yf/NjsNa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAACC35DA62
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 12:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773838730; cv=none; b=DN9DU7Yo+6Hz+696pn40d6yVz/IVRqhifU4pUFY5vKroX2jRZmIzKNZvQJXDALgaVe4MzKWsUjFy/lfyRYgc1FtPFb75ntNQOy+zWHJScjcEPc3HXLD7aqyiy2uhzUN9lvSIFaZihKKwMHI5Rp3tywRkC3JObPhlXVgMYlcz7ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773838730; c=relaxed/simple;
	bh=C5Cbap8oIXjaj9N/uWKLtgE6N2nyzeH7FvCbifYxsH4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=hwlLNaZ+mv0JiowhlRSD3z+J5prOhchwFzZTzsa2EXta2P6mHeCoSY9B59u61ts5DSa90DqccTIZRmXy0AzQqVOHoY6VTPgBoObPJpdG7jesM0viNmM8lgPqy063C7esHptddMUXT8ghpZa+29jt4aJDphG6EYpgJemR3xWsjUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=LJwZ8qoC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Yf/NjsNa; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1FD991400243;
	Wed, 18 Mar 2026 08:58:49 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 18 Mar 2026 08:58:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1773838729;
	 x=1773925129; bh=NgETNFSkBCuNe00TK+uyXLmxYSvaHFnqr/AOivVYrGg=; b=
	LJwZ8qoCOvpuw2sP0qvk6qXRdGJm52uroDrWcWj7BIimYw2bPdiuK5N+0jxStovX
	aOE4g+Iy9XRLS0uMe8kabVvquTlfpuk7LZ5fVZwpNyDStOoSUw5xxecS9WXhYBHq
	he+HcMKx4o/dgAl3L0BAfuKtbqG68IPSfecPvAM80Ie7lYbcT2sdHl/6MLdQj2b4
	2Mk20B0gk4uF8BCKaO/7aZ885/JjL1fHHIS9wEIAgHHFVi/RSbvi48Z1MXKKArbg
	HhX0vFK6VRywaa55DlT/bwDqn8GnUvnIsnodwVU3TfHo0IGGqZo4jgq7FvL+HA3R
	7REeqKkpQzJNddlcL7wesw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1773838729; x=
	1773925129; bh=NgETNFSkBCuNe00TK+uyXLmxYSvaHFnqr/AOivVYrGg=; b=Y
	f/NjsNafW+O29jaEeA7kJMfCR6QX8OeS39U5TjT6gw0EyzxxPvzBTcP3dc2aQ4YL
	JD1uHbTury0m6rQ3VProognDyz4X7+4f0LOaADcL2wAb8gSjEcOFSr4cA2eXs2MD
	aLj4NzFBxIaS+TUNOmNCuIbw1jdBpetXbVcm30JrDV6y3JO6ijiTxkJ8FL4zmOh0
	6BT8sMNSufEqGmY1a+ifG6wOmkIO0TwZtApU6QY9IE0HLjQTn6a/VCqRM5io1d5+
	eF2gEsMk7cEYZ+cdThF8yvwQ1oWlm1X26wC3+WvbpYPUNS8HW+J99XMqYbJdYxqf
	J/F1hy2yM+H6TlErV0Zfw==
X-ME-Sender: <xms:iKG6aUjhmOnkFH-LDG8v1kiI00jOI_ij5vVQ-raWDo1SmcrS-b1wXg>
    <xme:iKG6aX1vbcphyWehzNIjiosphUwnVOyTZVb2m_xYASbHXOP3LVtxHEHtLw0vkQiw0
    oJfQ5jjMqSb3N4Xfz9b3Jh1oBYipj-egx1xILakCpyKNS1iKkFHoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdegudelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtghomhdprhgtphhtth
    hopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgvvghrtheslhhinhhu
    gidqmheikehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlse
    hlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhotgeslhhishht
    shdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqdhsoh
    gtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:iKG6aVFzr-gzim0unLZhggbbLZ7j_LFSiChxpokLPIhRFqYM_IhJDw>
    <xmx:iKG6acnjyD9Xf6cwZQTglI_hMQG2r2O4mdBXc1KNd8BaUeyh2AMpiA>
    <xmx:iKG6aZZuv9uvwDbMO1aSqp6bmOGNc7G9ofqcH6CQsUMAeyznza41lw>
    <xmx:iKG6aRFI1CK_-5PmWP7qH8MXdRvEVATIHvePtg-nycWg4vMMFiNTFA>
    <xmx:iaG6afwghU4sT5JPuaIz8nBOw0zIum17yk_y0Nj2UjiB0ygSpQy0N4Vv>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D40AA700069; Wed, 18 Mar 2026 08:58:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AXMg69VYQg4R
Date: Wed, 18 Mar 2026 13:58:28 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: soc@lists.linux.dev, "Magnus Damm" <magnus.damm@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Message-Id: <a4174f08-cb01-4338-9909-e2d4cfd60934@app.fastmail.com>
In-Reply-To: <69927bd8-d476-4a24-91af-f21cdc0bce80@kernel.org>
References: <cover.1773399669.git.geert+renesas@glider.be>
 <cover.1773399673.git.geert+renesas@glider.be>
 <20260314-quick-gray-saluki-0f96ff@quoll>
 <CAMuHMdXJx14SDXq7oQ-m-576GRQztRybs1HSinzf03ttvF3c_g@mail.gmail.com>
 <bdefa3d7-353c-4aa1-a013-685b46773fe7@kernel.org>
 <69927bd8-d476-4a24-91af-f21cdc0bce80@kernel.org>
Subject: Re: [GIT PULL 3/4] Renesas DT binding updates for v7.1
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
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-29773-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arndb.de:dkim,messagingengine.com:dkim]
X-Rspamd-Queue-Id: 5C6CA2BBE4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026, at 10:53, Krzysztof Kozlowski wrote:
> On 17/03/2026 10:29, Krzysztof Kozlowski wrote:
>>>> See also submitting patches in DT dir.
>>>
>>> So the second commit is subject to II.3:
>>>
>>>   3) For a series going through multiple trees, the binding patch should be
>>>      kept with the driver using the binding.
>>>
>>> In this particular case, I could have included it in my drivers branch.
>>> Where do I put SoC-specific DT binding changes that are not picked
>>> up by anyone else (I don't have any this time)?
>> 
>> What is "SoC-specific"? You put the DT binding with the user, that was
>> always the rule and that is implied by submitting patches. If you do not
>> have any user, why would you pick that up?
>
> Actually I want to correct myself or explain more. If you document ABI
> for existing driver with DTS user of the ABI, but without driver change,
> e.g. new front compatible when using already documented fallback, I
> would keep the change in the driver branch, even  though technically the
> DTS is the user of new compatible. That is what I was always doing at least.
>
> Why? Because I expect there might be a next patchset with binding+driver
> adding new fallback to the same binding, which would have to go via
> driver branch because of mentioned submitting patches rule. Therefore if
> I put that first binding in DTS branch and in the future I want to put
> next change in the driver branch I would have unnecessary conflicts.

Right, this makes sense, though I've been rather relaxed about binding
updates in the past, merging them either through the soc/drivers
branches if they came with the driver changes, or through the soc/dt
branch otherwise.

       Arnd

