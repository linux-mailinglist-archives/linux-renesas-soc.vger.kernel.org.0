Return-Path: <linux-renesas-soc+bounces-34576-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z7CrElEFRGpenQoAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34576-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 20:05:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4636E7162
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 20:05:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34576-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34576-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 584113030E99
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jun 2026 18:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56F93DFC8F;
	Tue, 30 Jun 2026 18:05:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457853DDDDE
	for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 18:04:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782842700; cv=none; b=Ck1XRbeRot+IkKaItjtZOtWNMOLmTALy1Qf+umqPEtRXwlhDE05a7/iwVa0X5KbiEIwSaOty5Tf+LMgPXwLSjWhSdRhuDCxx4+uUSgGhlsDGolSw82+wvV95hlFy7iWg3iQiLz+zZ/+vT63+AyVU9aUajZ+k4/GkiBF6TWO8V6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782842700; c=relaxed/simple;
	bh=OYJNr+fvg0ooEirPKzpg45GmiwT9K/fc8PU+rAViuKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZ+u9TfEmyimNHd19228YN5h/+MLt3MEj+e+ZQnYvPC/wLNhTp/VA2AdqE3vVr+hrHHZSz9FqEaEiPJJ8oSK7Z8AJJrYm2GrbIRhcLqnt+kNUyig9JSiEcD/0Eq35eDa/2NydvvaDhDFnQalttWp76EoKGJ2oOoik2+M6zsqLZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7383cdb7800so2125420137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 11:04:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782842698; x=1783447498;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCVJ3/YfnMGwAtAU15rL0FQBriNX8zfFDwNu+BCGAtk=;
        b=nXS6jVihiHdfMzrE/ltAuzWktUknMheLKKaCW2rvnduqkakR48KFgyDgXN4OTDk78K
         yoBmj8Ksa1Fc+g5umEYNhgxfKHEkaPBRBLSD4N0gDI1nlH5VeSIpHPZ7ahEgYtpL6/ST
         UfE64FMX21Yl+gBjEbDKZL6WNJ/X3Xoi7Y06EZrOUQys1hsek3N2l8SOMgIXqJnO5xTe
         ZQKJBkoXfw9XZgYt6FDh0rRPXkugGSDHAICST9uyT6cY4O80A7kG+fBdBu9p+ZI8dPIz
         bRll5ty5DKODv271lmDowwm8/QKujArwb0VC0HS4cIGbMc6fShrbaE0KEX2u6RhKWUmW
         3Efg==
X-Forwarded-Encrypted: i=1; AHgh+RrZXRaiyq+KKs6xQWxeAn5u/YgMWOLwFHzxDwjW2e6RYl8wqxOQQGbE9X1Wu+X6MObBNcHOe/F/9SMQ07u+WyrnRA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3GNXN0fQQ7MZcum1xsSori8yteHrjdWqjrEqsh2gfSh+f5/cM
	yDmVBpgOZ5KVT3hug8zcKg7KHrj5VOQgxkKrXmhE32otmmMElHY4hBdzE+cCwi2Wigc=
X-Gm-Gg: AfdE7cnrsiG9UEwhEAtOevyENhmHhXWh7I5iDcD8ZOlTyIJhgJt7YBug9a5c5FZmOd6
	FlFbPV0bKLgARhAqAsjPJAv0roXTc3T0oQN9Lmmeak1tqU3UXX+3Qx3YJWZ6s7RfHYbs57y7dkM
	36UVIwxHJD5tW7m4bymc1rP7ApgnxSEPANlXTBdS1ZCJXkqxOR2j7DAwbILBl+xcb74BVOFJbGP
	rJ+xSVr5PkIaHjCFtGC0RPqUupeTWmR1YAWbREW9K7FNffrQJRUyCWwnOAXBDro8ObsBHepj7NF
	LjU6jl9B18ohtQQhQvionME67ZmuqsGTpqLg7+X8cJc5o2gUYCQUsxsacgLjC/5wfPvZ67j4OQ0
	HoWeI26H7NWd+pdIABdvhacy4/7tFhpg4amW5zlin98WiUR6t7xJPt5sHFJ+2uczcuUnQ+L6kIv
	sUZhWEavdVU1ii4/3SalY3LoKGhl3/p8h9xTWZ9+bWHXM36S3K7Q==
X-Received: by 2002:a05:6102:4428:b0:633:c6c4:b32c with SMTP id ada2fe7eead31-73a381338dcmr2525818137.15.1782842698174;
        Tue, 30 Jun 2026 11:04:58 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-73a8433bbabsm1510172137.11.2026.06.30.11.04.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 11:04:56 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7383cdb7800so2125385137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 30 Jun 2026 11:04:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr7eiQIDooK3s5Nir2ntQkbZ0FcYH7FJ4NkAUMtY2+rLZmkw5nL6S/KGsl5Lr0QIrQeDyvSpNlqcDDD6BIBSvI8pw==@vger.kernel.org
X-Received: by 2002:a05:6102:5805:b0:738:472f:2ca9 with SMTP id
 ada2fe7eead31-73a369ec1bcmr2473065137.7.1782842696311; Tue, 30 Jun 2026
 11:04:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618220427.14325-1-marek.vasut+renesas@mailbox.org> <20260618220427.14325-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260618220427.14325-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jun 2026 20:04:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV3tyZk8ckL-ihdbVcGV9tQumdntPc_nJB6HXEkZLytfw@mail.gmail.com>
X-Gm-Features: AVVi8CcCGeVbbcW5z0757KT0rVC9sZPZEWMHF1Z1kDBEh7vVAiL0IbidDTttqgc
Message-ID: <CAMuHMdV3tyZk8ckL-ihdbVcGV9tQumdntPc_nJB6HXEkZLytfw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] PCI: rcar-gen4: Configure AXIINTC if iMSI-RX not used
To: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-pci@vger.kernel.org, 
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-34576-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut+renesas@mailbox.org,m:yoshihiro.shimoda.uh@renesas.com,m:linux-pci@vger.kernel.org,m:kwilczynski@kernel.org,m:bhelgaas@google.com,m:catalin.marinas@arm.com,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:lpieralisi@kernel.org,m:mani@kernel.org,m:maz@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:marek.vasut@mailbox.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,linux-m68k.org:from_mime,linux-m68k.org:email,vger.kernel.org:from_smtp,mail.gmail.com:mid,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F4636E7162

Hi Marek, Shimoda-san,

On Fri, 19 Jun 2026 at 00:04, Marek Vasut
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

> @@ -305,13 +320,103 @@ static struct rcar_gen4_pcie *rcar_gen4_pcie_alloc(struct platform_device *pdev)
>         return rcar;
>  }
>
> +static int rcar_gen4_pcie_host_msi_addr(struct dw_pcie_rp *pp, u32 *msi_addr)
> +{
> +       struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
> +       struct device_node *msi_node = NULL;
> +       struct device *dev = dw->dev;
> +       struct resource res;
> +       u64 addr;
> +       int ret;
> +
> +       /*
> +        * Either the "msi-parent" or the "msi-map" phandle needs to exist
> +        * to obtain the MSI node.
> +        */
> +       of_msi_xlate(dev, &msi_node, 0);
> +       if (!msi_node)
> +               return -ENODEV;

This is not backwards-compatible with existing DTBs.
I noticed because PCIe is broken on Gray Hawk Single with R-Car V4M
after this series.  Indeed, "[PATCH v2 4/4] arm64: dts: renesas:
r8a779g0: Add GICv3 ITS and update PCIe nodes" only covers R-Car V4H,
but not R-Car S4-8 and R-Car V4M.

> +
> +       /* Check if "msi-parent" or the "msi-map" points to ARM GICv3 ITS. */
> +       if (!of_device_is_compatible(msi_node, "arm,gic-v3-its"))
> +               return dev_err_probe(dev, -ENODEV, "Compatible MSI controller not found\n");
> +
> +       /* Derive GITS_TRANSLATER address from GICv3 */
> +       ret = of_address_to_resource(msi_node, 0, &res);
> +       if (ret < 0)
> +               return dev_err_probe(dev, ret, "MSI controller resources not obtained\n");
> +
> +       addr = res.start + GITS_TRANSLATER;
> +       if (addr >= SZ_4G)
> +               return dev_err_probe(dev, -EINVAL, "MSI controller address above 32bit range\n");
> +
> +       *msi_addr = addr;
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

