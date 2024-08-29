Return-Path: <linux-renesas-soc+bounces-8478-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FF0963F40
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 10:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A315281952
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 08:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7875F18CBF8;
	Thu, 29 Aug 2024 08:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ei8Q/WhB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4933818CBF4;
	Thu, 29 Aug 2024 08:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724921723; cv=none; b=I65W/Dqiuh8qO/PMD4g9gHd8NICGI2V6EbEZR/Q+z/q7efG5HVvJG8Y+E2thheHYoDZVUylZDg7w5VZN9rAi/5tqHbMZDzzuTbmWa4qxPsG8N/FUw5rqO968Z44Qwmizgtv54o9horX1LX5jVkh2KN+ozgfPaWQeNw2Ems4u65I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724921723; c=relaxed/simple;
	bh=gZnVsetwZBu6/xBERfrnXPEYkMTpgnZQKcNGJpJ07Dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R1XHRPaoevDIl+863G2Qej7sVtFB5Y0QBd+KucZcE8uDYC6OZEYs63UTwNlT+c/13rqxqzmV4DXlKbzYT/YDxyFA9ZKNGD+uF0OuAPDF1/dpB05xkm0ADcTEYOLwwCV9TxweFI0x+wn5dVXzwYmnIoB4iN5N3WyVeTpNCKtVg1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ei8Q/WhB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 377FBC4CEC1;
	Thu, 29 Aug 2024 08:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724921722;
	bh=gZnVsetwZBu6/xBERfrnXPEYkMTpgnZQKcNGJpJ07Dw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ei8Q/WhB2a6U2Fbk8FvurbzlZSRlMDrfZU0XGmwJv1wSgEwKd3Dy3lcPBTJbDfXKr
	 Ehqtkc8xWogCaCLsXl4GCdoQT3nycI2eStErL3NkIoMMMItMmADTYqWO/rPsE0rqqV
	 ix4UuEJ3s03YDDKYWLr9fRm610yqkDhhnVtiVcQd3jsTaOZkmqhy/LigFzIyF5TBLK
	 JNwhtEtqn3TYo5uHcNszW/T78RkXIqtf68AerRI3Gmt2dtBbbPocKLPWi0MfRv2Jbb
	 FCmH140shKeAI9NtgS9xCc142TNNYRm0lVIBXl2+0zizq2hDYC5VvYaoOrl9w0nd9R
	 xP/KNnGz2j1NA==
Message-ID: <c91167d8-df24-4a3c-bb92-811bd1543be3@kernel.org>
Date: Thu, 29 Aug 2024 10:55:16 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] dt-bindings: fuse: Move renesas,rcar-{efuse,otp}
 to nvmem
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1721999833.git.geert+renesas@glider.be>
 <1a3d4ff8ce34a5e676d1cb1fafd40525378e29a4.1721999833.git.geert+renesas@glider.be>
 <20240730162435.GA1480758-robh@kernel.org>
 <CAMuHMdUwATmjM3E7WmwnCK739CwuyZH1w_YVYbroDcWEpzh8ig@mail.gmail.com>
 <67hcoj3haiptjh4f7qvaz4xwcdamr3x33xxrxusuwq2t3veiln@z2ggc7razty4>
 <CAMuHMdXSxMzzM6WgwObbymdWHcqUU2r6BOyS7ZzqSBx_gsWftw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAMuHMdXSxMzzM6WgwObbymdWHcqUU2r6BOyS7ZzqSBx_gsWftw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/08/2024 22:10, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Mon, Aug 19, 2024 at 1:11 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Wed, Jul 31, 2024 at 09:37:36AM +0200, Geert Uytterhoeven wrote:
