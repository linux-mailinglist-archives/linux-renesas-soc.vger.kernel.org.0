Return-Path: <linux-renesas-soc+bounces-23455-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07485BFF3B5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 07:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 959E118885D3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 05:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E76262FEC;
	Thu, 23 Oct 2025 05:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="BqfO9UCG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED540266565
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 05:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761196283; cv=none; b=GHJuiDr6nd1XOb9nH2YKDK9/aGuV7LxNhzeils+P/eWiL9qSbDlTlTT+P8P56nJO6I4YqbNZdvSJN/CP3vEmujpjykM1fmu3iHji/eeJ1GQHLvVpMd5WBlZO+e40lo7AFEGJlSBGNY28Wx9IgSalSPs6BInExOHbbkB5TJ9iZMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761196283; c=relaxed/simple;
	bh=w1LmB0SE2C+tSWh9OqT3WGhfCB5JmRvULI6W/A8+/1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S+CffKwP/NNDwgX6AOH3RZBxtqEntUjhLzPF7ydSwp8//ZVzteTyp8okljWDEfZImdxKIJufW7ZDQEBpJ6Cj9UTaJbzW/Yno16KObDEsGwOrl7l173V9SfwZLtOIgrC+LL6834o3idl0swsdXSOjLesZm0KD6/Wv5nVXTXk/9qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=BqfO9UCG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso2459085e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Oct 2025 22:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761196280; x=1761801080; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gBvcm1/+MWpjtuc12IDJ3vwTa6noB7EaiS2kKGjrEYk=;
        b=BqfO9UCGSJI+ZSEmVvCODgujXi/oSa2IOkRElOV7rbxOY/kWFEtmSQ8+BDx/FPzQ0x
         k+nmo6Owt0f+rTXd1KE1vUsknNPXql/pWVqh+eGMgwRvloajCyE64u6PkEafTTO3E5Dk
         j0CdCB7qm6WIYFk+eT6u8pyjjEg3+t0hn/+S2tRfZBZ6MouLTsBjDAdyZGwiMW+Wcv0r
         EDxw92TStEG5qCt6kO5eUAnMjskgBb3xMTLUqJ/IiuiuGg+/Vzcm8NBGCHdA4oA98cn9
         uF3+MLPRDWUEPo+HiRYJHSOAtfB0t7vqchkekROrdYleUUXefTE6OqDfalrhyeQkNkhJ
         +GqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761196280; x=1761801080;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gBvcm1/+MWpjtuc12IDJ3vwTa6noB7EaiS2kKGjrEYk=;
        b=h2xLU3OtLZAE6hen//imOwkuPaMrRFGP8doW+xkvfMI8NQiuonYZ3PIVu2O57TnX1h
         oQRMErQetcBcrkpgdAgR9EBtvFA12o33sW2pjZTRvcdf+oYweUGEbCHMKXZaq9stQl5U
         QEPYax/c4LhfjhdGBH4Lr7TnF4GXifAJb+xXbUm7j8/x/2vqfPcl/4Y+aGYRRjMhlYVm
         gzfdCtQEAngaveSXsBrQawGhXP76YOAZQ1ZWbcs24/g+kQL8DMzm6k5fqdaoHh5fgMxA
         MU3vxuP1RWu+tiBZWyUxvv/OVLCo4z7Dw04+Zz+xE7WM/RI3MyhTFtAqotIrxsxQ8Ezi
         o93w==
X-Forwarded-Encrypted: i=1; AJvYcCUzEed6CAsdttbZkJ2VazdIre7p7W5iu+Rew+MnZHqQa1P8Qd8XUgT48ULOm1PBdma/a0vvHVatrvR+hZTed5Ogiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6LUg4gMrP8CWNMjsVQl6Qsqd+O5gwGRltoWjDttMGxVHzVxEm
	WtUqoTWP+807Fnhw8B6cCBN+8P+yH4o0FypDpg3iFAw++oZdxoYrtSZ8Nob7L1C8exk=
