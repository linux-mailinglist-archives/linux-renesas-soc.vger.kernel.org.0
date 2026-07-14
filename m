Return-Path: <linux-renesas-soc+bounces-35185-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rlSkLt4WVmoKzAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35185-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 13:00:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E25EF753AA9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 13:00:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=MIFe8qeJ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35185-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35185-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E42DA304292A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 11:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60DF8374E67;
	Tue, 14 Jul 2026 11:00:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458FC294A10;
	Tue, 14 Jul 2026 11:00:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784026844; cv=none; b=V+JVNIQOtEIZKFjOaGLX4cpfK+ddvltEPJWOAi7r/sP9AdwCITiYjaV3egofxb3+CMkzkLd6rsji5MdPUp0G0dEqcuZ5j8YUaJW3ePet8nZ0T9PbPdv5k7hJk3FRdcDXkZBhA/Twi0qwvaABS82EVh0xJKZimqFMxkKWSVzOR9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784026844; c=relaxed/simple;
	bh=+b9h4x58nuRHFx18jbDfzoMRPyuPXoZCHsaPqr9H68M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=k6fBUpdSXuWd2qrvOJ1dihzMHw8mgDCLnrFXsPlg20eUSJ/rGoWMTNA0tQSaxgp/0JKcmArQNkMILqqJV/Za8zJdvzORLQTSyPrtDhMi50Om3mAt6snMxcJ10Mx3A84GoE/+QbWHDgFYWcur0KIOeu2yaRmBD0rnDuCCBkCRnFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIFe8qeJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B31851F000E9;
	Tue, 14 Jul 2026 11:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784026842;
	bh=/iv2AyieqD+wQwL0gejSGdtTP/mLifcPc9iiJuDu94M=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=MIFe8qeJETo7Wq9A8nBgLwOqwjMW62COVF1AfM5tzJUUaMLdanyCyL88ks4ZEPNml
	 LLK73UZff5LTqb5R0Q3Tdgf5JMYuxXe6sAlpC4Yc/qUUpK6B6xGdhvWffKD+sjP3C3
	 U5KY06jrIot3FN/VphtEX+vZm0IxOAwAoNLXCRu7Nt2rtixKpXsnSNFrZAQn8OwgVw
	 HtsAiNbMUpDSmXHPF6q0O03vDHcoX8uHAx8nQlz+2T7g475d+faW5QtxymwWLjZGc/
	 FDVU2CkfkI/iL4M11yP7wJ2jF4xMxFFFAcwxZtFmdOKSs2QI82QBQnhR25Tl5LsQ4S
	 3pqgkiUe1PEJg==
Date: Tue, 14 Jul 2026 06:00:41 -0500
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
Message-ID: <20260714110041.GA1349622@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2013cac8-d887-4a09-b1c5-6dc9606f16f0@mailbox.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
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
	TAGGED_FROM(0.00)[bounces-35185-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bhelgaas:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E25EF753AA9

On Mon, Jul 13, 2026 at 08:05:38PM +0200, Marek Vasut wrote:
> On 7/13/26 7:54 PM, Bjorn Helgaas wrote:
> > On Fri, Jul 10, 2026 at 03:35:10PM +0200, Marek Vasut wrote:
> > > On 7/10/26 10:30 AM, Marc Zyngier wrote:
> > > > On Thu, 09 Jul 2026 21:10:03 +0100,
> > > > Marek Vasut <marek.vasut+renesas@mailbox.org> wrote:
> > > > > 
> > > > > Instead of pulling in the whole linux/irqchip/arm-gic-v3.h ,
> > > > > copy the one GITS_TRANSLATER register offset macro directly into
> > > > > the driver.  This repairs the ability to build the driver on
> > > > > non-ARM non-GIC targets the way it was possible until now, which
> > > > > retains good build test coverage.
> > > ...
> > 
> > > So in the end, it is either this patch or limit the build to
> > > arm/arm64 . At least this patch still allows building this driver
> > > with more compilers on the various build bots, so I would opt for
> > > this patch here.
> > 
> > I like the build coverage, but duplicating the #define doesn't really
> > seem good to me.  It makes readability worse because cscope/tags now
> > sees two definitions without an obvious reason.
> 
> I can rename the macro, or ... sigh ... I can reduce the driver to build
> only on ARM/ARM64. Which one do you prefer ?

I think a dependency on ARM/ARM64 is preferable.

