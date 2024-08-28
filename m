Return-Path: <linux-renesas-soc+bounces-8420-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2268A96220F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 10:12:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CDD531F23BA2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 08:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43DA115B99E;
	Wed, 28 Aug 2024 08:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="GVQn5oCs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B466B15AD99
	for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Aug 2024 08:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724832715; cv=none; b=ToYSwFoccd4P64sLelsvXnO63l0RNWHOTk8HdrzFlHS6/vxL7AsNwOJUl3/zl6HtTOtt8m42r3/+zNoUVPGkUNOjdX2B3ImV8ghYRycBh4tOEInS2Ax23w6tTuD2KkkjsYLC+7RVnXK9rbPFhEIL2s0yacEWREI7QOkdAEZqb7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724832715; c=relaxed/simple;
	bh=il6KHy+HqQt10Eh6wRZHdafRPQsQ+9G123xudegdugc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iTdj+dPIFyRQ0z8bJHP50TPeiTCOCxIVxrhILvudEcDaf8qXvjH4fGoPurRhpmvLNdtyGRqH7ykvYKTWMr4nlU1PX1Gir5IMW8zw3FwHY9MauMfI7qRfNfV/veuCWe7ogsBydk2F63jNR58rjkpE/FCgB1AGChXdfOB9cMUmB/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=GVQn5oCs; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a868b8bb0feso700065166b.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Aug 2024 01:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724832711; x=1725437511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ok5cBxVxaPwKYrTNl8M9e59G2es3jRCQAGdlCM5p44=;
        b=GVQn5oCsjuabQkjjuh7v+GZJV6mjP3yxmn1PJhLvNpMrhE7+LVeqZT12Mv3/8hw1Uo
         WI1G2A9pnJ/oV3QTwLM83s4RIiksBdUrYqzcIeSKlQDsuXyVgfGtF3e4TM1rfo97LbQT
         DFfU6qcFpSBSfUqAyDixs+4Soyhuk8fNuzMRBv7ntH5vUmSdyWkVkHxNXCQG4W43MgsP
         J5rSOruvkcTPc9j0WJURcpk2GNHGCHbEdULVuvLmFkhxrpE8rOVAkotG/KbNSZoNYuWU
         bVEIpn4fRFT3I2ghGWQgY0htCQMf0B3yI1O6tnUO5B6pKH/zuQZwXC4YyECNKwp4PA8u
         edhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724832711; x=1725437511;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ok5cBxVxaPwKYrTNl8M9e59G2es3jRCQAGdlCM5p44=;
        b=VCs+hm0q8LDCglsIL2YdLca0eZaHxkUAbiEK3E47OBDo908hVCBgyUr6Hlthlo454K
         oSbhdDBWVy8hbTzMtC4g67+I2XGvREkaCH2XT6fG1jnZZF1PPnk5UiDd3BDE542T/G2D
         yZcOgL7DJieOgbvnRpUGzPM9A0s4ZRirrduJu10pRLgxbOwoFEZAx2ZD5knLIbokdtcr
         X9B2K1RV7o6R2Q0nM/s2PUBduJyT8zNHa5KpjmFfYuHcHrK5cuEq2ZrQWnq5MIONnMBa
         WuefG0+JYBuY7ZnrFhoLAopQDUqqejYLftoy8xTbJlI6sbZ+UcO9+tusiPpyj+H9mZJ7
         17DA==
X-Forwarded-Encrypted: i=1; AJvYcCWD5QNq4AK22e1BwXegHT9wJ8Gqn3cAkoCg0cC/bnnMO8UkvpVQABtrwmgb5yHV7TcYcOPkmtw3FxqKMe62bqbEog==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUyuhR1GHZUwfTJvXwVZjGlVGVB/unHVqW+t7Pqthb67Cqpdua
	O3SchqzXwjeeQsCEI4qS82s/HVXBuz9aprBjH3hP6tQ0Z3s6gQQquvHBAs+iqkE=
X-Google-Smtp-Source: AGHT+IFjKuTmNbAE+UCPDjaAVs/phS4B3XFFgZWaofLJjlir/ZZOFnG5p7cDeVAgRldvefalgotXAw==
X-Received: by 2002:a17:907:e6e3:b0:a86:ae95:eba3 with SMTP id a640c23a62f3a-a870ab28983mr92381466b.62.1724832710612;
        Wed, 28 Aug 2024 01:11:50 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e5878fc7sm205733766b.168.2024.08.28.01.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 01:11:50 -0700 (PDT)
Message-ID: <1f29901e-1076-4742-a1cb-c69903afe902@tuxon.dev>
Date: Wed, 28 Aug 2024 11:11:47 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ravb interrupt storm
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Paul Barker <paul.barker.ct@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <CAMuHMdXs=T7Spiu8N_xgx=ai3b1Bcx3qcncwUMwSoN2T2oRFpA@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdXs=T7Spiu8N_xgx=ai3b1Bcx3qcncwUMwSoN2T2oRFpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 28.08.2024 10:53, Geert Uytterhoeven wrote:
> Hi all,
> 
> Yesterday, I saw an interrupt storm on Gray Hawk Single after s2idle
> with Wake-on-LAN.

Do you know if this used to work after suspend to ram and runtime PM
support added for RZ/G3S? Not sure if something wrong was added with these
2 commits:

e95273fe4d02 net: ravb: Simplify ravb_resume()
b07bc55cbb1c net: ravb: Simplify ravb_suspend()

Thank you,
Claudiu Beznea

>  The serial console log was flooded with:
> 
>         ravb e6800000.ethernet eth0: ignoring interrupt, rx status
> 0x00000001, rx mask 0x00000001,
>         ravb e6800000.ethernet eth0:                     tx status
> 0x00000000, tx mask 0x00000001.
>         ravb e6800000.ethernet eth0: ignoring interrupt, rx status
> 0x00000001, rx mask 0x00000001,
>         ravb e6800000.ethernet eth0:                     tx status
> 0x00000000, tx mask 0x00000001.
>         [...]
> 
> and the system became unresponsive.
> 
> Do you have a clue?
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