X-Gm-Gg: ASbGnctr6BRXiWWodo7tJ8lYSFkLRDpouqGsJdV6y/qsoDmrD9xSf+g1po8q/VTvBAp
	m2MaEplhiWHUK+/rj8RhQc4hajAAPoDbGXCj/U/D5md301EZxrXT3+CZRPl//9ZpXC8955gHT0r
	NuP7HqcTnzPTajIuFKiWj09ke1FI0QTWj9h/WpDnO9hN20pDQIlNGkWFX2S7H6vgmuhUkY8NvMB
	FdJnvH3FUpETus52YRJ7h8N8clQikxZTSOvlIYyxG4YCP2uQXDzN9DsrGb9gVltmlmIktfSY0HP
	HdtgjTasvkUJ3lbVl8C1xan/b7At7kl+tTTn6y2RFvwocR0CJ4rcyjRiFLAvHk8dU9tlmMmcqq9
	tjLXvbqbHUY6EUHl85quVwMalmmkkMSb0DKERPm8zQgSyJDwY3IefzwfdpTFdjQxRyJbWKvHNZt
	Y8EyzyEog4dPipgrlsWNc=
X-Google-Smtp-Source: AGHT+IERViLl8JWsqBiRvBQnkt+CyM86zrBZonOHrHEOXB8HhThhVqCeU64XpCcFS1zawD1h5Xuw5w==
X-Received: by 2002:a05:600c:450a:b0:471:21:554a with SMTP id 5b1f17b1804b1-4711787c0c0mr138571215e9.13.1761196279421;
        Wed, 22 Oct 2025 22:11:19 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47494aad668sm53195075e9.2.2025.10.22.22.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 22:11:18 -0700 (PDT)
Message-ID: <51af454f-6322-47c3-9e93-4fc07efc2b8d@tuxon.dev>
Date: Thu, 23 Oct 2025 08:11:17 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/6] PCI: rzg3s-host: Add Renesas RZ/G3S SoC host
 driver
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20251022194939.GA1223383@bhelgaas>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251022194939.GA1223383@bhelgaas>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Bjorn,

On 10/22/25 22:49, Bjorn Helgaas wrote:
> On Tue, Oct 07, 2025 at 04:36:53PM +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
>> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
>> only as a root complex, with a single-lane (x1) configuration. The
>> controller includes Type 1 configuration registers, as well as IP
>> specific registers (called AXI registers) required for various adjustments.
> 
>> +++ b/drivers/pci/controller/Kconfig
>> @@ -266,6 +266,14 @@ config PCI_RCAR_GEN2
>>  	  There are 3 internal PCI controllers available with a single
>>  	  built-in EHCI/OHCI host controller present on each one.
>>  
>> +config PCIE_RENESAS_RZG3S_HOST
>> +	bool "Renesas RZ/G3S PCIe host controller"
>> +	depends on ARCH_RENESAS || COMPILE_TEST
>> +	select MFD_SYSCON
>> +	select IRQ_MSI_LIB
>> +	help
>> +	  Say Y here if you want PCIe host controller support on Renesas RZ/G3S SoC.
> 
> Wrap to fit in 80 columns like the rest of the file.

OK

> 
>> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> 
>> +#define RZG3S_PCI_MSIRCVWMSKL			0x108
>> +#define RZG3S_PCI_MSIRCVWMSKL_MASK		GENMASK(31, 2)
> 
> Unfortunate to have to add _MASK here when none of the other GENMASKs
> need it.  Can't think of a better name though.

Most of the register offsets and fields defines tried to use the naming
from the HW manual. Register at offset 0x108 have bits 31..2 read/writable
and is where we should be writing through driver, and bits 1..0 are read
only and have fixed value. These fields are named in HW manual as:

- MSI Receive Window Mask (Lower) [31:2]
- MSI Receive Window Mask (Lower) [1:0]

As bits 31..2 are read/writable, would you prefer something like:

#define RZG3S_PCI_MSIRCVWMSKL_RW		GENMASK(31, 2)

?

> 
>> +#define RZG3S_PCI_MSIRCVWMSKU			0x10c
> 
> Unused.
> 
>> +#define RZG3S_PCI_AMEIE				0x210
> 
> Unused.
> 
>> +#define RZG3S_PCI_ASEIE1			0x220
> 
> Unused.
> 
>> +#define RZG3S_PCI_PCSTAT2_STATE_RX_DETECT	GENMASK(15, 8)
> 
> Unused.

I agree with all the unused defines pointed. Will be dropped in the next
version.

> 
>> +/* Timeouts experimentally determined. */
> 
> No need for period at end.

Missed this one. I'll update it.

