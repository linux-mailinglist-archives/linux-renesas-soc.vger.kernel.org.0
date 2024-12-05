Return-Path: <linux-renesas-soc+bounces-10933-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 568D89E4CD1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 04:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 110752853CC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 03:46:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656A318622;
	Thu,  5 Dec 2024 03:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="vFTrMxUC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99460D26D
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Dec 2024 03:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733370381; cv=none; b=a4pZvy+7pRQIf3IBEI4v+yzm/Ql7GMS2xgFEjondzV9azAtqp9XjO7WVjrB8Bravoz3wPbjmWMk4IMHzb/WOS23PS6N9fdU1lfJfhg65s5a0Ajt3trodovgiT2Ursyrw4PPUqu+cz+sgLoPMrzVwQ+WaL9xIUgrMT4z75q7cQ0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733370381; c=relaxed/simple;
	bh=sM3nMzC7TAsFvCC8GdPgobx0dXQVeP/mcuTeiAUa+ns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lH3DQ9FTF6c29VkdW6IrC4888mjaIBiovIRNGzm8IKi5hit7GNTP63VvfEBIC1zT33pOOPWgXDop5hEpX86LC6FOLaM4jh86fX0tcbVlu+t3SrNKF4A9fVEZSoQ6Z+gP4drZt5FQM4q6IzhAadm+/07hH0HrMG6VPTMExkZHdgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=vFTrMxUC; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53e203d77a9so465237e87.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Dec 2024 19:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1733370378; x=1733975178; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0/UWGflKJO/+P3D0XoMr9nLPY+D4nXktguor9vbxGSg=;
        b=vFTrMxUC96QB0LDIS6MksHLpcgU7PkW12Auc2sX2SqWJTeyNugl5aynZWR73jNjrUq
         cFqj3JjuetX80NcAPdYJ+Yxdk2P7a3Fpzyr6SlGLC1ng8wl7D78kb3+rJpqdX4rSnh2u
         q8ztEocVDPt0/56DBrzrqob7SsGjuTa6RryXYzD+raibV5EWDKCHyszzlv9LvaYDBmrw
         mruqYDnomYy0f1yPKj16Dq6zgI/KXpqJ7lRY6TkuGHaHw6PnjwNI/LcZGBqvfc9lZIlV
         nJ0Olp1F2tu96w4bs/+NfGr4Z76vf5HrPxizUDxNmAqad8qNE1pX6rU/Rf4XuTFUdys4
         6vvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733370378; x=1733975178;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0/UWGflKJO/+P3D0XoMr9nLPY+D4nXktguor9vbxGSg=;
        b=nWDuENr6SmAFwjGqvvjEHkQtAjQIVLKeNLdM/P7nfi67B0mUEovCFNidlzozBeUl4A
         BgOTa9wDOnGaD8vpkwKB3HvvMKanziG2CtNl4We1wWn1GCb5UNXvU4CjcJIoT/Jv6qC+
         K4f4g6rGjatQAk5GA9eWoN6+2Q4g4g8Dfy4hWhQys9nLdoq4uZuzESoj0UEJ7nzLoWCL
         oKkGVFM7et81p1BE5p5ymlclyTfHGEp//PZyyh/MIxcc04qEtaRCxes1EOovVFwqbvzm
         +JoSYo+6K0qXudSg8FJ8dpLH6xU5Tc4dduq6hh0c9CUFdqrw+GqtLLMFZ2RSFGT3ElIL
         YHdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI3btdXGaskMu2T07o5XoCxCuSSxOIZYcEPIb+Lxv/Tt6wsdt8BvSSNgmsloseHlryW+dbHNart14S6Jc40HIorg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgkBvAXRwe0KbE0Qp6NGKRZ17tn642L6mk6BC3fyoEsBR1Y3pE
	YwTTQMU9BgEQWRxfvzsmYp7O8sB02KyVvHSm/w0Q7msboLxbSUCHYhNZStMcd08=
X-Gm-Gg: ASbGncvUd6q/jV/yR46pNEKP67jgnQBm6L083633syiJLbXXpFFqP8onQnxx1WqkkT0
	kl+ZwFIf/ZA91pd6iN+E5+DcUgTU6c/8rQ91IynLMaJ2BDthnTlbSUsBOMNJBvUSjx0HUjgw/qd
	fqR0/VpffX/qcNuND5xkug6ymvXGvcFcB9oZIB57+v7+LmFvO1CtVgybv5HjD5zq6Yfl2BWUUHc
	0HayqM3MVBOQGLJ+yWTjQaMUqpcUdDT1TYm/m8uEoftbQIxZKyV6RWc3lgWJXEwbiY/CQ==
X-Google-Smtp-Source: AGHT+IGVgzpGqperEh+QPwsCh0haYo/KcfW5l34sezpfLSZ8Qc+W3UcKvNf9XwxfmZTyOcNqdMUXhw==
X-Received: by 2002:a05:6512:3a8e:b0:53d:fa6b:94ae with SMTP id 2adb3069b0e04-53e218f94e6mr384227e87.21.1733370377733;
        Wed, 04 Dec 2024 19:46:17 -0800 (PST)
Received: from [192.168.0.104] ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229ba6d0sm91875e87.139.2024.12.04.19.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 19:46:17 -0800 (PST)
Message-ID: <9b2607ac-a577-49ca-8106-b82b25723439@cogentembedded.com>
Date: Thu, 5 Dec 2024 08:46:15 +0500
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] net: renesas: rswitch: fix leaked pointer on error
 path
To: Jakub Kicinski <kuba@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Dege <michael.dege@renesas.com>,
 Christian Mardmoeller <christian.mardmoeller@renesas.com>,
 Dennis Ostermann <dennis.ostermann@renesas.com>
References: <20241202134904.3882317-1-nikita.yoush@cogentembedded.com>
 <20241202134904.3882317-3-nikita.yoush@cogentembedded.com>
 <20241204194019.43737f84@kernel.org>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <20241204194019.43737f84@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>> If error path is taken while filling descriptor for a frame, skb
>> pointer is left in the entry. Later, on the ring entry reuse, the
>> same entry could be used as a part of a multi-descriptor frame,
>> and skb for that new frame could be stored in a different entry.
>>
>> Then, the stale pointer will reach the completion routine, and passed
>> to the release operation.
>>
>> Fix that by clearing the saved skb pointer at the error path.
> 
> Why not move the assignment down, then? After we have successfully
> mapped all entries?

That is a different possible way to fix the same issue.  Either can be used.

> Coincidentally rswitch_ext_desc_set() calls
> rswitch_ext_desc_set_info1() for each desc, potentially timestamping
> the same frame multiple times? Isn't that an issue?

Somebody familiar with how timestamping works shall comment on this.

> I agree with Jake that patches 4 and 5 don't seem like obvious fixes,
> would be great if you could post them as separate series, they need to
> go to a different tree.

Ok, will repost.

Shall I use [PATCH net] for all?
Or [PATCH] for fixes and [PATCH net] for improvements?

Nikita

