Return-Path: <linux-renesas-soc+bounces-19196-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7E0AF8DB5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 11:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F4A31757C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 09:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D402EF9C0;
	Fri,  4 Jul 2025 09:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="Isudx/+W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BD028B406
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Jul 2025 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619780; cv=none; b=g+xFVU0hUeqpsNyz1BVzbWkXkDSiiEDsgE+3mqGNDvL6SDNj99ZN6sJr4HqqQwHcX4oHfQeqBWR94njkBahrCm09OfCJoiC2HTZUAxbo+nhMd2FgAp6H2PNKqof07qMaRHE+g5GeUPNdAqQrwMnVStAJ8INKXzSWxoURmeQc6GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619780; c=relaxed/simple;
	bh=V5koUxfFSy4uE/qodJBIzWPVCfvRZytYrEavwyzOljQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iI5GN+ugf8F58SvqKuvEBDKViI5qJeIZzymSpZ/GxUtH9BFsB/G72WyzencQO25XnaTOpncU769EDXjeZRXrN0sXVU9p48xntQb1accUIFyOslKE3PzWWxQA8wd0WJ3hK/+ua3P128k/tU0eVN6CpJ4k+B+Eo7VL+WKJPLA8RKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=Isudx/+W; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so1434958a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Jul 2025 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1751619777; x=1752224577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ytkeLBOWSUjqyF+0AmdGr/K0zuZLknn5NPnuNHm4xFk=;
        b=Isudx/+WPV9kYeQisvCk1E15F5Tgu7lkfA7Q9SHYs9L6ItmU7kfmG/7Qx2ucIPgFeP
         L5KJoumPHx1GJKxy4QMe0MM8EoeLxnd7u/bjpySIe49GAMpnbRzlvuAIJ6A7MWLn4aPt
         30+FvfHUJU351zYeiy5w1oVgyD3F0x8vlwc+8Fhzj81xE9EDaWnbZj+GRajMvNLKnJN8
         tXY9zdM5awyuGUrCQ9JTS4Y1nAB7+z8gx2JutBn+eP8vHyeiPVTxyAbwnQO9986k5Umy
         crmdyhujQJXtnsmU76NY9MAnz/ArLvW2LbmgWRBqPO89Acmz5qWcS93FEKkl/UZxXU1J
         G42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751619777; x=1752224577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytkeLBOWSUjqyF+0AmdGr/K0zuZLknn5NPnuNHm4xFk=;
        b=scF0kSHYZ22NOCPHCDv14Cj65CkZgX+p18gpYFUeuCEXcKm2GaomX4dzDKk551j+tH
         +eid4ICLGtx+BjMv224FTpv0COK1GdHz8xGtYgLdSrQ5hElz5J/GF+81kpNE3LWtQVQ7
         mlsYdjAZ4DV/s7iZ8wrSZlcRxd0xftwFkLz9lN88RrSiXJAn4QWkU9Meal1c+BxyQGNU
         OivUnXXdGzPkdEHu3Y+zx0VHuoVZ18KIL3ZkqGZoSAyZ2P5i0YT6DkV5opZJTgNiMXOD
         zBvyEq8aL53nh8Zdy+JlF8HazYtg7daeXzzFniccqBXY8d/Lc03PTmhvjWr5nRUMXt7L
         GSEw==
X-Forwarded-Encrypted: i=1; AJvYcCXmwR+2tTzrUQpZ3+WDAwinox9jCuL2b6carGd5zlsUKTSjCXlzvsZ/lxjoXLB4x8425qy8P3eljD+i6hGfc1VGjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2oRzdCy9EarrZSpqf4A4kPTLmJZYL877ChQTYGdUD8Gsi4j6X
	ikpfQhRb5qRPMoiD65u5eO1H43ccdzTKagaV+/lFzhJEG6+ekzeI9FuLx7Ku51tFndQ=
X-Gm-Gg: ASbGnct0v1HaUzWQqhFB78iTxwy7K6yMdasOTgYdIz8DPzZYni26nlVj/FIx+kNzoSw
	OYMr6encLRwzTzdB5ppIWSJ7DUOAFxlYlsaGm6OiTkrU4Rl8SMUQCeM64yTHYfpEFMHloh844kQ
	e+YP9csoU44ec5sZ54qs66l68F+ZZ7e+EVqD8jlEChCsWd8zPJJ9iS0SCC3/KM/Dyamct70eokB
	6AeuLwImnXXEU/CWz5BZPChnWTrKtYfqIRBQndqU6rIy/s2IrYG5jB0fH2bo1waTkf7hZTOZ7Wo
	pGtHeRFOeJ+gXJ0WaS18RzghrqhEghBFqY7HC4zWzZFcH76KuBm+cnn0hF7VVAazMPD29StYTpV
	nADwf5+c5j2ts
X-Google-Smtp-Source: AGHT+IGrFm//KlPYym03dXJJ6W90PNMtDAjlmeJkmjKflfhllyQQtVHYO7NBFLu6I8h506BVFQRk5A==
X-Received: by 2002:a05:6402:5189:b0:606:f37b:7ed1 with SMTP id 4fb4d7f45d1cf-60fd33621f8mr1546754a12.21.1751619776886;
        Fri, 04 Jul 2025 02:02:56 -0700 (PDT)
Received: from ?IPV6:2a02:810a:b98:a000::f225? ([2a02:810a:b98:a000::f225])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fca9bc848sm1043594a12.34.2025.07.04.02.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 02:02:56 -0700 (PDT)
Message-ID: <8d17d946-07fb-4335-b8e8-9ee256f75c12@cogentembedded.com>
Date: Fri, 4 Jul 2025 11:02:55 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] net: renesas: rswitch: add offloading for L2
 switching
To: Andrew Lunn <andrew@lunn.ch>, Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
 <20250704-add_l2_switching-v1-2-ff882aacb258@renesas.com>
 <64e7de61-c4ed-4b42-83c6-5001a9d28ec0@lunn.ch>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <64e7de61-c4ed-4b42-83c6-5001a9d28ec0@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>   	struct phy *serdes;
>> +
>> +	struct net_device *brdev;	/* master bridge device */
> 
> How many ports does this device have? If it is just two, this might
> work. But for a multi-port device, you need to keep this in the port
> structure.

Having per-device (not per port) brdev was designed by me.  Reasoning is that hw L2 forwarding support 
lacks any sort of source port based filtering, which makes it unusable to offload more than one bridge 
device. Either you allow hardware to forward destination MAC to a port, or you have to send it to CPU. 
You can't make it forward only if src and dst ports are in the same brdev.

There are 3 ports in the S4 SoC, but the rswitch IP is parametrized so any number of ports could be 
possible. And, we have been implementing virtual ports (not yet in the patchset by Michael) which opened 
possibility to have netdevs of the same rswitch to be in multiple brdevs even on S4. But still had to 
limit to one brdev due to that hw limitation.

There could be a theoretical possibility to use hw L3 forwarding features for better L2 forwarding, but 
that is tricky and creating such a design did not succeed so far.

Nikita

