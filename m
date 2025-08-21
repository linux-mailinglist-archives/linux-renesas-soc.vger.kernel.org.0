Return-Path: <linux-renesas-soc+bounces-20821-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9FCB2EFEC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 09:42:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56801A0320A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Aug 2025 07:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604E62820A4;
	Thu, 21 Aug 2025 07:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="paI360l2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154A51FBCB2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Aug 2025 07:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755762047; cv=none; b=Hwnh8hYhqIkezAZZeEBZVGFLUJIu39u0ML8FbpksZS7MWvKY5tNCRL4/dtoEt0O0TYrIwhHEpyee3mVi1ZOidCJzPXNj/dn8/xs8HMXswIeeBWx7Ui6YPvhjZYu9hgJz2jfInPz5YnMZmTb6YiPL4oZTR/nBFCGXd0IN77wNFnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755762047; c=relaxed/simple;
	bh=Uj3lhiNQ8KTr4No999KBtD5ZsLbjQ3f79sUlJDHS0tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MOBrtsUpdeglkKfMPrISa4pVEKk5JNqv8DjYO82SW85JlHl1jZwfqnFzZWN6ohXHU+seCCWNWYM6rZuHdZC3X3nSHzT7a5dibG59w+JEHu7HcZpa88ar5opkdQCvgym3FzKSZ6EIOjwnB/ZQYOkSqsu3JxBs4dj7yZFyr2t6ko4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=paI360l2; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb78f5df4so119722266b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Aug 2025 00:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1755762043; x=1756366843; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UOmX8DoVDkdi25dNPPFg/anGS8Ls6i4vihgyINbx3eI=;
        b=paI360l21SWhZYekRBoBldNtbNlggtjTEkV5yobCx2NadeoBa9xSBwXClqKI7zV9Zx
         nEdNZ779qCpmNO4SspzhzPJvD+pJszCwTv5109KY+ulHiKCKpy56jPFMvzvhImHvfYqh
         j+x77tPi+4j8VqsWgxd9ujlTX6XL6SpNgW5DPFHX1UCwT/9FqhOT+CTTOQmXoxrCbciP
         NDBqBXPt4OR6yEp4DYqRIT/KDttkWZpMCNOh5iC4cvsl1s19yZMDckrGtJh1aBNTQQ0u
         zt3VEFEGZH6hMEV5lMB9NyWdojju3SdSeCTqzSWyrMd4JA9P/XeQcyMLgJq+WcS3PcKn
         yeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755762043; x=1756366843;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UOmX8DoVDkdi25dNPPFg/anGS8Ls6i4vihgyINbx3eI=;
        b=uf4FmQtqwR3z6NFXjCcbHV5hZrbOfXgL8Qh9sJ31Vl1wi2gsJfV/w0FQNSeZ4/OH4B
         ZdonEv3yP4drlX5Aj4I7h2Gi0pLMC9RFt30AB2yrwHZ1ArrofeItzXtnH3ERHHL6KsGE
         5KfUPzFcZdC3QFBDzK9oSLgrgfULq2649j0dZkZM645NkYYIb7J+Q+U3gTVBSu1huQJX
         tFxoUyfn+/UQLAkFL/r7sl/+r2+IX9j6PVNkggAw5i8beRhN8EuW6X/RPzOj89fhVV+z
         tpy4ObIv1t96mSWLBqpZFMkswS0WqJTQj0hd2DAEpbH+PAJMpDynGsqsZ/QB8nKBmD1H
         WHfw==
X-Forwarded-Encrypted: i=1; AJvYcCUh/pFOkkMDzknfg/9jE+ANsOKtvFFIlyx5xco3lMI3DkNiHmnAZHJWaUbabGOpeVaaW/yt63c77a6D4DX5VjYIbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDsWy6u3EDHlzMBPODoybaHFAf3oPgUqsb2/9+rMcib/Wb6aXy
	HflM2ozSxl9qb4JkYxyvPaDV26SvIQo1p1plzH0FPCylOJf8u9yN5RHJvVN9JjQc+3Q=
