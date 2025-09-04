Return-Path: <linux-renesas-soc+bounces-21369-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49021B4464D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 21:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B65BF7AFC39
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 19:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE83271475;
	Thu,  4 Sep 2025 19:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="0KD8ErqY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3067E26FA6E
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Sep 2025 19:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757013767; cv=none; b=RTr2C/HDlKP0Oi6VOuRRpMkimHNgSPgSR/o2a3UbBSTqV6BSiXrQR1HHMJixtRh4jhvGwaFtVqW7KJRIeNDjEuM5Sc9wEr3O2m2N2bW0CdCDYISEHJBwIieZp4QjWhcwL0qOgmNn6qRIjgSm2nHBpZfKZ91O4bzpctds+N/+JgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757013767; c=relaxed/simple;
	bh=cvHLF5lIxxEYKCDL/S6Atw9RYeWBQtPXcbrB6/hY5Fk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l3R0yafF/niXYHDOqOXn75f0geLov5weZKMw5WvRhn+kMznOnY8l9wKz11wKwnkBwuDLED+pJomJI21/flcNEVPkzz/JogBJV5EOD6yOmJX7w/G/YkBLvMdZnz9Pvut+oW2zph/+RdA4joEeXyj+gFpVSL5pBjCdkq1lfjFdlww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=0KD8ErqY; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb7a16441so210117266b.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Sep 2025 12:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1757013763; x=1757618563; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F8DNqWy7PFA1m3JpqcxAelInf9yGcTh60eYTIOaOZ9g=;
        b=0KD8ErqYEQ5vHzX7A04diJNcIVzKk4MwY38ZJBcgC4hW2NaTJylG1YSzASphWQv8Lp
         +bHxb4Z1xR6hjN1k1Xf516hPVPA348XXbTLE4BYi8Zl06SzbCkykdT8uG7Tegumsg8Cw
         yNo5M+eUugfMVyu/ItV9IUX5yBiyaL8U4GAG2LXHrLTyygm+OVshtIWCay9KWj634VYR
         jwWQGrIkI0kZRR7SoLjUhMop0EC2XEfTIqbq5r8nn0pziobKD1qZdiyUUYI+oTDRftGU
         /SnnAm+6WHVeTRUUB5bNO/M8rpgWCBHQRNwzl+D5hroi6d7JX8tV8Bp2axDukXF/Wc9i
         ePDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757013763; x=1757618563;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F8DNqWy7PFA1m3JpqcxAelInf9yGcTh60eYTIOaOZ9g=;
        b=FmJ2OqzTziszJlj84CIGR/xjAYlrdxuZLiPJUz4f79oHCpcPqeO1S5ih/lSwlzhWLJ
         7c4HK2WMl7IlFPpNNulo4L3M+s9VD6eSSOhNR17HfFrjkNr+Rks1j3Iu+3g5DzwDYavl
         TxuombYwk4hCgxYQDYWv2M66WhZDeAD/1vll9mrzzgIcDiB13PdbVhR7Rna78XGmFNm0
         RjUqZziNKbVHVgv4Lkv9oSrTQRbfCvauuWmO5IM35MnxPiOncNNJ/XwcC5aRuX2Eg3aL
         nZYayKybv9bM545pwYAhdJMtpZ46hK8SdWNWGZhzSk+bfmvmXDuqHqU4PslmiuYkk9gK
         zclg==
X-Forwarded-Encrypted: i=1; AJvYcCXSzIteCAjqf9ZvnBZp9r7EBQVwP4khyNNFBLQvL/KQ130YNF9807O+uMajicvWwbj4UxQTLkQcTfrf62pXTkAXww==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi6Y2uOaW4qbeKrIr19l1hY9GkguebYpE8kQy1aE01q25LgMrz
	+lEKJeSXlgtteLN08F/yHT/8fRjcq79Aopd1sA6ErcrCGcJPbXbDfB8NUoB8FB+YqPI=
X-Gm-Gg: ASbGnctB3x23pLYAMWrwg6ndEbO/XjOwFGAMZjsT77FqqUehQ1HFTThP9pj80+o5iSI
	2gLS6iu+5dVPtoRQw4fgfbINuLxMGRDN3bRkwwdgNrDyuMDR+TlnkWLNIDyo1yJe3y0gXed/ttL
	N62KBOKj5NMdVAafMQ9Lt2qKwB6xhMBrTDzbFundxklCBxzCd2SOUWzUtWY+ocw3RTd/O/fbzOl
	7Kj2ZNbIfnCKxJ2mjHrmZW3hiZRHgIrGJLvd4Do6MKrLxh8ZufEPaRtYA+/nHtmUsvS3HpBQt4E
	Qu2DO3ZV+CqkkaJlmyf46PhZ9BeSAnFtpU4csBQRIuH4NHLMMvzQfsG8D98m4sQ84gkkFrBQ1GW
	17y9YdCHJtS8Gd80r0kA5v+sy3O+3e5lwNuaXpqBPSOcPzRpugjwJjpmY8Ro=
X-Google-Smtp-Source: AGHT+IFy0SFOT7C901rftOYeqJCGJue7CBqku6XfDYtcVsOoql1kTJcq3KIN3uvTQDaPgL18Z8ckOA==
X-Received: by 2002:a17:907:6e8d:b0:afe:d597:f0c2 with SMTP id a640c23a62f3a-b01d97bd1d4mr2153885266b.56.1757013763338;
        Thu, 04 Sep 2025 12:22:43 -0700 (PDT)
Received: from ?IPV6:2a02:810a:b98:a000::503d? ([2a02:810a:b98:a000::503d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b040d44c9adsm1309821966b.9.2025.09.04.12.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 12:22:43 -0700 (PDT)
Message-ID: <e2243aa3-f062-4bee-9f1e-6e8728b5c486@cogentembedded.com>
Date: Thu, 4 Sep 2025 21:22:42 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: rcar_jpu: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <240d566d0c77b6db21f7e6f8dab50a46e68f4f4d.1756999968.git.geert+renesas@glider.be>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <240d566d0c77b6db21f7e6f8dab50a46e68f4f4d.1756999968.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Convert the Renesas JPEG Processing Unit driver from an open-coded
> dev_pm_ops structure to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().
> This lets us drop the check for CONFIG_PM_SLEEP, and reduces kernel size
> in case CONFIG_PM or CONFIG_PM_SLEEP is disabled, while increasing build
> coverage.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

