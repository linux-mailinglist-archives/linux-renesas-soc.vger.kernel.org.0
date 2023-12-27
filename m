Return-Path: <linux-renesas-soc+bounces-1254-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 105C381EE4B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Dec 2023 11:44:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9D72B224A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Dec 2023 10:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83AB944377;
	Wed, 27 Dec 2023 10:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="p4lS0a2C"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B697A44373
	for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Dec 2023 10:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40d60ad5f0bso299505e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Dec 2023 02:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1703673833; x=1704278633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=psn+iTqR/9XLop+81fIG4XBpTo4yHjFb2NMDUgrpVV0=;
        b=p4lS0a2C+k12HosYxldW+c9GVcpRQAQYIw4MFI8FtiL6A+P4a3Wb5QBcLx87L15sQg
         6TjLLQXdiCk1we2MFcf94VSO4e+uOa8kmr7ONcAqVV4QL2lRPgSNzrdFS678rZz8te2J
         NvSKA1zEjbczrrBvQ8V7qkhW0kxNsIfj842qekuunJ+UIUzjFE0zrhn/M+Ac25qSiDq9
         vTNOcmv3qWGfcsgP9Ox8YLIwCT9c5KB5EY6nQrPwMLv5xkW0wZWqNw4tIz22lZ5/Wc7Z
         eMVpBylR9eunWFZFNFkXqapc2pZdsmGVcujGXtW3fqdvsDqMOyX7BrvU1tqq0wtLWiNS
         Z56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703673833; x=1704278633;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=psn+iTqR/9XLop+81fIG4XBpTo4yHjFb2NMDUgrpVV0=;
        b=cLcbVTXNOXnmK2f1H6Rpb3HYy/45/L+tw8/SLzXjthsnW1NkoefTcS2ckWQ7hRuf0n
         GKn1GcP0DgAjXaIkYXqUiz+uZ2JRYbbvb0yWrb/f/8x5+2xjML7Jk4zYMU643ck1O0QA
         mintWr+0b4PB6BRjCKkHOrPhjPBV/o8mL95cvjqtwtayW2HupXokZRWVnOGzzsySIAOF
         k7yplxKzqF+rcLUieft8PW3GQUGdB14/0i6Ofto7aueTzAfeXONtgBtw7snVQ8qjHPsf
         RefsRkyJA9CJmaoOkgxgdW4Al1Q4xBYJuEslwjvwPjuG+MzOP45jpYQmKDymtrw4pOCS
         sVRw==
X-Gm-Message-State: AOJu0YyCikDw4ZklFmmJ7N8QFmLDuTJTEd6pW7r+H07I2020vGodoBrt
	6OkQ0xX9652pF/l1HUNM8T9c281u12ND6w==
X-Google-Smtp-Source: AGHT+IEi0hPhVmmuIpcX/7Sf7mfwXdqMNq3yQ1/e7DEySKa1sy84Ci4QVXInPOphq1I56Q3IlsLeOA==
X-Received: by 2002:a05:600c:1f17:b0:40d:5c9a:de3b with SMTP id bd23-20020a05600c1f1700b0040d5c9ade3bmr747058wmb.47.1703673832831;
        Wed, 27 Dec 2023 02:43:52 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.140])
        by smtp.gmail.com with ESMTPSA id g8-20020a05600c4ec800b0040d60bd6ce0sm40185wmq.39.2023.12.27.02.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Dec 2023 02:43:52 -0800 (PST)
Message-ID: <1404c7ee-c9dd-4f2d-8f1d-d87310ceab8e@tuxon.dev>
Date: Wed, 27 Dec 2023 12:43:50 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 1/1] net: ravb: Wait for operation mode to be
 applied
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 yoshihiro.shimoda.uh@renesas.com, wsa+renesas@sang-engineering.com,
 mitsuhiro.kimura.kc@renesas.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20231222113552.2049088-1-claudiu.beznea.uj@bp.renesas.com>
 <20231222113552.2049088-2-claudiu.beznea.uj@bp.renesas.com>
 <98efc508-c431-2509-5799-96decc124136@omp.ru>
 <d5448a91-a4d8-444d-9f96-083049b1e33e@tuxon.dev>
In-Reply-To: <d5448a91-a4d8-444d-9f96-083049b1e33e@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 27.12.2023 12:10, claudiu beznea wrote:
>>> -static int ravb_config(struct net_device *ndev)
>>> +static int ravb_set_opmode(struct net_device *ndev, u32 opmode)
>>    Since you pass the complete CCC register value below, you should
>> rather call the function ravb_set_ccc() and call the parameter opmode
>> ccc.
> This will be confusing. E.g., if renaming it ravb_set_ccc() one would
> expect to set any fields of CCC though this function but this is not true
> as ravb_modify() in this function masks only CCC_OPC. The call of:

What about ravb_set_opc() or ravb_set_ccc_opc() ?

