Return-Path: <linux-renesas-soc+bounces-12539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 917D1A1D285
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 09:45:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECE7D3A4F7B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 08:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76F831FCD06;
	Mon, 27 Jan 2025 08:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="pdj5lU+D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7071FCD0B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 08:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737967508; cv=none; b=smTitxkpDfqnp1fXE4E57lLLMFx1rBxP+xQ/CsJTS+0qH6mNz8KQxM96UOOl+OvmcGs/osBgHnzK/pUE9cWQA1TeXk2/Nnz4kIyk3CTw97IpU4VtEwoFWZj2owze+MsqQYdup2QQFD01nXnE4+iIIa3zjysNxc1+MoEGumjBo3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737967508; c=relaxed/simple;
	bh=DRgRHg2H9HZndRrP19dAAUkF/GOcikF2Dd4jfd5iTPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HBX4UwveRGtrgRPlCTg18p8GXm9viYXd//m+cDsToeA1YhBHocU++Y1/iR4ukXyQj8HHUN2f4NkyjcV4hey3F1740yV0c5M3JOTbGmHI1vIUV9Khx4+FezrpLymVLeJLBrSlb6VYvKl4j0CfzUYp4aFjDQspqjs6Y4Nu+dIGHFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=pdj5lU+D; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2160355f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Jan 2025 00:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1737967504; x=1738572304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bz2kSYLl3e38VCG/b+eXaZea6pK/eL1ZVqCIQrW1rHw=;
        b=pdj5lU+DvNs15tLNvzWQp3FHPJNjXDjVDe2GnZ7On2VpyXlGi94/xA5UGKaq2JF9Ru
         wsRJZawYHzhwInDGtpodNfD1gOdY58gWSL7egw4DhN/8aedkXx+bb3SnrJVnRokoFwSK
         XKegrU/qbEN8nalAZYwhgqPQZ0YQ3FhZ2USQoVdhr12lgxbPt1Svvv9riynDRoO4cJ7V
         ckL/TKTRF2yW8/2U4a8Gy3mSgOxUrHFN4tdApSL5CvbJHVG2nwK1jg3v4affA7vRiioj
         Gh+EQH5mpCJP5+i6stSeyO/jLg42MYLZjepLSoxc3W8L33j7eD0PmzlpU9Rx9jH08BtJ
         FsMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737967504; x=1738572304;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bz2kSYLl3e38VCG/b+eXaZea6pK/eL1ZVqCIQrW1rHw=;
        b=FkFWhVxy34Hexo50ywyOtKJWuq3jtLyisqf5PJbRFWaLWIGby0+aif6n3gXZ7s5uN1
         DP1iWBsVRnGbyIZNfsmXI8UxU6dluZ4LnrDgtgLexbc8V+Okm6YoFlK3qIfykczr6g8D
         uaKV+aMWZQcdQjrEB32tG9yBtscC5gGB5tZvxuc/dt2onTReifndMLVu87lIEnJs18RE
         qD7haXBkY50knr//JDbktBlMj8D56jzh2q3+couIY3H1nnpHm2yaHYPuvX0PZhBPMQ2Q
         +iIWt6YntwgNpdzQMnt5cahE8zlrdPJdUftaHfJN/7/FRV8/JxIs27o1HKBhlNNzNNa+
         xi+w==
X-Forwarded-Encrypted: i=1; AJvYcCVNR2Xa+1v3K9zjMMS1Tek5rKO+ehSzVNFwk8n9/IPInayL86gcosIMn7/ER+jwEpICa3EZtXBs6r9qxRtevgXQ+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBhAtZnoHpTb+aHinmYXJ27bJKwL0w1EJW06Bd6ZgAKOYZlmA4
	yJLDkoVpSyOgku+vB6pceHoIsP+P90tNjQ0rRnsCglxg96pphAkkIC9myCKFV3c=
X-Gm-Gg: ASbGncvkTiVdhK/F8FXzXtwBQvb8jOqWdnOP5oV/698RLy2946CBc39AgIeMbDGrlcG
	/+P9FspMtTR4x8YKpqlDW+AZy6gjJp6M/o0YPRM7vP7VRXqMslTeWjKbhsMVrqMZvU/e6o0yNdS
	m1yJT1+t/rp75wGeiaqMAl/qJPNyjlFjxFIW4bS0PmF92g4WvBDmgNihOn44Lw1pCjgRP4lIBSa
	uydbxsPGM9qLukbz5hNqG/nwx4SCgHjJLzyq1e9SOP2hY5242O5IjsMsLu228NsTXeOudIHookD
	9qM+kWEN5g8n
X-Google-Smtp-Source: AGHT+IGWqfhgnm7mqqj6MlWyyva4ixlrWco+wQr8HSdWnEWxXD9z+L+c1tqnICNsQrM+oKfyIH0FqQ==
X-Received: by 2002:a05:6000:18ab:b0:37e:d2b7:acd5 with SMTP id ffacd0b85a97d-38bf5655900mr33401129f8f.8.1737967504213;
        Mon, 27 Jan 2025 00:45:04 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a17d6b2sm10635095f8f.34.2025.01.27.00.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 00:45:03 -0800 (PST)
Message-ID: <4074b42d-fb49-45ee-9f38-31a105ce6a67@tuxon.dev>
Date: Mon, 27 Jan 2025 10:45:02 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: renesas: r9a08g045s33-smarc-pmod: Add
 overlay for SCIF1
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 p.zabel@pengutronix.de, claudiu.beznea.uj@bp.renesas.com,
 wsa+renesas@sang-engineering.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
References: <20250120130936.1080069-1-claudiu.beznea.uj@bp.renesas.com>
 <20250120130936.1080069-5-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVjvKmR-0ZiYGiAwXf6dfx9O9HtG2JXht9iDwV7oKdwDQ@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdVjvKmR-0ZiYGiAwXf6dfx9O9HtG2JXht9iDwV7oKdwDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 24.01.2025 21:15, Geert Uytterhoeven wrote:
> On Mon, Jan 20, 2025 at 2:09 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add DT overlay for SCIF1 (of the Renesas RZ/G3S SoC) routed through the
>> PMOD1_3A interface available on the Renesas RZ SMARC Carrier II board.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
>> --- a/arch/arm64/boot/dts/renesas/Makefile
>> +++ b/arch/arm64/boot/dts/renesas/Makefile
>> @@ -143,6 +143,9 @@ r9a07g054l2-smarc-cru-csi-ov5645-dtbs := r9a07g054l2-smarc.dtb r9a07g054l2-smarc
>>  dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc-cru-csi-ov5645.dtb
>>
>>  dtb-$(CONFIG_ARCH_R9A08G045) += r9a08g045s33-smarc.dtb
>> +dtb-$(CONFIG_ARCH_R9A07G043) += r9a08g045s33-smarc-pmod1-type-3a.dtbo
>> +r9a08g045s33-smarc-pmod1-type-3a-dtbs := r9a08g045s33-smarc.dtb r9a08g045s33-smarc-pmod1-type-3a.dtbo
>> +dtb-$(CONFIG_ARCH_R9A07G043) += r9a08g045s33-smarc-pmod1-type-3a.dtb
> 
> s/7G043/8G045/ while applying...

Sorry about that! Thank you for handling it.

> 
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds


