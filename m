Return-Path: <linux-renesas-soc+bounces-22872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C359BCC13A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 10:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18EF43AC645
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Oct 2025 08:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5DE279917;
	Fri, 10 Oct 2025 08:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ifKO9b7D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206D52765C1;
	Fri, 10 Oct 2025 08:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760083490; cv=none; b=JrySh+RSBJwlB5lpOvP0giExKyLjwQhvncZngzsTnBpQow22UVpPzU1rULOQ6JRlai86vaOmNT94ogBx/h8Eez4UYEmLxDAPHurzGCX6Yqoi6DpCaZBTG3PP/syXv55C5IwYB87L1LQZRnxAOu42cn2ZkTc7Wwt5XYu1eFIepGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760083490; c=relaxed/simple;
	bh=SGkuX7KJF6+UkbYJgY7P6BKiaLRlHVEp513mUHIom9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H80Wx2ehgwqtqaSYHDlxbW8EB7fcZD6PnvUgxGTtF2/picm4JO36L3hTqBi+FlZm2zRIEkuAC+aXOwjPczL0w21exUEfU9EusMc9ShbYYCYilWO9no/R+RgzMJieaGyngmJTN07nz0FevMEa4n7198gwQLAAtc3blRbOD9w2jtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifKO9b7D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1ACC4CEF1;
	Fri, 10 Oct 2025 08:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760083488;
	bh=SGkuX7KJF6+UkbYJgY7P6BKiaLRlHVEp513mUHIom9w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ifKO9b7DfyT9v5wpy5TKCb1XZwaExiasb/N9jbCKHgth44NFyKGntMKaDdQwt101/
	 8szqJLHFeu+N18FueG/kY1x+jTKSKF4YReQ25A7JbnqXGJVSwWWoopLr9wbzhq5kG4
	 4DnOHOrCTpPKPq2OBGe341Ome4W1LVEvBiNzw0Sw/5Usn1PWXeb19q2zMc+TbTAmf8
	 xbA0gYlKqSWtc++N/wqq/WnPRyHVl5pfI3X7obiOeeTUt8T/bQfgHFm2edq1hNBV7Q
	 ctyesRlhxHdKTYeFF4d5RSuR9O1q7IG7PL5TBfhas0J0y7VTE/0/NE6tfkJ8K7KqAE
	 /NvGuqOUPGhyQ==
Message-ID: <6ae23e44-2263-4cbe-aae1-d056597cd543@kernel.org>
Date: Fri, 10 Oct 2025 10:04:42 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: mfd: Add Renesas R2A11302FT PMIC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 devicetree@vger.kernel.org
References: <20251009181916.2431-2-wsa+renesas@sang-engineering.com>
 <08b7a21a-72f7-47e4-9dc9-37a7316f94d5@kernel.org> <aOi8pQuHfduf6-FX@shikoro>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <aOi8pQuHfduf6-FX@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/10/2025 09:58, Wolfram Sang wrote:
> Hi Krzysztof,
> 
> thanks for the review!
> 
> On Fri, Oct 10, 2025 at 04:37:14AM +0200, Krzysztof Kozlowski wrote:
>> On 09/10/2025 20:12, Wolfram Sang wrote:
>>> This PMIC is referenced in upstream DTs for the Renesas Lager and
>>> Koelsch boards. Sadly, we don't have documentation for more complete
>>> bindings, but due to the spi-cpol/cpha it also doesn't belong to trivial
>>
>> That's not a problem.
> 
> It is not? I found this mail[1] saying that enabling spi-cpol et al.
> will disable sanity checks for other trivial devices.
> 
> Adding this PMIC to trivial devices would be my fav solution, actually.

I meant, that not being complete is not yet problem.

> 
> [1] https://www.spinics.net/lists//devicetree/msg731369.html
> 
>>> Change since RFC [1]:
>>
>> Please start using b4. This is v2. Your wrong numbering makes any
>> comparisons broken. Try yourself with b4.
> 
> I checked the link [1] I gave last mail and the mail said "[RFC PATCH]".
> Looks correct to me, am I overlooking something? I am open to switching
> to b4, but I need a time slot for that.

Heh? I said your numbering is wrong. RFC was v1, this is v2.

Your broken numbering breaks tools. Try yourself:

b4 diff '<20251009181916.2431-2-wsa+renesas@sang-engineering.com>'

Works? Not. Should work? Obviously yes.

> 
>>> * dropped "unevaluatedProperties" because we know this binding is not
>>>   complete currently
>>
>> You cannot. Bindings must be complete (or complete "enough"), otherwise
>> I see no point in accepting them.
> 
> I can see that.
> 
>> It is like you sent driver code which does not build because you did not
>> write half of it. Why would we want it?
> 
> I would agree if it does not build. But it does build. So, the proper
> comparison for me is a limited driver which probes and gives access to
> the device. Features can be implemented incrementally. This bindings
> works/builds with the few information we have. It even removes a
> warning.
> 
> My reasoning is that DT describes HW. And on the Renesas Lager board,
> this PMIC *is* connected to the SPI controller. I am open to removing
> this node because we don't have a driver. That would mean, though,
> otherwise rare to find information is lost.


If you have it in DTS, then you need the binding. Just write it as much
as complete as possible, mention incompleteness in binding description
and provide reasons of incompleteness in commit msg.


Best regards,
Krzysztof

