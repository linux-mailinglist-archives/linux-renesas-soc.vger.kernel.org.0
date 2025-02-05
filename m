Return-Path: <linux-renesas-soc+bounces-12884-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4F2A29B22
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 21:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D464B16503B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 20:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B38002116F9;
	Wed,  5 Feb 2025 20:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="TFJY8Pnh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67DB846F
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Feb 2025 20:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738787175; cv=none; b=VnIaAhNrBKN/DtFb2HcBca1p7FCu5cjGsHm5viyKl14bikADNPQgdX9ATVQ5QeCj1EjhfwBpLPl0l+RyjTktxl1LFeSP7ibN+H6S2z3wKV38QwIO6BTfyi4qdeXvTuRrmG+28VVs8BdxS8L04F3DmTzKSol1FGSV0jXDW5Ywd0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738787175; c=relaxed/simple;
	bh=hWcjkVvv6KY7K+i5MOmOpjaDm9yKh5mFFQCnW/jf3uI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q+bjb14+PIzKs9/JZ2A7wFNB4s46r00BVeeTKzqs+FVp9EDmyvdRFcp/gkEc6EB1lUaP5f1xcR+uIQ5B4xFw0P2zubDnFKkI+e6SeEQg/p524w3R5P0jY3TlnH4RxCVAri7eD2vQ1aZe3UZNq2PFhsubkvA+svZ4xIT5C3Kij0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=TFJY8Pnh; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dc0522475eso475469a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Feb 2025 12:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1738787172; x=1739391972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWcjkVvv6KY7K+i5MOmOpjaDm9yKh5mFFQCnW/jf3uI=;
        b=TFJY8PnhtYQY/EbyFjVANJJjS9ShjElv9GBzaKut/LDmIOePLfb2L+elGjot2Nxwyt
         grfA2+4KJcbHLossN3dUgdIdE6ODsVo99t3TWUStjAKGl+kXLjPlnZtEvMUSnWmF4hAJ
         xFm+lfRb3ZAw9OwMtVEOHE7vJa1BcmlnmqWsS9fPM2Vn1kPdfy8F6XbvnYtO8Qt+4/3L
         My9SV359eVsMwcNPd8ESPEolaPpyTf9+HzsNZ/zXOGUMLGw4nGHGquwtSMUmf4+NlrbW
         7NQlwDePw9ldumYLLAvzj3c3H5fyuV0u2YQX5zMV1jBlDHLA0rErOD+BLpvCfo7wF15n
         7EHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738787172; x=1739391972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWcjkVvv6KY7K+i5MOmOpjaDm9yKh5mFFQCnW/jf3uI=;
        b=lvun+Ewt58EEAprlcW+Rp/9zquznIxgz4B4PnknkOwXuhYPSBAh67KbjZ16pyg4wPf
         eWgFzv+JKm1hgESYlZFBMrDj3mr7sjWkLtEvoXrbnAN1MqqYBcpeu+YHBl4PImyApzbq
         PFwi2V9SsgwaESAULGPh6d2iQaBdp2Jiu76VpuZzo2lLK3TPy0ZeHDFi03FTa9JrfilP
         YFlYeJ8FYKLFoNpOv8BsGS6AChYesi7knujWtx5w37VmrBsxXnAKgtjNGIweVVT3JB9p
         fHLPhvn+fAVd2S8hAJW8/ZXRQOGRR7416Jtg0O9kJ753vl6jxe67ssPRHeRc6ezSnKl2
         fRDw==
X-Forwarded-Encrypted: i=1; AJvYcCVEj14kZyRocHiD7xJCsl4YICEytN2q5+IY5uX4LeJx4KvjYCqWkEyvpQXX2XthpgPmmvVl40D76/FWTvD/MPT0bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3G962Y2Z2H6KGc2vz3Mq2cwXEOP9PwELzf7hFAsTglVKuFLsQ
	zAn6DdPUFTH75/2WASpOcu7X3iZwZTSveRqGnDsgLO2jFrt6Ro/nKE6rX2Y4Uqw=
X-Gm-Gg: ASbGnctFFh1koCPU3jZ34fej74ddb+yjwEp8Rm6ScE+Wprmn/rkmW0HEKq4yFI6QGz3
	9BBPtSZOsLPW5HYWCUKs+0nNZ8kSSkppumlQIfBQUimlhNLsOMjUhZl5ZS1zalrs2yDIC5edEvt
	zxr3l9HK8iksXW5Fh94PeiEMPjNYyVOABzGONVoV9Ifm9VzNU2HqGn7UzNfNI9BrlM9GpCWqMnt
	PHffLFJL/59VTGrjX+HriEqL2Koyl9kQtNqdbIDzCNujRHeKlt2W06+Vm/ODLUKH5LTZqjUwXsM
	QxbIYHLwnsKa+HjpXwwWwumznnudc9ARU2jY/iZ3SA==
X-Google-Smtp-Source: AGHT+IFaywZdRalBVpVVP5TmbF1T5HAAaPMMuKHq8rwyEDyE+qrnaJZq8qLnDjIR22e45iPw8kWcCg==
X-Received: by 2002:a17:907:d8b:b0:aa6:b63a:4521 with SMTP id a640c23a62f3a-ab75e23a4ebmr414280166b.15.1738787171974;
        Wed, 05 Feb 2025 12:26:11 -0800 (PST)
Received: from ?IPV6:2a02:810a:b83:a100::2e88? ([2a02:810a:b83:a100::2e88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab70e4e3b5esm818932366b.138.2025.02.05.12.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 12:26:11 -0800 (PST)
Message-ID: <93856925-b451-408c-8dee-bfd8dc2d56b3@cogentembedded.com>
Date: Wed, 5 Feb 2025 21:26:10 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: renesas: rswitch: cleanup max_speed setting
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Dege <michael.dege@renesas.com>,
 Christian Mardmoeller <christian.mardmoeller@renesas.com>,
 Dennis Ostermann <dennis.ostermann@renesas.com>
References: <20250203170941.2491964-1-nikita.yoush@cogentembedded.com>
 <18a72981-9896-4725-8f5b-5783224de300@lunn.ch>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <18a72981-9896-4725-8f5b-5783224de300@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> If the interface mode is 5GBASER why set the speed to SPEED_2500?
> Also, USXGMII allows up to 10G. So this all looks a bit odd.

2500 is hardware limit (or at least the datasheet states so).

Nikita

