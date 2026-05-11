Return-Path: <linux-renesas-soc+bounces-32387-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JXmIkrqAWpHmQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32387-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 16:40:10 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E20FA510576
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 16:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 89603308A69A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 14:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B1B3FF889;
	Mon, 11 May 2026 14:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXQw6eet"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB1B3FF881;
	Mon, 11 May 2026 14:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510072; cv=none; b=lI6mXqqTsTsvEE+g/7xroc/JHOs0gMFjK255Zt98FpO+syaLSOG1o4wC/q4xh8ID/WIZXY0VGOC2nsUhI0ra4INo4b/13RhPLLLppUVuXgaZOFDxFCE00Tn8hYixYPYRJeS/T/lUyoSNvhlxQTHstvBbuQjJABQGdXhWfX2iHms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510072; c=relaxed/simple;
	bh=NxEdhgVml/9CHOk6VphJBRaD99OlXHF3ZLYM28HI5jA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WW7WnujztRFlHeaOFMMrLduJvj7R3VYDIm9Fs3TZPz2ZWzuaAz5e1OFmjs3MoNGKSeJlAAsTg6Y2M0kqiymfDSlKYRndUkeUeUaJ4vsnRlrzeoQwdQEVACg/6bY97ALYd37Qgg1exyUfSxG4kTDCtCTs77+0ZSVGTWTcYnByKHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXQw6eet; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CB09C2BCFA;
	Mon, 11 May 2026 14:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778510072;
	bh=NxEdhgVml/9CHOk6VphJBRaD99OlXHF3ZLYM28HI5jA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JXQw6eetjX/+acIOeyQNxIc7OmLOyw9UoOTz/ssbQc5zk/LhbjkPUteoN3pDQ/F07
	 dqma62bDpgJGd4ZmPkyqo2eJBuI4xx2DtH8H9lU8dyQSBQeYCjH9Tn8E5nnNLsp6ER
	 noIP0VIv7kaSd0QImIabgiwnNDlUia7nyXJbEFhnHoJLteMlf9kPv+JiVxNYpkGiTG
	 2QL7TcXO4sVlk8X5WhVogi4+YaIZY0cLS65VAnQsS2a46Jq5OXl9p+pN3K8JwWSvuA
	 sXpPQikAoXLk0IlANqg3fCt6TT0Dfeo6qPke41KuRD8LL+pAB9H3xVpf8/w3RIj9Uq
	 REBrZMrptMWQw==
Date: Mon, 11 May 2026 20:04:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, stable@vger.kernel.org, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Koichiro Den <den@valinux.co.jp>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] PCI: rcar-gen4: Limit Max_Read_Request_Size and
 Max_Payload_Size to 256 Bytes
