Return-Path: <linux-renesas-soc+bounces-22063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D15C7B88780
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 10:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89FE07C2118
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 08:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F5F2EB5C4;
	Fri, 19 Sep 2025 08:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="YTD5LzHs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DCC2940B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Sep 2025 08:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758271693; cv=none; b=VA+HfIlZgisMbC5Rggwy9ut7R8bMFZpbbA8sO+SJUsC08zu+TUIHTg124thwVIipIvsAOdeGp3BWsh6CY3RHSf6Xslo+5TM5FLeKkvSjqABRJopi3gtRU4eJQowIc6yVU8sGgVuTbLR7TT3hBiy5CqkMkblWnk1Z6ym8TSyVNS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758271693; c=relaxed/simple;
	bh=DRKQQo7E0XXI5t1Nl2xKgdV9ZjFBGXh+yL905d9NgOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hN0EE85RcTuWHNHLxSFZYhWBSP59cW+O4m63dXh2N4W/lnAipe9gzvjxxs0TOKty70iqSyvwg3Xq55FAZrG+HE/i3J85VvV3S0SkO3PNP2PUIcr+0J2utMAqR8DOLDLFaD2iK1f094ZpBorxppAXjoheG8+joLGuYabZDJv0R0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=YTD5LzHs; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4619eb182c8so17198635e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Sep 2025 01:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1758271689; x=1758876489; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eeKy21799Hcr7FkiQNz9qpF/GKHks2yWa5KvVvnnvBs=;
        b=YTD5LzHs/2JghmXjuOtJLVaVWPiSNLYgNIeuGJ8sHtXycY/v5FjZCotRh2WKCxEFEo
         JraQFBcpSLdvPh2MYd9mzXDnyc12btnHSYK5qoHZOSsxtrf8YR7iyBAC7HQaD4VDS7hv
         w66rlaqAAwVGwdXf+ckp2C5J1lPFLNDQwQxh2sMG50TOAqKF/qneRLtAAlsVrwzn7fBJ
         1VptB56yQW2oL7+mTi9gY31Nu+OO4728nQs58ZFA2WcJ7/ZdlQLIppWUFYiOKkDE+TLU
         3G4J5xzfgF0WLGb2wwzBoUk4MA4RpHXdL4dRqrv6tkLd+jkejk4JVJJ8rR7Hp3wVEoel
         0JEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758271689; x=1758876489;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eeKy21799Hcr7FkiQNz9qpF/GKHks2yWa5KvVvnnvBs=;
        b=pjFyGyQ3boW4AyrrePNIrd4cSYwhq7eLtS+oUzQFpSjrd43Psu+T/oH1jXi0RFMeTG
         QmFI7i9RZCxtkkLOGGZxmUWVWGoPua7H7vARPIwlAkHoBJHHxyaw1I831RlTtENTutKl
         Wh6JTGLTak6cLZnYZDiFTeirEhv6OXppRHQAy3L42r4faTWvl2XlL3j+DXI4iXlfJwE/
         D86HKWR3GkAxf2UjEk3l199roLk48GxOIxm+6CywqIBVoUps1SPpf0i26E1rBb7DyZ9G
         MRZV+t5apkr+Z1t4y3qYtRClRIDHC+eyaH59BI8lq++97v2z4G+Fhe3SfVoJuHWaD0Th
         I0ug==
X-Forwarded-Encrypted: i=1; AJvYcCUpfv3cMx3/iG6YXD7VDFoG6KZFOD8gn/Kn/p9EIsUz1BdGxrz+uF2fVpbgPSmuuQEqgtnwSK1kggFaToBLqFBM1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBWKWfajmoZ024FWsMzcgQV2M6QUANAr735ymoK45q+r4RWlzO
	mOn1QnGrCtq58Or1Qcu49cuHnn7KpYZQ1sSYhR2mB3S4o3sGh3SytgOsnqvj2FKzGvk=
X-Gm-Gg: ASbGncvwQ4+RidDrRj6gjFeAt4f7of/52Hg+y1fstFEUazO5YIAj16RZXE5V3jng6DI
	EIkYin6h4vC4AoloKmXhvmwhryO+o9UhoFGv+1k0mXdTUGNnIX4+iISy6yBecUqn8T4QbnLCW+f
	+Rzk410vz8K/+8wTJ6qL2yFQrSd33kn4w1aaXerKRD4X303js8uvYOMVuJbrJiHPelYLYvX6nz1
	IezSMVgsjsQ5W6N2U9bZJmvQIf+qhaOFGo/dseE3a2ExioPXEDVXEa/g5MtnkHLswYKY3NsBA1y
	DbD6V+uPElFI+EKUuLG/mpv4h55XRkhrRNtbHnMEG+4ibnFtBPdtwk/Dky8vhDRAukpNdi/L4lL
	OUDgUa6JS85+fBnTBVXJ1YaEUPS5gbMk=
X-Google-Smtp-Source: AGHT+IEcfSBKA6EVtbz44CtdpDIr7jJoD+o0et3ddP2anoSqvYQpa11KA6TpHEkqTDry3s/PDolXgw==
X-Received: by 2002:a05:600c:c4aa:b0:45b:8f5e:529a with SMTP id 5b1f17b1804b1-467e7120cf3mr18971265e9.14.1758271688605;
        Fri, 19 Sep 2025 01:48:08 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4613e849a41sm115536495e9.20.2025.09.19.01.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Sep 2025 01:48:08 -0700 (PDT)
