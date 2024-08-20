Return-Path: <linux-renesas-soc+bounces-7936-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B28957F85
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 09:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47F161C23850
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 07:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DD1188CC4;
	Tue, 20 Aug 2024 07:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NcdUsqbl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF99132124
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Aug 2024 07:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724138710; cv=none; b=clT7yDHJMJ/Dnd5iw4i2dAS4Dtrj97pJWnNBB7s91DijFwEpu8YcLndLcGzz0yKGRP9XOd4u+HQlwHeORaoiDkIzmC5Gon5sUVUQT504sXyAAFhtF1LsoGZbqWUdirVEFEb7t1wmKPd1hN2AWY/yMsmde1PkY9V9LRU4ZKQxK00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724138710; c=relaxed/simple;
	bh=dgqu4JYBQj2QnVeSbZK0OLE8UCJZ7xEm/wPtjtV1EH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B9t3qcix44nNAKRIp5wHLNWIui0da6nCiiDg2jR90bBH/FEKwBFl3JhtS5y3+em3Ij6AuV1VVVi/Eqlhj7Mp274Row/duliTQxXen7pspiMVS82HK33jYcgs1U/Dz/o3puOp3y1EvcBxDnBKbnECrtLIykBpt/2wHtHAcsyYJy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NcdUsqbl; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f3f0a31ab2so1501231fa.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Aug 2024 00:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724138704; x=1724743504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KY+Pn7UxCWwux6Nl2NUqCDNWg2E6CQrceaqKs6911ps=;
        b=NcdUsqblH5apsH4vsbX0zy/PenbHRfhF2aQRPp5SXI4EVc6Ju1N/eCcybzg4R+vQxz
         HRpP7t7spq/b5O8wWy/BU9R3Iim2y7LdF1dCd19tJZqFw03Qhxhk6zIoeQv9MSJSIJFt
         7RzMHLWF28hHUxdscfRx/jAi3CxvdLjB4mF1s8Txmw6wtyNxyud57WHtralQ+/lDE/r/
         FevvXmXGHgh+pqTdEl4SB+gYUOmktDy0KwWWz3evMkyyw+JLRbdNSJRHVkbbeOzFhuUs
         JyrMKbQkcb3QN5+WnXXMxjUBplg8C44ge+/YYLWmeNMGjyi5FdGxABeZrx8yOBUhFtGU
         09dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724138704; x=1724743504;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KY+Pn7UxCWwux6Nl2NUqCDNWg2E6CQrceaqKs6911ps=;
        b=mCk3wEi/mqWXeL2qeXgcNWHZ+PvKtrdI5ISg9dcVIRuAACXyMy8yw8d5x3hrJknbYu
         01/XqGLbUJAO1mwOdxAwboD8z9Gscjo4cmtSMAPuTPPef4fvXArJl5olrT0hTJHnZux7
         QwidPUZElnmbFx/mCYxnZMfb7L7rv2XckIGkv+mAO2vqU5DuVO/KYxPqOqzf0TN24VDS
         4uC0dkAnGxQFBZyjJlcKFobUSaHCkJGvMQxEs5+q9DFgxeBlMF3xcQQPXTcFNqDZ0Jdr
         ZIoqqBSllXR2bshGyRAL46RK+rba5f360r2fNZfjY5BeP92cDMUM1MGLBBVZQQ//83fr
         RnVA==
X-Forwarded-Encrypted: i=1; AJvYcCXsjS02USwAKNNEXxcRUeZaN+aBVn9xhh1kOam44AKk42bn76p+zvINHEmf3+ZjKvOC6cB6TUJHRTLLl8s41lzjpQZ3YRlKYlNuSPDkoAH2iDU=
X-Gm-Message-State: AOJu0YyfhRrJc03OZ0CGw4viBDRZ8fgZ0cSZqvk8qxlYvvwZefXcF1n3
	9O/WIAYOix1RNcVoz8UxR/vwAJq+78twTITPItzI3yNCeiZgBcJbCfjlXKeD2uA=
X-Google-Smtp-Source: AGHT+IGTPNA2s+cNW2f69+8kmFELCsr7npIzZBbuC3yWFsocerzVeG9BMezpjpbwoOvRtOjCVaH9Zw==
X-Received: by 2002:a05:651c:b06:b0:2f3:f1a7:9813 with SMTP id 38308e7fff4ca-2f3f1a79bf2mr1817831fa.43.1724138704232;
        Tue, 20 Aug 2024 00:25:04 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bf0b0cc99fsm684362a12.49.2024.08.20.00.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 00:25:03 -0700 (PDT)
Message-ID: <c9a466cc-97b5-465e-8420-ce69f307b362@tuxon.dev>
Date: Tue, 20 Aug 2024 10:25:01 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/11] i2c: riic: Add suspend/resume support
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>
Cc: chris.brandt@renesas.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 p.zabel@pengutronix.de, wsa+renesas@sang-engineering.com,
 linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240819102348.1592171-1-claudiu.beznea.uj@bp.renesas.com>
 <20240819102348.1592171-6-claudiu.beznea.uj@bp.renesas.com>
 <ajj4fwoob5wq5guktq2b54h55fn5qlcakiybq6pk3xagiops7d@abpwevzemidy>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <ajj4fwoob5wq5guktq2b54h55fn5qlcakiybq6pk3xagiops7d@abpwevzemidy>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Andi,

On 19.08.2024 22:37, Andi Shyti wrote:
> Hi Claudiu,
> 
> On Mon, Aug 19, 2024 at 01:23:42PM GMT, Claudiu wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add suspend/resume support for the RIIC driver. This is necessary for the
>> Renesas RZ/G3S SoC which support suspend to deep sleep state where power
>> to most of the SoC components is turned off. As a result the I2C controller
>> needs to be reconfigured after suspend/resume. For this, the reset line
>> was stored in the driver private data structure as well as i2c timings.
>> The reset line and I2C timings are necessary to re-initialize the
>> controller after resume.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> This patch doesn't have tags, so I'll add mine :-)
> 
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 
> 
> Just one thing, though...
> 
> ...
> 
>> +static int riic_i2c_resume(struct device *dev)
>> +{
>> +	struct riic_dev *riic = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = reset_control_deassert(riic->rstc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = riic_init_hw(riic);
>> +	if (ret) {
>> +		reset_control_assert(riic->rstc);
>> +		return ret;
> 
> Can I add a comment here saying:
> 
> 	/*
> 	 * Since the driver remains loaded after resume,
> 	 * we want the reset line to be asserted.
> 	 */

Sure, thank you!

> 	reset_control_assert(riic->rstc);
> 
> Unless I missed the point :-)
> 
> Thanks,
> Andi

