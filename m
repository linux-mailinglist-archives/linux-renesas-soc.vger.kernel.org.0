Return-Path: <linux-renesas-soc+bounces-22014-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78147B83E55
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 11:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 016804637F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 09:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519F62E2EFC;
	Thu, 18 Sep 2025 09:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ybv3BI+6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B06A13D638
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 09:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758188867; cv=none; b=jxtYTrRDv/VSZK8WYLkrJyZOQzi85iZ0Uau2qRCt06vD8jEc6f4ZFo+CIc9M9y90QaDYH15NzcscNeY39ctWNBzozITy5IBu/Ds1vxZtqcjiBq42mg09ziCuQSXhMT8FaTWgJyYMPNgCn4zVfJ+LN6GN9ISfXbQGtXGmAQKOBHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758188867; c=relaxed/simple;
	bh=ebIejkG9lO3H+4v19Kd3NsOO4t6uOqMYtPLh1XK6HPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aml/zOed41HFbzsY4BzCRagT4mY7p6E4fDREDAdcV45E60p3VIg3hVgqrlHkggwMX/xINLziJ7BKYaDAvLSbOinpNqCyvG1VroyWbowG6xxCC6qSY2zjkEDfa30DaK/84ngl/nBOYuvBqdJ1r4H5sO5CE0jMezGlNwgrP2AUsxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ybv3BI+6; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b04ba3de760so96102766b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 02:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1758188862; x=1758793662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xY2fN2zgk9K5ePhnAH7PE+WNn7DSzrHO8ylDHhqkcZ4=;
        b=Ybv3BI+6pNabav/XvdmX6XIsppQ0M/5IxuGMMtXGZgPUwY0Lnd/MprI2Pk+tOS7kbu
         w2fp5utdwqax5a1S9sBlkkn7oAbBk1ju3xCZ0EHQv/lYLwEjgbeUIgxZIxTOhXj9nefr
         qPiv2mCwuGuJI9ezJUK6Xo9K1uZ9Ae08ij4XxyXDeSwiFt/BW9DxV3KC2zA3DKvDrGI6
         N6nUXPpEtXLqIsyy3Q7F6qLx0OuqWg8OE6X6flkiKAoV4oFhP5E9C0Tvw9SvRzp8cluG
         yxv9j7zqAIQmCBkecM0MwzPVezr/UPQoij/GCYGfDzWnDgeb+mBWcoO4AzzC1oMpIkT4
         cJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758188862; x=1758793662;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xY2fN2zgk9K5ePhnAH7PE+WNn7DSzrHO8ylDHhqkcZ4=;
        b=qPOiqiPM6zWQxeg6WYFuZCAj5k64jg0qkEMuZBAWELRbKxvfw5TrPEfkq6EZgY1yCC
         wbCSF52ZwgfM9RllBFxXlgFSm1Wt0KxLHn7VyWt146vR1X8kg5XQXVWGGVXngwDnND4R
         nyYwh/kWn5BLQyOpzAwDViUGWQYz1ZctzphN7a4vw3rJYcH8gk7tT3LPQPEY4WUU3+3t
         S4vUpCosos8rNlcvTle3Y3bynaCy+h6m0mhFO+Rglyt19O9rHWwbgiEEaLraiUTY94N2
         UfROP/+W8kxKA1MgL1soC056dS+NRrMR5qcQ1SrcCHiaGsYgAnFr5mUgB6W6FLvFczPV
         wgNg==
X-Forwarded-Encrypted: i=1; AJvYcCWn/o+WnF+ZRQD/uzQViVPp2XtADDQtYeyC5Cloza0XDiE8TYt1mHgUNI+1wzHHIEAflkmYWt4k4xDfD08wNtoBVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAd8pHTYChjbOch42vim7bbpJ5IlPhNXQ7aMU8ozThec48eu5/
	fWEdJChkGZfa85Gg34KpV47Iymb864Fjd1esoTu4irQ3whbqNT7iwemOWRkk7edXbic=
