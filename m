Return-Path: <linux-renesas-soc+bounces-16840-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA26AB1262
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 13:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9374A9C2392
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 11:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1447F28E5E5;
	Fri,  9 May 2025 11:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ayri1AN/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05A422F16E
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 May 2025 11:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746790911; cv=none; b=I49VVdQ60qBVGygERjMshBgrkc/Wx+v8wYGBjQJc/aJPcCEGp4aLQBbETz/v93l70Fby2x8IUjfbEJaXZWSUtoqr5iPg3lIyY6sEIYqvOriSvVLokMOkZUXw1ggm8134mHW0edpUuYevKs3owQpHjctG3THkpgkYOpQHMwBljDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746790911; c=relaxed/simple;
	bh=21R4CdsJlxo6ZIUB4aWnLHQhzIqhbI+E6wdmGGSh4zs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YQKSPA5VAhRYaQrcBHw9lKg42nOnRLsdqpUGOB6iBpIUFwBJbLZVOvRyNWkcgB7dBIylBcYjyGCHHTwPxjLva3UjDSpLv1FEsoTXayJI9g8Hdww3Iwi8uWOCRX+c3+PYPBIF8SCl+nEzKC+MlUJaW6Np4whZ9zXufpRjiorp95c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ayri1AN/; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so284089766b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 May 2025 04:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746790907; x=1747395707; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xqSqgdbr6mkrFUbRKHE1fLZLEEIHfO7KWsMJjVuS+q4=;
        b=ayri1AN/SeBgJ2RHWOluJm//i1J26QV+grwv7cw760nXkqFlLPeqM3zfaIicoUnJQV
         nR0ZkT2odUUfKWb61TYl5guqeewzxnJ9UpeOyzbuCRZq3DJltHrP/pBowx17XdQZ/+TM
         bAYDL0AILCtYvyS+Hmq1aBlwNDmX5EknHeVUbG7SFjK6fDzCpNjhg4YxMlpkFfK7intx
         5D9LEFukgf9Stu+h2kwp8wr9NIWnCYb4SyCCYZyvegjMqOGFnf/jHJ0+ghsaKYwkmoO/
         rXLA0I5xGaS+lf9mnzuuHTw4q5BlxuBV4kJ/9/tMjl8hNqgZLskHGWJ2fKi0YE8s5yKI
         tvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746790907; x=1747395707;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xqSqgdbr6mkrFUbRKHE1fLZLEEIHfO7KWsMJjVuS+q4=;
        b=mlve9UACeNz/pOwtosQauy47tMcGiQut/wlJ/NcNyUZNCz92Bal/xCHr6I3UqieBi+
         0PWMZ23BhiEa6nfeDFg7zyQFR9B8xdACwzJLKX9zqRSnLQkF6CBTaRsosA1nXuuysA+b
         2kVifN2l+Nq1MsGvHBiZkYl2bD9+l8fFhdu3UctXAOvfT7NQit6ggU+Sf2E2bnMHqCA1
         Vu4GApnFwaKMn/DWrzjGiw9twYxXOSz6wdstlRyLTGW8Zbro6qfyJAOS9onC/9+T7eR/
         DGGNsN6oXqFf2YLPwUpDmEHgNXvlL3b+UitmYHsmj+aRaWg/Km3exXZVJpc3YzeUepUQ
         WE/g==
X-Forwarded-Encrypted: i=1; AJvYcCUskip+bHH1wMWVjwXH+4mwh4HtUXA8ZbflkSPLr4SGSVMRK6gcpq28F7itlsjRnr1ndIpo8QdKaDxNwXKy7hUZmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFvIiwk8ITMtTo0puPrG33rVWK0jF1cofReR1gekFR4FgixxuY
	XCCSghJZdpOl/Xb8tv3pCc+drLShHzQLb02p+/lB79QpBvlrK6GSv+95H8BOskQ=
X-Gm-Gg: ASbGncvhAMeCCA9dL99z28W2cqCZ97ztG/P4CYeruuDFsL4XRj5RHcACntZPXCUdt41
	J1l+f9zK64zRKE+DTOZMndFaKimDx2b/pWXAkkIfgl5WggN/qpJTmLQHGOSSMb9CtrZgu0s8Bj4
	Wrk7NN4kUIrb9uVIVaLs+3musBVB7C5rHatQOppmEKX6Vq8wSOC+PHAAgazYyW5jQpWUnrNLg5O
	dg5/vBQgeU4iQrNuC9UHSkIKOTX3uxrxfsoovg/F8QCC/+RVrsTiTpjd24Mubi3vjGEhh7+xZTY
	dZ1hFEUmSekpA4OVMAryE61E2fBl3TZk41J3Yhxx0XPLvuq5
