Return-Path: <linux-renesas-soc+bounces-33774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BEafFUhDKGoCBQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 18:46:00 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A35EA6628BE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 18:45:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=gQvvyx2p;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FD6031BCE4E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 16:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ECD3379993;
	Tue,  9 Jun 2026 16:12:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347DE378D78;
	Tue,  9 Jun 2026 16:12:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781021571; cv=none; b=aOzCPF2tXxrQxqv/OkUdND/bEx1foteQ7YcLGkOpNDEK6XuA3si7oao0tR/u47l90Qy6bGO2QRaXbvEQCyUm7rrJK10KGr47dvfOsPxLmN0oPvR47nZ4OPAtvTNoakwpmEGyncfgla4UfKvS/bgr22sWN9gY9SusMfC6CBkcpQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781021571; c=relaxed/simple;
	bh=3rllqHtSZlQ3+eTYOxV4cCxNx9fbZfUu8XWpwEcj5RE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKaFYBHK2Mj/x+JzEwnNuIJJ7LyAdnBUDbmZL6ZBf722HDwN2vcoNxNFt/AYYozGnQ4DrwHZSgVRnBvz7pZ7LakkFcqre6srkKyAhJUBruVWWE0iii+iNROgdzlKN8FzYdYtAE1ldeZg6EY6OzmFmjHmIc/ObbYqHA6oS3Hw6po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQvvyx2p; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D5CB1F00893;
	Tue,  9 Jun 2026 16:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781021569;
	bh=bPqQ6uth3gPaAJwu37Rm70J2rM+vQopDdeskULmpciA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gQvvyx2prbGt7/Gzx7ZiSbc1lEfON7wLOfqL4aIRhEJE+QRqBAviXG1ZLPkbCLogJ
	 X400cgzYRkpHKwtKJDF76pZlr8+IQSmLJRUW6a4iAMjrY1oL7cQ0zXdxEPZajW+rAA
	 Mw/FdobYcMzaclJEuluMMQ9QJsgOKFoUqAMwqhwSxTn9xgKdYtaio4J+eG9PVoaXN/
	 x/7Jsbvk/yjPL9WjqfvWrCIGgCVE8T20MHPQqZnx1oxF0m4robpW8x11nE9WNwL4uz
	 SyWFt+zCnEkztq2STrJzdSB6WXVoueBgtIyO84Hs88x8e5TkGwi7UeO9jaHlYL+yOQ
	 EdKZWnwt8YDsQ==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wWz4J-000000012LU-1XXM;
	Tue, 09 Jun 2026 18:12:47 +0200
Date: Tue, 9 Jun 2026 18:12:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] pmdomain: core: switch to dynamic root device
Message-ID: <aig7f5rCZCbRyR9B@hovoldconsulting.com>
References: <20260424104050.2617041-1-johan@kernel.org>
 <CAMuHMdUHabMGJyJ7e7yp7DLC+JJc9k6NK9p4anj2wRKNuwZUng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUHabMGJyJ7e7yp7DLC+JJc9k6NK9p4anj2wRKNuwZUng@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33774-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:ulfh@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[johan@kernel.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,hovoldconsulting.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A35EA6628BE

Hi Geert,

On Tue, Jun 09, 2026 at 12:53:59PM +0200, Geert Uytterhoeven wrote:

> On Fri, 24 Apr 2026 at 12:41, Johan Hovold <johan@kernel.org> wrote:
> > Driver core expects devices to be dynamically allocated and will, for
> > example, complain loudly if a device that lacks a release function is
> > ever freed.
> >
> > Use root_device_register() to allocate and register the root device
> > instead of open coding using a static device.
> >
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> 
> Thanks for your patch, which is now commit a96e40f4afdcb52a
> ("pmdomain: core: switch to dynamic root device") in pmdomain/next.
> On e.g. R-Car H1, R-Car M2-W, and R-Car H3, this causes scary messages
> when systemd-journald.service is started:
> 
>     synth uevent: /always-on: failed to send uevent
>     genpd_provider always-on: uevent: failed to send synthetic uevent: -22
>     synth uevent: /ca15-cpu0: failed to send uevent
>     genpd_provider ca15-cpu0: uevent: failed to send synthetic uevent: -22
>     [...]
> 
> Reverting the commit fixes the issue.

Thanks for the report and sorry about the breakage.

I mistakenly convinced myself that this would not be an issue due to the
pmdomain code making sure that the bus has been registered but missed
the two-step initialisation.

I just sent a fix here if you want to give it a spin:

	https://lore.kernel.org/lkml/20260609160634.246526-1-johan@kernel.org/

Johan

