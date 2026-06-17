Return-Path: <linux-renesas-soc+bounces-34119-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4FQTA0paMmrTywUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34119-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 10:26:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B460697873
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 10:26:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34119-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34119-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D7DC8300B448
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Jun 2026 08:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB9D1389108;
	Wed, 17 Jun 2026 08:26:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38977384CE4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 08:26:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781684806; cv=none; b=pK9f1fzMajzo4J8A7WdUVVWrqRgap5W40rUpzVBlTZ1xPVuUuAJWOWA9QJOhKqPlG4O4VeFyE3SnbcPbjBySYaosPlRCkpqoIAPCayfcUcXbATUP41Tude+eycfDc8bRFxrR5mdzwY6oxaM0z0ARtMlwGF7eLfUxeRo9ILqZadk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781684806; c=relaxed/simple;
	bh=C0U+32GwJ4K0nGpIroKkA0XQuytFUnwuQ08KdAJjTbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AwGVEezTVF+Ec0PusDcUzZjMNJ0aepg3oavr0hL8vonvmT5ctGVz65ZQ6XNbAJmZSAeA4ZbgCpazvMycLPOFPQ7952yd78gomuuxUE9QPkkHlC5kKry0Jv0PgRXNN9RB1IBEQlhfURBkplrSUOJ53SIJ2OeTlSixznNZCnqxKaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-59eb501bcf0so1850275e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 01:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781684804; x=1782289604;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NH6hocZNylot+M4XVVVgASnxnSv/8JW5bdpWIVIZHYU=;
        b=dDZjTtLOq86tPfXSJbAqG0h9sgTnT4iDwlIwFlirdTHys7ICzWhpezWytYr5ZsP168
         cw+0T2A+Wyzuu+yP1t6Z581z0EDgFtVHsRCnP8jl9Un8rRPwItsOz1CNZdT3Qs9DTsFF
         vEesz5Kvuhn4AxOZMlBa9R+h3adICMlCNiYDZm5mSt7WIR+f9JfbQuX3DqTp7QIMqx7w
         JZZoSppWxi3pKDa+UNi+7NrmDxYvtHP2/V/Q1haGSAsOE5YwLLRc9zGvVV6/0G90ccgc
         7diLy1GtMdFGNHq81xUmy03AhCtxAhyQNCTCD55QWmdsqe8w/mUUB9Y6FsbnRzYdUTPS
         dR7A==
X-Forwarded-Encrypted: i=1; AFNElJ/HalmTQQaXgC7ZGtq3usUXrq2UFPV0PpQ5jyDZdr5BLKdeaax54nuwLnio2SSkZVQOAuugDr9eW/qC0KKgRR0XZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfbFA1yAdlIABojhIQO1zCa8IjGaeIrb8q4WX9qp9VfxGntucV
	xWusIY7+9IzONE/HtjxITmQobxU8XuKnhPPLuv4oLxcQ2AWpuVAD2zieBKN+yMEV
X-Gm-Gg: Acq92OF5mTO2LmK4SbbB9r+zxMj5Mi/Ljfl0X0N5sWfQsQhU0AadqosCgDzY+LyqSsT
	0C9SaaFboQil8iEzlbvfJwtITAlJA2WKNLhzdSQuJxzq+4I+7Lz09QUkWZERSf2OVnsNVFNoTOz
	fsPjAk/P6ECd0b6Vz8GIgveLhxiJSe0kwT85BNmphjhlZn7I60qsc8ev00167gcdUlwEtNGI1Sa
	VQDwM6KDKa8Yr25s8IYRn1BluW5jg0+ZZ3QthuH1pLrIBaRg0B7gLS/putk+yxzskJU0edd9Xdv
	OZtKRvyz+XONBXWxKDTJHCz2Xjwg3hVryRyY3jVSc7qglQJ/laEfnlb0pGrZ+ebrbhQ2Rq4obwN
	l+62/vK/N5JbNM6U6ZcA2dIUBkG2DnlqdkSSqvFMABif3JlkzcW6Hs/q+ZXXcmYL8OocaiWNtnZ
	4wGAa5alPuMCSu4co2XQroLKUa7fuFu4IEzrx+HqAxlzgPRVEImQ==
X-Received: by 2002:a05:6122:8b1b:b0:5a0:370:f12c with SMTP id 71dfb90a1353d-5bbbe702937mr1236343e0c.11.1781684804052;
        Wed, 17 Jun 2026 01:26:44 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bb901ac4d6sm7968943e0c.13.2026.06.17.01.26.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 01:26:43 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-6c5ac3fa819so1837669137.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Jun 2026 01:26:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8FamuzlWL6nEnvvwh6c0uRQIddNPllgLDkY6Rtk1I+WlGnMWuug5rMmWMRKCPbsqxk7MtEwWZjeaDrzj9WqfW2qg==@vger.kernel.org
X-Received: by 2002:a05:6102:4b03:b0:632:3bb5:95f1 with SMTP id
 ada2fe7eead31-7246d528766mr1135210137.27.1781684803531; Wed, 17 Jun 2026
 01:26:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260617030008.154449-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jun 2026 10:26:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0SJ0q2hcpu+qZCH3eZ5eFDyo8Z964h9DhuSaQ7QdHSg@mail.gmail.com>
