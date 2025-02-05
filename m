Return-Path: <linux-renesas-soc+bounces-12878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E670AA295FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 17:15:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C8BE7A2031
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 16:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4B2194A44;
	Wed,  5 Feb 2025 16:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="zpUDfjLe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356B51B3F3D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Feb 2025 16:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738772110; cv=none; b=QxbacqnuKHfUmn5escdkaN4C2tJ6s0Xe6LQDMSkI3HIb7lAHiGDeTVTUp/UTxNN7fohmWqxBuXjtCBaJKCeRJmZj8EYR9VnYs7MqHXIxlBeOzyCCuLPbncXoNtued0ahl1+GxHvYKymWEurX167y5VzEDIJF7aJ4lCPd84zlHvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738772110; c=relaxed/simple;
	bh=gSrK2ZLv5hJh0Bg4COVHxgaWWQ3XEJvJIcwIcutDZ2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ayIGkuq1mF8ADZDigDCnrDJMwOBqaNv2yk47onT0/pd61NqXQKZgqzr/YyLY/+EZd0FPS2x22NXeFqxs5WgYhTYYUSdxuQW0MhOz3QDN3nQzZ+8xLrpRzW3n4KdSBjCXF3e2a8zAGTFGbSAwvNa2CM4hxYtmD5PlC4dgeBAPnSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=zpUDfjLe; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5dcdfa7df68so1246798a12.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Feb 2025 08:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1738772106; x=1739376906; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/QBdlnJvM8ArXaAVPib9x88EpLXbzWHvETvpWGPxgSc=;
        b=zpUDfjLeDVOcoeTucHh2ZP8CQEgYON5Laz31kqiPM92jVDyVp5OKOaoYqi3uWGSB5i
         kVQzzsAYA492K3tlmF+VxDNG1Plstyya+hrGFB2DrC0gYJUtv7cmMnhOs9b9Xj5u1rK/
         ayp1bApu3HyfP157h8wMBrksHB7N45pDgtDnpbJgJiBV5o7ulu5w2LmJwlIBL7163du/
         5EP7H1qryS2RzXnQKg7RnDxC1zlt05Q91UzkAUiTX0M28tWf9a5YHVWwju/XejNh/Epk
         9LDxG9M0lNl1H4XD0LMCaxjfTjqLewZICEWy8kjzYHqzMmVDT1zAQKIbxWhctSjgJ4eY
         YqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738772106; x=1739376906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/QBdlnJvM8ArXaAVPib9x88EpLXbzWHvETvpWGPxgSc=;
        b=AI7EbhJOHA715ltqfGRJKjrw/xiwflfeoD8+l9OwdctfuYrWTO8VJgeI3WxG56tobw
         7/DhNmg/jAYChPs+UTbVI/ilIA6xDM0n3kF637UlEgCV7r7wERpIkHJ8S6P5QqNtYbK9
         LfEUO8dUwb17v8kYLaUJSd8TAyu7GZQ7PEcGl48oaRtOh9Ij6neAcvVeM2x4GadFAHwL
         TaOjnPgFwlFFjg0A6TqpzJj69jg+R2l6oYAKlc3mIe7rXlP9ou9b0lxkm1nLPphcskR5
         EMa5pXg8XA4JnONKnJVj034+6dyDLbx+RtlwRVlKRncQg/1hslj1BaYVxZ6gOzUD9UB0
         46vQ==
X-Forwarded-Encrypted: i=1; AJvYcCURwstUWL7fVufREY4x8MhrD/Cn3Rae6+a9zjsIbupMp45vbCChk5PaQX627ollnnOF5ILtRHzUJT8bQX7GMbq4Ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgRMkuy/Hg32BDoJVkKUdr4FRUuNPF8RMHaeq6zmqr7OjS+xRH
	4hljOJH31eowFAlAZsV//P1/h85qn/iHNAAFezS0Njg3yCGqVN9itpW/VsnOWxs=
X-Gm-Gg: ASbGncuDqgMFTDIb1iIYTVjv2mRVeYC2DHvUcOMpGMd8Jr0VgrqZX4IMgYloBLVjRSo
	Bq456Tk0B8hg0mcfv9Gz7nM/XC+sGk6Su279F+hZDnzy/hqWkSX0N/c686oBGA4TmkGvrDNn91w
	KsXp3BgQcGWf4/tgcAUq4kP6lY4Dtjmkjuu+UU0ehdbQH9go/rVG30+S5yxi2lu1mMHqd0wdEjm
	T01rPnKTp60c63c5e4qXyixi5ETurFpf1jwNgvnZihgxvscLdAJroJ4qvBic37P+2x19z8TzkpH
	KG/MSq94HkWC/PTaOVrIJ1fHpffeQc17aZVBngpowg==
X-Google-Smtp-Source: AGHT+IH0wU5gBFvhZ2RIZWTUFQl839crReRXqo57y1w5nilnJSkbOGn8HKAeAqcDVTna2eLqwpOWLg==
X-Received: by 2002:a17:907:3d8e:b0:ab3:875f:a246 with SMTP id a640c23a62f3a-ab75e21dd12mr345489266b.7.1738772106387;
        Wed, 05 Feb 2025 08:15:06 -0800 (PST)
Received: from ?IPV6:2a02:810a:b83:a100::2e88? ([2a02:810a:b83:a100::2e88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49febe6sm1136209366b.100.2025.02.05.08.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 08:15:06 -0800 (PST)
Message-ID: <6d09e337-8bca-4ef7-bbfc-d824829ad211@cogentembedded.com>
Date: Wed, 5 Feb 2025 17:15:05 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: renesas: rswitch: Convert to
 for_each_available_child_of_node()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <54f544d573a64b96e01fd00d3481b10806f4d110.1738771798.git.geert+renesas@glider.be>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <54f544d573a64b96e01fd00d3481b10806f4d110.1738771798.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Geert.

> Simplify rswitch_get_port_node() by using the
> for_each_available_child_of_node() helper instead of manually ignoring
> unavailable child nodes, and leaking a reference.

FYI, I have a patch in my queue that replaces this code with traversing child nodes (via 
for_each_available_child_of_node()) and only creating devices for ports actually defined in the device tree.

Nikita

