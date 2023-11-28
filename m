Return-Path: <linux-renesas-soc+bounces-315-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AFF7FB531
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 10:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E29BF28238E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Nov 2023 09:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4DD1D557;
	Tue, 28 Nov 2023 09:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdRpIuSD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42360D4E;
	Tue, 28 Nov 2023 01:06:42 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50abb83866bso7000735e87.3;
        Tue, 28 Nov 2023 01:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701162400; x=1701767200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2TtVT9r6Ap3lfSrLlJlyUkvyevyK8TC9uXcXi9Em2ck=;
        b=DdRpIuSDjUEvliC0MrWNGdzlBgvv+ozex/jhSKx9S4a8PDJgfnde+LQiUWf9bF92yr
         dy/1Z9FmGK0s3CG6lFU5TgFdFLPwEMoWpF6l07muF6ZROIbVV9hUNgaTtqz+a9KZlEdI
         4LBrow/yL8SJTejJboPnADd3nwyLUCeDCIBZG8a+yCWjThMeOC3nOMukYpAaZXsrXN1g
         PXRAw4KeVhooj+30HDuXGYj2MU6LwmXGKKumBh4Cm/oZriERDigyyUrU9W780vfzB+VX
         UZjtJ4yYg+3zrkxPcbnzNgAm39vvI3+VGHNy++5zkRM12n0GWwgp59p9RruBa7KHXlg8
         iP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701162400; x=1701767200;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2TtVT9r6Ap3lfSrLlJlyUkvyevyK8TC9uXcXi9Em2ck=;
        b=VYMGgfsAi7uJvDQXs7qW4CtfxNkEOW9cAKUQcutNej93tCUrlyZtE0CTuFadKYzA59
         3YjbEryVxW1MvVXh7wEAaQ5WKoeVZZ44d0AHkzcYtBZPnf3svkqQVFlERfhH3uoVpJIU
         SaCdlTLSo42FblvsmM20t3ser335qw/ORDxq1B4kBaoAy094xBRsdN27t5GjslIksdfy
         xKsNW1YFt4SibiN4SXtHck0c89JuEZaX3oNKcVTn2txB9kfIOctbqxdeVeKYDKBEu1GH
         5Tmb/RJ7dEwMwIh9zo6vYjkvKFa8GpSONxLcEO9tzA1/wGQT3J/C2hFvlhG6VeHKK2QH
         sFrg==
X-Gm-Message-State: AOJu0YzmEgKv9kCMp3Q3uSwT1v2yVbIMha+Wq6RpNH7ismiyvpMyZTIH
	MA9WafTSOgwz7HxlMzpECQf7amahQWA=
X-Google-Smtp-Source: AGHT+IEks0iYLKuPkU+ZqjROCRlZBcpTEHp1SOXzfxZ3Rs3N9Trq5Cn99U9xniHpg6RrI4W/7v+hFg==
X-Received: by 2002:a05:6512:3e05:b0:50a:7868:d3c5 with SMTP id i5-20020a0565123e0500b0050a7868d3c5mr12720377lfv.0.1701162399842;
        Tue, 28 Nov 2023 01:06:39 -0800 (PST)
Received: from [192.168.1.103] ([178.176.72.137])
        by smtp.gmail.com with ESMTPSA id br3-20020a056512400300b0050aabfb8807sm1788245lfb.4.2023.11.28.01.06.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 01:06:39 -0800 (PST)
Subject: Re: [PATCH net-next 4/9] net: rswitch: Add unmap_addrs instead of dma
 address in each desc
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, s.shtylyov@omp.ru,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20231127115334.3670790-1-yoshihiro.shimoda.uh@renesas.com>
 <20231127115334.3670790-5-yoshihiro.shimoda.uh@renesas.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <39248b92-3439-c1ed-e4f5-9f1f61fada34@gmail.com>
Date: Tue, 28 Nov 2023 12:06:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231127115334.3670790-5-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/27/23 2:53 PM, Yoshihiro Shimoda wrote:

> If the driver would like to transmit a jumbo frame like 2KiB or more,
> it should be split into multiple queues. In near the future, to support

   In the near future, you mean?

> this, add unmap_addrs array to unmap dma mapping address instead of dma
> address in each TX descriptor because the descriptors may not have
> the top dma address.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
[...]

MBR, Sergey

