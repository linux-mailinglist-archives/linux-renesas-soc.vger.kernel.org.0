Return-Path: <linux-renesas-soc+bounces-32843-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIC2I3poDWo0xAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32843-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 09:53:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9660F589340
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 09:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E3AF3302482A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 07:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38175378D63;
	Wed, 20 May 2026 07:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YQBv+m2x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486A3375ADE;
	Wed, 20 May 2026 07:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779263568; cv=none; b=JfS6GoWEtSTyBqcCGfaFvCO8lj8baStGtKCa65Y817atCB1KOzP/Te2lmmlFPgrNxWGR9g41z8IWGmIzdpcm1opKZItdj44lLm0Sn70s0Rt0HbVp6h2ZZTndSk0PJDuptR9Ycpiu+GwwtXjn2Bz4K4TGK9zjRAeaeeTwarkTm48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779263568; c=relaxed/simple;
	bh=l2iq04dfid1P/RI7IJB6RTFHGWrxxxOjteF9sXcweUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3nEnsKXopWzTkFoer3vjLhTy7N3ngjb/gvEtwHpSu2I8uhInH7wwc4B9cm7wl8nyfVv4ur7iPgVhnS+6W4urM3T+zDhyYs8fhrPwPm8RmnfXlZwY9dgb8MIaB73GeUOYo5YXi5Md6IBUh8w35f0xVFSA6T/bNKJRsTMNlFghj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YQBv+m2x; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12ED41F000E9;
	Wed, 20 May 2026 07:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779263566;
	bh=K7AXusVw5tvRk0MCx58b3uVuuJbfqHqRR7DEObAZuqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YQBv+m2xMy4acoftW+DIFqymklNIOAyXZXlVYOo2ON1JvQARL78iTvyrRWzv3kXrw
	 iN5udWjmMvNWKgQRF8/mCm+JiZi1pTiSmtXs3WgIuC5Vb6jtv2+q3C3waRqtrCexXe
	 kM69ptL06OpIAvotnuTai5zRhuvsd6VnOrAazR5ZXPJcfXgsGgCFi1gOb3uTSPlDLk
	 lpMD6q5Hup5DNGehX92Z74Bv7dff7d9+JksIcnk7irk/3l3Y/H9qnzIiiJXobEnU+j
	 IO6wg9UlrhNlW5aHsjgcfUj8DmMeLqXnhDUX9LP0Om9zjLID1Wk6Ku+FArQVu01FgX
	 FP336eN77QIzg==
Date: Wed, 20 May 2026 13:22:37 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-pci@vger.kernel.org, stable@vger.kernel.org, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Koichiro Den <den@valinux.co.jp>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] PCI: rcar-gen4: Limit Max_Read_Request_Size and
 Max_Payload_Size to 256 Bytes
