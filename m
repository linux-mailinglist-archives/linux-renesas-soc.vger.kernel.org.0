Return-Path: <linux-renesas-soc+bounces-35144-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kQBVOK0FVWoRjAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35144-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 17:35:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 609DA74D193
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 17:35:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DjkyuPnQ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35144-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35144-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2184B30B49BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 15:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E56CD3749F4;
	Mon, 13 Jul 2026 15:18:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C4C30EF77;
	Mon, 13 Jul 2026 15:18:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955939; cv=none; b=R6YM64IAJkXDbh+ghGHlNL7VXazTk5PDZnGMIaf/9tXIgbtbwAQUTkw4pwnORzWdoPLzup1aVmzbh1K50wsJkKhnLmWjous8UyItTd3z1mp6LWMvg+Fvt2cM5d/tP0NMLXqyBAIgEKzoMbsUTiaU7VCj58ZrYySpksGpWmj44CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955939; c=relaxed/simple;
	bh=Q92+vm/2vUfD7BvMv6itjSyYoLq4GSIt9f0Z3LqR9/A=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IV3q1LSpEiCvMamMXZZzEPMZ71Zy5elVcnkEJ+Rkb+M8zqNMYJeaqwyRCjTDRu70cbAby/GsHy+97E7HMQ+SS4qWhVMIDcNJx+7wuJ0KsiPgJITorkMb+EdmruFfr5YdhJBlu+j36P3B1+WeCNDRF2XMIeE2GvDy7Qd5h1rBLz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DjkyuPnQ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E321F000E9;
	Mon, 13 Jul 2026 15:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783955938;
	bh=ciq/I2+BL5j+uB+AABX0XLHmc/WSjoaA1RcZmJWFnaQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=DjkyuPnQfstUUzWkidFDDVxGMprS4Et5vhWSDhkPCeRuWSjmhG6Km5kARaCsw/Y+v
	 EQqZ6DGLbRd3fKpYjPw1huYb83BENbYrx8bs2WT4QditMiCeAJo2ZKD8gwwtzEiO7l
	 rw/TH4KEOVL10wu4/aeXCa3uRo4kqr0TKxyZb5wSjWCjv8yHaIhPTpEBN/fBC/dLO5
	 VtkmH49gPUkWjn/EiCa5HfU4GAPRwuJHtQ/ohoCLpDXqvquhmP0ipQHZFCeHXmiMuV
	 O4F7670dgEeQMnimChpI4eux+NbII+5b7Fa+BK9vRxEnMg7ufPCknKLIsoiAoYSTlr
	 vD8xxud9rr3Lg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=lobster-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wjIQq-00000004Xo1-1iIy;
	Mon, 13 Jul 2026 15:18:56 +0000
Date: Mon, 13 Jul 2026 16:20:45 +0100
Message-ID: <87fr1m6hma.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-pci@vger.kernel.org,	kernel test robot <lkp@intel.com>,	Krzysztof
 =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>,	Bjorn Helgaas
 <bhelgaas@google.com>,	Catalin Marinas <catalin.marinas@arm.com>,	Conor
 Dooley <conor+dt@kernel.org>,	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,	Lorenzo Pieralisi
 <lpieralisi@kernel.org>,	Manivannan Sadhasivam <mani@kernel.org>,	Rob
 Herring <robh@kernel.org>,	Yoshihiro Shimoda
 <yoshihiro.shimoda.uh@renesas.com>,	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] PCI: rcar-gen4: Inline GIC_TRANSLATER offset macro
In-Reply-To: <2cb03029-0957-4ed8-98bd-9b3e0e0bce2d@mailbox.org>
References: <20260709201103.90162-1-marek.vasut+renesas@mailbox.org>
	<87qzlb5jsl.wl-maz@kernel.org>
	<2cb03029-0957-4ed8-98bd-9b3e0e0bce2d@mailbox.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: marek.vasut@mailbox.org, linux-pci@vger.kernel.org, lkp@intel.com, kwilczynski@kernel.org, bhelgaas@google.com, catalin.marinas@arm.com, conor+dt@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org, lpieralisi@kernel.org, mani@kernel.org, robh@kernel.org, yoshihiro.shimoda.uh@renesas.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35144-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:linux-pci@vger.kernel.org,m:lkp@intel.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 609DA74D193

On Fri, 10 Jul 2026 14:35:10 +0100,
Marek Vasut <marek.vasut@mailbox.org> wrote:
>=20
> On 7/10/26 10:30 AM, Marc Zyngier wrote:
> > On Thu, 09 Jul 2026 21:10:03 +0100,
> > Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
> >>=20
> >> Instead of pulling in the whole linux/irqchip/arm-gic-v3.h , copy the
> >> one GITS_TRANSLATER register offset macro directly into the driver.
> >> This repairs the ability to build the driver on non-ARM non-GIC targets
> >> the way it was possible until now, which retains good build test cover=
age.
> >>=20
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Closes: https://lore.kernel.org/oe-kbuild-all/202607100310.iQw5m9Uo-lk=
p@intel.com/
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >> ---
> >> Cc: "Krzysztof Wilczy=C5=84ski" <kwilczynski@kernel.org>
> >> Cc: Bjorn Helgaas <bhelgaas@google.com>
> >> Cc: Catalin Marinas <catalin.marinas@arm.com>
> >> Cc: Conor Dooley <conor+dt@kernel.org>
> >> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> >> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> >> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> >> Cc: Manivannan Sadhasivam <mani@kernel.org>
> >> Cc: Marc Zyngier <maz@kernel.org>
> >> Cc: Rob Herring <robh@kernel.org>
> >> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >> Cc: devicetree@vger.kernel.org
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> Cc: linux-doc@vger.kernel.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Cc: linux-pci@vger.kernel.org
> >> Cc: linux-renesas-soc@vger.kernel.org
> >> ---
> >> Note: The alternative I could think of would be ifdeffery which
> >>        is not nice and thwarts the build coverage, or limit the
> >>        driver to ARM/ARM64 in Kconfig which also thwarts the build
> >>        coverage. I could also split off the register macros in
> >>        linux/irqchip/arm-gic-v3.h into some separate header
> >>        linux/irqchip/arm-gic-v3-regs.h and include that which
> >>        might be OKish and avoids duplication. Thoughts ?
> >=20
> > No, I'm not hacking something that is purely architecture specific for
> > the purpose of a bizarre integration quirk that should be handled by
> > the boot firmware, and not Linux.
>=20
> The PCIe controller is fully controlled by Linux.

And it shouldn't. Why can't your favourite boot-loader use it, like on
any reasonable machine?

	M.

--=20
Jazz isn't dead. It just smells funny.

