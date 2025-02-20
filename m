Return-Path: <linux-renesas-soc+bounces-13437-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B39FA3E125
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 17:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9D223BA988
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 16:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A7E20C471;
	Thu, 20 Feb 2025 16:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oPM6Dbpc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25BE20C028
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Feb 2025 16:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740069634; cv=none; b=srbTSRlOTe5k7XPn4eA6jg0Qvz32SJ7QnnbqiPKQH1gDWltDzJbQwmM/NbvJPAndMKtWPjrx08T+54jGWnslGYK3Aguq+7CWJwGI9ynTYptpu6erycidt97IdwNi6v0qe0/5ml4Ii/7SeeZrp6EFCho86p+O4x/zms2pbRpt5mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740069634; c=relaxed/simple;
	bh=eSBNTn4Wei7MvSd7KTecAx4Wv8JIaBEaD1KQ7IcmbDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=atE6wMIBQzTSVl8VYBz3WoCtxkt95Pj9QwJtFu90JzTTtIQquyay4lYajYFHQJ6aSQH/+LxVoJ7JeaWABzGxM+xgssnsCI7My0S34vfwOQdRUK/0y/JRqFnPs4VD0Re36Jn7wdHYiRZxPutlzO2L3M3hGPW2x6u1GuX5EnQT07k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oPM6Dbpc; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-439a4fc2d65so9526985e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Feb 2025 08:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1740069629; x=1740674429; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ULQr0sXJ+T57rYA6unBEw0SRnUfX3L+nBpEtFm34hbM=;
        b=oPM6DbpcgQzVlBX59AEA021448KJV7QdUesUQy/vSug6hIqZsYW1thhsWXF0Zl7ZnG
         1iIUXPyOO4kOmZKHeNs2j46/j5Qo5OZXzJ+Nm3LiKowvm7nha+efCmk5acvRw4rW0L2B
         bUOzFiSWKIZhv5Ss5U8PYRCsArM2xjsRGa7R7NEciPzipVrjsqFZEqk4/ZvAzPmMRQjb
         PaemPpqouP8lVQb1idfHSsRTRWH6uVg9yJHbK0Sej/ulN2be8bPpNSN5jg/uQSD7NY/z
         9svDNyQSdwULHhQJyctinq1aY6Xm2Kb6PL9CL+A1bS0HUw6PHTHnm5LwvyuT3CNceTBL
         p7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740069629; x=1740674429;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ULQr0sXJ+T57rYA6unBEw0SRnUfX3L+nBpEtFm34hbM=;
        b=GQ/ysYgsTejaU2QLvT33a5ppyq3S0bL2VEh6k0cmFOTnN8eluKuJJwcNhnN+DtOf+I
         dRlQ9Y2NMFoBOctVvADEBzj/42yl8LTom1s1AU/m7oHDzLo7h2MS7SJ2g5siU6OV0RKV
         4NharItAXSeHkNE2w16j1w1LPlH29nywxZUvwewBxtrZQj/4cnFQq9O9lF3OoNPCNEzl
         zYtwSOTUAITJDej2MIMbdr1+V2X6Pmbvu7NmvV+AVe1yJp9hGsjRJb3Wbydqi+8dxn76
         rT1uTTo+aSvBG1B/cvRRJBf0k8ZssPYGu1LOWtnig+GjGMqBLgPqgS5XBZFCvqJJJsi7
         +9vA==
X-Forwarded-Encrypted: i=1; AJvYcCWdVXKPH+m4glhsje9kjDvv6GOrvmsEUxbZRp/0pjndtJkf8J6jm4UOC6J0POaA9Ekz4IYdwv4+RgS1TkbRTYwZMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc1/6t2aOV9OXM6L3c8eqisgm3U1RCdE+cklj/rZ5aYFKD8qEU
	Jr6IoUHlXPX0OVD2ErwBFev3WIXEbZFNS762DoAdoRSEvhgSGsjOxMk4nHXsp25aUamLdofycNj
	m
X-Gm-Gg: ASbGncs3dc/qLku1eY7emHi8OORex6fLEDkTDOsy7YR4ciaK5UMqkpOdfRelIYNVQHS
	iDoDQU+442B041SEfQ55/h7hXPAz0qjLzE8HZVfYJF8lWUjmCG1os8JzwXEnw9KPElWD11zD55r
	EmZ0ZydmrPeZ/sQfil58DBdRM0y1QhODgdtOlLKHP2QyNC4RlsWtNsOq6dzlrUvFGWYyaNLE2Ww
	hpdYj+ZSRITx0VD11y7XHPkzHPCQrtrbUl/5X1k7rmKGwFsjq3lfWygDVxVcyWAE884xE0D6+h5
	JmDaHnFK5Ogf7VFOD0/IqG0vr10uT/N8LZknSg1TEgEAQoJ+l+5yEuVBXWZ3tNtYDbVVyno=
X-Google-Smtp-Source: AGHT+IHSMvs2kzmsmKiQHxZFyIcYPymD0uCa2DDj89kJ9d8q2/htWsAaOvyyBs/FSYI9s7/vlQ3GgA==
X-Received: by 2002:a05:600c:a384:b0:439:88bb:d023 with SMTP id 5b1f17b1804b1-43988bbd481mr201896195e9.11.1740069629081;
        Thu, 20 Feb 2025 08:40:29 -0800 (PST)
Received: from ?IPV6:2a02:2f04:6203:2100:5146:3c6d:da37:b887? ([2a02:2f04:6203:2100:5146:3c6d:da37:b887])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439a416caeasm25629165e9.18.2025.02.20.08.40.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 08:40:28 -0800 (PST)
Message-ID: <d1e4fead-d486-4836-a48f-8421571b8ed8@tuxon.dev>
Date: Thu, 20 Feb 2025 18:40:27 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: renesas: rz-sysc: Suppress binding attributes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: magnus.damm@gmail.com, john.madieu.xa@bp.renesas.com,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250215131843.228905-1-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdW4sN6x5C7iQgiZD=Vmzg=BA1v+WjS7aapXmuM2_y8JvQ@mail.gmail.com>
 <CAMuHMdWwzwHnZazp79q0R7n7MjKDQXRH_RqRSmNd1vdN_9JTqA@mail.gmail.com>
Content-Language: en-US
From: "claudiu beznea (tuxon)" <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdWwzwHnZazp79q0R7n7MjKDQXRH_RqRSmNd1vdN_9JTqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 2/20/25 18:37, Geert Uytterhoeven wrote:
> Hi Claudiu,
>
> On Thu, 20 Feb 2025 at 17:00, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> On Sat, 15 Feb 2025 at 14:18, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> The matching data for the rz-sysc driver is marked with __initconst, which
>>> means it is discarded after initialization. Because of this, attempting to
>>> unbind/bind the driver through sysfs after system boot can lead to "Unable
>>> to handle kernel paging request at virtual address" errors due to accessing
>>> freed memory.
>>>
>>> Since the System Controller (SYSC) is an essential block for Renesas SoCs,
>>> suppress binding attributes to prevent them being exposed in sysfs,
>>> avoiding potential issues.
>>>
>>> Fixes: 1660e5ea6a3e ("soc: renesas: Add SYSC driver for Renesas RZ family")
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>> i.e. will queue in renesas-devel for v6.15.
> As the offending commit is only in renesas-devel, I'll fold the fix into
> the original commit.

Sure, thank you!

>
> Gr{oetje,eeting}s,
>
>                          Geert
>


