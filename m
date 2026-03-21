Return-Path: <linux-renesas-soc+bounces-30046-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLsZMb4xvmmqIwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30046-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 06:50:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 243AF2E37B7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 06:50:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 497A4301A9FE
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Mar 2026 05:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8081B368293;
	Sat, 21 Mar 2026 05:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b="VFYAWh7w";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="2+3bruGF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA388367F4A
	for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Mar 2026 05:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774072250; cv=none; b=id77lZIAULD5/H3iKvSUlalRdz2rSqLxBHkfp+sh6UKtwQdHw9dKWiCUoSSzyHouU4xjccrc+uNdxwZ/KEy7Q+HzKbocYXTVJAZYRRkZ7CyJhx+nt03rAF9Dj++L1691t50vXBWkcz/u8gukgsuk2bd5qUINgi++1yY7ddxK9u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774072250; c=relaxed/simple;
	bh=d11mHS7X00/pM1KE59xLeWuSAEe1HQbsiUL5da1+p7U=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=lI1GKyQHj7n17cU2M/3GKJVB5C0yeg8ByHm3DoZBJLpMdWLR5DOcV/tQKpAdyQkET66wIlk6+jm5xwOaEiCHgzu0ygfuqyJH7hMFEWlSGPU5wlVcwOgrMeLqZEqdYhfhINuPFEjQB6Og03t3/ciJkndAb8NPZLdJqP2fzIoOQcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org; spf=pass smtp.mailfrom=shazbot.org; dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b=VFYAWh7w; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=2+3bruGF; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shazbot.org
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id A0D0EEC0113;
	Sat, 21 Mar 2026 01:50:44 -0400 (EDT)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-02.internal (MEProxy); Sat, 21 Mar 2026 01:50:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1774072244;
	 x=1774158644; bh=RRtfR5e2ZlMbp50vZXrBUCW0kymEC/MrW4PG2X1HoKM=; b=
	VFYAWh7wQ+t4dsNVDkN6Iw+BwNf38B4qFDy9GjPdggYBuH7knI5LjSmUp7KvPNok
	D2GnjiYe+FIu1MYU18VrR2hN7kdtcaNNm3GHXx2tmKwHVWu4C7vnOmw8pmYsmve8
	kV0lZU/NgfN9Oy83TGAgA02LC2NRcp5jXsgW6aTqvRDHG6l7fM07lVJEZzASnDxP
	yq+5QnTONQklHWOKMcfVTG1UUGJwSg1C5dq1bsVyYxDd4m/a1aMA3ANrb0j3nChH
	1OjllUW4TfXD4ryOQgwpI/SaUIg7ruN14tPixR9KoiZ+4JIQZVdVobaSDMTqee84
	Jxi/oEUk0YVqcC2qz4qVKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1774072244; x=
	1774158644; bh=RRtfR5e2ZlMbp50vZXrBUCW0kymEC/MrW4PG2X1HoKM=; b=2
	+3bruGF/uIoj9ur2whpKKRLcxqPUeh8IyDS7oKms+6eDl5xHUYRuewmLtN9nuf90
	gkXfoSAQz+vkVbHPukNlWZ14wYrlF1KsM0eViTCJE7oxx8Wk4eu+BU5P5wVsZfZy
	rFLLpfYeADvYyt18vODQy+wBbU0IUkBUFCKynI3mws8DIOVF0e6tD6IFfKGKphId
	b0O+vUaLPNkXRXx4PK/uODWetftRUW8gthI9PQHK+Rn3olSkWSwlYOUv5OAJMaq3
	fKgdEHQ02slaBe5qEFZdc4RUDMX5dZAfT7mUmyScqcpUjc29avHRx5LnpDi0CT1Q
	BuY8wfYjSlQx1ZfLXauBA==
X-ME-Sender: <xms:sjG-aYCtAu6tX5TAPP-xlBsp6dZZhRhoHmv4Z25Hd5ELHSEuppVX2A>
    <xme:sjG-aVWzk4y73Qwkkzxm89Hb4ey6uWaAjWuhX3iMLeQYTikNJbhSusJGSpvoKH876
    EkbWs6xX1nTMZ_e5hH30XZTxRU08EpWdJq5i46q1fq4bsCns2EicQc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefuddvtddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehlvgig
    ucghihhllhhirghmshhonhdfuceorghlvgigsehshhgriigsohhtrdhorhhgqeenucggtf
    frrghtthgvrhhnpefgfeeflefggfffveffteetiedvtedtgfdvieevfeejfeefffevteej
    tedufffgveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrlhgvgiesshhhrgiisghothdrohhrghdpnhgspghrtghpthhtohepudefpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpth
    htohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehl
    rghnughonhgtlhhiphhpsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrghhnuhhsrd
    gurghmmhesghhmrghilhdrtghomhdprhgtphhtthhopehlrghurhgvnhhtrdhpihhntghh
    rghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepphgvthgvrhdrmh
    grhiguvghllheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhgvnhigihgrohhfsehl
    ihhnuhigrdhvnhgvthdrihgsmhdrtghomhdprhgtphhtthhopehqvghmuhdqrghrmhesnh
    honhhgnhhurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdr
    ohhrgh
