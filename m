Return-Path: <linux-renesas-soc+bounces-35263-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ChgaHqOWV2ozXgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35263-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 16:18:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5B775F44E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 16:18:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=iPr9uWFZ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35263-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35263-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD16230182B7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 14:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8D931E852;
	Wed, 15 Jul 2026 14:03:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C3A30D40A;
	Wed, 15 Jul 2026 14:03:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784124234; cv=none; b=r3xePyqwCOqL3kp22R3vFoBeJFn3Us1XYB2GwXb+IDq8lP5oVIObr+lGc/P9kHlhv8BupLixVm1zoviacl++lZLjdCPel/U1HHkJeFiqzCXvqfu/GGB04qvm8al7UrVqkUVfozN2sz/0/VGB51iIIE3O9C43ZfHub/VQTKWl88I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784124234; c=relaxed/simple;
	bh=7kPozF3hpCE2xRs4SFXmnG3+PTJyYbqH0uMFLQv7SOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/f14KmFxM7LErmsDaT+llrzriY573VHGCzju22CfAKbhA7AwPK1IzPKm+yYlBJQiWq13dE+CUpGoRZr5A0K/oXFXgLpA5FXhGTEQAeCUhUgOC2SvXZ38jpWI2ZD9a1IRwLFrTjV22GGAa23MKzTYTNv6qGgL7IcaJ/GqvuQQTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPr9uWFZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C31BE1F00A3A;
	Wed, 15 Jul 2026 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784124232;
	bh=uRGb/8XPZ50+gmV2e/JydZ7jSZMs7iOCF4kGCOiqSAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iPr9uWFZNFD4QvWn1joHhHGF1s9vVOlBUqfVWY6Bo1/6hs/tB+1/XLKSW7ySWR6Ab
	 eF0tvN+fwFL4YJ6SgRVWHRclkQhCYS4+5J0eMZZSeO98Pz2CpZzpJfDYL3OsgMGrcf
	 z3t2+nXTKes+CZ01MoHmPLv7qNTVLlpXYl2AaTa+mXAUqsYt3lWpU/vEQgQ3qNxhxa
	 Ky3Y1m/FNxJg3jUxT66XUl0NeMzuiqngS4rE0IA2GqFlYS3csYXgwd8N11Lz3mNadA
	 xtew0N+LkZc8qA62Jnc1Uij4ovbRsk929FlMHtmAeIjz9ul6IOUkIugCxgP0tanwjh
	 kz23zWhwhChnA==
Date: Wed, 15 Jul 2026 16:03:44 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	linux-pci@vger.kernel.org, kernel test robot <lkp@intel.com>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] PCI: rcar-gen4: Isolate driver to ARM64
Message-ID: <jipy4hvsmksv6fy352y23sjdnutpkqoi2577qp5vymqqggiscz@cnx2vijnhvh4>
References: <20260714131957.38067-1-marek.vasut+renesas@mailbox.org>
 <20260714211030.GA1412991@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714211030.GA1412991@bhelgaas>
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:helgaas@kernel.org,m:marek.vasut+renesas@mailbox.org,m:linux-pci@vger.kernel.org,m:lkp@intel.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-35263-lists,linux-renesas-soc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED5B775F44E
X-Rspamd-Action: no action

On Tue, Jul 14, 2026 at 04:10:30PM -0500, Bjorn Helgaas wrote:
> On Tue, Jul 14, 2026 at 03:19:27PM +0200, Marek Vasut wrote:
> > The driver includes linux/irqchip/arm-gic-v3.h which pulls in headers
> > which are available only on ARM and ARM64, on other architectures the
> > headers are not present and the driver fails to build. This driver is
> > used only on ARM64 hardware, isolate its build only to ARM64 to avoid
> > build failures on other architectures.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202607100310.iQw5m9Uo-lkp@intel.com/
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> 
> Mani, I assume you'll squash this into 89bded511a66 ("PCI: rcar-gen4:
> Configure AXIINTC if iMSI-RX is not used") so it's connected to the
> addition of the linux/irqchip/arm-gic-v3.h include and there's no
> bisection hole?
> 

Yes, squashed now!

- Mani

> > ---
> > Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Manivannan Sadhasivam <mani@kernel.org>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-doc@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-pci@vger.kernel.org
> > Cc: linux-renesas-soc@vger.kernel.org
> > ---
> > V2: This is a rework of PCI: rcar-gen4: Inline GIC_TRANSLATER offset macro
> >     which isolates the driver build to ARM64 via Kconfig instead:
> >     https://lore.kernel.org/linux-pci/CAMuHMdVvWE7YZgKvreSn_vJLOVD4eMmn3TCGOyqSXksqjBCwvg@mail.gmail.com/
> >     https://lore.kernel.org/linux-pci/20260714110041.GA1349622@bhelgaas/
> > ---
> >  drivers/pci/controller/dwc/Kconfig | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> > index 49a7a2c50ca15..3260d916110b2 100644
> > --- a/drivers/pci/controller/dwc/Kconfig
> > +++ b/drivers/pci/controller/dwc/Kconfig
> > @@ -346,7 +346,7 @@ config PCIE_RCAR_GEN4
> >  
> >  config PCIE_RCAR_GEN4_HOST
> >  	tristate "Renesas R-Car Gen4 PCIe controller (host mode)"
> > -	depends on ARCH_RENESAS || COMPILE_TEST
> > +	depends on ARM64 && (ARCH_RENESAS || COMPILE_TEST)
> >  	depends on PCI_MSI
> >  	select PCIE_DW_HOST
> >  	select PCIE_RCAR_GEN4
> > @@ -357,7 +357,7 @@ config PCIE_RCAR_GEN4_HOST
> >  
> >  config PCIE_RCAR_GEN4_EP
> >  	tristate "Renesas R-Car Gen4 PCIe controller (endpoint mode)"
> > -	depends on ARCH_RENESAS || COMPILE_TEST
> > +	depends on ARM64 && (ARCH_RENESAS || COMPILE_TEST)
> >  	depends on PCI_ENDPOINT
> >  	select PCIE_DW_EP
> >  	select PCIE_RCAR_GEN4
> > -- 
> > 2.53.0
> > 

-- 
மணிவண்ணன் சதாசிவம்

