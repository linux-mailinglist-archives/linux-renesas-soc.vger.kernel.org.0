Return-Path: <linux-renesas-soc+bounces-21654-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C97EB4FBAB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 14:49:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E35F934508B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 12:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10CB233CE9C;
	Tue,  9 Sep 2025 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NokdZ6BY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB2033CEA2
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Sep 2025 12:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757422097; cv=none; b=Gcf0M5fOww14e7430yt8xVqhKwCDuD7s1EaoXv4tWJGv6QI5CM0gmbfGlTKOfATNOAJ+MnIJvG8/cwac/yz6EcWhFQtnjGGUkBi+kkB6JxBqXSz9V6HPXtvrdNq/q7q1lx2W2QxH9YdrMNGpCZJf2nMptPxADMdIfpE89mzan3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757422097; c=relaxed/simple;
	bh=VftbE1hsLmXFChLA3aJJHbvI9G8AlMyg5ojBtwjpRKo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=R6KECVOWiuV2+WK6ZT5M+CT/6usqGIEtvi4MpYRplk/aP0vO85cRd1BXxf3QT3YSgrAiwip5AL0Hm1mvgcoQ15oZSLuiGCgwCd+kFXSK+jUUNy+t4A+DGWkK62MG8LFnRfayViNrNirNM/PXs+mj0N7GN6N9yCgoEcXqBfbtJqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NokdZ6BY; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45ddddbe31fso19939895e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Sep 2025 05:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757422093; x=1758026893; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/9O8tHwn09nsjeClSuqgfyQVy6t2GJ6AHHgo9UAkBbk=;
        b=NokdZ6BYazX/JhBEcEC2OTZ6eRkjs7y0uEp0LXUYy9BiyZSIZk7sPHMmq+JbNkzcoA
         t3ztbk9gkrCMzrWLyzDIgYyjE4Q1NXlPvGum3GwfsZQkUZNO1fEnqUF5cJctheqUQL96
         3l+LGCsbEMHvPg2j6Nqxms3PEgpv1CUUc1xqfEYA8hBeZOcVsMhoDaKEVDlz3+b46KTp
         SVoPwYvczWzPsuhBRBdKzM5jctbjYhCFdQ0M+khI9b+JlU1oq/Ic/dtE/NeoQJVc/7tU
         waIefJtJ3EQgRmKhMyHIn9gBpGYVqJNJ7v/heJnpaOyZvSGGJLX1CyimDGzaB2NxHncR
         yRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757422093; x=1758026893;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/9O8tHwn09nsjeClSuqgfyQVy6t2GJ6AHHgo9UAkBbk=;
        b=gr2poSyHye8gjMRVF8yiFV6/DlY/r5jrl2zl3MIZJSzJ8Kj5YZa6sH4j5/vBx6vYYd
         MZc82PkFHJy//7CA4yl+4ijJ/0W32Rd6eUwTu7HOSSSVHf6Pk6NmWN/UMWXTdcLJF1z/
         4YMAnyEZz06feuWN1ur07y/GTNlSFDg9atBb3ebqLjD9iW3YczkTgub4he9U1iMf2/GY
         gnYt1xnVSFfb2JRnw2Tx9CmIbP62MyytwQimqn8Ab1IcCEpiIiZImCw+Da8luslJYTF2
         i36J+uDgwkrPlybPGiez1U9ks0VW0vfXj+o/0/hCfeSPXlzwHYrbMKiR4BNNtAfq6FLA
         Y1Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUrnLvA5YZd3rApyHZ3Nur5sWE1m06QrXQQCTOzg44N0dt/oJOWG+X/i1aFqYdQX+ZjLW4n6YA9SJijxJyM492/sg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2tRMM4aQ5jvIhi7wlLI/n/nC4tuI2j++wWykugMc7q9EwX0Y7
	NzduSmcAnu9Z/wOLM6JB2bmqDjIS1g3MgU7hcz9zxYSpwgThW7OEX/cM28hvnHe1iAg=
X-Gm-Gg: ASbGncsHXOozPJwL7brBZYPmKrh5b6xQpWSO8NoHEp53ZO33uzcfHw555fNcM22MyNZ
	A94Y0Tw8pebZFGjt729avDIzZpubzDI13ULWt5iOUfwRSSqRKHGbT+7ko88rBTadTx+1oPzZSwu
	3ksfsTpfNNp6wsCdC4oZdb6AqJsLiMuXEnndHGUdKvsML37vOkOGx7o+1PEKGF/FUNGiZsci+zy
	MumXlQqFp2+wkr+B/+vbEWD4yn3WlFA1CyQQu+C+o6ZhaGW8DU3lUGGul12z+6uublbr/Ms4xD5
	7PNGyuCmxmwzSR12NXo5n+am5Sj0QXBkfjqjUQ/tocf0mgW8OISs/PYroiSWGC1HD9X10b/2+Fs
	OXeFE9umowV0J6aWguqwH3BW+EsQe6xweVeYIyvWBAg==
