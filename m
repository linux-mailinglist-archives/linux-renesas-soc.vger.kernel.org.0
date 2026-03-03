Return-Path: <linux-renesas-soc+bounces-28712-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Kr0Nc3npmlWZgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28712-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:53:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF971F0CA0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 14:53:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64EC031525D1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 13:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A01A226A0A7;
	Tue,  3 Mar 2026 13:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="J4/2zGuw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C3C30DD2A
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 13:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545598; cv=none; b=aGStVT7eP9OdpO1yQWq+0C4VL4eslMW2MLHzWcodu4N6UTEh7sJklgWUorVZx4+4O1t9mY7kfG3tcBPXux9bvUOO4uJRxGFdd7cy11ve/U64JELxKdaWV6s5gwGJBXsd6FR5356obpTZhT1w/UaRTVpxAQ8mGPEgfSVgGbDHNw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545598; c=relaxed/simple;
	bh=tziw53490D9dLBPgoajUHk6E3hNYGEt7eHXmICjRHUw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=bJWHjABUMh8F32fKPrR96OYmJtIoKJlfwuc+8dqjTbpbO7IJP065NxnykY2WYcMFgzho/n+gWz8LWZU2A9KqwbZwLBKImsspQDcIaSQVKBH5snXoh7DhWwG77InEWaDFCbfTnNoc1QmDahtdzS0Gqpgbc1dToR8LG3qp4VitMGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=J4/2zGuw; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B335A4E42500
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 13:46:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 822595FF87;
	Tue,  3 Mar 2026 13:46:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 70C2C103695E2;
	Tue,  3 Mar 2026 14:46:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772545594; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XDRpvBtYzC34KJ2LgpsbI01brcrkDd6rfNwNv6anEv4=;
	b=J4/2zGuwaWqYyv4I21zejYDFYxBN3Fgy20I5xGwVPpjl9rTCySOIPU1yAmxpx6GO2LYyWo
	YvuF9uPEme6AhEz0Vvi8qsfc7T5TRUg8upSniC3XxWz8DnQKwwQUrof8aF2+ZU1w3bpPbV
	2nVnd1EW0elrOOUtsDxqCyrm6DpShSOORtOfYxT/MLmeYWuOPn0iHWFbAlTyHX1xVu0IIz
	C3DAtx3GG3LpKZE5RycUx0GGBSTf4Uyg9X9Q+Ky9LayNVrIEn6q/ZlRH++TuCsDvlFcw78
	pfCLugJLBnJN1lcYW8pM5ADAEKGqzx/tA2xPrDKkIwTesFYKPtRA8kDO81dBfw==
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 14:46:31 +0100
Message-Id: <DGT6YZGAMK2M.1NLHXMQI54ZW5@bootlin.com>
Cc: "Marek Vasut" <marek.vasut+renesas@mailbox.org>,
 <dri-devel@lists.freedesktop.org>, "David Airlie" <airlied@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>,
 <linux-kernel@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>
To: "Maxime Ripard" <mripard@kernel.org>, "Geert Uytterhoeven"
 <geert@linux-m68k.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] drm: of: Fix drm_of_get_data_lanes_count_ep() return
 value documentation
X-Mailer: aerc 0.20.1
References: <20260115024610.661624-1-marek.vasut+renesas@mailbox.org>
 <20260303-uppish-finicky-mustang-cd135f@houat>
 <CAMuHMdW4HwgwiBJFkA43MpYWOScG8n7p4p3_KBL+Cg3_P_a18w@mail.gmail.com>
 <20260303-delectable-just-clam-d25e08@houat>
In-Reply-To: <20260303-delectable-just-clam-d25e08@houat>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 4CF971F0CA0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[mailbox.org,lists.freedesktop.org,gmail.com,linux.intel.com,ffwll.ch,suse.de,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-28712-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,bootlin.com:dkim,bootlin.com:url,bootlin.com:mid,mailbox.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hello,

On Tue Mar 3, 2026 at 9:39 AM CET, Maxime Ripard wrote:
> On Tue, Mar 03, 2026 at 09:14:53AM +0100, Geert Uytterhoeven wrote:
>> Hi Maxime,
>>
>> On Tue, 3 Mar 2026 at 09:07, Maxime Ripard <mripard@kernel.org> wrote:
>> > On Thu, Jan 15, 2026 at 03:45:53AM +0100, Marek Vasut wrote:
>> > > Update drm_of_get_data_lanes_count_ep() return value documentation
>> > > to match the drm_of_get_data_lanes_count() return value documentatio=
n.
>> > > The drm_of_get_data_lanes_count_ep() is only a wrapper around the
>> > > drm_of_get_data_lanes_count() and therefore returns the same error
>> > > codes.
>> > >
>> > > Fixes: fc801750b197 ("drm: of: Add drm_of_get_data_lanes_count and d=
rm_of_get_data_lanes_ep")
>> > > Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>>
>> > > --- a/drivers/gpu/drm/drm_of.c
>> > > +++ b/drivers/gpu/drm/drm_of.c
>> > > @@ -539,8 +539,8 @@ EXPORT_SYMBOL_GPL(drm_of_get_data_lanes_count);
>> > >   *
>> > >   * Return:
>> > >   * * min..max - positive integer count of "data-lanes" elements
>> > > - * * -EINVAL - the "data-mapping" property is unsupported
>> > > - * * -ENODEV - the "data-mapping" property is missing
>> > > + * * -ve - the "data-lanes" property is missing or invalid
>> >
>> > I have no idea what "ve" means in that context. We should rephrase or
>> > pick something more obvious.
>>
>> "-ve" =3D negative, "+ve" =3D positive.
>
> Thanks!
>
> My point still stands though.

I also stared at "-ve" cluelessly, so I vote for plain English too.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

