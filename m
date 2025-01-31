Return-Path: <linux-renesas-soc+bounces-12770-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1DDA2394C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 06:24:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9EE5B7A3850
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 05:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A377A13A;
	Fri, 31 Jan 2025 05:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0TEBjcS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E4B20EB;
	Fri, 31 Jan 2025 05:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738301070; cv=none; b=gFp49QPDn7XIel2rPzC6tYH9knLqgPd9dj0EzbHuaYiIeUF1dlWrpHvzKnMw4eLCaKlSQVz7vpLPUQfSeHPddmYlmNnpP4yXLibEXa6m+n8LOs2bHLzBg2bybNYUKYA72UcKT05EStVILBWEbHJa41L3FGRb/pjDg4piIGKB1mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738301070; c=relaxed/simple;
	bh=uEaQNDnRabS19DktP9CQejC+CsMVFc0j34KpEn2i+CI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BKNLYhz6DzIv33dIL+sw4iL+r2xdRDPeF/eOeV4yCCCPovRhXsSnpgGyNwIEhOSlTLej1NQQB4RnzIDuLbHZVQlO89wpgU2fVekSwG84b0Ti+ClmeC4DGdiwbuWlAr/hWQKNUnifuIlXfEOu1RKlq1rkJbyrWUdYtNKlTuQvVGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0TEBjcS; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21619108a6bso27110155ad.3;
        Thu, 30 Jan 2025 21:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738301068; x=1738905868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=L0HOftXKvAHvcr2XI+AW4KKpr/P+I8tOr/VDHbgW+dM=;
        b=L0TEBjcSptjv+2l+xulgb5+K7Rpppb+xyPz4CBZO/H5eIX/BIxSv1RYGEqRpbDi/co
         21kpjp3sRvdWtToFeYDWrXmSq93xFe6M65GciDW9/swbnCZc/JFWbQXftvsg4fOSR0up
         aza9M62HBU2R2yG+hX84rLuCRQtdzh096bQWOwmedicVugEwVd1X/AUwsKLYr0FWIUAa
         oBeEZl99BLm7YVEGquM6GCnqvQRdlCVnbPp4/mGwqqnW9WB5DjrTZYyPila4B26wj3fF
         4Z0XfnutHuZ8OApj4bNu2dXKhLDqvX44XXBYIsXnq5qO0vy7/BtgtFBNO1s4gqGIvEQL
         N1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738301068; x=1738905868;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0HOftXKvAHvcr2XI+AW4KKpr/P+I8tOr/VDHbgW+dM=;
        b=GR47SnaCB9ElxYI7Me83GXdWHiQokgeIRw4EJ2Nv++8hsK/bQabyQNzuwDKN4faiRW
         uKgTim9NDrmXMZTs9xYqTpj/xW96BHOM6LtbGvt0yYdm80xtY0pUk0jrZ33z5/eTO7Xb
         lbiubelHZ5KUs0UX0NSUyurs0H8d/y4Kp5EDh0CtDU4d8B0XCRBusRhCNg7F7nhWfNcd
         4ZH7PE/io59GFC+jobMYlcLAN3lQgcf7PpC5uleuXdAky+to84tWZKq0iL7uClU8uGYk
         ObPEo4A9fSVfNumNx5Vf5x3YfsjtkDc9xXt8cc5syl53VqyBiPEMXEi5o6XHm4pi6zk/
         jOKA==
X-Forwarded-Encrypted: i=1; AJvYcCWaHCKGgC/vbwRUa9Q++F1RrrKfaRZyRuqubTXG/rfmS/06J0x1fG4y/cC/tmcmLJlgOLPyhvyjvPL59ZvgJ7itvh0=@vger.kernel.org, AJvYcCXKTWltvkvexuPg6dh9wgP0IK4HZzIvGgel5cYrPLylwxfWBER99Bq4xhVRUVdlIv4dDUB9qDK7LdsQoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQEy8+tSTXWcdTbiMME752EtId0S2pnvkqu9SIYgojaxcPaV2J
	8M2p+YxEBBrMrK3BomjsxlZo0O2p9Vo+KSQ9FTuAPvp1bQPSLRl6Dov4Wg==
X-Gm-Gg: ASbGncssKPV2MgGm/Sk8LbXQ8nCb1s3zAcF6ksAOspN47TkYLfZA8/xZlEwEI/Txt95
	AArh+K0lluHe4XOxG+PWpyZ8WYdsNdU+8XaAsniP2LN5EPflpFI8ksYgIcdCdUGNHgv4/nHVh4d
	YZ2GGwYJtPCkFJz8Rcb1xHAFYe5xRIFOQ8/6ujcAapvTaZIP67kZvGYeG+70w/sWwmyBQqhb0wX
	aZCQkUDBO6MABZKolvXveDWGMG/OudzR35hea5DIrXyp1231EpOsyQY8wETKJ49/Ct4EsbdNNgy
	sTxjnjy3/NIw54Q9ZAlmsdFor6Y1klCeziufx2Rar0lbxP+fCbMBXKCnEZ8yrh7U
X-Google-Smtp-Source: AGHT+IFnl5vyWsAjOMnqibTb4T/y/cGKcRO97Z7INzriFTl8lk0eulvslV6ZJJccPomVXRtKqz5GNg==
X-Received: by 2002:a05:6a21:3399:b0:1eb:3661:da3b with SMTP id adf61e73a8af0-1ed7a5ef9d3mr15718236637.33.1738301068079;
        Thu, 30 Jan 2025 21:24:28 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba401sm2358432b3a.88.2025.01.30.21.24.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 21:24:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <557697b2-caf0-4d60-8c42-2bcdb69919ce@roeck-us.net>
Date: Thu, 30 Jan 2025 21:24:26 -0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] hwmon: (isl28022) Use per-client debugfs entry
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-renesas-soc@vger.kernel.org, =?UTF-8?Q?Carsten_Spie=C3=9F?=
 <mail@carsten-spiess.de>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
References: <20250123160347.44635-1-wsa+renesas@sang-engineering.com>
 <50e84380-f054-4c2f-9961-6b8a1784ea10@roeck-us.net>
 <Z5s-e0JwnO7o5hj0@shikoro>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z5s-e0JwnO7o5hj0@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/30/25 00:55, Wolfram Sang wrote:
> 
>> I expect that 'i2c: Fix core-managed per-client debugfs handling' will
>> be applied in the mainline kernel by the end of the commit window. If
>> not, I'll drop this patch and re-apply it after the problem in the
>> upstream kernel has been fixed.
> 
> Rightfully so. Just waiting for buildbot success report.
> 

You dropped

	if (IS_ERR(client->debugfs))
		client->debugfs = NULL;

from my patch. That will make the pmbus code more complicated since
it will to check for IS_ERR_OR_NULL() there. No problem, I'll handle
that, but I don't really understand why you dropped that part of
the patch.

Guenter


