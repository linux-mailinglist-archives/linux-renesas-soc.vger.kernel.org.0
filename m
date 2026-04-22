Return-Path: <linux-renesas-soc+bounces-31512-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FiSF3cX6WlpUQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31512-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 20:46:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 09067449D49
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 20:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 599D5304E5E9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 18:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811EC2DB7B7;
	Wed, 22 Apr 2026 18:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="YR5vqQX1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E44D84414;
	Wed, 22 Apr 2026 18:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776883552; cv=none; b=qnB4HM3TIf4gYaIQtnH/XsXu0rfuYVHwwGUVKySK4SEUGcLvepX90/gjkrfPSZwQXFcvf/IuZLM9oovDHXYYqW2ykz8d+gD+1rI75/11i53Gpw1uBWJnX610tAusPEOIiqq0Rh+BHPtnY9yllMVYyDN37OylNlrae5/HjGOTQrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776883552; c=relaxed/simple;
	bh=hkA5KjlIl5jwh4GkTXHA4vVNwgDxaznRvBx/RdhhKnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U2UkPGcPkGYL780deNI/v00YzpuJdMWC+O00M2Dm31yfSB5J/FQ5DWb0LWqN1LHYuo81KyjozfP268thAmQ7PHvDhFA00iQk0wL7l21h31TIL3eFD8QJ0q9IZOUgo4+rMR78vYDUhtO40S+dZuUlOS3nErZq1YLXPuoWHaXl+HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=YR5vqQX1; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 797ED1E8D;
	Wed, 22 Apr 2026 11:45:43 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F7BC3F641;
	Wed, 22 Apr 2026 11:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776883549; bh=hkA5KjlIl5jwh4GkTXHA4vVNwgDxaznRvBx/RdhhKnA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YR5vqQX1RwlqvU3irJVsmTCjnxjrT6BB9Mobx9TN8DuowUioHwsuy9oU1pnpwNL11
	 1dlH18U+1iqag2bVyl/WX8QGsNBDr23tbm4Y62yq+fUD39OYy8G20AUnr3jzLYs74m
	 6vfxb5Ccpxy/4VArdBH/MSuXTFo62aj6EQPD8FS0=
Date: Wed, 22 Apr 2026 19:45:38 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
Message-ID: <aekXUvIPb8nkhdKu@pluto>
References: <cover.1776793163.git.geert+renesas@glider.be>
 <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31512-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xkcd.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:dkim]
X-Rspamd-Queue-Id: 09067449D49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 08:11:38PM +0200, Geert Uytterhoeven wrote:
> Currently non-SCMI drivers cannot find out what the specific versions of
> each SCMI provider implementation on the running system are.

Hi Geert,

Thanks for your patches....this is not a proper full review of the series,
BUT this patch catched my eye..

Indeed, yes, it is deliberate that the SCMI version information is NOT
exposed out of the SCMI world, since being the SCMI an attempt to
standardize a common FW interface (as in [1] of course), you should not
know what runs inside the black-box, it should be irrelevant...

...indeed the versioning is used inside the SCMI stack to deal properly
with different protocol versions implemented by the server OR to apply
proper quirks when needed, but all the rest should be standard....

...you should NOT really behave differently based on the underneath
protocol or firmare implementation version...it is the SCMI stack that
should behave properly, transparently...

Having said that...I understand that at least it could be useful to be able
to query the SCMI stack to know, even from non-SCMI drivers, WHICH quirks
have been applied/activated at run time...but anything more than that it
seems to me dangerous and prone to a number of abuses of the SCMI stack
itself...

(Also...exposing the versions itself means also tracking that bit of info
in more than one place: the quirk framework and your drivers.)

> 
> However, different versions may use different ABIs (e.g. different clock
> IDs), or behave different, requiring remapping or workarounds in other
> drivers.

...abuse like this indeed :P ... the SCMI server is supposed to be that
one entity remapping the IDs in the background if the same IDs happen to
be representing different physical resources across a number of distinct
platforms all supported by the same firmware blob...so as to present
a consistent set of contiguos IDs...

Also because this should be one of the selling point of the SCMI stack
in a virtualized environment: you can ship the same kernel drivers with
the same DT and you know that ID=<N> will always identify the specific
resource that is needed by your driver without worrying about the fact
that in reality in the backstage the effectively managed physical resource
could be different across different platforms, because that does not matter
if the SCMI platform server had properly remapped (at build time/run-time ?)
the resources to your expected ID...alternatively of course you can ship
with different DTs to describe different hardware...BUT remmapping stuff
in the drivers themselves guessing on the vendor/subvendor/impl_vers
seems a dangerous abuse...

I watched a bit of the LPC discussions around this (from Marek I think)
but sincerely most of those problems had one (not necessarily simple)
solution: fix your firmwares AND/OR apply quirks in the meantime...

Sorry, I am sure this not a welcomed answer :P ...thoughts ? 

Thanks,
Cristian

[1]: https://xkcd.com/927/