X-Gm-Gg: ASbGncv5KEgU1IsVlmSCkKXwM1QFlgZJ3gyWl+3CscUynaJOzUmjwA+AxiXp42OutYo
	6bPxxTaWQnCXdoC8bRshGTR2+5dQFu569hiWZEMrEBfuNYwAhOt+Cwvw+sb1lXwFSVMN6OQlF6l
	eryNklQIHbml0JbHavG/tudDDIcqiHoF3XXWyddnhTdEqNHlQvqWF0+0bJ/EfufAZKkP5V/cfIj
	EzBWdUWjmOFH1Dt0YvHeHpy7er+YkGdRbcKpDGnjLLUj3MP3P/Uct8m5vLHJnYCdraiB3+/T9QA
	0jKw0BQ37mhDVPvMLfRakmL2lg4sFnUVwLOuqEK/FUbfVC/15qrBaJf8oKEJ7V+Mi5SAUYqW14P
	G8415r/RLUjG+nYoU23FMg7MWPoH6Lg==
X-Google-Smtp-Source: AGHT+IHEJwqxJwdifUOCSxwxS8LU3s+6tTaEhqmWIZcz8WNrqBZn4cOf5NK2eo88RGZk0Kt+NV58dg==
X-Received: by 2002:a17:907:3e89:b0:afd:d9e4:5a4a with SMTP id a640c23a62f3a-afe07d61255mr154660366b.62.1755762043006;
        Thu, 21 Aug 2025 00:40:43 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded309f55sm341039666b.47.2025.08.21.00.40.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 00:40:42 -0700 (PDT)
Message-ID: <d004d9c4-f71b-49e6-9ced-031761f5e338@tuxon.dev>
Date: Thu, 21 Aug 2025 10:40:40 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] PCI: of_property: Restore the arguments of the
 next level parent
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
 p.zabel@pengutronix.de, lizhi.hou@amd.com, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704161410.3931884-4-claudiu.beznea.uj@bp.renesas.com>
 <7wmpgldjvznbllotblv6ufybd2qqzb2ole2nhvbx4xiavyqa2b@ezaqwghxmbve>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <7wmpgldjvznbllotblv6ufybd2qqzb2ole2nhvbx4xiavyqa2b@ezaqwghxmbve>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Manivannan,

On 20.08.2025 20:47, Manivannan Sadhasivam wrote:
> On Fri, Jul 04, 2025 at 07:14:03PM GMT, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> of_pci_make_dev_node() creates a device tree node for the PCIe bridge it
>> detects. The node name follows the format: pci_type@pci_slot,pci_func. If
>> such a node already exists in the current device tree, a new one is not
>> created.
>>
>> When the node is created, its contents are populated with information from
>> the parent node. In the case of root complex nodes described in the device
>> tree, the created node duplicates the interrupt-map property. However, the
>> duplicated interrupt-map property does not correctly point to the next
>> interrupt controller.
>>
>> For example, in the case of the Renesas RZ/G3S SoC, the resulting device
>> tree node is as follows (only relevant DT properties are shown):
>>
>> pcie@11e40000 {
>>
>>     // ...
>>
>>     interrupt-map = <0x00 0x00 0x00 0x01 0x1f 0x00 0x00 0x00 0x00
>>                      0x00 0x00 0x00 0x02 0x1f 0x00 0x00 0x00 0x01
>>                      0x00 0x00 0x00 0x03 0x1f 0x00 0x00 0x00 0x02
>>                      0x00 0x00 0x00 0x04 0x1f 0x00 0x00 0x00 0x03>;
>>     interrupt-map-mask = <0x00 0x00 0x00 0x07>;
>>     interrupt-controller;
>>     #interrupt-cells = <0x01>;
>>
>>     #address-cells = <0x03>;
>>     #size-cells = <0x02>;
>>
>>     phandle = <0x1f>;
>>
>>     // ...
>>
>>     pci@0,0 {
>>         reg = <0x00 0x00 0x00 0x00 0x00>;
>>         interrupt-map = <0x10000 0x00 0x00 0x01 0x1f 0x00 0x11e40000 0x00 0x00
>>                          0x10000 0x00 0x00 0x02 0x1f 0x00 0x11e40000 0x00 0x01
>>                          0x10000 0x00 0x00 0x03 0x1f 0x00 0x11e40000 0x00 0x02
>>                          0x10000 0x00 0x00 0x04 0x1f 0x00 0x11e40000 0x00 0x03>;
>>         interrupt-map-mask = <0xffff00 0x00 0x00 0x07>;
>>         #interrupt-cells = <0x01>;
>>
>>         #address-cells = <0x03>;
>>         #size-cells = <0x02>;
>>
>>         // ...
>>     };
>> };
>>
>> With this pci@0,0 node, the interrupt-map parsing code behaves as follows:
>>
>> When a PCIe endpoint is enumerated and it requests to map a legacy
>> interrupt, of_irq_parse_raw() is called requesting the interrupt from
>> pci@0,0. If INTA is requested, of_irq_parse_raw() first matches:
>>
>> interrupt-map = <0x10000 0x00 0x00 0x01 0x1f 0x00 0x11e40000 0x00 0x00>
>>
>> from the pci@0,0 node. It then follows the phandle 0x1f to the interrupt
>> parent, looking for a mapping for interrupt ID 0x00
>> (0x00 0x11e40000 0x00 0x00). However, the root complex node does not
>> provide this mapping in its interrupt-map property, causing the interrupt
>> request to fail.
>>
> 
> Are you trying to say that the generated bridge node incorrectly uses Root
> Complex node as the interrupt parent?