Message-ID: <a3ce3fd1-6aca-49e4-b86b-75557526d62e@tuxon.dev>
Date: Fri, 19 Sep 2025 11:48:06 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: renesas: rzg3s-smarc-som: Update
 dma-ranges for PCIe
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20250912122444.3870284-1-claudiu.beznea.uj@bp.renesas.com>
 <20250912122444.3870284-5-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWP638eB_p9xMAqZmOnuc6n7=n31h6AqV+287uvqQEdww@mail.gmail.com>
 <c2fc5f6b-0e7c-464e-89a6-35dc76177d18@tuxon.dev>
 <CAMuHMdWeHoUe-=7TDetnDQbLQsKGf4pDGpSdz3xEVLs_Rst9qQ@mail.gmail.com>
 <0a20c765-ff72-4c03-af84-dff3f4850fa4@tuxon.dev>
 <lunqwki2orbf5gjyo4a5kz6ko3rs5w6fspbantqcv7b2vxe5ku@734remr6z4lp>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <lunqwki2orbf5gjyo4a5kz6ko3rs5w6fspbantqcv7b2vxe5ku@734remr6z4lp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/19/25 11:25, Manivannan Sadhasivam wrote:
> On Fri, Sep 19, 2025 at 10:38:52AM +0300, Claudiu Beznea wrote:
>> Hi, Geert,
>>
>> On 9/18/25 13:00, Geert Uytterhoeven wrote:
>>> Hi Claudiu,
>>>
>>> On Thu, 18 Sept 2025 at 11:47, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>>>> On 9/18/25 12:09, Geert Uytterhoeven wrote:
>>>>> On Fri, 12 Sept 2025 at 14:24, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>
>>>>>> The first 128MB of memory is reserved on this board for secure area.
>>>>>> Secure area is a RAM region used by firmware. The rzg3s-smarc-som.dtsi
>>>>>> memory node (memory@48000000) excludes the secure area.
>>>>>> Update the PCIe dma-ranges property to reflect this.
>>>>>>
>>>>>> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>
>>>>> Thanks for your patch!
>>>>>
>>>>>> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
>>>>>> @@ -214,6 +214,16 @@ &sdhi2 {
>>>>>>  };
>>>>>>  #endif
>>>>>>
>>>>>> +&pcie {
>>>>>> +       /* First 128MB is reserved for secure area. */
>>>>>
>>>>> Do you really have to take that into account here?  I believe that
>>>>> 128 MiB region will never be used anyway, as it is excluded from the
>>>>> memory map (see memory@48000000).
>>>>>
>>>>>> +       dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0x0 0x38000000>;
>>>>>
>>>>> Hence shouldn't you add
>>>>>
>>>>>     dma-ranges = <0x42000000 0 0x48000000 0 0x48000000 0x0 0x38000000>;
>>>
>>> Oops, I really meant (forgot to edit after copying it):
>>>
>>>     dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0x0 0x40000000>;
>>>
>>>>>
>>>>> to the pcie node in arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi
>>>>> instead, like is done for all other Renesas SoCs that have PCIe?
>>>>
>>>> I chose to add it here as the rzg3s-smarc-som.dtsi is the one that defines
>>>> the available memory for board, as the available memory is something board
>>>> dependent.
>>>
>>> But IMHO it is independent from the amount of memory on the board.
>>> On other SoCs, it has a comment:
>>>
>>>      /* Map all possible DDR as inbound ranges */
>>>
>>>>
>>>> If you consider it is better to have it in the SoC file, please let me know.
>>>
>>> Hence yes please.
>>>
>>> However, I missed you already have:
>>>
>>>     /* Map all possible DRAM ranges (4 GB). */
>>>     dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0x1 0x0>;
>>>
>>> in r9a08g045.dtsi, so life's good.
>>>
>>> +
>>>>>> +};
>>>>>> +
>>>>>> +&pcie_port0 {
>>>>>> +       clocks = <&versa3 5>;
>>>>>> +       clock-names = "ref";
>>>>>> +};
>>>>>
>>>>> This is not related.
>>>>
>>>> Ah, right! Could you please let me know if you prefer to have another patch
>>>> or to update the patch description?
>>>
>>> Given the dma-ranges changes is IMHO not needed,
>>
>> I kept it here as the driver configures the PCIe registers for the inbound
>> windows with the values passed though the dma-ranges. This is done through
>> rzg3s_pcie_set_inbound_windows() -> rzg3s_pcie_set_inbound_window(). The
>> controller will be aware that the secure area zone is something valid to
>> work with. In that case, if my understanding of PCIe windows is right, I
>> added this in the idea that an endpoint (a malicious one?) could DMA
>> into/from secure area if we don't exclude it here?
>>
> 
> That's true. But do you really have an usecase to setup inbound window for the
> endpoints? What does the endpoint do with this memory?

I don't have a usecase for this. I did this update just to be safe for the
described scenario.

> 
> - Mani
> 