>>> On Tue, Jul 30, 2024 at 6:24 PM Rob Herring <robh@kernel.org> wrote:
>>>> On Fri, Jul 26, 2024 at 03:38:06PM +0200, Geert Uytterhoeven wrote:
>>>>> The R-Car E-FUSE blocks can be modelled better using the nvmem
>>>>> framework.
>>>>>
>>>>> Replace the R-Car V3U example by an R-Car S4-8 ES1.2 example, to show
>>>>> the definition of nvmem cells.  While at it, drop unneeded labels from
>>>>> the examples, and fix indentation.
>>>>>
>>>>> Add an entry to the MAINTAINERS file.
>>>>>
>>>>> Reported-by: Arnd Bergmann <arnd@arndb.de>
>>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>> ---
>>>>> v3:
>>>>>   - New.
>>>>>
>>>>> I would expect that the calib@144 node needs:
>>>>>
>>>>>     #nvmem-cell-cells = <0>;


So this is for mac-base...

>>>>>
>>>>> but after adding that, "make dt_binding_check" starts complaining:
>>>>>
>>>>>     Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.example.dtb: fuse@e6078800: nvmem-layout: 'oneOf' conditional failed, one must be fixed:
>>>>>           '#address-cells', '#size-cells', 'calib@144' do not match any of the regexes: 'pinctrl-[0-9]+'
>>>>>           Unevaluated properties are not allowed ('nvmem-cell-cells' was unexpected)
>>>>
>>>> Did you want 'nvmem-cell-cells' or '#nvmem-cell-cells'?
>>>
>>> Oops, I've been (manually) re-adding and removing it again too many
>>> times during my investigations. "#nvmem-cell-cells", of course.
>>> According to my build logs, I had it right at least once ;-)
>>>
>>>>>           'kontron,sl28-vpd' was expected
>>>>>           'onie,tlv-layout' was expected
>>>>>           from schema $id: http://devicetree.org/schemas/nvmem/renesas,rcar-efuse.yaml#
>>>>>     Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.example.dtb: fuse@e6078800: nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'calib@144' were unexpected)
>>>>>           from schema $id: http://devicetree.org/schemas/nvmem/renesas,rcar-efuse.yaml#
>>>>>     Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.example.dtb: fuse@e6078800: Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
>>>>>           from schema $id: http://devicetree.org/schemas/nvmem/renesas,rcar-efuse.yaml#
>>>
>>> Anyway, with or without the typo, the error message is about the same:
>>>
>>> - Unevaluated properties are not allowed ('nvmem-cell-cells' was unexpected)
>>> + Unevaluated properties are not allowed ('#nvmem-cell-cells' was unexpected)
>>
>> And if you test your schema or DTS with all nvmem (so also layouts)
>> schemas?
>>
>> Apparently fixed-layout schema was not applied.
> 
> With today's dt-schema:
> 
> Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.example.dtb:
> fuse@e6078800: nvmem-layout: 'oneOf' conditional failed, one must be
> fixed:
>         '#address-cells', '#size-cells', 'calib@144' do not match any
> of the regexes: 'pinctrl-[0-9]+'
>         Unevaluated properties are not allowed ('#nvmem-cell-cells'
> was unexpected)
>         'kontron,sl28-vpd' was expected
>         'onie,tlv-layout' was expected
>         from schema $id:
> http://devicetree.org/schemas/nvmem/renesas,rcar-efuse.yaml#
> Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.example.dtb:
> fuse@e6078800: nvmem-layout: Unevaluated properties are not allowed
> ('#address-cells', '#size-cells', 'calib@144' were unexpected)
>         from schema $id:
> http://devicetree.org/schemas/nvmem/renesas,rcar-efuse.yaml#
> Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.example.dtb:
> fuse@e6078800: Unevaluated properties are not allowed ('nvmem-layout'
> was unexpected)
>         from schema $id:
> http://devicetree.org/schemas/nvmem/renesas,rcar-efuse.yaml#
> Documentation/devicetree/bindings/nvmem/renesas,rcar-efuse.example.dtb:
> nvmem-layout: calib@144: Unevaluated properties are not allowed
> ('#nvmem-cell-cells' was unexpected)
>         from schema $id:
> http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
> 
> According to the last line, fixed-layout.yaml is applied.
> Am I missing something?

I cannot reproduce it. Neither on 2024.6.dev5+g0e44e14b7eb4 nor on
todays 2024.6.dev16+gc51125d571ca (which is actually from 15th of Aug).

But maybe we talk about modified patch, but then which exactly?

Best regards,
Krzysztof