> 
>> +static int rzg3s_pcie_child_read_conf(struct rzg3s_pcie_host *host,
>> +				      struct pci_bus *bus,
>> +				      unsigned int devfn, int where,
>> +				      u32 *data)
> 
> Would fit in three lines if you want.
> 
>> +static int rzg3s_pcie_child_write_conf(struct rzg3s_pcie_host *host,
>> +				       struct pci_bus *bus,
>> +				       unsigned int devfn, int where,
>> +				       u32 data)
> 
> Ditto.

Will update both of these along with:

rzg3s_pcie_child_prepare_bus()
rzg3s_pcie_root_map_bus()
rzg3s_pcie_set_outbound_window()

that have the same symptom.

> 
>> +static int rzg3s_pcie_msi_enable(struct rzg3s_pcie_host *host)
>> +{
>> +	struct platform_device *pdev = to_platform_device(host->dev);
>> +	struct rzg3s_pcie_msi *msi = &host->msi;
>> +	struct device *dev = host->dev;
>> +	const char *devname;
>> +	int irq, ret;
>> +
>> +	ret = devm_mutex_init(dev, &msi->map_lock);
>> +	if (ret)
>> +		return ret;
>> +
>> +	msi->irq = platform_get_irq_byname(pdev, "msi");
>> +	if (msi->irq < 0)
>> +		return dev_err_probe(dev, irq ? irq : -EINVAL,
>> +				     "Failed to get MSI IRQ!\n");
>> +
>> +	devname = devm_kasprintf(dev, GFP_KERNEL, "%s-msi", dev_name(dev));
>> +	if (!devname)
>> +		return -ENOMEM;
>> +
>> +	ret = rzg3s_pcie_msi_allocate_domains(msi);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = request_irq(msi->irq, rzg3s_pcie_msi_irq, 0, devname, host);
> 
> Should this be devm_request_irq()?  Most drivers use it, although
> pci-tegra.c and pcie-apple.c do not.  Maybe there's some special rule
> about using request_irq() even though the driver uses devm in general?
> I dunno.

In general is not good to mix devm cleanups with driver specific one.

As it was requested to drop the devm cleanups from this driver (especially
devm_pm_runtime_enable() which enables the also the clocks) I switched the
initial devm_request_irq() to request_irq() to avoid keeping the interrupt
requested on error path, after driver's probed was executed, until devm
cleanups are called, and potentially having it firing w/o hardware
resourced being enabled (e.g. clocks), and potentially reading HW registers.

E.g., accessing the HW registers while clocks are disabled on the SoC I'm
working with leads to synchronous aborts.

So, I only kept the devm helpers for memory allocations, resets
assert/de-assert and the mutex initialization.

> 
>> +static int rzg3s_pcie_intx_setup(struct rzg3s_pcie_host *host)
>> +{
>> +	struct device *dev = host->dev;
>> +
>> +	for (int i = 0; i < PCI_NUM_INTX; i++) {
>> +		struct platform_device *pdev = to_platform_device(dev);
> 
> Looks like this should be outside the loop.

OK, I kept it here as it is used only inside this block.

> 
>> +		char irq_name[5] = {0};
>> +		int irq;
>> +
>> +		scnprintf(irq_name, ARRAY_SIZE(irq_name), "int%c", 'a' + i);
>> +
>> +		irq = platform_get_irq_byname(pdev, irq_name);
>> +		if (irq < 0)
>> +			return dev_err_probe(dev, -EINVAL,
>> +					     "Failed to parse and map INT%c IRQ\n",
>> +					     'A' + i);
>> +
>> +		host->intx_irqs[i] = irq;
>> +		irq_set_chained_handler_and_data(irq,
>> +						 rzg3s_pcie_intx_irq_handler,
>> +						 host);
>> +	}
> 
>> +static int rzg3s_pcie_power_resets_deassert(struct rzg3s_pcie_host *host)
>> +{
>> +	const struct rzg3s_pcie_soc_data *data = host->data;
>> +
>> +	/*
>> +	 * According to the RZ/G3S HW manual (Rev.1.10, section
>> +	 * 34.5.1.2 De-asserting the Reset) the PCIe IP needs to wait 5ms from
>> +	 * power on to the de-assertion of reset.
>> +	 */
>> +	usleep_range(5000, 5100);
> 
> Consider fsleep() so we don't have to make up the 100us interval.

OK

Thank you for your review,
Claudiu

