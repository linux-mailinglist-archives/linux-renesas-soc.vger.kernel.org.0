Return-Path: <linux-renesas-soc+bounces-11674-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E764C9F9FE4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Dec 2024 10:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0BB47A2F79
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Dec 2024 09:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DB21F0E37;
	Sat, 21 Dec 2024 09:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MCMX5F/x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B561F238A
	for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Dec 2024 09:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734774143; cv=none; b=af7o0Oah02luU70cfOW0DNy533MkZtKZlVahUFy8SyGd5UFXzWsOcmAIfVIIdREDZoQ50ARdEpFyEdOlDQcLsgsBtX+VArg243uEMnR8/lx1S59/zGeyqIBZXJuMkTA5lXuJ5pdVBgphXhYg2/8R6YcWjNkl03UPxg0rkxN/AbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734774143; c=relaxed/simple;
	bh=skAEpd2O5+Df7mgJH3XAIVTg+HFKNYoWDbGYtlf8Xi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C3V+av0Fyy7qLcH6co0SuSWWXHAONy1BoD6fUNJqjsIpngTDav56XOUodHOmjXfWbA19IiMhT7Ss8wk18u7eUucXrUnBmdmEp6Ay1L6rH8Y/3sksz483NWvYy+byXC5JL3Ko+xV5x6R0zg6lCzWtbUUidpvUr4P4iSdQ8ma4kGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MCMX5F/x; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso22773425e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Dec 2024 01:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1734774141; x=1735378941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s4Nr1VJAu9tAGz/GDFeA54KKO7asXY2wIkKjUTyAcqg=;
        b=MCMX5F/xBJGQBE+bVyVHRp8udWHwTL7+2E+X/UfvrGY9wspDuDL0Q9vgvKVtexsxY3
         GYvyoyukk2SJm4RMK0yRhOMMgWmLscPRR+BBvtREdRPmgy2WyAFwxwy/CRJEcrtjtuFt
         yxh072Ffj7JceMCTl6jY/6HHZyN+rmz7FSXbZtDejTtpnzNBN2TQLjNHx7JRADVCJnjF
         ef6Fuq/UOfhT6E+/yJ4qMMXYl3GAl+FGpXmF4o0KBMVLbcKSd+eHYmUst1Juy7R0clTQ
         wXTZaY0GFusYLVkW1rzlRnO2h+3wZpu/Q2BgpqnffNJm0gVaeuS2zU+Pf9Ts1CLu7yZB
         qBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734774141; x=1735378941;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s4Nr1VJAu9tAGz/GDFeA54KKO7asXY2wIkKjUTyAcqg=;
        b=USS2LdjgEW1b40SgyN8nPo+gS0mJ8AL3ysiXdzI2QceOR1JizBsR5icsydm5FMkl/I
         BQXElnAY3KV5cWNlvXXuu81PsW6wVzDUxksZD9GCbY6Orcj/cwRKWY2mEqQ1fpNfqpgV
         ArdsrVkExI5+6OryF96HuiO0duBWviVShfB6a8eMwfx+1ZiIXppW5K8oMMzr5MHzf2f+
         bYMt7u2IM48ifQfHTMsZPRXmPiI6XiplfKU8ut5Ls4Y/ZlVEDpfPn8RhRwq+mZRk+je5
         QL7tRpFNP0M01ammduqn3RK7A7XHQs05wR1rP8MWKS3mwKSbDv4udxJi8pVMkFaZCV6d
         axig==
X-Gm-Message-State: AOJu0Yx72+zxSl9a9ledlxXUNmWmgItolPXlRKnUsiqUAUzuNxz90SSi
	B6CiiWy7vSHkEaiOI0G/bl8i2VqLRK+F9FdS3IKExX8T1bIULTUB0l0/1FaRC/o=
X-Gm-Gg: ASbGnctRjDACOLS2WlkhgzviTXVipLBy/0whaH80OAPeAzeqXPw/sIZZflYhJQczkbV
	miirlDDUYI3nYGMzKvxV4t8Hyvpmu4PGESvQknwfsHupregh/1nCyftTCIHNoX4KQTqx+7TD8RS
	OXb3oVPy5LIXPu3EE9t48Fsp6H1pSdRKa2zbqvHr8w4ARA4ZcBPjHxHT5cp2MMmY8TmIu6Eaqmw
	y+wQJj54T5le6wCFA9fLiiR3g+t9AHE+VAQjAydji5wcwX+oVZPDnrUWfQayj9Lvg==
X-Google-Smtp-Source: AGHT+IHAz4je9hZ7JBpRIp4B4qjAOQ6GndH21aphqoARGXhR+Vfdr+n34kF6/YR6VTNj/2tZgKzEbQ==
X-Received: by 2002:a05:600c:4f8a:b0:436:488f:4d8 with SMTP id 5b1f17b1804b1-43668643a47mr49276785e9.11.1734774140672;
        Sat, 21 Dec 2024 01:42:20 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436612008b1sm70375885e9.15.2024.12.21.01.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Dec 2024 01:42:20 -0800 (PST)
Message-ID: <15af52e7-c55b-4be0-be45-49d5b031fe77@tuxon.dev>
Date: Sat, 21 Dec 2024 11:42:19 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] Add support for I2C bus recovery for riic driver
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Prabhakar,

On 18.12.2024 02:16, Prabhakar wrote:
> Lad Prabhakar (9):
>   i2c: riic: Replace dev_err with dev_err_probe in probe function
>   i2c: riic: Use local `dev` pointer in `dev_err_probe()`
>   i2c: riic: Use BIT macro consistently
>   i2c: riic: Use GENMASK() macro for bitmask definitions
>   i2c: riic: Make use of devres helper to request deasserted reset line
>   i2c: riic: Mark riic_irqs array as const
>   i2c: riic: Use predefined macro and simplify clock tick calculation
>   i2c: riic: Add `riic_bus_barrier()` to check bus availability
>   i2c: riic: Implement bus recovery

I've tested this series on RZ/G3S checking the already enabled
functionalities and suspend to RAM. All good. Please add:

Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thank you,
Claudiu

