Return-Path: <linux-renesas-soc+bounces-1111-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6338144CE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Dec 2023 10:44:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2345AB20EE6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Dec 2023 09:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF932182B9;
	Fri, 15 Dec 2023 09:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ZIgQnAFu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AB518AEE
	for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2023 09:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40c6736d10fso5843345e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Dec 2023 01:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702633476; x=1703238276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BGsQv8WEe/6SR5Ajt9iPU5Ka1yMz6Xn6B/vWUWwGUcI=;
        b=ZIgQnAFuf67ryf7vlJ04+RmEeQKeCvejjrq4DGbz0HiUpM7jICIQYJ8m1ROjcpOCVd
         n03/Cn9WSxN2ksAmFXnDqOV1ciAg15D8PEqtntabEOhHqoGlRLW+W66ScxgoVtnDnruM
         jjbv7RVS2iC7avWNxdI/5+mQs2IO+gfmzDWoE2eD13K1NJoDa8NB0m8scLCS0xOiRRS2
         +/Zpk+9ZFp3RQWVWGE0bIrlgOYN0x7UDti6JAFCC1IMsy4i2qLQpoeLgvxYnSOhGpZv7
         5DBD0EAprRnNtnyHVH0IqVRSF8+FlKnhmqvQSC87Tywcn5FZ8+3iMHuCx0+/apNpLGt+
         5Z4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702633476; x=1703238276;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BGsQv8WEe/6SR5Ajt9iPU5Ka1yMz6Xn6B/vWUWwGUcI=;
        b=xBwAgASuvU4phlqA4CkvI99COgmQy+od7Af+TlQD0sDqkIeltTybWcUfdi+7AN+D1f
         LsVgeA85n1r/DrjiFFqS/yGGVp/wh9SfBmF405norglprHNndOofOfKT8txRJAF4MzYK
         jziAElQDOy+7bmOxAHuxB4U9sJY7PRdAbZCdVcUvrHJGKVgSLUVm1PmlHWWCw/jM1EXe
         CK/tdsvLq4dSMVcGjfeMdFMT5ffI27vUv8bS6i0D8m8Tey1EdBc/EAmeUBLwVRwxjD1B
         t1eFm7nnXNDoaOuUkWOeTDi+98boTjnxlZyBTFdO1Ck0A7JrsUcHDctFgwkBdxXQUoGG
         Lyqw==
X-Gm-Message-State: AOJu0YxMXNdidcTzy/SC88VVjIuGLc8peD5rvKvxmVpwvPHnrCeHHMkq
	6KdBtC7yFsGlh42B2h+YQxVTIw==
X-Google-Smtp-Source: AGHT+IEhdstdUJHu0rGrumgYO5BxsGJGxVRyybI/e7vIAz8ZZQmv5SIhKmNAC37d45CSLy/6N+G4xA==
X-Received: by 2002:a05:600c:2d4c:b0:40c:37f8:5186 with SMTP id a12-20020a05600c2d4c00b0040c37f85186mr6154327wmg.13.1702633476034;
        Fri, 15 Dec 2023 01:44:36 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b0040b3e26872dsm30750429wms.8.2023.12.15.01.44.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 01:44:35 -0800 (PST)
Message-ID: <a84b6250-dfd8-4a33-b247-5dfe2d28472d@tuxon.dev>
Date: Fri, 15 Dec 2023 11:44:32 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 00/21] net: ravb: Add suspend to RAM and
 runtime PM support for RZ/G3S
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>
Cc: s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, richardcochran@gmail.com, p.zabel@pengutronix.de,
 yoshihiro.shimoda.uh@renesas.com, wsa+renesas@sang-engineering.com,
 geert+renesas@glider.be, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20231214114600.2451162-1-claudiu.beznea.uj@bp.renesas.com>
 <20231214112658.583cfc60@kernel.org>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20231214112658.583cfc60@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 14.12.2023 21:26, Jakub Kicinski wrote:
> On Thu, 14 Dec 2023 13:45:39 +0200 Claudiu wrote:
>> Subject: [PATCH net-next v2 00/21] 
> 
> We got 260 patches in the review queue. Please pace your patches:
> https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#tl-dr
> 
>> Patches are based on series at [1].
>>
>> [1] https://lore.kernel.org/all/20231214113137.2450292-1-claudiu.beznea.uj@bp.renesas.com/
> 
> Meaning there's a dependency we're supposed to track?

The intention was to have a review on this series (from driver's
maintainers) while the fixes are integrated, if any.

> You have to wait for fixes to land, we marge the trees every week.

The intention was to let the reviewers know they should apply [1] (if any)
for reviewing this series.

Sorry for any inconvenience,
Claudiu Beznea

