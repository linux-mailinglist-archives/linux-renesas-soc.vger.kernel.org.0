Return-Path: <linux-renesas-soc+bounces-7007-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 165FA92498A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 22:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB15F28456B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 20:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D3C1BB684;
	Tue,  2 Jul 2024 20:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Aplv7IPL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EDF1E531;
	Tue,  2 Jul 2024 20:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719953153; cv=none; b=ezYebmPi2x1h2T/gV/Uu70Lr6uZIvFDOtDoAnBnOgphCUymrA/Yon+ya3bIjIFXgGjidjCteCq9vNzsJA2lYAMn2IKSCLTyTKq0LQpXCW2VSAqWBWyUMgAYkFvjmy1KfRiZI22y1PoL+uB96kGyUeIi7WYXnlCjC8bhveUYLuM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719953153; c=relaxed/simple;
	bh=ehgWM/z3W96l++CfYeD511unHwMDxY5uw0/ccIeI6hA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z0/QDs8h5CymA3CpaLShHKPXMrRQlEecghFgujxJSWa1gV40q+WBc4h9eIR5SPfgmgfWQK6yfhukYfiWC0KexW5hwBJLGjOx+uvwcscEb3iXqZcDkdLUoJ251UWT00dwQ1n8uiY7QnXmnYe4VZNVCX36pkwK77/2FjuNtc0TfSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Aplv7IPL; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 7804E88747;
	Tue,  2 Jul 2024 22:45:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719953143;
	bh=o202O5Cd4rj9NcyZCORLUhE7yY5KqQ5h5kB4I1s5jQ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Aplv7IPLmi4DfeRIuuWCEMiyIieQgKMEpyE5idWG0oavOAv7hFTHRw3cY6qb6s98S
	 EOez8+d+xIcPSuEgmZQ93IlG/ZWDfLGa5gGe9MKxgw1tz9t1sK20CnsWlh7PVGhRMB
	 C9pXHyBta7EF/UCOF+sk7zK4yEXLWWJQlwe6ebbJUSEjk168BDz5N1ebo3XBLJAYtV
	 /OIFHPKRel5YhmZ0fUZGAyXuLXUMe8roq4O1vF/T/ISOqCUlonBLN3YQgBhDWymSn3
	 KuYzJ5TsO+mYUljje5kgoiO89Y1mZl8BuZAdT6kZe+lKPbNlBR6Lq9lbLzDPtTAtJh
	 ap9qBZrLbYSQg==
Message-ID: <9f1ae430-4cc4-4e2e-a52c-ca17f499bbba@denx.de>
Date: Tue, 2 Jul 2024 22:02:40 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Drop ethernet-phy-ieee802.3-c22
 from PHY compatible string on all RZ boards
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org, andrew@lunn.ch,
 kernel@dh-electronics.com, kernel test robot <lkp@intel.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20240630034649.173229-1-marex@denx.de>
 <20240630034649.173229-2-marex@denx.de>
 <CAMuHMdXb6nBHLeK1c4CwEUBE8osDyAC_+ohA+10W_mZdGtQufQ@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAMuHMdXb6nBHLeK1c4CwEUBE8osDyAC_+ohA+10W_mZdGtQufQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 7/2/24 10:38 AM, Geert Uytterhoeven wrote:
> Hi Marek,

Hi,

> On Sun, Jun 30, 2024 at 5:47 AM Marek Vasut <marex@denx.de> wrote:
>> The rtl82xx DT bindings do not require ethernet-phy-ieee802.3-c22
>> as the fallback compatible string. There are fewer users of the
>> Realtek PHY compatible string with fallback compatible string than
>> there are users without fallback compatible string, so drop the
>> fallback compatible string from the few remaining users:
>>
>> $ git grep -ho ethernet-phy-id001c....... | sort | uniq -c
>>        1 ethernet-phy-id001c.c816",
>>        2 ethernet-phy-id001c.c915",
>>        2 ethernet-phy-id001c.c915";
>>        5 ethernet-phy-id001c.c916",
>>       13 ethernet-phy-id001c.c916";
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202406290316.YvZdvLxu-lkp@intel.com/
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> Thanks for your patch!
> 
>> Note: this closes only part of the report
> 
> In that case you should use a Link: instead of a Closes: tag?

But which patch would be the one that Closes that report then ?

>> --- a/arch/arm64/boot/dts/renesas/cat875.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/cat875.dtsi
>> @@ -22,8 +22,7 @@ &avb {
>>          status = "okay";
>>
>>          phy0: ethernet-phy@0 {
>> -               compatible = "ethernet-phy-id001c.c915",
>> -                            "ethernet-phy-ieee802.3-c22";
>> +               compatible = "ethernet-phy-id001c.c915";
>>                  reg = <0>;
>>                  interrupt-parent = <&gpio2>;
>>                  interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
> 
> What about moving the PHYs inside an mdio subnode, and removing the
> compatible properties instead? That would protect against different
> board revisions using different PHYs or PHY revisions.
> 
> According to Niklas[1], using an mdio subnode cancels the original
> reason (failure to identify the PHY in reset state after unbind/rebind
> or kexec) for adding the compatible values[2].

My understanding is that the compatible string is necessary if the PHY 
needs clock/reset sequencing of any kind. Without the compatible string, 
it is not possible to select the correct PHY driver which would handle 
that sequencing according to the PHY requirements. This board here does 
use reset-gpio property in the PHY node (it is not visible in this diff 
context), so I believe a compatible string should be present here.

What would happen if this board got a revision with another PHY with 
different PHY reset sequencing requirements ? The MDIO node level reset 
handling might no longer be viable.

