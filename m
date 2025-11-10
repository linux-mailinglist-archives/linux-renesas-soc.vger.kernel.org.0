Return-Path: <linux-renesas-soc+bounces-24420-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83ED5C478B8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 16:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34806188466C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 15:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB46241C8C;
	Mon, 10 Nov 2025 15:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Eah1SoS9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D610123D2B1
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 15:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762788428; cv=none; b=qFeV+Q+j0DVMRPMX35sXR2J2ycHHoXq9ZzvRkojRpr6+lJJgCGCXVRVbFehliqMCbAKYYWZqQGtkpTrA0Tkd7Nx8TmHIXCh9HhXZsxGB04zrORpxORFiqFrpZH6a8Ftu92GnQuAq0gizfeNvV49qNNN8CHGmZzPpMknFBCCw+fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762788428; c=relaxed/simple;
	bh=2+TwJQ8oA9Lyx9ApVt+VKWFMh5SdFjYczHAvYgBcGSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ml14swrPf7cZfVKo8tQnM3fwV+7D0L44C4wB6woKB0eZtuVRF/+XcbQlSl1NLzB8nWGBog4q+HPjqhSTbZfHXI+VT5lsu2TrYst6uaSktlk86yab52w3E6Vq+LiNNKxSXNFGSLxrrg2DB+dLF8N/39YYAmOEi6ymC9K9LM7t5Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Eah1SoS9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-477770019e4so21843995e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 07:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762788422; x=1763393222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sU4Vu+5Nhcr+sXRc68w+sgESrqt+otDbTB/fX8fU/W4=;
        b=Eah1SoS96coR8VnG4Wqa6NTOPARugIiuddHN51RcI8DEVg+8iy6Znbeq3m0juLUfQ4
         TXU+t2xlBk1YuQh2t9modn0swMr9n4pqFDbizNK7gj00hLE9nDQKFBMA7y70z14ANH5F
         n60DIPoIuOPDci4DFBELSwR86PvkVj+rFiL4CUCTL2hb6AOmo0VxqRM+WW/xYaUgFMXc
         amVIeKhwTU863j2JWIBZb40B0fsuiw2Mwr65uNzfGsPwfrKLc27NcjmwqwUmYMR3VWdU
         rpgi/HYd8ZTQc+siTfWlPcwZ6kH1Dje7aKHpYGex17qG6vgS9zJmGr3fBi0GZhxVAgtk
         8Oeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762788422; x=1763393222;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sU4Vu+5Nhcr+sXRc68w+sgESrqt+otDbTB/fX8fU/W4=;
        b=rBiHywSYOUZJ7/vWpEhWg2JxZiHycbk6nEZGClgp2rGNOr9me8lsA6PmLwltygO00w
         BQMEed7HN9J7r5kmB7VbFrrTEHeogF3SUKivJoQ0WruafkckG/ZJvyYKsaBLLZTfnoRo
         2oiM7z51zwLxbYMySQ1h9ysvho+NS+nrlKH32blVoGsosQi2AyoNs4FJ5aTGk6WsnkuU
         810zrvs/z/kfQkcbWjCa9vadZ2vuw1i1YIU4SjCpnAabqqgDc8HSJ7qyj/AN3sIutoIl
         kJNNm24Ha6T91QUel678aZBQFaEapY5hXop69cQy72Zm1l5BD3WdZPkbl5OdWw5H07yO
         b7mA==
X-Forwarded-Encrypted: i=1; AJvYcCX4mbggv69/GI5nhgxnPY5r/31vZXLIdo7xzGKuLaU/LzD+fA/QaIYVrmuQ6kz08d4isQnGm9WNwbFWR/XzD3XWFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtIwiMemjq0rD7yPp+5PBlXncN7e3BXlgkMqLuu5Xpuh7wNkKu
	bq9/74lMb2835yh6DrMa009p/31+PirxEsNhZmaWcYMBDn2kn8BtieXTEG2E3FJq2mA=
X-Gm-Gg: ASbGnct//HzKaZhVAxmf6Yky56M/k6Y7KRY5U4NjbWUozYfq+S4UsxxqpmhyG2d9c2c
	d8PIGv2S6mb93Hu9zkhMJDuSCoHlEjeNV/pgWDSyOPFQPRIZCvox2UOt++PmwUe6zlmqjO2AUfV
	xBjtcI/aLn/rXGuunN1oHzkSrteZlg1G+Krio4HsYY34Q7D8eTT3jUQL0iEOM+7WHgTviu1rp8W
	oA1DbTEydOAJawr1XNWTKIajSdgTEQ57aAexAWNR26xB/nH9pIn85mEMkJpHj3cKqvGtXkoTRyN
	5E11zGUkeykNb7kEmHrRVZLEXMddUo2UH4zswJMcGqKx6yScpXzTR8x1fEr3O0hPLzym//nzFZT
	XK4rxRsBkkoMF60xFtb/seGPRXQvlEAReqovZVYdaCOt6xIawlDqqCHO62Q7XH8pbgQwuQ92mCc
	w1d5M1JlzX
X-Google-Smtp-Source: AGHT+IGKa6znPzwKr8w/TiVXgulW73+wNboeJt9rzEOBoA6V/J1joYMMoFHr1OJr0Wko0CzJFczvYw==
X-Received: by 2002:a05:600c:45d4:b0:477:1326:7b4b with SMTP id 5b1f17b1804b1-4777326eb64mr76072995e9.19.1762788422160;
        Mon, 10 Nov 2025 07:27:02 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce2cde0sm329772085e9.15.2025.11.10.07.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 07:27:01 -0800 (PST)
Message-ID: <fecb65e5-f434-43c4-9132-cfede05eba0e@tuxon.dev>
Date: Mon, 10 Nov 2025 17:26:59 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/7] Add initial USB support for the Renesas RZ/G3S SoC
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, geert+renesas@glider.be,
 magnus.damm@gmail.com, yoshihiro.shimoda.uh@renesas.com,
 biju.das.jz@bp.renesas.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20251023135810.1688415-1-claudiu.beznea.uj@bp.renesas.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251023135810.1688415-1-claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/23/25 16:58, Claudiu wrote:
> Christophe JAILLET (1):
>   phy: renesas: rcar-gen3-usb2: Fix an error handling path in
>     rcar_gen3_phy_usb2_probe()
> 
> Claudiu Beznea (6):
>   dt-bindings: phy: renesas,usb2-phy: Mark resets as required for RZ/G3S
Gentle ping on these patches.

Thank you,
Claudiu

