Return-Path: <linux-renesas-soc+bounces-9948-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A62EC9A6E66
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 17:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DEBEB21B61
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 15:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4631E1C3F34;
	Mon, 21 Oct 2024 15:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crN4GJzR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC44131182;
	Mon, 21 Oct 2024 15:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729525245; cv=none; b=F1rVvFtnyqJKU5qL0RtVSV0g9yhGjB5vImFkRC9Am7YW2nOjsYZnJ23N7waLWwAXVFU5W1hWs0DNFC29GRwVP9PWXdQK/LRaN+yKRCkowwdNxZxjm2dRGXmDDXhal4uAaRTuLH9Vg5uVC9PAccHpxvhDXf+GqAjLD5NBJlAgBKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729525245; c=relaxed/simple;
	bh=ifLaVKX5f4pjIkahfUVbVfbWhI693YQo3t5omuqgSrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uld2efJgr+wz9/wKoUkJ5ENiJD7Od54FkAsExypu/maCrfCKcn+8L98G6iOPY65O8mA5YB7O0bdnhhf+Zd4yA8j+w6Tl6+T42+3eW80A52hF2O5T4Q+RReybkWfRUAQXHAD68IR8DdFnjTPxhDytiBfX0yjgX+xW1M3KrzRwl3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crN4GJzR; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb3110b964so40579041fa.1;
        Mon, 21 Oct 2024 08:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729525241; x=1730130041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kv5UT6mtcpe+cnb4k9m/wVUK0gKv8OfPDi6E9+ZSQzA=;
        b=crN4GJzRmMhRb0cwNbbtntzmSaMrDdpRBzDDGZLXRi1FB0IK1z3T3po6G3jTZU6Gtf
         GXid8DqM1p6NSjKpefxt/X7w4OBIdtuTdBOzm8WMnFCwAqY4fJdUvcXvSGO4/s6MehBQ
         YEWKMwiH02iOT5pb1f9bl0OZpp7sWnz24AUmcKLqoWtmGpMfBUEDOiFZzALBY/THaix5
         P6dpQ92w+Cbq/XAkQhyW2OYZW8FCMF8jRRqdDYBIhtuiEvQ7oEAPCuPT6Fre+CoPD9Mn
         sBawzPccDdH3bfX0wgKPd4CpC1kfMdbzDIVsfgLeN0RYzBfmvKGNa8JwRLlQmxi0qyog
         aRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729525241; x=1730130041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kv5UT6mtcpe+cnb4k9m/wVUK0gKv8OfPDi6E9+ZSQzA=;
        b=p3KGqgD76Oej5kvu+6+CX77DyopDwtObxFaJ1LZzBJFSNgo3JmQ8WzYsZ1xnMaLZe6
         ZGZPtFprASh1emBvQsjBKEYLhXPECGPI200nFkNQgyw09ldAySDLszsi7zY5UzwV6GQS
         nB2/rOayUlpnbiAS0ciqGoiNIUS8coWou9HAKeIWETBi/5srmiNo5kQlU2ZQK65zq1yk
         McxVHoB4fhf2tVxblgglKNigya18NGTKr5Kt0+D37efsDK/VOCuZs/n4taNRw7LRLB0A
         KAqNX3JLHj/gYFcoGvN1HD3b97GeZhTmzPWvmM1bcss7qC9PEgB/BPrBYh+dYAeL/LwL
         jPfg==
X-Forwarded-Encrypted: i=1; AJvYcCVD2GJ+bhtCFTr6Gt3+Kic6XSdypPwo5UcP5J6+5DDYnBFOkC8f0oJKYmOBwPbOuqasMy+ToQclzBI=@vger.kernel.org, AJvYcCVNIhl4FcoAoAEvJUYV5njKavwQ2VsmnILwRdKwuiq5BO9NpAvJqyfSb3gXpCaaqhYnln/3FZa1fiw6j7YgkZ21/JM=@vger.kernel.org, AJvYcCVz2EInZg/sbml2FfFgxHYY8gQ96MWASxIOta/+G9P1EQg9V/0Qrm0p7NVkGuKBixnT/eyTi89c@vger.kernel.org, AJvYcCXL+uCYV3lYjyUZr8w9bB4N7HSctXn+NruB+EKXkOM7l086/XOO64cgS+gLE4OM6o21YdRQsAp9VtY=@vger.kernel.org, AJvYcCXXxDNwk7bxVhb6IiGV6pxNvI55TUawgg0lUlo2X8LAs9ND1r355SsmHFm9TIpfSswuvSF1maRjYvnopinA@vger.kernel.org
X-Gm-Message-State: AOJu0YzzeH1tihXGA7VDx3gHnyUfhromGW0umIz8ell9pUUrKF1zVVPJ
	K3wl2f+UEcFYOrm/tSfPO0C4GVa05ONI6WDch4XV/y6uXx6m4mOU8BS0og==
X-Google-Smtp-Source: AGHT+IFkQVd4FvCnjeIZN1QcmBJUx78OKRBL8umpe0S6Nsvo84HcjKcLxgJwz2/j/IsIFpL/2Eq0jg==
X-Received: by 2002:a05:651c:1541:b0:2f7:65c5:c92 with SMTP id 38308e7fff4ca-2fb82eaf006mr44503811fa.20.1729525241030;
        Mon, 21 Oct 2024 08:40:41 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:4321:8ef5:e514:855b:c891:f732? ([2a00:1fa0:4321:8ef5:e514:855b:c891:f732])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ae12273sm5218741fa.115.2024.10.21.08.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 08:40:39 -0700 (PDT)
Message-ID: <2b8dc3a4-5017-4028-89a0-7267ff3b48a1@gmail.com>
Date: Mon, 21 Oct 2024 18:40:38 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/RFC] MAINTAINERS: Re-add cancelled Renesas driver sections
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <0a189e2c4090a1b308e18005d2552e335bac354f.1729511337.git.geert+renesas@glider.be>
 <20241021150447.GC4176464@ragnatech.se>
Content-Language: en-US
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20241021150447.GC4176464@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/21/24 6:04 PM, Niklas Söderlund wrote:
[...]

>> Removing full driver sections also removed mailing list entries, causing
>> submitters of future patches to forget CCing these mailing lists.
>>
>> Fixes: 6e90b675cf942e50 ("MAINTAINERS: Remove some entries due to various compliance requirements.")
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> ---
>> Anyone who wants to take over maintenance for these drivers?
> 
> In case Sergei is not interested to keep looking after the RAVB and/or 
> SUPERH Ethernet drivers I would be happy to do so.

   I am still interested, of course... but looks like I'm not allowed to anymore. :-/

> In either case should not the maintainer entry in the bindings documents
> also be updated?

   These still have my Gmail address... I'm not sure yet what to do with it...

[...]

MBR, Sergey


