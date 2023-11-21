Return-Path: <linux-renesas-soc+bounces-24-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB137F285C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 10:08:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D577B21279
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Nov 2023 09:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F64F3FF4;
	Tue, 21 Nov 2023 09:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gs5ghXbM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22CFBCA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 01:08:40 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-a02c48a0420so15162966b.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Nov 2023 01:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700557718; x=1701162518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hFovBB9Vql+9NqvkTFIq9gmXZC+zLPtoVf9iQ87ehkQ=;
        b=Gs5ghXbMoh6KH3HLauomQ4OlQysH9nBIz8H6zhc6Alzte5ttMUyTQqWaaJWrPFcPFD
         z2oZkKFUR5Gb9GYiswWC7Gt8dTZJtoKt8MRMZVNjlMzfVvovYB6mRBi2NKCpN7+6G/Ow
         Lz/7r2gLv1dEmy8w4Y3E2fRGmEPo9JmGvLtIGH1wWQwN7k8AgH8/oOWUS1SkebITO5E7
         bH/vfGvPhSm3lL2EBBtdecqyT9THKtW/1c1hvQkI0PyyuK333awT5kiiGg8ll9Hi2GW/
         NCdiMuZdDjE7NTQuwN+m8GXTEFQY4R6vV/Z1TAiNszLxQZOc7Z0s/8HppS6wl7Ujoxkp
         MjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700557718; x=1701162518;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hFovBB9Vql+9NqvkTFIq9gmXZC+zLPtoVf9iQ87ehkQ=;
        b=hivpYgC98Z3RzVDXnbwkXXrlBZpp08vrrigb1o7WBEb6rTe4PDT2ckYOCmeUOYBYf9
         2i9TJPFNorUmJO6EYnqDRY7XCyNpUwIRq5ZVf/PsHed6HZuYXkFcDxI7UlXk2RoSxbmI
         yMiyYzX15JdK6NrWCP+OU/hkxqDWVeEywTTXYExMzUtLAVjyd2xtXeNt7gMCMqGGou/E
         dPXdbWNO+UxDrNKz8JV5b5eDdBzP9Nj0f7wS40ql7GbTNUdvwZgBLTDikHajURYw0kqm
         JX9ZUfeEJfjQXScI9DM0ILu5/wCzCHKFBlVRjnAQaveJlWAYcye/9rbuS48mSutMZhGR
         twcA==
X-Gm-Message-State: AOJu0YxQE6Mwti8uXnVVpB7QwlzfMVS58QCrsPaKjMZiB0v0/6ex/yOQ
	8UQIXBdzj4m7ULbpCFi86OA0WRcYwFB7qGqWl+4=
X-Google-Smtp-Source: AGHT+IHBWYjp2SuF4+t2j5JN3xaFC8K8By+OiXOlIk2gqufFhG2OzCA2tqUueAoHAsh/3CbCrzAgaQ==
X-Received: by 2002:a17:906:2d2:b0:a00:76fe:9016 with SMTP id 18-20020a17090602d200b00a0076fe9016mr2182028ejk.21.1700557718572;
        Tue, 21 Nov 2023 01:08:38 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.11])
        by smtp.gmail.com with ESMTPSA id n21-20020a1709062bd500b00a015eac52dcsm843584ejg.108.2023.11.21.01.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 01:08:38 -0800 (PST)
Message-ID: <8ff39c71-a22d-4b94-ae49-a240a7797df1@linaro.org>
Date: Tue, 21 Nov 2023 10:08:36 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/4] memory: renesas-rpc-if: Add support for
 overriding IO fixed values
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Michael Walle <michael@walle.cc>, Biju Das <biju.das.au@gmail.com>,
 linux-renesas-soc@vger.kernel.org
References: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
 <20231108171149.258656-4-biju.das.jz@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231108171149.258656-4-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/11/2023 18:11, Biju Das wrote:
> Add support for overriding IO fixed values to control the pin state
> based on the flash type.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.c


> +
> +	regmap_update_bits(rpc->regmap, RPCIF_CMNCR, RPCIF_CMNCR_IOFV(3),
> +			   RPCIF_CMNCR_IO0FV(val & 0x3) |
> +			   RPCIF_CMNCR_IO2FV((val >> 4) & 0x3) |
> +			   RPCIF_CMNCR_IO3FV((val >> 6) & 0x3));
> +
> +	pm_runtime_put(dev);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(rpcif_set_iofv);

EXPORT_SYMBOL+GPL

Best regards,
Krzysztof


