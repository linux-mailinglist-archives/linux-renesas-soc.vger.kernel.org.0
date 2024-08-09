Return-Path: <linux-renesas-soc+bounces-7786-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9B894CB1B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Aug 2024 09:20:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA961B23A4A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Aug 2024 07:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E8917335E;
	Fri,  9 Aug 2024 07:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Qq5mQAtp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BF517107D
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Aug 2024 07:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723188029; cv=none; b=NE9fxBpNpJ1etHp7OCRqKy/0xWN5BkucyjJMKAm3H2kjRkCPnFlGpd0fQmES36n6XyhRfqpVXmg3wvIDs5507t926SugYormM+UcHEqxREQ+ldsZdWp+ZPCHKE6UfMaYrEsXoQheU6bxcvB7SRSmf2AeNv2eTBSVe1MHCqeAqBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723188029; c=relaxed/simple;
	bh=LCQjMCGu/NtAGIDdzcexTOBsi+0vUqa7B0DD5sAYYr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IBYFPnxKA4v+iTjNVZTaG8xSRyfemH2fyQHQLIRPhlb/gsKR4mnKWw6kW5Z0y3OC1iWQX6WXUaX2YkPoR3L90LcH9CdZ6Pj2K668qfRDLMKcvPJpxQToSO8yGaDsbHEo1gtTfD3Q0i/UpZaeoCEPZh+McgRf/sz5WRXiRKNE+2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Qq5mQAtp; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-36887ca3da2so795697f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Aug 2024 00:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1723188026; x=1723792826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d47CUelTnreJC+PfHZ3JAzMPsN6JTZHLt6cE64vISVI=;
        b=Qq5mQAtpdNfdlpCpGTDIgXHwpVnmlrHcRvxkgzwNFdab415YIUsJ/3bt8p40r8ouv9
         bfhwROBKcRqosR/s07FQxqsXDAG/24KJnLLJ2n8lGBvNyOQrjgYIdwVOiJ2KY7ZpdIht
         T+epW2u7VXPH1wyUIMaUrv1jGYkdlIczyBOljkitz7so5p5pw1kjqiERqLugvu6KGYz/
         Kyscj3dcLhUye38X8VYdiPw7PgFz0I9weMLHXNILjlz17nPBRP66Dj4i/K2ngjcYDP3h
         3fy0KAixMuYcjEIKzv+xGjP7W7gOZEzl+WhT+JNHOAA5SfyRLkbU4NcvYB+JPZERJKvd
         JzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723188026; x=1723792826;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d47CUelTnreJC+PfHZ3JAzMPsN6JTZHLt6cE64vISVI=;
        b=rfzNCC6fY697bVxh0q5OhGUzMIpwoIkSvO6GxLUgL9S26UYSIy1KbhowoD9pQT0laC
         4xAfmQ4u5SdDF6iZ+HjiI5jHXXujuHATD+Q80nTrex3/zlBwQvlFvgZZehKnRGzAI3ah
         wAvVIMI52e6ymwuBuL2QmaFHpRP6MZlOn/NkVldYwYw+0ghSvSBeA2h1+ObxjjdsfHsR
         +dJ9AmZybRJZt0/g8gXjtkY4bmDtLHkQqxlLiyDLyVZTmkcYWoaG6BlfhderszleGUKt
         28/Kq8Mi8MA3y1xqk1ky8WfvVwFO3V+jVz3ZooVZCFuLALjaFKasHVSOmvU+kmrQuEBF
         eeIg==
X-Forwarded-Encrypted: i=1; AJvYcCWED4ty9EUViRSIUR2QK6UFxc5fGjMQdsdzNSgpaFgMddDA+AFa5GZqFfVyDU96/m7eYvWRWox6wM7htJSkJLjcRgZQ477z5WQ5GtrkZ6L+WRQ=
X-Gm-Message-State: AOJu0YydHMloKJQhH2XIUqYcRiw1Ni9k2MdzkfY09/VdT0aYogEx6npl
	kka+2vme3nrrgWe+oSiUAyQl9Fye64VTaNy2HxHjabXQjH+V3ewdj27O2NxaN18=
X-Google-Smtp-Source: AGHT+IFHpW92jqjIYi2miDOsQE5JPxAd01QY2fBqHylu2JwNHdLR7v5WkJ4KHtbzJ9eJlICDWlTF1Q==
X-Received: by 2002:adf:fc12:0:b0:36b:d3bc:af03 with SMTP id ffacd0b85a97d-36d5e3c30acmr376684f8f.15.1723188026393;
        Fri, 09 Aug 2024 00:20:26 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d2718bfb9sm4360112f8f.54.2024.08.09.00.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Aug 2024 00:20:25 -0700 (PDT)
Message-ID: <e39ab10e-8e95-4fce-b75f-10fe918e81a5@tuxon.dev>
Date: Fri, 9 Aug 2024 10:20:23 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/11] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Content-Language: en-US
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
 magnus.damm@gmail.com, p.zabel@pengutronix.de,
 linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
 <20240711115207.2843133-8-claudiu.beznea.uj@bp.renesas.com>
 <ZrTiZtD9U4I2LYZj@shikoro>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <ZrTiZtD9U4I2LYZj@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08.08.2024 18:21, Wolfram Sang wrote:
> 
>> +          - const: renesas,riic-r9a08g045   # RZ/G3S
>> +          - const: renesas,riic-r9a09g057
> 
> Why no comment after the latter one?
> 

I kept it like this to avoid confusion b/w RZ/G3S and RZ/V2H(P) documented
below, as the RZ/G3S falls back to renesas,riic-r9a09g057 (RZ/V2H(P)).

I can add a comment here, too, if you still consider necessary. Please let
me know.

Thank you,
Claudiu Beznea

