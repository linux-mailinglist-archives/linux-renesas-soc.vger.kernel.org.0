Return-Path: <linux-renesas-soc+bounces-25932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B73F1CD1204
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Dec 2025 18:24:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17258303BE12
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Dec 2025 17:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05934337BB2;
	Fri, 19 Dec 2025 17:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="G22Njx/w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851BD21767A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Dec 2025 17:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766164893; cv=none; b=EKmXmk2MzGeoKIAYVvGbikhGoQkUQwWibiLicHSlHz8tXFisfvNjNE4+NfwW4c3ERPeeAiLZEE4NRTouEA3ygsAqNoQcwcyJ7GyZTX4bWVkdDRKvnO1lIKQwovL9565HMaLHxddc23btOH+f/AHwILn+LSEP9Ay3s9pg8pnpfp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766164893; c=relaxed/simple;
	bh=Eu7fYQUBOXyG224eItn2cWpfYezwnojs51HJPGnoyso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PKggECJgN+jk/yFmr5rblT0KkKSq9vsqnC386XkL749DAUZ90olMLjX+iTdJVTSAfrscVAaPFoQomp9vv0gzRt6jvzgzoOwDaF+dBkzwMJkrFiDuEaCkwH8XVDCs/tr+WfOkUDKSrq+r4FvS0SFxnz+QoigTAj57OXWgDDN2KeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=G22Njx/w; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6418b55f86dso2707409a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Dec 2025 09:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1766164890; x=1766769690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7nzQHHF/S+BccOb8wa9qfv3IuOW99jPcII0xzfB0+Go=;
        b=G22Njx/w/A+tk6D2UIpMxyoLxg+FQc8iliWhVyb03p5QUZ+uclrlQoU97nW0oLhWKk
         sAa+kajIYmnum6p/TDC7POEtlalIJabwXKOukAPd9y/u3zLf1KE35JS6nSNmHXvu9tuo
         wIRbyvE9CnI2tMi2Qk7y/3BDPzCE6qkL70enasONG34gohbMQQ3XWOJGYrCwvOYtZ4Im
         t5L5WRa4EeCEX8eD4ZT6ls2lxFVXjzGNMnDIGlk22QOYZggCyK8x3VaX2Yj3jTxWbzrU
         Q09QNqXgiJ+5XS7dAur/jG7JBjPpuILeJhAkIS8gcZzc7UMb2kdRTEhFK1ODJ19r7mjL
         8FJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766164890; x=1766769690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7nzQHHF/S+BccOb8wa9qfv3IuOW99jPcII0xzfB0+Go=;
        b=gsMHwxCgfBZVSJf2UaP3RUecT0s+0l12SxB3a9BSphmkFkR/6vFGCA59bSCTRhpx1l
         tNIGxxWogEczZWB05IhAMeroANI+03LAb5fwj7RtktbbnaZ5NuVwPTD7hSZ/GXvHLb3l
         Oj6cM01VQ9GmhBbZLrL+cyqnLibfVtMxYjS2EhJr1FE0Qxvt8sVOJkLyA+jJTrIaw8b3
         dfahWJWCvuv7RB8TgRNbgnrx3lRvmAswlZRSS28M9VX5apthQZz+DW8N0LDZP91XOYMC
         cq1halFePHdbsMWZ+wT56uHR1MIL+gzPoFQMNY5TlwIDlD8JSXsLeG4g5aojfsAQhb7U
         XF4w==
X-Forwarded-Encrypted: i=1; AJvYcCUMF4aBu2F1gLmXPtQFxPQA0Clgf4ZOeiYxD7pnBmyelcq5G2iZBDmQqrjzlQp+/1PQ9rZtHRkZFOFirubAhrcdrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxusBVJNcJ3aG6sDOCsCN9vBWX4DPdY8PGjFaysVCnobcdZpJd
	qWT2FyOEDkMMj+7CXQnFyPHUDjg32WYocU2ZAQqJnrCHKExzwVBENvI3khfaPwMAoeI=
X-Gm-Gg: AY/fxX7FIOibAmU5V/+8zVybGxvSlIJHcEacQoUHe3Ee96ItMNxuwB6XZ1opm4pQCs1
	7zbOfP08t0TYlJx2Nh4GpVxb2mBuOB55IKW0hWHutMfc3tDWjanBiF1XCq4Ku8ijARoBOeP+Hw4
	gau1X45Cz9Ddl73K4LOCsEOf28H04Sz2sN1J+7yHqhiX/0yCaP2H/rT/Is4U78VOO9urSJffWnV
	Lllt1Q2yR5Pn8dj0IquVnFyse3W6CoSqf4fqwzvUM9HlOb08+cDCr0/5Iv+x+rRxjYegy8FucGB
	I9I2stAOww51th5i3uSQYqxaIy5wkSDIylizw7l1W0qccIWUvjJOEeS0jfaVyyY+Iw2b1afngdY
	XqVOnWLaFM5die1Qt+XtZn78kG/sMJR3OOB1tPZZDj1I/aY6T8U4zfCu1NNQqsVeX/0Wj3MSTid
	Q/hk85U6YLfy9Ef81fgg==
X-Google-Smtp-Source: AGHT+IE6v83ThLR84HAPweCtmBhiOxhwyezgVI3gOrK46YZQBm9NnevJEXxrckISudnh+58Tk5217w==
X-Received: by 2002:a05:6402:35c1:b0:64b:6c8f:f99f with SMTP id 4fb4d7f45d1cf-64b8ea4b9dfmr3263450a12.12.1766164889674;
        Fri, 19 Dec 2025 09:21:29 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.17])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91494c0esm2667948a12.20.2025.12.19.09.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 09:21:28 -0800 (PST)
Message-ID: <d1a9a430-ac14-4d19-879b-57287b434cc6@tuxon.dev>
Date: Fri, 19 Dec 2025 19:21:27 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] PCI: rzg3s-host: Cleanups
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, robh@kernel.org, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20251217111510.138848-1-claudiu.beznea.uj@bp.renesas.com>
 <aUU6J5anuzNgSeBr@shikoro>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <aUU6J5anuzNgSeBr@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Wolfram,

On 12/19/25 13:42, Wolfram Sang wrote:
> Hi Claudiu,
> 
>> Series adds cleanups for the Renesas RZ/G3S host controller driver
>> as discussed in [1].
> 
> Is there a branch for testing somewhere? DT parts seem to be not
> upstream yet and I don't know all the dependencies probably.
I pushed it here: 
https://github.com/claudiubeznea/linux/commits/claudiu/pcie/follow-up-v2/

Thank you for checking it,
Claudiu