X-Google-Smtp-Source: AGHT+IG2j0Pea0l+03cwVMYbfwrcANbL1huFvD6sD/j4JhDPCTCSj3oUMBeHqG1csVa7s5Hq/oxNxw==
X-Received: by 2002:a17:907:1907:b0:ac2:cae8:e153 with SMTP id a640c23a62f3a-ad218ea823fmr310536466b.4.1746790907122;
        Fri, 09 May 2025 04:41:47 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197bd2a8sm138611966b.145.2025.05.09.04.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 04:41:46 -0700 (PDT)
Message-ID: <b4771b63-3198-47c8-a83d-5133ba80d39b@tuxon.dev>
Date: Fri, 9 May 2025 14:41:44 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
To: Philipp Zabel <p.zabel@pengutronix.de>, bhelgaas@google.com,
 lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, saravanak@google.com
Cc: linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250430103236.3511989-1-claudiu.beznea.uj@bp.renesas.com>
 <20250430103236.3511989-6-claudiu.beznea.uj@bp.renesas.com>
 <42a5119e547685f171be6f91e476a9b595599cf9.camel@pengutronix.de>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <42a5119e547685f171be6f91e476a9b595599cf9.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Philipp,

On 09.05.2025 13:51, Philipp Zabel wrote:
> Hi Claudiu,
> 
> On Mi, 2025-04-30 at 13:32 +0300, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
>> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
>> only as a root complex, with a single-lane (x1) configuration. The
>> controller includes Type 1 configuration registers, as well as IP
>> specific registers (called AXI registers) required for various adjustments.
>>
>> Other Renesas RZ SoCs (e.g., RZ/G3E, RZ/V2H) share the same AXI registers
>> but have both Root Complex and Endpoint capabilities. As a result, the PCIe
>> host driver can be reused for these variants with minimal adjustments.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>  MAINTAINERS                              |    8 +
>>  drivers/pci/controller/Kconfig           |    7 +
>>  drivers/pci/controller/Makefile          |    1 +
>>  drivers/pci/controller/pcie-rzg3s-host.c | 1561 ++++++++++++++++++++++
>>  4 files changed, 1577 insertions(+)
>>  create mode 100644 drivers/pci/controller/pcie-rzg3s-host.c
>>
> [...]
>> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
>> new file mode 100644
>> index 000000000000..c3bce0acd57e
>> --- /dev/null
>> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
>> @@ -0,0 +1,1561 @@
> [...]
>> +static int rzg3s_pcie_resets_bulk_set(int (*action)(int num, struct reset_control_bulk_data *rstcs),
>> +				      struct reset_control **resets, u8 num_resets)
>> +{
>> +	struct reset_control_bulk_data *data __free(kfree) =
>> +		kcalloc(num_resets, sizeof(*data), GFP_KERNEL);
>> +
>> +	if (!data)
>> +		return -ENOMEM;
>> +
>> +	for (u8 i = 0; i < num_resets; i++)
>> +		data[i].rstc = resets[i];
>> +
>> +	return action(num_resets, data);
>> +}
> 
> What is the purpose of this? Can't you just store struct
> reset_control_bulk_data in struct rzg3s_pcie_host and call
> reset_control_bulk_assert/deassert() directly?

Yes, I can. I was trying to avoid storing also the reset_control_bulk_data
in struct rzg3s_pcie_host since all that is needed can be retrieved from
the already parsed in probe cfg_resets and power_resets.

> 
>> +static int
>> +rzg3s_pcie_resets_init(struct device *dev, struct reset_control ***resets,
>> +		       struct reset_control *(*action)(struct device *dev, const char *id),
>> +		       const char * const *reset_names, u8 num_resets)
>> +{
>> +	*resets = devm_kcalloc(dev, num_resets, sizeof(struct reset_control *), GFP_KERNEL);
>> +	if (!*resets)
>> +		return -ENOMEM;
>> +
>> +	for (u8 i = 0; i < num_resets; i++) {
>> +		(*resets)[i] = action(dev, reset_names[i]);
>> +		if (IS_ERR((*resets)[i]))
>> +			return PTR_ERR((*resets)[i]);
>> +	}
>> +
>> +	return 0;
>> +}
> 
> Why not use devm_reset_control_bulk_get_exclusive() directly?

I wasn't able to find a bulk_get_exclusive_deasserted() kind of API.

This IP needs particular sequence for configuration. First, after power on,
the following resets need to be de-asserted:

	const char * const power_resets[] = {
		"aresetn", "rst_cfg_b", "rst_load_b",
	};

then, after proper values are written into the configuration registers, the
rest of the resets need to be de-asserted:

	const char * const cfg_resets[] = {
		"rst_b", "rst_ps_b", "rst_gp_b", "rst_rsm_b",
	};

So I was trying to get and de-assert the power_resets in probe and just get
the cfg_resets in the 1st step of the initialization, and later to
de-assert the cfg_resets as well.

Now, after you pointed it out, maybe you are proposing to just
get_exclusive everything in one shot and then to de-assert what is needed
at proper moments with generic reset control APIs?

Thank you for your review,
Claudiu

