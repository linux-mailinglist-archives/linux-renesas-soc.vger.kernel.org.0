Return-Path: <linux-renesas-soc+bounces-5535-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA298D0A2A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 20:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C812B214D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 18:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3292D15F321;
	Mon, 27 May 2024 18:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S4Qu7Un0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBFA26AD7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 May 2024 18:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716835758; cv=none; b=TrLWIS0wjg8Rrsw9HAlFTgRuUehN+GblYqjJSe90pxI2D5ts1APkYhtpUZ2x+mil+HpfKEqkJFMgfyZtrj8UEPKE6YpoJOP8nLSMo/wsQlcJGbqTs6YCwMEzPkuTGB1SuBU0rDDYHXIZU3yGw1MPdhJu0rufuuRWa1IP9+mt2VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716835758; c=relaxed/simple;
	bh=gwVP2M//MG4bms+JvzyCg+FfQnJxMd1Ltz9Smse1a6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aLrXxTi2R8laSvNuXyHCV5+eRuf+U5KqYu2TXlqipqD1A8DcFdAdAleUtSMKKIt4W5jTUhgHNvO4Wntv+0PiBCtK3SHCo7eVfEtELYn7X3qD2lGJPu3LOqlrYub8zt4bNfTvCfWFZKCg+hfFo6tfliLRVRXHWhqVIRlt1MMR/60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S4Qu7Un0; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57857e0f45dso27347a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 May 2024 11:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716835755; x=1717440555; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CcizzYKeeso2p0kSglxAbM4cy54HHw7GeUK6cIuDglA=;
        b=S4Qu7Un08kmN8nZ9dUABxly12OFPrU03QyCK61FVUArqnpSvK0mdpynHIRVBi0tuW8
         rSaYIg4XYERw4V7YTawlZRtTjbER7c9JAQafjlhdWMpy9QIGRcoZkfQzq3RISZaDk+MI
         JAyboL1TaZU9XLNtElbGxe4wmMwZNC3xIoJzOj//TQ0+3dnydcjKIzaOr44pudQLU6LM
         lfZDeJrQ51374R0XZDYBpq7ELtCUez1WHiRipwdk+ULeBCwaWiW/f/MQhlja9AN8//yF
         YzS7WwzG28aVjR1w13N0gPT91938A60GQtPi3rj0VWKzeVW6QCLqHsatd2fOlIIaraVN
         wyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716835755; x=1717440555;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcizzYKeeso2p0kSglxAbM4cy54HHw7GeUK6cIuDglA=;
        b=FG93ZsQqQ9AnZifA8N680h9BRMEzDtYHu2s4Fnsa7CxWMrRW9iO/e2LWOa90AKcQ49
         a7SKxX0ywq+s5QtsLDA/0EksxKVWh27BUlgary8INRC1+Lk6cNnfh/bRW6GdLU2aq+jy
         ay1DzhmuLXnSdaSmb4mBJpU1XWpRsNqV6saWwa2XNT+oSDmRXQuvQ6rDKZJ2KVuAkdaS
         hPbhMgai9FdIKcoxI1m429fImDsPGh3n3gdnB2/gHHCCJof9SJLsW1A6jDjYyBdCPasy
         mgUjj2JHnzFqcesVaMVjk/1sGRTo4LwyFGBO9qUj50ugUfRuOE/lYnX7khKNHyjEtGFG
         bC7w==
X-Forwarded-Encrypted: i=1; AJvYcCU91ZgneSCDXd1wIoR5e5QFfifmWGyWu8ut+qIbRHmqe6zD8X3oXNfnQXUT9l7fA9/ljcK1CmnwFhzFQ4FJCNDS6i52uuCCM6t3YN8JUDEJXVI=
X-Gm-Message-State: AOJu0YytifnYo+8rTixMY/g9Ml243Shhatu4G53PkORZ3/3977hp76gO
	RuVLUO2vqD/+eFAlHd4tu5Ss9tQ7xxVMoDUDOEIM1iqJuWTi8vQqe9U9E6HF2aY=
X-Google-Smtp-Source: AGHT+IExgbBcHZIiZqZrJ8vf/QrYobR7iw0HIQIvUwT+DaB3FEZOMjzwV3i6e9HhZnyGM6W+SzbXxA==
X-Received: by 2002:a17:906:7f84:b0:a59:cd46:fe89 with SMTP id a640c23a62f3a-a6264f15e40mr673618066b.59.1716835754378;
        Mon, 27 May 2024 11:49:14 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.206.169])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cda48e6sm515104466b.203.2024.05.27.11.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 11:49:13 -0700 (PDT)
Message-ID: <f587b37f-dc10-4a9a-8987-0a26c4417d94@linaro.org>
Date: Mon, 27 May 2024 20:49:12 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: media: renesas,vin: Add binding for V4M
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Conor Dooley <conor@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20240527131849.1678877-1-niklas.soderlund+renesas@ragnatech.se>
 <20240527-replica-mace-2306a85ad5d7@spud>
 <20240527180312.GA226593@ragnatech.se>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240527180312.GA226593@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/05/2024 20:03, Niklas Söderlund wrote:
> Hi Conor,
> 
> Thanks for your feedback.
> 
> On 2024-05-27 17:37:21 +0100, Conor Dooley wrote:
>> On Mon, May 27, 2024 at 03:18:49PM +0200, Niklas Söderlund wrote:
>>> Document support for the VIN module in the Renesas V4M (r8a779h0) SoC.
>>
>> Which is different from the other devices how?
> 
> Compared to the other Gen4 SoC supported it only supports D-PHY. I will 
> add this to next version, thanks for spotting it.
> 
>> Should be with the driver:
>> https://lore.kernel.org/all/20240527132429.1683547-1-niklas.soderlund+renesas@ragnatech.se/
> 
> As I mentioned in the other thread about the ISPCS bindings, I 
> intentionally posted the bindings separately to allow parallel 
> upstreaming of driver and DT users.
> 
> Is it really a bad idea to do it this way? For other work I have done 
> that involves more complex DT changes then adding a compatible, such as 
> adding a new device or adding more properties to cover more features 
> only available in a later version of a device. I always post the DT 
> parts first as this can spur discussions about the design and only after 
> they are agreed upon do I post the driver parts that make use of them.

Binding goes via driver subsystem, so how exactly do you achieve
parallelism here comparing to expected way of submitting (driver+binding)?

Best regards,
Krzysztof


