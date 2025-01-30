Return-Path: <linux-renesas-soc+bounces-12761-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B91A232E6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 18:32:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71521164874
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 17:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DA41EE00F;
	Thu, 30 Jan 2025 17:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uKs1s+Xl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CA43BBF2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jan 2025 17:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738258319; cv=none; b=lctL/WKoaq9O2NmNfyAbXz97VrT83pqbsIzrfw4lK8bThlLxk1VuTtP4CAnoIGbZuRJnoAB7g2hXmsjEri9NUs4x98fXOqUfGVg2zXMT+ITeuKahwyPSSE4ofjNToxyEWQBWMHUSyRfy25UvxWL7UKa66WGYzYcP1CnPtMFVCt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738258319; c=relaxed/simple;
	bh=xuMqgfxSwdbvy3i+zP5z3UiMW6qWNT7u1ikBE5pPpQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hw041xDxWk4cHpTrMqNDDMdgjmwfKwe6pCsRZ2YpJ8GTYYJzQPVt/IlupWGw8wxr49mQRGzdab/3rO2M2ho7T50FrhrW0oOb6G4NULS1deW/rj22jsgrHrxAHz8QVzT0c+ySZH4refCfpEVCF2RZgzwA/8z67vXDXIVW6szAhsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uKs1s+Xl; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385e3621518so642877f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Jan 2025 09:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738258316; x=1738863116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGFJ/SZJyjcLl8OPYBdzU/HVC+kA3jQp0maWZ+GZ/dM=;
        b=uKs1s+Xl2mknT0EeYXSAJ7/h+OeDJejIr300abkJLiaZQHDp2+Dad5LzZATmj2ZqnK
         rnImpBO/HMJZQHJjpIOi+CaudQmCRTcrbeX05wocVPZvKP0KXObFDJYtuHEqhhfPIhuZ
         tEnRpeeey3xRt7nmC+6OiW7YZqoV6XOb3P+HHEEXxpCYw+TuAVeJ/HmjpAoNqCfIPLBb
         jLFH+CQKTmPLbNoHX+QJcIxm0MG97LrUkhBLGMIYIrgvWUjoVuBPoSRapuYtowsoQswz
         6UUfqzFY8EMDA6h6mk8wIgX3xvAucL519lPXhcddO55puJdcsESgGXayIM1tx/3EWEMr
         uBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738258316; x=1738863116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oGFJ/SZJyjcLl8OPYBdzU/HVC+kA3jQp0maWZ+GZ/dM=;
        b=ILAY8+61ZcFROz//dzMUzUvAamUQ3rYmafMJRmpVHmeXAQWFjOzNqOVe6ckU16Vpbq
         47xnu3h+GGjXEHSX2uPAoMeT2SNcEsGqEWgHh6okARKdpAxp3Bc1hy6PnaGMeYMCXI2T
         5+n2rPLo2QpmGE7OVdD6FmdZUXg78tEDPZj3YcoQfswPSr7JV/VGM9REz2WGUZyDKnxZ
         Iy7E+Gnwhx1MKKGhn44M77UReMSRsjQ1Y67mk3PjmiWi8/zusDAgZEWbG2XxpOh4W4tP
         kl91XhTX4nyCb4k+jTK/fCaO8FSeNWaubSwoflGbSe4IsreLiYSDcWakF+t3nYfVZjJp
         mQQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvf4kohjBp1eS6Rb8AoBLTXBMb8F5ioOG/3yq0bLtXJP9NTTCBhKyoFh1c3SFUZp4fy0KCm20qrGirPAIh+6Pm8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC8AHgaMW3ap0EfEWUar18LIjiNuz3eE/elSD/TdOV61JbqoKw
	/bE0g79QeuaqQt5ZM4qRzkN+J4ktKJSkG/NQOd78IDyTssZTcWM/gRIF7BraYoo=
