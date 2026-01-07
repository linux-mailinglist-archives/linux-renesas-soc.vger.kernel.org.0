Return-Path: <linux-renesas-soc+bounces-26373-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9E7CFF034
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 18:08:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C23F2362EC1D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 16:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D894D39E16E;
	Wed,  7 Jan 2026 16:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gJVwcJUH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E973803D8
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jan 2026 16:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767803918; cv=none; b=rqEyEjMY/wgzVjddYLhOAwHzpg84SS0XBIWY09h/ht5tt2jg5j02WbKhFQNZkl4OxrZ7UdAsJ/cTshoR3Cm1fuL0Vozhc/bZ14i32oWfeGmZPdPNbHHo2VouB7H8xfZ9uGUBhWVx9xFW21f2OdvOmzJronAoLxAFiICS/MJooe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767803918; c=relaxed/simple;
	bh=5h4K5oub7/AXA/c29GFK3TWej4Mta4tDG2m4A/NuNYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BdV0LpWhWCK+qNdsvNy+/bUR3yYu7d/WFoAuYuJWEE+4z3JWljElgfT9F4qLJ07I/HMPjl+4aR1N3JwKrCrmdfsT4ehvipzJOpUR/8IJE/H6FNmhZMXgnNt+COX5nS3eCMjwFw6LwdshdL19NVRFNstOAKzZ1jNRtc2u0Jpor5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gJVwcJUH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477563e28a3so8167185e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 08:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767803903; x=1768408703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VE8Zj62WXZdLdYrr2YwiHtiAoQvZVh2N0dQUprLSifQ=;
        b=gJVwcJUHS51Sy1heqVaoDG3EeOCsP2Fa6j8+KqGrC0e+BMkHr3fYLobL+lYwacpgOU
         1zRyF7D6bmFk0yoLVrXo6SmPj5c/S3dljFz/Haq4VPwkenNO6YUewC08sbVhLLvfTHmy
         d62qluusIEGnCt1bx8O6FQO/SX7EtldvEOa4fS6HfYp8Oqe0JHTaE7HIpCXe3v24ppqg
         gJDqjnsCFIu8f6ZaeJBZtGxBVkvE6EYEdHHg/m/QJ68mK2YakMOyd0xUMVt6wSsYutA3
         /aYcYxc6xmoQ0AJ793ZH+A80bTHiwOM481iBU2fHRySx4+qM2bO0cUes//3SrFrzA4WL
         Trzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803903; x=1768408703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VE8Zj62WXZdLdYrr2YwiHtiAoQvZVh2N0dQUprLSifQ=;
        b=g25ohTtDuRE1JmhDMer34VpnX2l2BWwFjycvtSe/sw3pVF1u8XhBkDrtuv7/ImemoA
         Uyjy5aXQ0GiaBHwPZSGyMBm/p4uAFGthqW8oTpadWFXowjiU6zYD+yTfd1JwXuxbP8uF
         bmwgQ8sV9J0EOlRLRHwsMPByTtyQCVEW65PbB4HsNE1Oe7/8wY53UoPj6lDtELPCC2h9
         EEXY7zDLK+nSAiwVpaRWqlRZX/K9kmseG/11ogrAKNpdWwErfG8uDPH/VjwspcfVkWwq
         YTR+FRKgpNqz+2MLP3kFfrVVdSjtnuCgmTMXJWaLRP8fLCSGTaalVtB5p6aluN0A/GTb
         LI3w==
X-Forwarded-Encrypted: i=1; AJvYcCWnw9J21EgjE+LXBzyCA6YKeV9+DoruDaqU8PUgRTJQe7q7zpPuF8E0PI+MJkTCD0b3HrjO+G2FOl9qq+rzZz1vng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNCJBxlLZZj9Y2L1HqNyF2P1ukAIWxe7stK+cQ+4zUzAIB4+fp
	s1sVk6Ph0Xua+nNThNaSlT3R8g9EvqvI954WlLu5SvyiofefLjxRk1K3ICv1VNucv9U=
X-Gm-Gg: AY/fxX6/PStLmpyx6zDmhLEwGuZpZDdNRbz3imkoKj2GA/vVcRMOEA8DSwa5+eRe5S+
	Qof6L3/KeVolIr3AF425XHpqk4V69HUooZol631LXfo5p7P8RI2RleJJQrrWjQJ5U/NDPMERdVP
	RuMINgPlKfkVS6LYxhVZZQ1JZyXXWU8d/8zxlSXWMYTCf+69O6Yt1V7UyddCS80t5+2NTVbF8E9
	rekpr8s3K+0vIiQ2COe+RN37ZurdOA8OEyaEjm2HGTZf7NpsRgMRLRQ2URLcuayYBO5XWj7bQeq
	FGMdn7XKB7GGCvwV03D1adR2NE0NpmkwVPinpAtkE414h+0JGEcxHKESC7nYR6y3rSp39Jc7m9V
	4yA2mWUOSsntfeUejC3DEriHC38K3tYOyWlACWWJnwLBtWJFtMLVxOSkJi8dVIXycRnkK2U2AqV
	XyXxJHTuVB1giMMxe3LPYKW6rGtSdoE+meHxZxcqUrXvGUWRMpBqmOKn4BGfl8A5iCiA==
X-Google-Smtp-Source: AGHT+IFlEZxyM1oDC2UILSq7md9juHQsIhmsBcJE41UR70lvfgIq0kGCqYeoOjecl8psTYZcXOhJag==
X-Received: by 2002:a05:600d:41c9:b0:45d:5c71:769d with SMTP id 5b1f17b1804b1-47d8484a4e7mr37627045e9.8.1767803902697;
        Wed, 07 Jan 2026 08:38:22 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:edca:100f:ed11:66f2? ([2a05:6e02:1041:c10:edca:100f:ed11:66f2])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47d8715b5f7sm17049305e9.4.2026.01.07.08.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 08:38:22 -0800 (PST)
Message-ID: <a6c04e69-b0fe-43b1-ab7b-3326f6980471@linaro.org>
Date: Wed, 7 Jan 2026 17:38:21 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/9] Add TSU support for RZ/T2H and RZ/N2H
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
 John Madieu <john.madieu.xa@bp.renesas.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 "magnus.damm" <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251126130356.2768625-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <TYRPR01MB15619FEEF47DF01E9FFD57BF68586A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <TYRPR01MB15619FEEF47DF01E9FFD57BF68586A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/5/26 10:09, Cosmin-Gabriel Tanislav wrote:
> Could I have some feedback from the thermal maintainers regarding
> this series? Is there anything I must change for it to be queued up?

At the first glance, the changes look ok for me.

John ? Geert ? Magnus ?


[ ... ]

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

