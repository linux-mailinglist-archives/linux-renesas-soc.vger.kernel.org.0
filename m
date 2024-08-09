Return-Path: <linux-renesas-soc+bounces-7785-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E99EF94CAF7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Aug 2024 09:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 941351F231EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Aug 2024 07:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFDA916DC22;
	Fri,  9 Aug 2024 07:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cUK+2OxK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F3D16D9B2
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Aug 2024 07:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723187344; cv=none; b=gcT7ggtA2ax9Mq6TIWbUkirM08FpB2eVmYQNKF50Z0IJ+beFmnHfkWqar0knuM+GqufP1gmoh7wntQ/bjSs85GlFgmwQk9auFtHh0hqxG4yonJILT3ry1q+hfknEWg2TUEAVy5S9CzXgv9NXfq15RWt62g9OXGrn+IUevD7jSJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723187344; c=relaxed/simple;
	bh=VfECz7OPrQqPTCXZmokmOw+YGaGRk23fu+dwqvsd0QQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=t778w5QPuHNESl8aDUWAwvIlFIK2tWLDJ63YyAZqKFcmnwm94B/y8tBpItaxtvCFCkz04GoRha7OfoFvNPu2w7vD0XMCKwmEGJSmHg1lyNaU69uTbPoskzY+CCbTq7aVMWazMxob2EwqZQypzb7nLOV0s0kbyr0wn8X8hFpJMdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cUK+2OxK; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5a1f9bc80e3so689397a12.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Aug 2024 00:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1723187340; x=1723792140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uyevx1eSZveednPIyrWDCVPvbsLJ4CSv84HEJGwgqRA=;
        b=cUK+2OxKdFs3j66gaTn6DtxLCFKl/B5tVAn18w+VYYnqMzHK5Kj74JR5FpKsi+1B44
         DOrmmM3HXPfOEkLlfXkFv9PDEPndLzAnfitoKe9JmqmwjSXxynLyx0Fi+aZjCjhBizvB
         EcMH150UGj3Anoi/DQfiBwD6fRKV4QRBSx140qzBSrT3v7b2uZIqiNAHMBXB6/kpL91G
         H5TyF0B8Zt7oJ5+w0cMXnybdq3uvY4kNMQWsfHYTmN9kD/qBwCD82bA1HVdaCIg/heWx
         L++AuzEdgVw0h6RC4C2hKbtvc6lbNGDwzFmMytRufKAvmB1/BGuhOuzy2dhMHTCvhRgL
         3AtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723187340; x=1723792140;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uyevx1eSZveednPIyrWDCVPvbsLJ4CSv84HEJGwgqRA=;
        b=Lu6ms5IHNeZYUDlEeNYbs86rqoSWfKZFH4MblO0G3G4GXAO61QThpvyXhXgBYs3Ug/
         r9vlvyY8NxwilXYEv9jTxPmhCGx1U8OA3pBsnG+LLdUBe1CV6B7ChC0JH/U0gajph2r4
         mIy6p4TP5cSz7ySIvDiPg/LJNAscUobit0dWS2SZ+CO4Sb4q6b32CG7vEcnNYnemz+9h
         kBAiHlVM+DwRldmxjOIMLrejb6GzYPsYnDpZrTN15hSX7d7qkmKYd3JpdMt5WOfGBx1T
         w4d404DB8s+tNEK6ysAFXMB2TlJ6ci5kAx1TJK4VYvEo8SpVwoTBE/MKZTDpA+JeDcGy
         IM/g==
X-Forwarded-Encrypted: i=1; AJvYcCXkWZ35A8hV37yIbgQDl2rU/q2AAb81c8Thof3qbvg0w9eXnxh6T9s0AvOE92Jwbx6z72x2vtYWcLkkImKa4Xw4B8q39UafCwp09ewLGZRrpvQ=
X-Gm-Message-State: AOJu0YwjshBhu1PrMVB8CMT6D3wz6fHInlZ5vhKYniXCsIaOfx3gJ0p6
	Ld8I8PiCVrfbdO3Ltk7WXulC4qXyJqfC7dLjWyP8Ci7DAZHO6ciOtDkCiYgp5NA=
X-Google-Smtp-Source: AGHT+IGS2QSI7Zek1QoyFMiJIsl9IBJLkppjoDYkqSIfv+JYsY3kSxvXPRLfJWdBp4iPNDsWfQLR7w==
X-Received: by 2002:a05:6402:2116:b0:5a0:f9f7:6565 with SMTP id 4fb4d7f45d1cf-5bd0a577cc8mr714543a12.21.1723187339798;
        Fri, 09 Aug 2024 00:08:59 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc3d77sm807642866b.43.2024.08.09.00.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Aug 2024 00:08:59 -0700 (PDT)
Message-ID: <8359caf0-5219-47dc-b68b-41486757be92@tuxon.dev>
Date: Fri, 9 Aug 2024 10:08:57 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/11] i2c: riic: Add suspend/resume support
Content-Language: en-US
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
 magnus.damm@gmail.com, p.zabel@pengutronix.de,
 linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
 <20240711115207.2843133-6-claudiu.beznea.uj@bp.renesas.com>
 <ZrTg-_Tzmu6whv_W@shikoro>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <ZrTg-_Tzmu6whv_W@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08.08.2024 18:15, Wolfram Sang wrote:
> On Thu, Jul 11, 2024 at 02:52:01PM +0300, Claudiu wrote:
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
> ? Doesn't apply on top of the previous patches for me?

I just checked it on next-20240809. It should be due to commit
e1571b1fb4ff ("i2c: riic: reword according to newest specification")
which introduced changes around riic_algo object, present also in the diff
of this patch.

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
> 
> Is this assertion really needed? It is not done when init_hw fails in
> probe().

In case riic_init_hw() fails there is no recovering way for this driver,
AFAICT, and thus there is no point in keeping the reset signal de-asserted.

In probe this is handled by the devres through action or reset function
(riic_reset_control_assert) registered by:

ret = devm_add_action_or_reset(dev, riic_reset_control_assert, rstc);

if (ret)

        return ret;


Thank you,
Claudiu Beznea