X-Gm-Gg: ASbGncvIhani77Y79ghYkF3F1rjJlr7nTl8eF2VsLIpBi0iWLNxAOSXptXmNRFbNFB+
	pfwuYAhGbSZx9CuSdmEd7MFl0CdZdqHoMltpir3Bx75t339Fj/HKuc5xm2uXUwz8Ge1QRS3N3Fk
	+PQ3BIcJQj7oDlNWm2zfBOzhyt06vBQCpDfHCqJO5S7yr9cTYdAtw6wc3FkehN4lNh3qpAzF1zh
	tVZjFdPQ4DL9SCKuSXwWjLjKXYaMk2JjyQZNj1dNCHn5e5MCkLTeYE5qAMTShS5CueeoM/+sMd9
	kJpD610Ap9myFHAWuiCCFCmx+2NCpiHQTM1D91hG3Y4diCd9UADXdI4=
X-Google-Smtp-Source: AGHT+IEi5kedgLMkork5YJAKY/3aI2UDvYGuUStK46XPsuiG324UkAjxLQwuOm9AwPnUYK4o3lkp9Q==
X-Received: by 2002:a5d:64a1:0:b0:38a:86fe:52b5 with SMTP id ffacd0b85a97d-38c5195f256mr8386213f8f.14.1738258316013;
        Thu, 30 Jan 2025 09:31:56 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438e244f087sm29478855e9.29.2025.01.30.09.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 09:31:54 -0800 (PST)
Message-ID: <867eb310-11a7-48bd-b2fa-35e001875498@linaro.org>
Date: Thu, 30 Jan 2025 18:31:53 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] thermal: of: Export non-devres helper to
 register/unregister thermal zone
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>
Cc: "rafael@kernel.org" <rafael@kernel.org>,
 "rui.zhang@intel.com" <rui.zhang@intel.com>,
 "lukasz.luba@arm.com" <lukasz.luba@arm.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>
 <Z5pkUNNvsWPjRQvy@mai.linaro.org>
 <65a16c3f-456e-40ec-91b0-afb57269ed46@tuxon.dev>
 <Z5tPR_tv7vWDkUI7@mai.linaro.org>
 <TY3PR01MB11346E087A4DFCC5BDCCB10B486E92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <TY3PR01MB11346E087A4DFCC5BDCCB10B486E92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/01/2025 11:33, Biju Das wrote:
> Hi Daniel Lezcano,
> 
>> -----Original Message-----

[ ... ]

>>>> I've been through the driver before responding to this change. What
>>>> is the benefit of powering down / up (or clock off / on) the thermal
>>>> sensor when reading the temperature ?
>>>>
>>>> I can understand for disable / enable but I don't get for the
>>>> classic usage where a governor will be reading the temperature regularly.
>>>
>>> I tried to be as power saving as possible both at runtime and after
>>> the IP is not used anymore as the HW manual doesn't mentioned anything
>>> about accuracy or implications of disabling the IP clock at runtime.
>>> We use similar approach (of disabling clocks at runtime) for other IPs
>>> in the RZ/G3S SoC as well.
>>>
>>>>
>>>> Would the IP need some cycles to capture the temperature accurately
>>>> after the clock is enabled ?
>>>
>>> There is nothing about this mentioned about this in the HW manual of
>>> the RZ/G3S SoC. The only points mentioned are as described in the driver code:
>>> - wait at least 3us after each IIO channel read
>>> - wait at least 30us after enabling the sensor
>>> - wait at least 50us after setting OE bit in TSU_SM
>>>
>>> For this I chose to have it implemented as proposed.
>>
>> IMO, disabling/enabling the clock between two reads through the pm runtime may not be a good thing,
>> especially if the system enters a thermal situation where it has to mitigate.
> 
> Just a question, You mean to avoid device destruction due to high temperature?? Assuming disabling the clk happens
> when the temp reaches the boundary and re-enabling of the clk after a time(which involves monitoring the CLK ON
> bit after enabling it, or a run time enable failure happens), where it exceeds the threshold??


Well, I have some comments with the device tree thermal configuration 
which may answer your question but I'll wait for Claudiu to check the 
temperature read comparison without rounding to 0.5°C

What I meant is if the temperature read is inaccurate, the mitigation 
will be inaccurate too. It may not reach the critical temperature but it 
is possible the performance could be impacted negatively under thermal 
stress.



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