X-Google-Smtp-Source: AGHT+IGNhrTxIPsosCdGJWZIZAbT0RGPUxRM8nlUnIFpaFAXk/yICLpZY71X3iYYFxkLTIc/wDUO1A==
X-Received: by 2002:a05:600c:46d0:b0:45d:d96e:6176 with SMTP id 5b1f17b1804b1-45ddded62d8mr99306545e9.25.1757422092531;
        Tue, 09 Sep 2025 05:48:12 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e75224db20sm2503507f8f.60.2025.09.09.05.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 05:48:12 -0700 (PDT)
Message-ID: <ba50f82f-3344-42dd-b58d-0a1d7438e1ac@tuxon.dev>
Date: Tue, 9 Sep 2025 15:48:10 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, lizhi.hou@amd.com, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea
 <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704161410.3931884-6-claudiu.beznea.uj@bp.renesas.com>
 <ddxayjj5wcuuish4kvyluzrujkes5seo7zlusmomyjfjcgzcyj@xe3zzzmy2zaj>
 <8ef466aa-b470-4dcb-9024-0a9c36eb9a6a@tuxon.dev>
Content-Language: en-US
In-Reply-To: <8ef466aa-b470-4dcb-9024-0a9c36eb9a6a@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Manivannan,

On 8/30/25 14:22, Claudiu Beznea wrote:
> 
> On 30.08.2025 09:59, Manivannan Sadhasivam wrote:
>> On Fri, Jul 04, 2025 at 07:14:05PM GMT, Claudiu wrote:
>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
>>> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
>>> only as a root complex, with a single-lane (x1) configuration. The
>>> controller includes Type 1 configuration registers, as well as IP
>>> specific registers (called AXI registers) required for various adjustments.
>>>
>>> Hardware manual can be downloaded from the address in the "Link" section.
>>> The following steps should be followed to access the manual:
>>> 1/ Click the "User Manual" button
>>> 2/ Click "Confirm"; this will start downloading an archive
>>> 3/ Open the downloaded archive
>>> 4/ Navigate to r01uh1014ej*-rzg3s-users-manual-hardware -> Deliverables
>>> 5/ Open the file r01uh1014ej*-rzg3s.pdf
>>>
>>> Link: https://www.renesas.com/en/products/rz-g3s?
>>> queryID=695cc067c2d89e3f271d43656ede4d12
>>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>> ---
>>>
>> [...]
>>
>>> +static bool rzg3s_pcie_child_issue_request(struct rzg3s_pcie_host *host)
>>> +{
>>> +	u32 val;
>>> +	int ret;
>>> +
>>> +	rzg3s_pcie_update_bits(host->axi, RZG3S_PCI_REQISS,
>>> +			       RZG3S_PCI_REQISS_REQ_ISSUE,
>>> +			       RZG3S_PCI_REQISS_REQ_ISSUE);
>>> +	ret = readl_poll_timeout_atomic(host->axi + RZG3S_PCI_REQISS, val,
>>> +					!(val & RZG3S_PCI_REQISS_REQ_ISSUE),
>>> +					5, RZG3S_REQ_ISSUE_TIMEOUT_US);
>>> +
>>> +	return !!ret || (val & RZG3S_PCI_REQISS_MOR_STATUS);
>> You don't need to do !!ret as the C11 standard guarantees that any scalar type
>> stored as bool will have the value of 0 or 1.
> OK, will drop it anyway as suggested in another thread.
> 
>>> +}
>>> +
>> [...]
>>
>>> +static void __iomem *rzg3s_pcie_root_map_bus(struct pci_bus *bus,
>>> +					     unsigned int devfn,
>>> +					     int where)
>>> +{
>>> +	struct rzg3s_pcie_host *host = bus->sysdata;
>>> +
>>> +	if (devfn)
>>> +		return NULL;
>> Is it really possible to have devfn as non-zero for a root bus?
> I will drop it.

Actually, when calling:

pci_host_probe() ->
  pci_scan_root_bus_bridge() ->
    pci_scan_child_bus() ->
      pci_scan_child_bus_extend() ->
        // ...
        for (devnr = 0; devnr < PCI_MAX_NR_DEVS; devnr++)
            pci_scan_slot(bus, PCI_DEVFN(devnr, 0));

The pci_scan_slot() calls only_one_child() at the beginning but that don't
return 1 on the root bus as it is called just after pci_host_probe() and
the bus->self is not set (as of my investigation it is set later in
pci_scan_child_bus_extend()) leading to rzg3s_pcie_root_map_bus() being
called with devfn != 0.

Similar drivers having ops and child_ops assigned use the same approach.
E.g. dw_pcie_own_conf_map_bus():

void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int
devfn, int where)
{
	struct dw_pcie_rp *pp = bus->sysdata;
	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);

	if (PCI_SLOT(devfn) > 0)
		return NULL;

	return pci->dbi_base + where;
}

Thank you,
Claudiu

