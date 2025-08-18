Return-Path: <linux-renesas-soc+bounces-20601-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60742B29929
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 07:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA78A1964E31
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 05:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D41B26F471;
	Mon, 18 Aug 2025 05:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="T1IMr5Lt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A2E26E715
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Aug 2025 05:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755496463; cv=none; b=QZvCwX1HkHDs6fYYZK2IDWuywo1sg1/y4G5295ea2g25ysZrSXqOtYTMiujaabnqMPZK2O1uQCK8c9XMvTUGUxTO07OeDC1LRc1eAwBzheyHTw54h7j1RmwUDO0ANQlBYCtA+LUGzD85d6Q7Rya4XI2V0toJ8SZ81hYoukEkSPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755496463; c=relaxed/simple;
	bh=rSwNLEEae3P9QEq2Hme2YrXdZ7yJVM2ZDx26GAa5T6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IrSZQZJOMF0M3ZQZsm1opA/u2Xq5bhqwmeJTudUaqWJnMdsNaI/PTlBF5HMnyInDgspdBtWzj9gDKfhQn4L+KBujGtBdHHqj9rdEpHo35IaPtFixcbNeVx7sSFMxiNOD6mlNE4XbApjI8PGQX6Xg8yQPrNiEsAS5OX3YdkqFDUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=T1IMr5Lt; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb72d5409so598486766b.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 17 Aug 2025 22:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1755496459; x=1756101259; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rSwNLEEae3P9QEq2Hme2YrXdZ7yJVM2ZDx26GAa5T6A=;
        b=T1IMr5LtRbt3st3jCDW41Yg8CU6X2qUVL/lH48ElYepRtMAE6v9UFbJKs25YYRLSpV
         1iMJ0iqYKK18zY49CDvyFNfgkT8kPZynccAw0EJwGVo3a8iR82jIDMCFM+5qeKowrk5K
         dEnhUVfFclYginAwaIMlfdRgb4Yod0vHRT1TJ6WH6lfIvUoPIEzMOKmon3RFL0GSoYZe
         00DdRvRPWhAK2tiqYN0d/wKQhuJ/ecZ9K7wWpYfAap4GNo4y824DA8glgOv/+mMufxnk
         kDYSkaH+FOOJZumRYxFLUAPin1YVrMISm+/cjS8phbOYeBJrYaAK38Xecgm5FnD/eSrd
         /c4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755496459; x=1756101259;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rSwNLEEae3P9QEq2Hme2YrXdZ7yJVM2ZDx26GAa5T6A=;
        b=YPN6OKxe83pDQZT134O/jeA9onDNlPiSoz+9k5qUx9422sXD7ZtIlzRhg62IQG5YK4
         q5BnzIPsc9wuUr69SV102dNM6Gdx+Su9lPIDK1o2hSDYIa3uQoS1StrZvk/sitHy8E6e
         gwf6mL1wKHPE9Xi8t4G1CgnzZum6GMyrY49ConzrYoNyBtTUjASj2Jxp3LKi2SGByJN5
         /2iWG7bAdVXB4iIV+cTUuoiq1nYh7o8schAYEZXXAPMnpIbVnF9FdW3GKFsZ7r57fxsg
         5qsEeX79GiXhS9+OKszz4uZVYqrnigmqumlfjgtTE1h6DoSYM2tL8QPMgiXoJ6gL0Z3c
         WESg==
X-Forwarded-Encrypted: i=1; AJvYcCUNByFwPUqJUmq0ksKgVnxtvGTSvIpMuRyx+MAqhW79OsCQnOWN3RcjFafjkUJ/itbkwAr9yOE3MS7icP5uymROGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeZXU2jC2ITFBcI1VxSziHnKDY86kRJrlft6ODWEnmmspknj2w
	NYS8SvzMxFxfu7o0eOPsJPp253dz4NKYVMEsvXidz6N2wxjnaVE9pvg0M/Bv2ZKN0IA=
X-Gm-Gg: ASbGncsY0beMVLWiKzvO7Pfrdbdyp3o0z91/x0rUswpi04SCCFES8UPasRF2mPPcgyA
	14ms3F+izkoN4AmbVPLyuL9iBYjsIvybj+HR36K/R8RW709es8l+gsY+CQcFKWWaxtjjiJpEGZs
	XPUVxl+2OXqPqFo27AxcfaRJIzrayD5Cfnm5RtBDT5xOG7PVzIK6GdeIkc+F4JTbdEwbvfHY1cz
	X7lm6krtzBEAxNRlNcBW3uKpH0VCKzVcBjmzhM2zGNCs9TJ8eJpl2PCQCRFE0YcIwkEmLgwdW21
	qsTjEKsxwwkU81m3KZtqOh/QaoIQZzQBuU0cCGr5QJGswmnln19blNFIX5pVW828iyWBpAVBJ6S
	PQc+Hup9PkRkWdXOFpPOAVsiMnoq4o58umSynrdQG
X-Google-Smtp-Source: AGHT+IEOCX/C/iBLx623bOubuTqA7Kdn4TAgxaXuZzrmlCOVef2rZUF+MeuUI3aZvz9jOtGjq4uPMQ==
X-Received: by 2002:a17:907:96a7:b0:af9:a486:412e with SMTP id a640c23a62f3a-afcdc237cf9mr964877366b.26.1755496459172;
        Sun, 17 Aug 2025 22:54:19 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd01ab55sm732429066b.97.2025.08.17.22.54.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 22:54:18 -0700 (PDT)
Message-ID: <b064e3cf-466b-49b9-a66d-399441e1913d@tuxon.dev>
Date: Mon, 18 Aug 2025 08:54:17 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] iio: adc: rzg2l: Cleanup suspend/resume path
To: Jonathan Cameron <jic23@kernel.org>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
References: <20250810123328.800104-1-claudiu.beznea.uj@bp.renesas.com>
 <20250810123328.800104-2-claudiu.beznea.uj@bp.renesas.com>
 <20250816145334.7a538a19@jic23-huawei>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250816145334.7a538a19@jic23-huawei>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16.08.2025 16:53, Jonathan Cameron wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> There is no need to manually track the runtime PM status in the driver.
>> The pm_runtime_force_suspend() and pm_runtime_force_resume() functions
>> already call pm_runtime_status_suspended() to check the runtime PM state.
>>
>> Additionally, avoid calling pm_runtime_put_autosuspend() during the
>> suspend/resume path, as this would decrease the usage counter of a
>> potential user that had the ADC open before the suspend/resume cycle.
>>
>> Fixes: cb164d7c1526 ("iio: adc: rzg2l_adc: Add suspend/resume support")
> That SHA isn't upstream. I think it should be.
> 563cf94f9329

You're right! Thank you for handling it.


