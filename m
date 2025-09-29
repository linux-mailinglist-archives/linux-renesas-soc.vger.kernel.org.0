Return-Path: <linux-renesas-soc+bounces-22454-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2E1BA94E2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 15:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD91C3AC30E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 13:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114053016E8;
	Mon, 29 Sep 2025 13:18:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA401DF246
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 13:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759151937; cv=none; b=tjGZT3QXNlItLc9Fm3xrZmDOIPxjCKKLLM+YuY8CtijT3iFmV1RwwFTbxkT2NF8mYqQBlSpBO+Hq0p7pKj7jqJAJ0oBa1gfX7OpphREVR7f4SQ5uTKBlKiND97J9NTUfOAa6ogAavy+75izA5tyMbwM955+DlNEE7oUReP0CJYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759151937; c=relaxed/simple;
	bh=brSfkV1bIv9/1CILbq/2c7mai4jh4ZoqfNa+gZIsQo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T0GJUfumNREnTLaudPb5OZUNDClnHMkemhTSrkAlpwtvK3kdOTZZgYacSKjU2Dlcp2IPl9Tp0hNCKn8B7jcdBtwcxzc4NUjwfmj89ssLJxUrjZ/du4EIIuncAo+zET3cuVvsNDVd2kuYE1RCba0NGqqL7TLVValiZSn/4vjehfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-54a94e39720so1633693e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151934; x=1759756734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4bKK4PdCjP70JiZl5KbDKcWmIOjd4Dbc3wrsn1YnxIM=;
        b=eMdKCxsdwuq5rhmv2Nfm/jyIF/ubEstTC2dyI7X7rAYbccLWUS8rKn8UqQYi8nsVOh
         shrF3v7aRcUqy/Orj5o8IYsXEtx+R6QRDhAjir3sn14M57kuOh6ynMbWcnc2GKlZ9hkl
         60hCkFH92qf31RBc+Ea26tBkLwC/LVW9rvXHe72gdt3I5F/xw3FsaTGszhFXyYay/ZwF
         PxT5k1ASggHjEkCk1C6+m/EU45Dqv4+1rW9TWfbsI88TT1GRTRY9E16fubrBLGc9MQq8
         wuJbGTeuw8ElVf2enz958whvrBoMtV6auT2rVCFVIHU7sgUr7PYYpa6Uy3v4J4LiUVou
         m14w==
X-Gm-Message-State: AOJu0YyURnMmcRSTjFDlbb9POIvfjbMqasKVBmXAkRdFoNpAGSkP6DiN
	e0dfqbVHpkCtzFAx+BpjCNHXGeBEyCQh802rj85k52M0uxgVOm5mmM29eZWoGNk7
X-Gm-Gg: ASbGncvn2mkLTThsm8zN+dHDmSmdUD63zERe/F9CTxXQp67k2hhQte1swjmTqJD4Ns9
	6h0TonvSgyKbL7BRYEq99YJGQo6P7fvwQyrbs6E4caLqWw5cf9PRvHV7bCLCkqcDLPwWIyfhzOx
	MN6TaQVxnByg8D+7NqCpOWOtxNcm6+nw0TZ4YqWRbrwyqC3GvPVjqTyl2x3263AcUjF6D/wEyU4
	2pJ32avcSS63m44+zEUEX5196JWtDfoO9lb00epWh8EAUYLLqHO0GcJGXVDBfpc2Ru8lwHS1ALA
	rX9VuxDFFEwQMQJQS9OOvQy0t0pWzCVgTFFDKlrZuum3uUPWHrE7o6IpPILMgBcPPquQLLjRUjX
	JkDFh4EcHAQGlzOJyPXZpQ5XH4ofQwDTYy/Y0Ad+ySGMWM+i5ieopFMjNHDc29HWCzDx5OWQ=
X-Google-Smtp-Source: AGHT+IGjSusciZ2b7xuhwCS/LiLWAnbui8Ivf3jNNGtc1ITIefa6ajq/UhFhoD9dW+8VpqI0WvkbGw==
X-Received: by 2002:a05:6122:1346:b0:54b:bea6:a226 with SMTP id 71dfb90a1353d-54bea300960mr6512483e0c.11.1759151934137;
        Mon, 29 Sep 2025 06:18:54 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54bedca040bsm2217430e0c.15.2025.09.29.06.18.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 06:18:53 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5b658b006e2so1575284137.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:18:53 -0700 (PDT)
X-Received: by 2002:a05:6102:442c:b0:521:7afa:3b95 with SMTP id
 ada2fe7eead31-5acd046d9damr5630463137.30.1759151933466; Mon, 29 Sep 2025
 06:18:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925093941.8800-14-wsa+renesas@sang-engineering.com> <20250925093941.8800-22-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250925093941.8800-22-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 15:18:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXk-O-UBeyiRfdSOrurL+5drQQzpbfOA=g3g8ES7Fr-Zw@mail.gmail.com>
X-Gm-Features: AS18NWBC6nSaNPpPtc_BXwSzoWy5zpF6I6NNMGG1EfJhUcpjQY-yLt3NspXEUM8
Message-ID: <CAMuHMdXk-O-UBeyiRfdSOrurL+5drQQzpbfOA=g3g8ES7Fr-Zw@mail.gmail.com>
Subject: Re: [PATCH 08/12] arm64: dts: renesas: salvator-common: mark SWDT as reserved
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 11:40, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This watchdog can't be used with Linux because the firmware needs it on
> Salvator boards. Sadly, it doesn't mark the node as reserved, so this is
> added manually here.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on the RFC is still valid, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