Message-ID: <n54cy5tedwjw7tr6a7h7fh3ja6rnmwur4yuc7235pt6nv4dwfs@phoahokzmts5>
References: <20260425233845.459175-1-marek.vasut+renesas@mailbox.org>
 <dicudl6knlptqnscyqkedp5zrs4vyosjggysnqsaupxi3g3o4x@rngp35usnurb>
 <e7078be5-4d95-4b85-9590-d1f0c76b653a@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e7078be5-4d95-4b85-9590-d1f0c76b653a@mailbox.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32843-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,google.com,glider.be,valinux.co.jp,gmail.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9660F589340
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 13, 2026 at 12:57:18AM +0200, Marek Vasut wrote:
> On 5/11/26 4:34 PM, Manivannan Sadhasivam wrote:
> 
> Hello Manivannan,
> 
> > >   drivers/pci/controller/dwc/pcie-rcar-gen4.c | 56 +++++++++++++++++++++
> > >   1 file changed, 56 insertions(+)
> > > 
> > > diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > > index 8b03c42f8c84c..82f0a074a71da 100644
> > > --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > > +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> > > @@ -576,6 +576,7 @@ static int r8a779f0_pcie_ltssm_control(struct rcar_gen4_pcie *rcar, bool enable)
> > >   static void rcar_gen4_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
> > >   {
> > >   	struct dw_pcie *dw = &rcar->dw;
> > > +	u16 offset = dw_pcie_find_capability(dw, PCI_CAP_ID_EXP);
> > >   	u32 val;
> > >   	val = dw_pcie_readl_dbi(dw, PCIE_PORT_LANE_SKEW);
> > > @@ -584,11 +585,66 @@ static void rcar_gen4_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
> > >   		val |= BIT(6);
> > >   	dw_pcie_writel_dbi(dw, PCIE_PORT_LANE_SKEW, val);
> > > +	val = dw_pcie_readl_dbi(dw, offset + PCI_EXP_DEVCTL);
> > > +	val &= ~(PCI_EXP_DEVCTL_PAYLOAD | PCI_EXP_DEVCTL_READRQ);
> > > +	val |= PCI_EXP_DEVCTL_PAYLOAD_256B | PCI_EXP_DEVCTL_READRQ_256B;
> > > +	dw_pcie_writel_dbi(dw, offset + PCI_EXP_DEVCTL, val);
> > 
> > Instead of limiting the MRRS/MPS values for all devices through quirks, why
> > can't you just limit the Root Port's MPSS value in PCI_EXP_DEVCAP?
> The root port MPSS is already 3'b001 = 256 Bytes and is read-only for
> EXPCAP1F0 (PCI_EXP_DEVCAP) .
> 
> The controller is limited to MPS 256 Bytes according to V4H rev.1.30
> documentation. There is no explicitly spelled out MRRS limitation in the
> documentation to my knowledge, except for the DMA hint, but please read on.
> 
> The root port EXPCAP2F0 MPS is 128 Bytes and MRRS is 512 Bytes .
> 
> I now noticed that in V4H rev.1.30 documentation, the EXPCAP2F0 MRRS field
> is default set to 3'b010 = 512 Bytes, but that value is "Reserved" and only
> two non-reserved values are 3'b000 and 3'b001 which are MRRS 128 Bytes and
> 256 Bytes respectively. That means MRRS has to be trimmed to maximum 256
> Bytes in software to avoid "Reserved" settings. I will also ask the hardware
> and documentation team about this.
> 
> As a result, I adjust EXPCAP2F0:
> 
> - I raise MPS from 128 Bytes to 256 Bytes
> - I reduce MRRS from 512 Bytes to 256 Bytes (this is important to prevent
> data corruption)
> 
> However, the downstream devices (in my case, PCIe SSD) can still be
> configured with MRRS > 256 (in my case, Crucial P5 Plus 1 TiB has MRRS=512
> and MPS=128), which is where the quirk kicks in and reconfigures MRRS for
> those downstream devices.
> 
> The pci_configure_mps() does propagate MPS from root port EXPCAP2F0 to
> downstream devices, but there is no equivalent for MRRS as far as I can find
> ?

Sorry for the late reply!

I'm now confused about the issue itself. In your v1 patch you said:

"R-Car Gen4 PCIe controller has a hardware limitation of 256 Bytes
maximum payload size. The PCIe DMA generates requests of size up
to minimum(Max_Read_Request_Size, Max_Payload_Size). Force limit
both Max_Read_Request_Size and Max_Payload_Size to 256 Bytes and
propagate this limit to all downstream devices."

The 256B limitation of Root Port MPS is clear. And you said, Root Port's MPSS is
already 256B. So this will prevent the endpoints from sending > 256B payload.

Also, the DMA calculation of min(MRRS,MPS) will also satisfy with 256B MPS even
if MRRS is higher i.e, 512B.

If MRRS is 512B, the endpoint should send two 256B TLPs based on MPS and that
shouldn't be a problem on the host. So I'm not sure how the higher MRRS value
induces data corruption here. And why you want to limit MRRS on all downstream
devices and not just the Root Port? Since you are using NVMe, the host will be
the one sending MRd TLP to the device. So I'm not sure how the endpoint MRRS
comes into play.

Am I missing something?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

