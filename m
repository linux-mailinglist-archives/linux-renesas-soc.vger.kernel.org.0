Return-Path: <linux-renesas-soc+bounces-24379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1205BC46682
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 12:57:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5809A3A57E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 11:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0CB30C60B;
	Mon, 10 Nov 2025 11:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yZ8sbvzu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C1A30C378
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 11:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762775815; cv=none; b=hbsJJ6k1jvzRMbws+QWcvHKudN/Swfv9k9pQvVMfwjqaX/+ICN2+fHSh3CiTkFR7+z/uEHRXEGiA+uVj9EluePcE4M0TkfdXg8hmhHXYMTAdyIT/XWxe185qXwXFQgKqK0VAyReVwuOwfXa/iu3G/RJEVyRLMqMjhKqADeP/27k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762775815; c=relaxed/simple;
	bh=oUgierYSU3dRBhCJGCsjS3J9M3HkXvV59r1SNiAzvk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NJpx6PfaQfxoymiuI8idmki+H17Hi0pjrWNrRT2cYAjWxSILUonm6amJzrFJ7vGJo4PWSrHOZImaTZI6S1lLfeeuuRJTu5dB6KlNiG0Ctua4Ox18Busqs6JkC7bVuyjIIYNRGPNyoLBRa559OGKVA9T9ZcxVw5D8yGJB6rA1wNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yZ8sbvzu; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-429c7869704so2183578f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 03:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762775812; x=1763380612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4g2z/CUdSCaQjy9LxpwOngAggO4WOQO9SBX2pApcNyk=;
        b=yZ8sbvzuAGCw2mrF/znpax5qC41Ec7OITzSh/dmx2az4dedT5WWB6bpqwtSq1I4Nlr
         oIpLrJxktDxHg06jbPw7jL2jKcc+0jSEAQd3c+S4v1KeOvQi/QSH90zJ/r6OyfXi506r
         hmTKfE/X0/sdzVMa9BE+0dwJJQdEftjpNt6jt1tHT6/j6tfYT6HVn/algXMNXZKO3VB+
         dRSM/3B6u/fUySKFFntvkD2WpNch/ElHnxg6XbZjgr8WjqdfdMpnrFgmL2piHu4dwSty
         M8OWYVWlLYbBk3RJ3adi7uPuosp/yzM+ERCRJasi1lgQxCnJnXtKfsoEfV5hkEUCGeMw
         hsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762775812; x=1763380612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4g2z/CUdSCaQjy9LxpwOngAggO4WOQO9SBX2pApcNyk=;
        b=hfSzn1dB7jox11d7BbACNjwHRu+QhZ7sB0FjvuMSWJgu6RGE3YbeUK+1Bgn2mgNjDj
         WkqTiZEr8zRULGd1bEBXLyqtZa5alyuOHDa6NeWFjTiE6BEqZGFupSlFrSZa8r4mDTqy
         Pq5uJRkcbnrPgvFmyhao9TwCbLQGqwRzgNuXZNJxD1QqRsZJQytTAKuhTT6Rftm2/I5M
         KyEo4e84OColi8qk4QFh9X8H9kQVgKiCnruu3qDNY7AzbnX1PxLaYkP+Jx5tD5/H6MAo
         wFzpdnT8yZV4Y58XhEbldowK552BbdUfHpWuboUMLAPUck8fctaWvKSMI1i7szfTQnbl
         Ch+g==
X-Forwarded-Encrypted: i=1; AJvYcCWzbHFyq3NrHvN2lW7zOyBsqcNxlk8WHhzewwtR0AQIBaAUgyhX/v/6ygYBpCbpe9/rt156BVZYVePkq7p6uQQEwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn2Gio8rR1tR21SCNx8yToxLOeZExYaksvG3PGq9I1v2pIPQWn
	9XSQpdqZO0Y3Q2Z2UZKd71yOG+olqp2bFnoiG6Oq8uS/yliie6Agyo7+tw0O6E7i6Ko=
X-Gm-Gg: ASbGncuuWLnHUUY33tewOCPvrZrYHvfvVWRBQc+tar6H1nt1nCcqezFupfYhvJ2B8Xb
	iIHmeSQCyf+ZDBNHm+37OEc24vvRpVFYMGt+3HA1ncndz0ySdEGf5FiexyX8jrPDh3EqNr2CLYK
	4fCGBrQtt8JpYP3kgMB713w57gzn/CPemfUi8uXZmBTpi4J8p22JpuzKYcLOXxtw3RttD/arI0E
	CgTNAxlnCeq3hRoZWtnH1Fcp/1b17z0MPRxwAwd1T57abxCAc42/hqxv6+HmRSZnBKJS5+wMfLB
	h8FToTs1XzF7/jLFzU2yymU32gmd7YzybIg4Qtl9e9ZmtKZKLlH7lwc31lfYwsIxf3ryv7nZjZ2
	tFlcUuufjUvz+WXhhTXJRXnbcFkA2W8ieXHmYmb7M37RppRKJJraojdkL6cj7NEylC4DuYyrShm
	EDZ4Oywswj1luI2Gj9t9jAWGnrvazDwWFHrfLadZ36NXx3IJ6PR+Zc/oU=
X-Google-Smtp-Source: AGHT+IFbcw4K9ivqGLQddDZa5CrYY9iwv64S3IIlLZWbi+XRwqAEU+75TumzHzlJ4CnXK9gTK1CTaA==
X-Received: by 2002:a5d:5f42:0:b0:429:bca4:6b44 with SMTP id ffacd0b85a97d-42b2dc1f4e9mr6741662f8f.13.1762775812360;
        Mon, 10 Nov 2025 03:56:52 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:2b20:d700:6e9c:533c? ([2a05:6e02:1041:c10:2b20:d700:6e9c:533c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42ac679c5dcsm24735244f8f.44.2025.11.10.03.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:56:51 -0800 (PST)
Message-ID: <d36f89d7-2d18-4c24-840c-243d4fa10de0@linaro.org>
Date: Mon, 10 Nov 2025 12:56:50 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: thermal: r9a09g047-tsu: Document
 RZ/V2H TSU
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
 john.madieu.xa@bp.renesas.com, rafael@kernel.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20251020143107.13974-1-ovidiu.panait.rb@renesas.com>
 <20251020143107.13974-3-ovidiu.panait.rb@renesas.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251020143107.13974-3-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/20/25 16:31, Ovidiu Panait wrote:
> The Renesas RZ/V2H SoC includes a Thermal Sensor Unit (TSU) block designed
> to measure the junction temperature. The device provides real-time
> temperature measurements for thermal management, utilizing two dedicated
> channels for temperature sensing.
> 
> The Renesas RZ/V2H SoC is using the same TSU IP found on the RZ/G3E SoC,
> the only difference being that it has two channels instead of one.
> 
> Add new compatible string "renesas,r9a09g057-tsu" for RZ/V2H and use
> "renesas,r9a09g047-tsu" as a fallback compatible to indicate hardware
> compatibility with the RZ/G3E implementation.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied patch 2/3

Thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

