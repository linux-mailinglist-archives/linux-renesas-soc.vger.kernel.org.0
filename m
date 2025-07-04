Return-Path: <linux-renesas-soc+bounces-19251-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C97AF9A32
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 19:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95FB85C11D4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 17:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC6E2DE704;
	Fri,  4 Jul 2025 17:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="YsIQHX6P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A096A2D8393
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Jul 2025 17:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751651810; cv=none; b=sPKJ5db24wkObHY8msyKgnVMHmdztOxe7/3kBbJa10ZSTKEnXWsqgPzy7/f+137VpgoE5nN0gInsZV0EArP5mTQfnJVA1vT7yx4WB9KKSi5K+eYBlyrarLgRuWnd5Ehho4+eHbImZ5lAA/bYeJKNmkpSgB3wxVNWQQGz+xS6hEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751651810; c=relaxed/simple;
	bh=RKPVMYwlIXXGLv5KkIATm3Cf3vqnlU/H4tKoDr3YVqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EP1w9LqTEEvHzK5XWNYScPH4aBPH57/lQm/E2ZEca++tLY20fmO40m2t4XMALW7ZQhu/MPP8tcsdMHrstvsgafX+9/O5oZkrLBv6a48F/nwHzXcOfpY3gyAkNQ7cuknoxPw2noi1aFS0899uI4Hm6OskqSfW7ezXTpw+PFAZbJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=YsIQHX6P; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a16e5so2083541a12.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Jul 2025 10:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1751651807; x=1752256607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U6n6hbn9caysKhPeEP/I9KvzM0cAThA7k26sM9u1aLk=;
        b=YsIQHX6PVONxqknKgVzzeHXo7oId/leAKFmgWGgk9dmiz+ckS2b2Fj+aodXZbT0R5S
         CNcqlcTw4bFBbelcJWTZLc/7EQ6tRBc9kO+1dlLz2B3gs30pFrzCmifN0DHpppyQuGpB
         91wwZ2Y2gnlvsk+EaF/I18Z7bM13K+5GfD8gCK96vPvEVm8WST60RsXCd1ErYIGdyVLA
         Qqeexa4HnURjwfYWxAENs2sVbK1WYmO/2KVNbY4RmBbIDnBjhAi0O/EVF2wGk4bZnp0j
         mdrjPLkoD5EmjmEUmAdOjPz1YqtU1p4ENJ9rAX9m7hTIrfB7B1EGejcPtoabehQqH3+U
         Msbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751651807; x=1752256607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U6n6hbn9caysKhPeEP/I9KvzM0cAThA7k26sM9u1aLk=;
        b=K+uqdpAwATSXCSE1sw647o+5+BAQRhVSCSvvFH0hYCgkXxkSKbDE6ryFVZlx+JRJFo
         ppeqZpexA0aVgm4O8MNuSgSmecEdujsI3bDadBO7sonUkd2dGBExUCF8jkvhldyHvZn6
         PtW6XOciG1oVHZFXND9eo/DT/XUgn75K+kuRnAvhTFoU3b95wprQV+9NBDzQEIXboWNS
         3I7YZI2fLsqz3c7lwtC95KcC9xmLrSDRSQutRkobGEa2ozkMmLSklRWjt68ZGbpRudY3
         PjcJXw46QDA1oVdTpDuyxk823wbw+kj2iyiAiC0FkTajcrcc9bf6x41gCqzEti9sBQOT
         Icvw==
X-Forwarded-Encrypted: i=1; AJvYcCWTkR84S8Zhc6MxMaBe15wbWu25r+iVLy0prYADoyYDYP09qEZ/DlG1LhEp2+yUPvd9q+rMEJ5pfEH34mK0RBcKOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxO4gc2XcPPjm4aficlALIVD0suQ+Nol7ZIel8AWirJe22WlHxA
	B+04Dn/Ni9ef5y3JBXG0CXHKTvzFwdaF7w/aasfNEsGA3AfZrD3qGU7dr9oZRI7urD8=
X-Gm-Gg: ASbGnctEE3Hufkx9mpUQqFEuCNUfqUeI57gv87sQ1W7GZd75hiKIAR9nAUHnhqNlyeg
	9hcGwFgOyQ5L5pkqeZQAFHNqbflCQPT9AmFcLe+9QXelHTWlh9xumobW+ScZs36Bt5hP1LVscWm
	OZblj3HnCc5wqyIkgpkwSu08aOvRzeMSixTU8AU89uIm5CzY24ul/FaphV16sMNV2XadVT9cWVJ
	BHWRDoycdInt47DLhCOtLR9SoxctIwnAFbTm4xB9spKoY37MGHXgvf/AruSj14LPxB0+RLZ9sZn
	O57KGbD3mS5YmoRlNMJEcqUhUgF2XMAczKNdDCL8FfHleVFztHrDkh95oD52p/YhVWZSY4EsEJK
	sh5VBNlTFTgrl/7YrNszOw3w=
X-Google-Smtp-Source: AGHT+IGoshS6MZusfjRaRJaVsMhxqzjeYCxj2P6UK+ArpuRluCl7/5NTB3tt7deN/8EfRsinNgpEIg==
X-Received: by 2002:a05:6402:3591:b0:607:5987:5ba1 with SMTP id 4fb4d7f45d1cf-60fd3370b41mr3071724a12.20.1751651806823;
        Fri, 04 Jul 2025 10:56:46 -0700 (PDT)
Received: from ?IPV6:2a02:810a:b98:a000::f225? ([2a02:810a:b98:a000::f225])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca696ec5sm1648446a12.25.2025.07.04.10.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 10:56:46 -0700 (PDT)
Message-ID: <79dca2df-1126-4d94-bab9-761a982090b6@cogentembedded.com>
Date: Fri, 4 Jul 2025 19:56:45 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] net: renesas: rswitch: R-Car S4 add HW offloading for
 layer 2 switching
To: Andrew Lunn <andrew@lunn.ch>
Cc: Michael Dege <michael.dege@renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
 <4310ae08-983a-49bb-b9fe-4292ca1c6ace@lunn.ch>
 <79a57427-fd4a-4b9a-a081-cf09b649a20e@cogentembedded.com>
 <27047e61-8307-472d-96dd-1e5b89dc427f@lunn.ch>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <27047e61-8307-472d-96dd-1e5b89dc427f@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



04.07.2025 19:53, Andrew Lunn wrote:
> On Fri, Jul 04, 2025 at 11:05:14AM +0200, Nikita Yushchenko wrote:
>>> Looking at the code, it is not clear to me what would happen with:
>>>
>>> ip link add name br0 type bridge
>>> ip link set dev tsn0 master br0
>>> ip link set dev br0 up
>>> ip link set dev tsn0 up
>>> ip link add name br1 type bridge
>>> ip link set dev tsn1 master br1
>>> ip link set dev br1 up
>>> ip link set dev tsn1 up
>>
>> Per design, it shall enable hardware forwarding when two ports are in the same brdev.
> 
> So in this case, the hardware offload has been reserved by br0, but is
> in fact never used, since there is only one port in the bridge. If i
> was to then do
> 
> ip link set dev tsn2 master br1
> ip link set dev tsn2 up
> 
> br1 would not be offloaded, but done in software.

rswitch_update_offload_brdev() calculates which brdev to offload, and it only considers brdev having at 
least two rswitch ports. So in this case br1 shall get offloaded.

Nikita