X-Gm-Features: AVVi8CfAqddoQorfQ6TrjH19DY2WU_w8lZ69fu1Z-CMFemynEW91v1W75EneBEs
Message-ID: <CAMuHMdU0SJ0q2hcpu+qZCH3eZ5eFDyo8Z964h9DhuSaQ7QdHSg@mail.gmail.com>
Subject: Re: [PATCH 1/3] PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-34119-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:linux-pci@vger.kernel.org,m:yoshihiro.shimoda.uh@renesas.com,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email,mailbox.org:email,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B460697873

Hi Marek,

On Wed, 17 Jun 2026 at 05:00, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> In case MSI are enabled, but DWC built-in iMSI-RX is not in use, the
> MSI are handled via GIC ITS. Configure all controller MSI registers
> fully.
>
> Set or clear MSI capability register MSICAP0 MSI enable MSIE bit and
> PCIe Interrupt Status 0 Enable register PCIEINTSTS0EN MSI interrupt
> enable MSI_CTRL_INT bit according to MSI enable state, set both bits
> if MSI are enabled, clear both bits if MSI are disabled.
>
> If MSI are disabled, or MSI are enabled and iMSI-RX is used, then
> deconfigure AXIINTCADDR and AXIINTCCONT to 0, which disables any
> pass through of MSI TLPs onto the AXI bus and then further into
> GIC ITS translation registers.
>
> If MSI are enabled and iMSI-RX is not used, the configure AXIINTCADDR
> with target address of GIC ITS translation registers, and configure
> AXIINTCCONT to enable MSI TLP pass through onto AXI bus and into the
> GIC ITS. This specific configuration allows handling of MSI via the
> GIC ITS instead of integrated iMSI-RX.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -31,6 +31,10 @@
>  #define DEVICE_TYPE_RC         BIT(4)
>  #define BIFUR_MOD_SET_ON       BIT(0)
>
> +/* MSI Capability */
> +#define MSICAP0                        0x0050
> +#define MSICAP0_MSIE           BIT(16)
> +
>  /* PCIe Interrupt Status 0 */
>  #define PCIEINTSTS0            0x0084
>
> @@ -55,6 +59,16 @@
>  #define APP_HOLD_PHY_RST       BIT(16)
>  #define APP_LTSSM_ENABLE       BIT(0)
>
> +/* INTC address */
> +#define AXIINTCADDR            0x0a00
> +/* GITS GIC ITS translation register */
> +#define AXIINTCADDR_VAL                0xf1050000
> +
> +/* INTC control & mask */
> +#define AXIINTCCONT            0x0a04
> +#define INTC_EN                        BIT(31)
> +#define INTC_MASK              GENMASK(11, 2)
> +
>  /* PCIe Power Management Control */
>  #define PCIEPWRMNGCTRL         0x0070
>  #define APP_CLK_REQ_N          BIT(11)
> @@ -305,6 +319,39 @@ static struct rcar_gen4_pcie *rcar_gen4_pcie_alloc(struct platform_device *pdev)
>         return rcar;
>  }
>
> +static void rcar_gen4_pcie_host_msi_init(struct dw_pcie_rp *pp)
> +{
> +       struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
> +       struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
> +       u32 val;
> +
> +       /* Make sure MSICAP0 MSIE is configured. */
> +       val = dw_pcie_readl_dbi(dw, MSICAP0);
> +       if (pci_msi_enabled())
> +               val |= MSICAP0_MSIE;
> +       else
> +               val &= ~MSICAP0_MSIE;
> +       dw_pcie_writel_dbi(dw, MSICAP0, val);
> +
> +       if (!pci_msi_enabled() || pp->use_imsi_rx) {
> +               /* Clear AXIINTC mapping. */
> +               writel(0, rcar->base + AXIINTCADDR);
> +               writel(0, rcar->base + AXIINTCCONT);
> +       } else {
> +               /* Point AXIINTC to GIC ITS and enable. */
> +               writel(AXIINTCADDR_VAL, rcar->base + AXIINTCADDR);
> +               writel(INTC_EN | INTC_MASK, rcar->base + AXIINTCCONT);
> +       }
> +
> +       /* Configure MSI interrupt signal */
> +       val = readl(rcar->base + PCIEINTSTS0EN);
> +       if (pci_msi_enabled())
> +               val |= MSI_CTRL_INT;
> +       else
> +               val &= ~MSI_CTRL_INT;
> +       writel(val, rcar->base + PCIEINTSTS0EN);
> +}
> +
>  static int rcar_gen4_pcie_enable_device(struct pci_host_bridge *bridge,

FTR, this has a contextual dependency on "[PATCH v2] PCI: rcar-gen4:
Limit Max_Read_Request_Size and Max_Payload_Size to 256 Bytes"
(https://lore.kernel.org/all/20260519195219.189323-1-marek.vasut+renesas@mailbox.org).

>                                         struct pci_dev *dev)
>  {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