X-ME-Proxy: <xmx:sjG-aUy-oYcGoovuYKPKnQM_po2oS_CnaTvadegDVPvPXsub5R28eg>
    <xmx:sjG-ab9BrAQIcdsVsATWyPXypUxRsnCp_xcZ_mFfxroIAsHdJBvusw>
    <xmx:sjG-ae_l9MXNq132DL2chdiHIV6ikHr1thGkuJ5lhxlAuFHtVBV0mg>
    <xmx:sjG-aT7orrrDgeRMYF4_nI2qZCjKQ3b86ikJEme2EiJMXXfL6HlTBg>
    <xmx:tDG-aXqCjn3gbMnei31EhyAoc0qBGRO3h5t51wc_6Dxogn8m4SA1ACv8>
Feedback-ID: i03f14258:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C274215C008C; Sat, 21 Mar 2026 01:50:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AC0Qvsrv4yKJ
Date: Fri, 20 Mar 2026 23:50:22 -0600
From: "Alex Williamson" <alex@shazbot.org>
To: "Landon Clipp" <landonclipp@gmail.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: "Peter Maydell" <peter.maydell@linaro.org>,
 "Auger Eric" <eric.auger@redhat.com>,
 "Xiao Feng Ren" <renxiaof@linux.vnet.ibm.com>,
 "Arnd Bergmann" <arnd@arndb.de>, "Alexander Graf" <agraf@suse.de>,
 "Magnus Damm" <magnus.damm@gmail.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, linux-renesas-soc@vger.kernel.org
Message-Id: <3b8c2bbe-72dc-4425-8381-c0323c692933@app.fastmail.com>
In-Reply-To: <DH807PW5SQCW.3AA422QQRGVAH@gmail.com>
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
 <1518189456-2873-5-git-send-email-geert+renesas@glider.be>
 <20180209085024.004b6f9e@w520.home> <DH807PW5SQCW.3AA422QQRGVAH@gmail.com>
Subject: Re: [Qemu-arm] [PATCH/RFC 4/5] vfio: No-IOMMU mode support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[shazbot.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[shazbot.org:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-30046-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[shazbot.org:+,messagingengine.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@shazbot.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,redhat.com,linux.vnet.ibm.com,arndb.de,suse.de,gmail.com,ideasonboard.com,sang-engineering.com,nongnu.org,vger.kernel.org];
	NEURAL_HAM(-0.00)[-0.940];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,app.fastmail.com:mid,glider.be:email]
X-Rspamd-Queue-Id: 243AF2E37B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026, at 5:38 PM, Landon Clipp wrote:
> On Fri Feb 9, 2018 at 9:50 AM CST, Alex Williamson wrote:
>> On Fri,  9 Feb 2018 16:17:35 +0100
>> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>>
>>> From: Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
>>> 
>>> Add qemu support for the newly introduced VFIO No-IOMMU driver.
>>> 
>>> We need to add special handling for:
>>> - Group character device is /dev/vfio/noiommu-$GROUP.
>>> - No-IOMMU does not rely on a memory listener.
>>> - No IOMMU will be set for its group, so no need to call
>>>   vfio_kvm_device_add_group.
>>> 
>>> Signed-off-by: Xiao Feng Ren <renxiaof@linux.vnet.ibm.com>
>>> [geert: Rebase]
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> ---
>>>  hw/vfio/common.c              | 61 ++++++++++++++++++++++++++++++++++---------
>>>  include/hw/vfio/vfio-common.h |  2 ++
>>>  2 files changed, 50 insertions(+), 13 deletions(-)
>>
>> NAK.  I'm opposed to no-iommu support in QEMU in general, but accepting
>> vfio devices with no-iommu (which provide no DMA translation!!!)
>> transparently as if they might actually work like a regular vfio device
>> is absolutely unacceptable.  Without DMA translation and isolation, you
>> might want to think about another interface, I'm not keen on the idea
>> of corrupting vfio support in order to blink some LEDs.  Thanks,
>>
>> Alex
>>
>
> 8 years later, I was wondering if we could revisit this. I found myself in a
> need to use enable_unsafe_noiommu_mode due to some systems I'm using not having
> a usable IOMMU. QEMU is being used as part of a single-tenant workload
> sandboxing environment, and given the specific circumstances, both the users and
> the administrators understand that enabling the noiommu mode is unsafe and
> cannot be used where security matters. Regardless, it's still something we want.
>
> As the administrator of my system, it's under my control whether VFIO is put
> into this mode, and if it is, I would expect the remaning software components
> to respect that decision. As is, the system is unusable because of a lack of
> support in QEMU.
>
> I'm happy to elucidate more of my use-case if it is helpful, but I 
> first wanted to
> gauge your willingness to reconsider this under a different context.

I'm not aware of anything that's improved the chances of accepting something like this.

In fact, a vfio-platform motivated feature is arguably on worse footing now.

More importantly, QEMU now has support for vfio-user, so I believe you can already do this.  The model would be a vfio-noiommu userspace driver that exposes a vfio-user interface for QEMU.

All of the previous issues with security and virtualization still remain with implementing this support directly in QEMU.  Providing a DMA capable no-iommu device to a QEMU sandbox negates any isolation it might otherwise provide.  With the vfio-user no-iommu driver model, you take on the security burden to use only non-DMA capable devices, or mediate the access, rather than asking the QEMU community to assume that risk.  Thanks,

Alex

