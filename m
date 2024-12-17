Return-Path: <linux-renesas-soc+bounces-11486-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A780A9F58D2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 22:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5BD4189158A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 21:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0AF11F9F62;
	Tue, 17 Dec 2024 21:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HQu94gD0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5DE4A23;
	Tue, 17 Dec 2024 21:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734470791; cv=none; b=E27+/kscKoZmsAooFKEhwMiuTg95KUU+mQrbqoCGeSy6SpQ6LUGBhRnAyOnRtLpvEJw8iwjsthSQmVODzrEnKz3TueGmvRnQa8ZfwqVHm67pt0G4VhQGuTLABMQ6e6CjIV5rdMAPedKtEEeaDdD+ckznY1blgwYDcUQWodM6uzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734470791; c=relaxed/simple;
	bh=VfZkdvm6nRTZADt+W2ejaXgoYRMnTjd1Safiyocc1OI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ln3tKw9XUma4veLbZvYMVjTqYblm2YkDIN5i+b0l//ztV25Uwxafv/3kdzvzXxKbYzM7q8aD+c3UkOXaZq/hLq/J/kc58QRBr3RmWchqLhwGHJIADkN5/S7+l5WeaDSmoqb06xbFOVeHKmfN6VjKC34xBb1bmyJGTtge7j5lP1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HQu94gD0; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2161eb95317so53874225ad.1;
        Tue, 17 Dec 2024 13:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734470789; x=1735075589; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=o3Ty0VMd3vr46HoUcqVf2dCO+sYirHQKwNXPoKI7+c0=;
        b=HQu94gD00+nZ8a1CiTOqUDGki65klE0fCjbcAbOfpb0KBJVNgXIzCRnQboxLt85ehU
         aZ43KWwNiGPoGdoAe+Codhtw7yETtuM/8EHp7OP2oNoOvV2au4OV+INHwmJzMWD4tobw
         lBOXVQQSG0juQ0Wcg6Bg970d4R7Yzf9fqYE4BrCdsl+szAGGYad11L1kOLUwOknaJsFk
         NUAOLge5ClHAaRCeBp1/BBMOAkx/YRJxYQvhmVhoEH8zj9WzlBXwEt6O1C07uS4oC3YL
         6k9Ip+VYW4jJM6GoBuc3hr+nYNrtGDP7eaJC0YAVmmDZTqq+XdsTAXX+KlZNskvcdu/u
         5hnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734470789; x=1735075589;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3Ty0VMd3vr46HoUcqVf2dCO+sYirHQKwNXPoKI7+c0=;
        b=vLd8ZE9C9PPwRmOjykoB7eirZEhDxO5VDHr6zJz18X5G7Q4sk13ihgUjA/sZcDzuWY
         Dawhl0EbnJY5qm/ZGrR6XeEcWT4fpf31Gk8mcMsRJRHwJh1aYFS3jMbvv0TeTTwM2e5z
         BALDI2ge0GWMyUgIHE+EAWQwKsH4kNU2Rfnj5LEdjrxd6JeP9eZFBCZgD5O0i6g6LEII
         6MtPTW1cX3tG8yYk9KIqy0FTmO8o4ful/iOU1eONNh1lIxZDvMLPhmmwvQYVKrCdxW8J
         diAFTu0YYQC9GUBsJpuWNded6YufRoAr+yu5nTsXDgHyDDNQwZ6BMH0W52KDPhDTBgfY
         93og==
X-Forwarded-Encrypted: i=1; AJvYcCUETSG9Cn3nUQG8UAgHjMgXhvyQCi21mHiFjEHS1Qn31tDhuAVmZpx/IcL4QHj8FQCKPDFaui2mdTc11kA=@vger.kernel.org, AJvYcCUVRNmRCSWouNCKMPGsMHt4nQ0NW7YyHiOJYrCTsHiTtDDPoPX9aZ114FYivVW9Q9aacO4oPUAMQ0TInJNGm7ccuQE=@vger.kernel.org, AJvYcCXwbBltNrgMsLJPI8rzY8E1e4E7Yp04fj99jdZfWX9eRIh/N2sTCTcDpzu1HjxSWBR8DNEz9TK6+8w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/rNIC4nSh6teGHFIJMjX2Aj9+HvtnrS/RVqVY/IOzDFvMc8on
	L/+MLb4NV7knsga9FocW3Jd8DuAqqT2E+gUkQQVR0Ejbcw3y/0yp
X-Gm-Gg: ASbGncu/Qejiqswe+i3mZPPIGrC4om8ryeaQxhmGU7T0QlYav7LaUNFq1Kxi26W2JvP
	pSTrvj2q5K5EuLWfnG8RmMs7h9SbzpknDiyeP3A2AuysJU9qkh1dXtYJtnqkAplkRlCEyPU3oWv
	HnBJVR5xSsE56DhMEButJFT2TCWAQmHzsN7/kKCz1P91ZKFA9qAiVgRg0XJjuRiNx5+oanlyMLc
	e31XeNXiHffu50tezIUq6ykqGEhSmOsdTPCvlyuOIjPMXJ4j/dOTRDwH+qh12ewtnRfIdRv5Sme
	sxLd5ZEpwotMGWX+mr4Qn2zBkw4CuQ==
X-Google-Smtp-Source: AGHT+IGrrsY6wrvW9fYzSUYoTkKRLlXFEXcJLHphyerFOR9bpSt2ghPf9PAn2bUZieHj5MEFkH0twg==
X-Received: by 2002:a17:902:e807:b0:216:30f9:93d4 with SMTP id d9443c01a7336-218d6fbe4e3mr5442645ad.8.1734470789340;
        Tue, 17 Dec 2024 13:26:29 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1dcb353sm64509245ad.76.2024.12.17.13.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 13:26:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f624f683-d240-4384-87b9-2576bbc611a2@roeck-us.net>
Date: Tue, 17 Dec 2024 13:26:26 -0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (lm75) Add NXP P3T1755 support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
References: <20241217120304.32950-4-wsa+renesas@sang-engineering.com>
 <20241217120304.32950-6-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241217120304.32950-6-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wolfram,

On 12/17/24 04:03, Wolfram Sang wrote:
> Tested with the P3T1755 soldered additionally to the P3T1085UK-ARD
> shield and connected to a Renesas RZ/G3S SMARC board.
> 

Technically that should describe the patch, not how you tested it.

Anyway, can you send me a register dump for this chip ? I'd like to
add it to my module test scripts.

Thanks,
Guenter


