Return-Path: <linux-renesas-soc+bounces-35166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OAGeBkEmVWoWkgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 19:54:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D5174E2DA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 19:54:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QIFnMeAW;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35166-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35FA73006D5E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 17:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4AF734CFC5;
	Mon, 13 Jul 2026 17:54:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69186345CC0;
	Mon, 13 Jul 2026 17:54:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965243; cv=none; b=cqKWspL1aCtimJrOACjtJqfBEIvNSXxiMlo4EBvswXf6OFVsp8gkOOvvkr0xud9cbp//K88lHikwuj9GybDPAbZIoJEYwqDWXWNYziOJ84CKUjdzd1y4EAXKftxQC/QgX1/pUq37/Qhwta7y21atQ5Gn4LtJd3t8tTJudUjaK4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965243; c=relaxed/simple;
	bh=xpgHPT/JcnkDhaTFjmE+nZeO4XbztrxHgTdL/5lej04=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=bvFKrK/iUnOoZfuo38UDYN8bppZsJV1470aZO5mhtoat7QAh7USzrfCwIsq8/ZjPxcnfzdF2nyHJMidyjUJtehios45Y1LWjwqlwQQVkBKOyTnSqjduomgAlOSdlNGrkAwSicbtN5pAXkAYk+9XQzWEBlpvD3Qw9QDg8FFzO6oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QIFnMeAW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E10EB1F000E9;
	Mon, 13 Jul 2026 17:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783965242;
	bh=5hmDkoykXyuPCNX5o4VG9nAOn2vOS+ZzIkyEv+1eQgQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=QIFnMeAWfUu5xUX6zoFQeRz6/U1yN51/WVkbP9f8XVzRUvQVcT1PnbYX012sRdGsu
	 Yyal/hZB1vTsCmmRZ1bfV9/nK3hfKtCLBdKy6S/lOLRz1Oi6xaTlUo0xAJH3y5yvxM
	 LF+DBgK79KTe3L40BkSYfaO9GEaxv0EosnBX1cz3wVSzqIt6k4wZKpttVTk6Blf79y
	 l5DQy8Qg/eQRV85kTfyR1ZXpHugtN7H2fv/jsSbItz9sx+XylYKfvyjHwM9kZFH0Ov
	 dqRv/ToS+zowvCFe6dUK0hqlP3fS9gS7EEOwmUmNOJYpLQmrIqhxrlv50iR7bml+nK
	 mIwHXEWzlrz2w==
Date: Mon, 13 Jul 2026 12:54:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-pci@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] PCI: rcar-gen4: Inline GIC_TRANSLATER offset macro
Message-ID: <20260713175400.GA1258926@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cb03029-0957-4ed8-98bd-9b3e0e0bce2d@mailbox.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[helgaas@kernel.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:maz@kernel.org,m:linux-pci@vger.kernel.org,m:lkp@intel.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-35166-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bhelgaas:mid,vger.kernel.org:from_smtp,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 21D5174E2DA

On Fri, Jul 10, 2026 at 03:35:10PM +0200, Marek Vasut wrote:
> On 7/10/26 10:30 AM, Marc Zyngier wrote:
> > On Thu, 09 Jul 2026 21:10:03 +0100,
> > Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
> > > 
> > > Instead of pulling in the whole linux/irqchip/arm-gic-v3.h ,
> > > copy the one GITS_TRANSLATER register offset macro directly into
> > > the driver.  This repairs the ability to build the driver on
> > > non-ARM non-GIC targets the way it was possible until now, which
> > > retains good build test coverage.
> ...

> So in the end, it is either this patch or limit the build to
> arm/arm64 . At least this patch still allows building this driver
> with more compilers on the various build bots, so I would opt for
> this patch here.

I like the build coverage, but duplicating the #define doesn't really
seem good to me.  It makes readability worse because cscope/tags now
sees two definitions without an obvious reason.

