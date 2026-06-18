Return-Path: <linux-renesas-soc+bounces-34189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2y/PCJeuM2oLFAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 10:38:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D23E69E7F6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 10:38:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=nXhelwwd;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34189-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0B1473009E23
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 08:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95B53B27DC;
	Thu, 18 Jun 2026 08:38:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF71020E334;
	Thu, 18 Jun 2026 08:38:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781771920; cv=none; b=BS2JZ8DHyn1LSLnzFc4rctsu0zfQnJ/bBtAoXStkiqQYZqcfYo9oHmcUQMkz5SmwyJehMry3794D+kx5j+MLAsIrjy3rGzoQGyhjEC9T0e8/FjLddC/UHxI8wwBBalPZnTwmdY2xGMhbO5Jqb3G3h0q+mXle0R9z90Tt/kb8ESs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781771920; c=relaxed/simple;
	bh=ummxyJt50kbd9aQHFBnf9BdFRrAXWdix7EapTIPLQFk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NsGOByzRTKFxddBPI1DbK1CjwTtM28G5wyHGHIjg934sFo63uWRpEGmfsAcZUmZiovFojUckOy12oholVRKoC2zl1smkQsRsRAizeRPLc5oA6ifYrSSrJpIuTOVOMM/yPVk+fxwfUv6yh2336gnIDp+NvN7oAvrPT3fOQ2SlK7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXhelwwd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63ADC1F000E9;
	Thu, 18 Jun 2026 08:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781771919;
	bh=BghaV0XJnds55dF2dgFuuXXCRlRZxRm1R2JFiOWPEcY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=nXhelwwdHIkf/sbE8QwEOS03rLt8fBTdIbsCZe07coYKQs4UXoUTDq6Bje6m8uGcu
	 Dr5MQ0TVj1Uq22/CL5bZi9uGamNGVyuBE4uwrVOqxcsPlGhLbA8QEBhkZmWInPyMJ0
	 o21G3I2bxvKtL/8BbxKnwjcZpGWTdpx4Egxa9y2kJpMJ0Zargl930VFJWaalzVrn6s
	 aasDnOM0EZTrvAPxjCdPlJaFr7RqjMSZU0dBX35bXjzedGX+hbz6n808Af92WmSRFu
	 Jd70COqSStxnjEVjQp7iIs9O/8kmUyPZ1VotsyFi+i48LOEwR+SpqD84Aw2cnWxJU6
	 RW+fUzBeRRDAQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wa8Gj-0000000DvgM-0yNK;
	Thu, 18 Jun 2026 08:38:37 +0000
Date: Thu, 18 Jun 2026 09:38:36 +0100
Message-ID: <86ldccs0oj.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-pci@vger.kernel.org,	Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>,	Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?=
 <kwilczynski@kernel.org>,	Bjorn Helgaas <bhelgaas@google.com>,	Catalin
 Marinas <catalin.marinas@arm.com>,	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,	Krzysztof Kozlowski
 <krzk+dt@kernel.org>,	Lorenzo Pieralisi <lpieralisi@kernel.org>,	Manivannan
 Sadhasivam <mani@kernel.org>,	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
In-Reply-To: <0935eb67-83d2-49ea-89ab-0d0aa51ead8a@mailbox.org>
References: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org>
	<20260617030008.154449-2-marek.vasut+renesas@mailbox.org>
	<864ij1tyrj.wl-maz@kernel.org>
	<0935eb67-83d2-49ea-89ab-0d0aa51ead8a@mailbox.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: marek.vasut@mailbox.org, marek.vasut+renesas@mailbox.org, linux-pci@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com, kwilczynski@kernel.org, bhelgaas@google.com, catalin.marinas@arm.com, conor+dt@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org, lpieralisi@kernel.org, mani@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34189-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:marek.vasut+renesas@mailbox.org,m:linux-pci@vger.kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[maz@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maz@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,arm.com:url,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D23E69E7F6

On Thu, 18 Jun 2026 03:50:29 +0100,
Marek Vasut <marek.vasut@mailbox.org> wrote:
> 
> On 6/17/26 9:24 AM, Marc Zyngier wrote:
> 
> Hello Marc,
> 
> >> Renesas R-Car S4/V4H/V4M GIC600 integration has address width for AXI
> >> or APB interface configured to 32 bit, it can therefore access only
> >> the first 4 GiB of physical address space. This information comes from
> >> R-Car V4H Interface Specification sheet, there is currently no technical
> >> update number assigned to this limitation. Further input from hardware
> >> engineer indicates that this limitation also applies to R-Car S4 and V4M.
> >> Name the limitation GEN4GICITS1, and add a driver quirk to mitigate this
> >> limitation.
> 
> My concern is this ^ , I do not have an erratum number, because there
> isn't one. I am in touch with the hardware engineer and I did get a
> glimpse at internal details of the three SoC, which confirm the
> limitations. Is this sufficient ?

To be honest, this is between you and the SoC vendor. I'll take
whatever symbol you come up with at face value, and will assume that
the vendor agrees with it. After all, they are on Cc and have their
SoB on the patch.

> 
> >> Note that the 0x0201743b GIC600 ID is not Renesas-specific, it is
> >> common for many ARM GICv3 implementations. Therefore, add an extra
> > 
> > Not quite. It designates GIC600 unambiguously.
> 
> What I am trying to communicate is, that the 0x0201743b ID is not ID
> of the Renesas GIC implementation, but it is a generic ARM GIC600
> ID. That is why we cannot match the quirk on the ID (it is generic ARM
> GIC600 ID), and instead we have to match the quirk on the [ ID
> combined with of_machine_is_compatible("renesas,...") ].

This is understood, and is no different from the other broken
platforms in the tree.

> 
> > It is just that GIC600
> > is integrated in zillions of SoCs, most of which don't have this
> > problem (the machine I'm typing this from has a GIC600 *and* 96GB of
> > RAM).
> 
> Right.
> 
> Shall I reword this paragraph somehow to make it clearer ?

I'd simply say that the workaround is keyed on the combination of the
GIC implementation and the platform identification in the device tree.

>
> >> of_machine_is_compatible() check.
> >> 
> >> The GIC600 implementation in R-Car S4/V4H/V4M is r1p6.
> > 
> > Is this relevant?
> 
> I included it for the sake of completeness and to provide all relevant
> information, based on previous discussions about similar limitations
> that I could find on lore.k.o

This information is already contained in the ID you quote (bits
[19:12]), and can be decoded using the public TRM [1].

Thanks,

	M.

[1] https://documentation-service.arm.com/static/5e7ddddacbfe76649ba53034

-- 
Without deviation from the norm, progress is not possible.

