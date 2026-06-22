Return-Path: <linux-renesas-soc+bounces-34275-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MTKFG07cOGrqjAcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34275-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 08:55:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCE56AD0D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 08:55:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ikvFlJzf;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34275-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34275-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3757930065D8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jun 2026 06:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86468360EE5;
	Mon, 22 Jun 2026 06:55:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5032FE0F;
	Mon, 22 Jun 2026 06:55:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782111307; cv=none; b=st1Q6yQcPW8SDQNsliTxoTBMKmJwJVasMwZUHQ0X+bbqE/CcnoOUW2X6Ck+1rXCLR5z7aF1/EjpMSU06E64IevFViBpjDLk0yeaQQ0sUAiOxrGgLL5JrRIkpDG6b4tTocuo7LeZfsqOiFcoW6E1Tm0xumsroWXSYRv7C+xWrQlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782111307; c=relaxed/simple;
	bh=D5x1kSmJK5SGdStf4cGnyBRqbu7Z2PCwTSTXsDBTtfs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DygqwIkGD0wBoLYGshExBCfs/Q/C1O9lMY4odeVV74eVUrBw3bxIq9mestCO8k80afFc4ybghi0+nV74AVbtvx9NjGsJL6E+qSCUbSW1z3vF5QK6OMjMHuJXgy6HvIbrAgNqNamYPolrIDwnxwhPUHhM+u0+cFrTMJrMSYcMnUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ikvFlJzf; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15EE1F000E9;
	Mon, 22 Jun 2026 06:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782111306;
	bh=ZG+FlhsVlEBxS0bsxSZ646KiQA9erOt9LJfgN0fiaPY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ikvFlJzfxPPr76gMlDohagJy/DrSM6dLOR9BUHjD9G0RlR3hEa/g/2fUQcQEwt2PL
	 jnWQ/jY+QzuqD2tq3Bp5W8di53S5nymamNb6+hFxKbqFMW7zKKwBtRwE/EUmtvk8U/
	 U0Kyl7gvnK7IxqRugBzijQKJ+Y2fHY4TFHp5aMk2+I8e+hDRz41pHzCHtnLzOsY9Y0
	 9SkXxa5PR4ui/1mpyc9X7OsOqe/5k5J1i7uD6Ku/+UjW1pAxjQCeGl/Y97F6xtAXbK
	 L1Ey1C0rtMmfFaAuoRvyhkO3ttBhk3UvLuOj4kimTYHrUK6zVLFxFvyBe1uGdjcOG3
	 tRbxbrmxL4N/A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wbYYh-0000000EoYq-2tzO;
	Mon, 22 Jun 2026 06:55:03 +0000
Date: Mon, 22 Jun 2026 07:55:03 +0100
Message-ID: <8633yfrrnc.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Thomas Gleixner <tglx@kernel.org>,	linux-pci@vger.kernel.org,	Yoshihiro
 Shimoda <yoshihiro.shimoda.uh@renesas.com>,	Krzysztof =?UTF-8?B?V2lsY3p5?=
 =?UTF-8?B?xYRza2k=?= <kwilczynski@kernel.org>,	Bjorn Helgaas
 <bhelgaas@google.com>,	Catalin Marinas <catalin.marinas@arm.com>,	Conor
 Dooley <conor+dt@kernel.org>,	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,	Lorenzo Pieralisi
 <lpieralisi@kernel.org>,	Manivannan Sadhasivam <mani@kernel.org>,	Rob
 Herring <robh@kernel.org>,	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] irqchip/gic-v3: Add Renesas R-Car Gen4 erratum workaround
In-Reply-To: <d6fce333-4353-4e49-873f-eb3187a631e4@mailbox.org>
References: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org>
	<20260618220427.14325-4-marek.vasut+renesas@mailbox.org>
	<87cxxkma5p.ffs@fw13>
	<d6fce333-4353-4e49-873f-eb3187a631e4@mailbox.org>
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
X-SA-Exim-Rcpt-To: marek.vasut@mailbox.org, tglx@kernel.org, linux-pci@vger.kernel.org, yoshihiro.shimoda.uh@renesas.com, kwilczynski@kernel.org, bhelgaas@google.com, catalin.marinas@arm.com, conor+dt@kernel.org, geert+renesas@glider.be, krzk+dt@kernel.org, lpieralisi@kernel.org, mani@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34275-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:tglx@kernel.org,m:linux-pci@vger.kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mailbox.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFCE56AD0D7

On Sun, 21 Jun 2026 23:46:25 +0100,
Marek Vasut <marek.vasut@mailbox.org> wrote:
> 
> On 6/21/26 12:59 PM, Thomas Gleixner wrote:
> > On Fri, Jun 19 2026 at 00:02, Marek Vasut wrote:
> >> Renesas R-Car S4/V4H/V4M GIC600 integration has address width for AXI
> >> or APB interface configured to 32 bit, it can therefore access only
> >> the first 4 GiB of physical address space. This information comes from
> >> R-Car V4H Interface Specification sheet, there is currently no technical
> >> update number assigned to this limitation. Further input from hardware
> >> engineer indicates that this limitation also applies to R-Car S4 and V4M.
> >> Name the limitation GEN4GICITS1, and add a driver quirk to mitigate this
> >> limitation.
> >> 
> >> The quirk is keyed on the combination of the GIC implementation
> >> and the platform identification in the device tree.
> >> 
> >> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > 
> > This SOB chain is broken.
> 
> Broken ? I don't understand , could you please elaborate ?

Either Shimoda-san is the sole author of the change and you are
posting their work, then the first line of the patch should say:

 From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

with your own SoB immediately following their SoB (see [1]).

Or this has been co-developed, and both of you should be credited as
authors. then Shimoda-san's SoB should be preceded by their
Co-developed-by: tag (see [2]).

 Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

This shows exactly who did what, who forwarded whose patch, and forms
the base of the DCO which is documented at [3].

Thanks,

	M.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n449
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n503
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n396

-- 
Without deviation from the norm, progress is not possible.

