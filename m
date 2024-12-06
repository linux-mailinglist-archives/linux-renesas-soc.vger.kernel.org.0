Return-Path: <linux-renesas-soc+bounces-11036-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B49E69E78B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 20:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A6C5281EA3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 19:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEDC11D61A3;
	Fri,  6 Dec 2024 19:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="KPr1iBy0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30724198A06
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Dec 2024 19:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733512697; cv=none; b=U1E+9hXD0QRtggSzLy1VyNLcfLdT7mOlgVRf5V0BscfFRauQ/2dpbnlgzNeNtBjklZ9aozhLcZ72tccGXtQkT27Ids9DUmIAIdqz3RKfwmSsPKtAYt7C1uvVBmHunVsoMb8v4yV0r6l2tqn52GKSlG+UBgqQwYgzH6GIQlWlrgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733512697; c=relaxed/simple;
	bh=XXEsKHStx4nAG+6QErJ1NiHGu6mTByr3YcI0FFX/DLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=boLoYEoBm0svvc8A8MYAIHWjGnn5HxY84xq8YXD7X5DUTj07G9MJdI2ncCF2ig6QZqMjO2gjray4HdmxLbxXb9Una5pa/tjm+whH/bqebCWt1L5vgSzmELIaPsEjLY7QtxZmH4VQViGPewRRJRYg6Sq8Mw1fdNdcW3WTFYNcMoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=KPr1iBy0; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30024c73101so20168571fa.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Dec 2024 11:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1733512694; x=1734117494; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XXEsKHStx4nAG+6QErJ1NiHGu6mTByr3YcI0FFX/DLg=;
        b=KPr1iBy0FrEE17TDfJQI2s6Azr173ocp+ycFX4CUZxKV5QPV9KWtlZzC6qYpo35+cg
         3ox9ve/sGFGjdcJugZFImoC+fRQMDPkWo3c0OT3eXyUSUZIIYibyvPY8rDNfdIRp3eQF
         0H0DjYbEGDyr5Bvc9MgduaD8atznpsEd6UmeGOjaa41KxWLTXsSEQyG57lNOZtdoenJW
         udM7+1qdBwhOIthO6cTpCNRazUhVYTvZfkZdY3GC+xRKlP9Ma7yoK6m3TYaecr44ZDBO
         C1f2/hijYyM8YmsIYcUJrHBOlxGtb+ZQaRJjMzgztALJiT6A9TQzSt2vZffRKNrTQfDC
         jAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733512694; x=1734117494;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XXEsKHStx4nAG+6QErJ1NiHGu6mTByr3YcI0FFX/DLg=;
        b=IE7kC9chlNg6/KLKJLUfMQSOodLyY1QhBgDPEAY3Z0PAnTEl213qFsCs5elhqXmeZb
         BtHDS5/CUtkP/4Nn+9UCIAr+JvJJsz5wk+1x2QUNhsujNrW6Qok94Fm5f/QCW/xOXzBd
         471ox7qCB3lSKt/E9JBwSzDFtg46/mEM6GMW0MXkeT/MIh/1T1hhCT6wI+2Wts33YDBa
         O59TIR2XW1H/ZiD4pCubcqBSmCsng7C4M783by38yusyqIRPZsm7goRpVoADw/g6xqlS
         E/8RDHjOpjDE41W+Uwl4ODy1VlEuqCIJuFm7eZ0UwLDWq4xR3X0cXHLA8i0CXrLztOs2
         U0Yg==
X-Forwarded-Encrypted: i=1; AJvYcCWBhvW8xqzT3Or1gUKLlzkhwKk2rvqOJV0QOBkZhtz3Jt3lAVXUmXFoz3dyO2bx3b1k1IikdOf3IQJW3y84ijkl3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNTxJq+7PDRFEaieq1JsjFZoEpEvIVZZjwwkVrfOMgHKDlZWbl
	8VHMtgq86aDArhWiJ4QdBF7/3nOj7ZTotyZGCxSh5EWDjYtt2TnWEXAXk+7CqeA=
X-Gm-Gg: ASbGncu+hrnkY/yt95H/7i5DztKe2aM3OcWzLCYD5uOtldf0vYbyP4aztpV9MbE6HQu
	Oc1yl14DW3vf98/WXfSyonuKiEFCjvznvWlcsKx+C7T2R90qP2FCF6uZkYuPy2mx1IC/O/8YnlD
	TnckDovaH5ZAjLVlYxbmKv4x0HUgHULdbKYs1Nzsv/dNWA2jAkFY5zhVfLuGIMhf1fhbsPeuKgf
	hbDvmtozIsAxiUcYM9QXVAlsWe3+esNTD8Bmw6izFEZKK0V5zWNwwW5eDQZDAT33M0dCQ==
X-Google-Smtp-Source: AGHT+IGis4qREcli745RBFrLJcy+fcg/7cCX/7Rt7z8z904kRcAYTDaWI9H2MT/YlwbjEUPc5o2viw==
X-Received: by 2002:a2e:be23:0:b0:2ff:b3f0:68d9 with SMTP id 38308e7fff4ca-3001ea9934bmr32824321fa.3.1733512694247;
        Fri, 06 Dec 2024 11:18:14 -0800 (PST)
Received: from [192.168.0.104] ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020e56f44sm5485231fa.104.2024.12.06.11.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 11:18:13 -0800 (PST)
Message-ID: <b39e495d-dd23-4965-bc1c-b30db81be0f8@cogentembedded.com>
Date: Sat, 7 Dec 2024 00:18:11 +0500
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/4] net: renesas: rswitch: fix race window between
 tx start and complete
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>,
 Christian Mardmoeller <christian.mardmoeller@renesas.com>,
 Dennis Ostermann <dennis.ostermann@renesas.com>
References: <20241206190015.4194153-1-nikita.yoush@cogentembedded.com>
 <20241206190015.4194153-3-nikita.yoush@cogentembedded.com>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <20241206190015.4194153-3-nikita.yoush@cogentembedded.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet Switch"")

Sorry this patch sent out broken, I've reposted it fixed.