I'm trying to say that the generated bridge node is wrong because it copies
the interrupt-map from the root complex mapping int 0x1 to 0x0 in the
bridge node, while it should have map the int 0x1 to something valid for
root complex mapping.

E.g. when some device requests INT with id 0x1 from bridge the bridge
mapping returns 0x0 then the returned 0x0 is used to find a new mapping on
the root complex based on what is provided for in with interrupt-map DT
property.


> 
> I'm getting confused since your example above shows '0x1f' as the interrupt
> parent phandle for both Root Complex and bridge nodes. But I don't know to which
> node this phandle corresponds to.

Root complex node from this patch description has:

phandle = <0x1f>;


> 
> In any case, since this seems to be an independent fix, please send it
> separately.

Yes, once port bindings are added this fix is not needed for this driver
anymore. Will post it as a separate fix.

Thank you,
Claudiu


> 
> - Mani
> 
>> To avoid this, in the interrupt-map property of the nodes generated by
>> of_pci_make_dev_node() map legacy interrupts to entries that are valid in
>> the next level interrupt controller in the interrupt mapping tree.
>>
>> With this, the generated pci@0,0 node and its parent look as follows:
>>
>> pcie@11e40000 {
>>     // ...
>>
>>     interrupt-map = <0x00 0x00 0x00 0x01 0x1f 0x00 0x00 0x00 0x00
>>                      0x00 0x00 0x00 0x02 0x1f 0x00 0x00 0x00 0x01
>>                      0x00 0x00 0x00 0x03 0x1f 0x00 0x00 0x00 0x02
>>                      0x00 0x00 0x00 0x04 0x1f 0x00 0x00 0x00 0x03>;
>>     interrupt-map-mask = <0x00 0x00 0x00 0x07>;
>>     interrupt-controller;
>>     #interrupt-cells = <0x01>;
>>
>>     #address-cells = <0x03>;
>>     #size-cells = <0x02>;
>>
>>     phandle = <0x1f>;
>>
>>     // ...
>>
>>     pci@0,0 {
>>         reg = <0x00 0x00 0x00 0x00 0x00>;
>>         interrupt-map = <0x10000 0x00 0x00 0x01 0x1f 0x00 0x11e40000 0x00 0x01
>>                          0x10000 0x00 0x00 0x02 0x1f 0x00 0x11e40000 0x00 0x02
>>                          0x10000 0x00 0x00 0x03 0x1f 0x00 0x11e40000 0x00 0x03
>>                          0x10000 0x00 0x00 0x04 0x1f 0x00 0x11e40000 0x00 0x04>;
>>         interrupt-map-mask = <0xffff00 0x00 0x00 0x07>;
>>         #interrupt-cells = <0x01>;
>>
>>         #address-cells = <0x03>;
>>         #size-cells = <0x02>;
>>     };
>> };
>>
>> Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v3:
>> - none; this patch is new
>>
>>  drivers/pci/of_property.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
>> index 506fcd507113..8dfed096326f 100644
>> --- a/drivers/pci/of_property.c
>> +++ b/drivers/pci/of_property.c
>> @@ -243,6 +243,14 @@ static int of_pci_prop_intr_map(struct pci_dev *pdev, struct of_changeset *ocs,
>>  		}
>>  		of_property_read_u32(out_irq[i].np, "#address-cells",
>>  				     &addr_sz[i]);
>> +
>> +		/*
>> +		 * Restore the arguments of the next level parent if a map
>> +		 * was found.
>> +		 */
>> +		out_irq[i].np = pnode;
>> +		out_irq[i].args_count = 1;
>> +		out_irq[i].args[0] = pin;
>>  	}
>>  
>>  	list_for_each_entry(child, &pdev->subordinate->devices, bus_list) {
>> -- 
>> 2.43.0
>>
> 


