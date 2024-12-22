Return-Path: <linux-renesas-soc+bounces-11684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0369FA66A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Dec 2024 16:18:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A697162892
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 22 Dec 2024 15:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4741618A921;
	Sun, 22 Dec 2024 15:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DyB8Uyst"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592297F9;
	Sun, 22 Dec 2024 15:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734880714; cv=none; b=tcE8YkT5aXtjhB5M0xs41LW2ys/qa73C0NZtYn+9AiMI1D7CDi5MIysG1S58hdhdQlJEAg3PAYrcb+IawWGmv3bJYKzyEdtDz1+JXlK93XQ9X/ORwVlKoS79GboXUb700ZiGIjEkRaqsgi26KYKHUMOpI4feQiNv5iSiB03h2+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734880714; c=relaxed/simple;
	bh=LmvXcFdB5Ci1DJvpqvicZA0QopNnULEw2LZXXchyZ1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=j+yE+dMcsFvlzSoU/Oai6K0ZmNKY1n28/SWS35XnEGU9GjpdNmFgF6G63S51Hy7QE/Eq9KYaqBmOlWafbzUy7IRGCmUzenRahYjU20OC3Le4NLLO52ajghlYjsnP3Ts8lUpvGxNadBS7Jzgtuy9WdrLZzwQmc5Dms9dHD+fyxjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DyB8Uyst; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7fd4c0220bbso3065233a12.0;
        Sun, 22 Dec 2024 07:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734880711; x=1735485511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wjVFIL5CAwVnTWzAtQfWfQS/Gkr6Tm05FfT6PqWh7aQ=;
        b=DyB8UystSoTySRIf0Qt/LFr0NehaLpVEDDlqyZkEuKTLZwWibSYAX/+yJbc59c11at
         Q7Rmk/wVOYpn4eCXQouoohK5ZaytyKNC89Ttp4DjorGOp9Jq5xmBZoekSVif0j6Ev5L1
         hCjmQpbSupXro/juxbzcUWyyRKMiuLjcM1UM7oTTaywJ57oKMtcmxh/8vqKZYExvso4U
         EnAlZKmS+qxB+BvCSZMdkyTcMQM9rTmOdn6X+ZUYet4Q49gW0Dy3UpIyyV9YYQY+SdF2
         o7dmwn/eZayvRjBVJ7tOzqkgAvLlXq8fWpen8aB12tY8zqVeb7yyHKTVMJ8wn/6t6XxJ
         Aa0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734880711; x=1735485511;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjVFIL5CAwVnTWzAtQfWfQS/Gkr6Tm05FfT6PqWh7aQ=;
        b=qV9jSxcHQD2vYymuV2IWozzy2xli1V2B9I+hnxO5JwdCwKmh5QsXYi78kJ1EBdt/uk
         AM0Bun5mj+Hbe6TL8pWgxwrMq0Es2jqUaqgimNIk1a+BgtRmUpW04BEORkJJSuP59bUT
         hcUhpaE8c7BLWHNjCvfhpDEQlx7hUAwKnEyhZ7b+W6rstdrwiWB5nECiD3/y2RiP6qbc
         jHc5xBlZVq3XSO12ZD+DmkU1Wp9X5pJQHotFjxjbVgmTk9UitfUch5kA1t6KbDoy+kLg
         YoFflJ3t/FfCXUWbbaIZSXY1Abgp8M7OA0D1xfAr4EwCo0CY5gjKBdunP4CY4X1qfa5s
         J5IA==
X-Forwarded-Encrypted: i=1; AJvYcCWZblVDhQcWbDXBAh7cRxKH74KCb21Ee3SMvRHmB7ouSucJD1J43/OruQU+MWqyobIECgJrKckBHUhj/SnR0Rhynfg=@vger.kernel.org, AJvYcCWxXdrrQ+tiFdwY88MD0IWSz1TZEYMSzP9uwnoRWLkKEPBwce17PgXLf0crtvPkRxkU4D4VnSmVmpMdRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7uT1PJ6BQXnyjJDSbGxuXA95hFChoCzP0Y9Zo3yewPbf8htUg
	22UZIwc4U0nFu2MN9WkIoaHH3qlZvyWY3gfMBiTAuAlSisj12061btPGqw==
X-Gm-Gg: ASbGnctAroOZLGTaC2izJHtkOgQY43GuVL18wWSejEe3AiPYDsk8mJuAP2HgykTRg6M
	GVmkn8cbUyQHhzRZjjaNc7PQ4UcAo0f9i0GMNSqiIaecsftQ8V+bh8r37oWt3leB8RYt0ftZKLa
	+4oMyypb8eQz7EEnCeXJ9JpNJoZda2DzE/nSRWTVtvZL90Pv3v8jp05tkumIiLeJhQvzIBG0Q65
	yq2HL7L3cN3qdiFAPjWcecvzMv8Adn+KDPXzlB0jcHq8ORrlJdT+si0Jz7r+sWbYx6mWv6QMDXx
	uwjeNs5k7BxBUSR8a+lKXPLubKDdGQ==
X-Google-Smtp-Source: AGHT+IH9iRzqIPn7nKYcRHH9cQBb+J9Pdjw4s4PQP4r4GsjBBzgx7aRKfHhJQ/t8nGepPF9aVoEWAg==
X-Received: by 2002:a17:90b:534f:b0:2ee:ab29:1482 with SMTP id 98e67ed59e1d1-2f452e2ecc8mr15686538a91.16.1734880711566;
        Sun, 22 Dec 2024 07:18:31 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e35d4becsm4899798a12.79.2024.12.22.07.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Dec 2024 07:18:30 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0e12c95a-9677-47e2-8f9d-1fe5d6facb7e@roeck-us.net>
Date: Sun, 22 Dec 2024 07:18:28 -0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] hwmon: (lm75) add I3C support for P3T1755
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
References: <20241220093635.11218-1-wsa+renesas@sang-engineering.com>
 <103fcb15-e550-4d3d-a243-ea3ccf98e76b@roeck-us.net>
 <Z2gNyermLc1i3Tkb@ninjato>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z2gNyermLc1i3Tkb@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/24 05:02, Wolfram Sang wrote:
> Hi Guenter,
> 
>> Should I apply this patch as-is, or do you want to send another version
>> using {ge,pu}t_unaligned_[bl]e*() ? Either way is fine with me.
> 
> I'd like to play around with these function first.
> 
\

Ok, but that doesn't answer my question. I can
1) apply this version of the patch and apply a possible follow-up patch
    to change it
or
2) not apply this version and wait for another version of the patch

I prefer 1) to get more rest time in -next but I'll leave it up to you
to decide.

Guenter