Message-ID: <dicudl6knlptqnscyqkedp5zrs4vyosjggysnqsaupxi3g3o4x@rngp35usnurb>
References: <20260425233845.459175-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260425233845.459175-1-marek.vasut+renesas@mailbox.org>
X-Rspamd-Queue-Id: E20FA510576
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32387-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,mailbox.org:email,valinux.co.jp:email,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sun, Apr 26, 2026 at 01:38:28AM +0200, Marek Vasut wrote:
> R-Car Gen4 PCIe controller has a hardware limitation of 256 Bytes
> maximum payload size. The PCIe DMA generates requests of size up
> to minimum(Max_Read_Request_Size, Max_Payload_Size). Force limit
> both Max_Read_Request_Size and Max_Payload_Size to 256 Bytes and
> propagate this limit to all downstream devices.
> 
> This limitation can be triggered for example by using an NVMe SSD
> which does not use host memory buffer, Samsung 980 PRO is such an
> SSD. Affected SSD reports 'hmpre' field as 0:
> "
> $ nvme id-ctrl /dev/nvme0 | grep hmpre
> hmpre     : 0
> "
> 
> The symptom is a read from the SSD which wraps around at 256 Byte
> boundary. The test for this symptom can be implemented by writing
> 512 Byte of random data into the SSD and reading the data back. If
> the read back data repeat after 256 Bytes, the device is affected.
> "
> $ dd if=/dev/urandom of=/tmp/data.bin bs=256 count=2 \
>   dd if=/tmp/data.bin of=/dev/nvme0n1 bs=256 count=2 \
>   dd if=/dev/nvme0n1 bs=256 count=2 of=/tmp/readback.bin
> "
> 
> Expected data:
> "
> $ hexdump -vC /tmp/data.bin
> 00000000  97 81 b7 3b 0e 38 2b 4d  a7 d3 e0 47 ff c2 4b ca
> 00000010  c1 85 98 f0 4a ac 03 a0  3b ab f3 19 44 dd 06 8b
> ...
> 00000100  7a ce 3c b2 e1 d5 d9 11  88 63 10 59 76 3c dc 32 <-- random
> 00000110  72 32 2a 7d a3 e1 aa 13  7c da 58 a1 7b 21 11 50 <-- data
> "
> 
> Faulty readback, collected without this change in place:
> "
> $ hexdump -vC /tmp/readback.bin
> 00000000  97 81 b7 3b 0e 38 2b 4d  a7 d3 e0 47 ff c2 4b ca <---.
> 00000010  c1 85 98 f0 4a ac 03 a0  3b ab f3 19 44 dd 06 8b <-. |
> ...                                                          | |
> 00000100  97 81 b7 3b 0e 38 2b 4d  a7 d3 e0 47 ff c2 4b ca <-:-+- repeated
> 00000110  c1 85 98 f0 4a ac 03 a0  3b ab f3 19 44 dd 06 8b <-+--- data
>      ^^^
>       |
>       '--- Repeat starts at offset 0x100 = 256 Bytes
> "
> 
> Fixes: 0d0c551011df ("PCI: rcar-gen4: Add R-Car Gen4 PCIe controller support for host mode")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Koichiro Den <den@valinux.co.jp>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c | 56 +++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index 8b03c42f8c84c..82f0a074a71da 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -576,6 +576,7 @@ static int r8a779f0_pcie_ltssm_control(struct rcar_gen4_pcie *rcar, bool enable)
>  static void rcar_gen4_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
>  {
>  	struct dw_pcie *dw = &rcar->dw;
> +	u16 offset = dw_pcie_find_capability(dw, PCI_CAP_ID_EXP);
>  	u32 val;
>  
>  	val = dw_pcie_readl_dbi(dw, PCIE_PORT_LANE_SKEW);
> @@ -584,11 +585,66 @@ static void rcar_gen4_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
>  		val |= BIT(6);
>  	dw_pcie_writel_dbi(dw, PCIE_PORT_LANE_SKEW, val);
>  
> +	val = dw_pcie_readl_dbi(dw, offset + PCI_EXP_DEVCTL);
> +	val &= ~(PCI_EXP_DEVCTL_PAYLOAD | PCI_EXP_DEVCTL_READRQ);
> +	val |= PCI_EXP_DEVCTL_PAYLOAD_256B | PCI_EXP_DEVCTL_READRQ_256B;
> +	dw_pcie_writel_dbi(dw, offset + PCI_EXP_DEVCTL, val);

Instead of limiting the MRRS/MPS values for all devices through quirks, why
can't you just limit the Root Port's MPSS value in PCI_EXP_DEVCAP?

- Mani

> +
>  	val = readl(rcar->base + PCIEPWRMNGCTRL);
>  	val |= APP_CLK_REQ_N | APP_CLK_PM_EN;
>  	writel(val, rcar->base + PCIEPWRMNGCTRL);
>  }
>  
> +static void rcar_gen4_rc_pcie_quirk(struct pci_dev *dev)
> +{
> +	static const struct pci_device_id rcar_gen4_pcie_rc_devid = {
> +		PCI_DEVICE(PCI_VENDOR_ID_RENESAS, 0x0030),
> +		.class = PCI_CLASS_BRIDGE_PCI_NORMAL, .class_mask = ~0
> +	};
> +	struct pci_bus *bus = dev->bus;
> +	struct pci_dev *bridge;
> +
> +	if (pci_is_root_bus(bus))
> +		bridge = dev;
> +
> +	/* Look for the host bridge */
> +	while (!pci_is_root_bus(bus)) {
> +		bridge = bus->self;
> +		bus = bus->parent;
> +	}
> +
> +	if (!bridge)
> +		return;
> +
> +	if (!pci_match_one_device(&rcar_gen4_pcie_rc_devid, bridge))
> +		return;
> +
> +	/*
> +	 * R-Car Gen4 PCIe controller has a hardware limitation of 256 Bytes
> +	 * maximum payload size. The PCIe DMA generates requests of size up
> +	 * to minimum(Max_Read_Request_Size, Max_Payload_Size). Force limit
> +	 * both Max_Read_Request_Size and Max_Payload_Size to 256 Bytes and
> +	 * propagate this limit to all downstream devices.
> +	 *
> +	 * For details, refer to:
> +	 * R-Car S4 R19UH0161EJ0130 Rev.1.30 Jun. 16, 2025 or
> +	 * R-Car V4H R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 or
> +	 * R-Car V4M R19UH0217EJ0100 Rev.1.00 Dec. 12, 2025,
> +	 * chapters 104.1.1 Features and 104.3.9 DMA Transfer
> +	 * section DMA Read Transfer.
> +	 */
> +	if (pcie_get_readrq(dev) > 256) {
> +		dev_info(&dev->dev, "Limiting MRRS to 256 bytes\n");
> +		pcie_set_readrq(dev, 256);
> +	}
> +
> +	if (pcie_get_mps(dev) > 256) {
> +		dev_info(&dev->dev, "Limiting MPS to 256 bytes\n");
> +		pcie_set_mps(dev, 256);
> +	}
> +}
> +DECLARE_PCI_FIXUP_ENABLE(PCI_ANY_ID, PCI_ANY_ID, rcar_gen4_rc_pcie_quirk);
> +
>  static void rcar_gen4_pcie_phy_reg_update_bits(struct rcar_gen4_pcie *rcar,
>  					       u32 offset, u32 mask, u32 val)
>  {
> -- 
> 2.53.0
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

