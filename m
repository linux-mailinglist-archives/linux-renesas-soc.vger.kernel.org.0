Return-Path: <linux-renesas-soc+bounces-21612-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8685CB4A61B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 10:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DEB517ABFD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 08:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E4D253950;
	Tue,  9 Sep 2025 08:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBm5wsaK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D6B3FFD;
	Tue,  9 Sep 2025 08:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757408142; cv=none; b=Ttf85MX6DQZTbiqv53OqBpnhdI9+2PtkjGi8Omnzu5u+Cptq7//y672u+JDgpLSzCm/V5VFVnN2fI4S70XcLN0XAt8TPGx1DP/7cmuT4imFKfdsoakXYjjnVWNYYPONjUvoZq8dVvA7gyNvxR9g2T0rUQqpQIY7o013m9E+C2pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757408142; c=relaxed/simple;
	bh=24AUuhUKJ93TXDsRRF4e9s9OsX3nkr3ACm23vkaLsLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g4kDj0ISszyBJDwGVmRClBsFo9QyOpLBvBlvVDOp8OLY6n2M4+wrDQrp7tVEtKy1PksGfxn380T32nbyKqM+1kWzZ5s/0gMU9ze23/8XnGamqkhMcARV0g6nVfioV19BOB0jfv8Fx0KL36M/eVqJ1YCPU2HyWjrXBe1YHOcOVeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBm5wsaK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A95DEC4CEF4;
	Tue,  9 Sep 2025 08:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757408141;
	bh=24AUuhUKJ93TXDsRRF4e9s9OsX3nkr3ACm23vkaLsLw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OBm5wsaKbqmOnkEiuwpKfcvsuUKIUV76q933TUJk5Pler5xa6WrfK7Y8Wzdze9cJM
	 BOe6I2ZPiY+0Bx8RU11fng27ob7UMZpE/WJv8cTYY546DDx3PQ4tR8aFeNOpnqNju6
	 3GfTxyZZRx12uZglXkCmW0f3W2NSU74U7/tmPOHz1dgFa9/aKRZEiSpZV/z9VfJ8Pf
	 obRwLpnqNymgl9cW/4r+7xeY/aKymQyPt8az9edBnp+CPlW7nLv9zFwYIYBRHHKEIz
	 4WqFJSJduinlZk7drXDPKhIsGRWpW53C2wSeVFtNCak0fpeYQneApbeBg+TtMSzh0a
	 X+AUZcUqSJx7w==
Message-ID: <bad82c16-8629-4f60-8c8b-36a5d1c171d6@kernel.org>
Date: Tue, 9 Sep 2025 10:55:37 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: renesas: Add R8A78000 X5H DTs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <87tt1c9z7h.wl-kuninori.morimoto.gx@renesas.com>
 <87plc09z6j.wl-kuninori.morimoto.gx@renesas.com>
 <20250909-woodlouse-of-authentic-fertility-1cea2c@kuoka>
 <CAMuHMdXd6yhi2SBHBvq+0LF4kBnjm3igVb21TYaKoWSvjPGcEg@mail.gmail.com>
 <df2dcd5d-bafc-483a-8ef5-f58ff225fc91@kernel.org>
 <CAMuHMdVM64FD_ObmkUpzWrr3eerM1w9hBZpsVde6Jf27xjuHOA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAMuHMdVM64FD_ObmkUpzWrr3eerM1w9hBZpsVde6Jf27xjuHOA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/09/2025 10:50, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Tue, 9 Sept 2025 at 10:38, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On 09/09/2025 09:51, Geert Uytterhoeven wrote:
>>> On Tue, 9 Sept 2025 at 09:46, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>> On Tue, Sep 09, 2025 at 01:45:09AM +0000, Kuninori Morimoto wrote:
>>>
>>>>> +     extal_clk: extal {
>>>>
>>>> Use some sane prefix.
>>>>
>>>> https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml
>>>>
>>>>> +             compatible = "fixed-clock";
>>>>> +             #clock-cells = <0>;
>>>>> +             /* This value must be overridden by the board */
>>>>> +             clock-frequency = <0>;
>>>>
>>>> Drop instead
>>>
>>> clock-frequency is a required property?
>>
>> And it should be provided by the board or fail the DTS. I think now it
>> hides the dtbs_check warnings for no real gain/reason.
> 
> In this particular case, the clock-frequency could indeed be omitted
> n the .dtsi, as the extal clock is mandatory, thus must always be
> augmented in board .dts.
> In case of optional clocks (e.g. serial, PCIe, or CAN external clock
> oscillators may not be populated on all boards), it is different.

1. That is not such clock.
2. So putting invalid value is correct? No, devices which do not exist
should not be in DTSI or should be disabled. Having wrong values is
never correct.

Best regards,
Krzysztof