X-Gm-Gg: ASbGncv9gsSF3keuN/Tln7xN3JYNMDwp2KP2uAANev1sZS2cc6BX/PaRpy+ZBf/5a/i
	RnRVT2xRihld/udecmknDBt+vA9Rf9b4Gmi1CUoNkbdDuZKPdk9ALBLscqLeHkSE80XcxRnlM0N
	zVeiWLCtImeGsUJ/aXaDvLaQSTtSt9Cb9WaLrp2rD8+ViMv27Pd3oolDg0aGQCQ4ACAhC0UsjG0
	FUUXlhtw3bjHPCojjuhDs5tmubLguUuVPlwKDI27wG7slF5So1ovS3wNfu8ZNs/9zBMzScyONks
	57hhwol6/43/cbsSzUxKM1xuZDhI0/htGF1uU/Br/p1NE3kTpn8yVszFZTwkfywKPQg5dIJJk9t
	rptotOex38ZlojcV1TVrmis2qVzm/nETnj/fdsAsEFMK9ApB+IR0O2wXOFRMY
X-Google-Smtp-Source: AGHT+IGm1gMecKNS7ulsOyutPp7cC/3sMrnG/x/HjeoFQdZsaPx3dh9Tz2I2uksJ4hOSdxJlyIcHBg==
X-Received: by 2002:a17:906:730d:b0:b07:88ae:4b80 with SMTP id a640c23a62f3a-b1bbb7615cdmr515429166b.65.1758188862248;
        Thu, 18 Sep 2025 02:47:42 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.153])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd15cb2fesm161684766b.89.2025.09.18.02.47.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 02:47:41 -0700 (PDT)
Message-ID: <c2fc5f6b-0e7c-464e-89a6-35dc76177d18@tuxon.dev>
Date: Thu, 18 Sep 2025 12:47:40 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: renesas: rzg3s-smarc-som: Update
 dma-ranges for PCIe
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 magnus.damm@gmail.com, p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250912122444.3870284-1-claudiu.beznea.uj@bp.renesas.com>
 <20250912122444.3870284-5-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWP638eB_p9xMAqZmOnuc6n7=n31h6AqV+287uvqQEdww@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdWP638eB_p9xMAqZmOnuc6n7=n31h6AqV+287uvqQEdww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 9/18/25 12:09, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, 12 Sept 2025 at 14:24, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> The first 128MB of memory is reserved on this board for secure area.
>> Secure area is a RAM region used by firmware. The rzg3s-smarc-som.dtsi
>> memory node (memory@48000000) excludes the secure area.
>> Update the PCIe dma-ranges property to reflect this.
>>
>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>> @@ -214,6 +214,16 @@ &sdhi2 {
>>  };
>>  #endif
>>
>> +&pcie {
>> +       /* First 128MB is reserved for secure area. */
> 
> Do you really have to take that into account here?  I believe that
> 128 MiB region will never be used anyway, as it is excluded from the
> memory map (see memory@48000000).
> 
>> +       dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0x0 0x38000000>;
> 
> Hence shouldn't you add
> 
>     dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0x0 0x38000000>;
> 
> to the pcie node in arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi
> instead, like is done for all other Renesas SoCs that have PCIe?

I chose to add it here as the rzg3s-smarc-som.dtsi is the one that defines
the available memory for board, as the available memory is something board
dependent.

If you consider it is better to have it in the SoC file, please let me know.

> 
>> +};
>> +
>> +&pcie_port0 {
>> +       clocks = <&versa3 5>;
>> +       clock-names = "ref";
>> +};
> 
> This is not related.

Ah, right! Could you please let me know if you prefer to have another patch
or to update the patch description?

Thank you,
Claudiu

> 
>> +
>>  &pinctrl {
>>  #if SW_CONFIG3 == SW_ON
>>         eth0-phy-irq-hog {
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 


