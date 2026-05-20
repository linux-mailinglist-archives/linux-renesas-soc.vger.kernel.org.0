Return-Path: <linux-renesas-soc+bounces-32880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJ/MFrLfDWro4QUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 18:22:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98661591C9B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 18:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BB0A432797B6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 15:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A80E3F076F;
	Wed, 20 May 2026 15:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Utyz6gxc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5592E21ABD7;
	Wed, 20 May 2026 15:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779290787; cv=none; b=D0FUAU8czOkY0AeaqLy6OrTkJQoWfubNJ9JG88MEoJlOAPomxtvF8o44yTtSWjtK79sc959Pltn9f300dyNUqKbEgVpm/BQbh01xROrK/hkQ6YmEoXTHOyzkJyqpzGJmoZ8GC2oavKKSr0LWr2KeVk5+j6HCB7CQGalmqubgwRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779290787; c=relaxed/simple;
	bh=wlo7UvgwYP16eDLQsjqB5+4swMbRE2kBVvvln25PfYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVeRPVDEUM+pLSn+F224QMJIucQlVSXB/YfzQyAmOZ9Tax/x5yDjXs3/fyhCy8Vf1vTUzrYa+1Zl9hLScXSb5ursZoHKs6EGJv4P7GFO/E12AdhY8LeHljL9GDbPYSJafhS5h3dr9FY19gzVjSFwYF7C5GcG9KS5rF+0XBNEeY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Utyz6gxc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56FCD1F000E9;
	Wed, 20 May 2026 15:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779290786;
	bh=VX5QXlO/FmCYpxFmNVmPdJNwz7Cx3UHOIbX66s/Mns0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Utyz6gxcGJ/e6rblW1DQ0G1pWtzHJG2lFS62wmEW3iLIWhn8CHeO7KI3ClxopW/Y/
	 SxRS9vFZZsFRfa997iibKorGr6b3JL4+cTTYbLv2e6intFRz9lkEIQmE8IGsVdsw8l
	 bYdf3ckKyC8tLDdH3bM/D0zsHxveal8mXz0pOKPWSZahVf25w8rcY4rVKz/PE+SkiU
	 g/WXTep89HTWJYh7pYAqsh49kSObGBk+kmHopqCQWrjZGbc09Uc0FhNGQ5EBvigCkR
	 RaZHlyKcOy6ZhBBFgu8VmhWv4jSxpdCPOLT6SDObwbt1WlMkD2xP8BzZ/VfmS3mre3
	 z6aUT/LNKrJvA==
Date: Wed, 20 May 2026 16:26:19 +0100
From: Lee Jones <lee@kernel.org>
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	"magnus.damm" <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v2 03/10] mfd: rz-mtu3: use device-managed
 mfd_add_devices()
Message-ID: <20260520152619.GI2767592@google.com>
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260410163530.383818-4-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260507124620.GJ305027@google.com>
 <TYYPR01MB156155337B60155F08D6346EB853C2@TYYPR01MB15615.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYYPR01MB156155337B60155F08D6346EB853C2@TYYPR01MB15615.jpnprd01.prod.outlook.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32880-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,glider.be,gmail.com,baylibre.com,pengutronix.de,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 98661591C9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 07 May 2026, Cosmin-Gabriel Tanislav wrote:

> > From: Lee Jones <lee@kernel.org>
> > Sent: Thursday, May 7, 2026 3:46 PM
> > 
> > On Fri, 10 Apr 2026, Cosmin Tanislav wrote:
> > 
> > > Replace mfd_add_devices() and the custom cleanup action with
> > > devm_mfd_add_devices().
> > >
> > > Remove the ret variable as it is now unused.
> > 
> > Do this first, then the changes in the first patch make more sense.
> > 
> 
> Doing the devm_mfd_add_devices() conversion first would not be a simple
> replacement, as devm_add_action_or_reset() would also need to be moved
> before it to keep the intermediate patch correct.
> 
> Otherwise, on release, the reset will be asserted before the MFD devices
> are removed. Doing the reset conversion first fixes that without extra
> logic changes.
> 
> Alternatively, we can squash the two conversions to avoid the
> intermediate states entirely, and remove struct rz_mtu3_priv::rstc in a
> new separate patch. What do you think about this variant?

As you wish.

-- 
Lee Jones

