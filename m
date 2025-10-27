Return-Path: <linux-renesas-soc+bounces-23710-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCD4C11EBA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 23:58:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C5ABF4EFCA3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 22:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55CC92F1FD5;
	Mon, 27 Oct 2025 22:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="GPS73RO4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351182848B2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 22:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761605834; cv=none; b=KaknOfKCIRJknTKyFVSdFtWxJTYX3uyC9OptC7y4yoOsxbeU7VcjMPbtprqRFtWrK7cDjMlJzCxNFxscd2I51EbsS9Z8mXH/ylHNh1ZuurX9KEaFEhtsPxUa7Imo9bTdZbNvt7e+Xld5y7f+OdxHKb7ZDVGROLhO9BoDhai7Jo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761605834; c=relaxed/simple;
	bh=RbgbmRKiII5Ao0R77HENK2nhkZb2TNN+Mr7QeadAS6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S3A6fAO7PEVzSefkgHrUUOXHVq72XthQAD4Y9FKDtZ3fpQdy5fbLUKJCommTBsiSpSXgeGRQei1kes8NTCIz/rNfujgZkhGdT9tKuPEG3udDqLoYzdzXFA3x1ItG25KiRBAtIdscGxPGyoEJaMWHIw806+eo+mTJv06Sd2yBUEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=GPS73RO4; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-63c4b5a1b70so10021668a12.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 15:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1761605830; x=1762210630; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fFdl4ZmTWATcoFU8X+kQFEdA63hl2cxFFo3h5RSrR3U=;
        b=GPS73RO48st2zL9tAmUneLaI0A2tr9N8nX+Ys5qCW1ieaMffJPUX/eY/1+jTjovzrV
         YE68FuT1gpEwMV5SfnMzVkDuzbjYWUz687gMw0dYw5Nr2oNXuIgcz78ftEULwXUhEQkc
         YZcNS7Gb28LxPb7k1Ugu+FPoBeEwo+aYJMa67CWuAs+o+OncfpjBFt9LsBUMBs/4SYUx
         z2VOitgNSOICn9kBixteJwY1vMXfVB0Ns3KWWX9/GgAXb1XM0diJ61Zilbfcjm7oB+SZ
         zcjdKtHhseCa+yP9YoqXL4TkqF5CosXQ+6GmEibSsXD5dL0mNlJfUjYa1K+yK/qZEB7b
         6u3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761605830; x=1762210630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fFdl4ZmTWATcoFU8X+kQFEdA63hl2cxFFo3h5RSrR3U=;
        b=b0U9bXJHexRg6hb9nsfv4md22k16p2Txa5sEME+Ce2/k2UOy+IH66MrlWiLBjWzR2m
         s09l/zOu7nPCXRubYjngOagtZxfRqosy3AaGSYegSrKlrrOy6niJJ7ILUNnklf7/qXt6
         bpHJ2b8oiI4tV18HnndvlZogMA6cS80FvCLCnhU6KCqLzctVlaeWW6Jr73kJ+eaqRid5
         Wwk+wtaFJd22bHx4MB90LZgMy+tR7awGg5ulO/FDLGnB37DS2i1Rrq4tM20SVzuYSLoY
         3URL581kWcJhF1LVlpC3B6hbUn8mnVlz7WlT8oItcn+WgQHXpaB/LLaOcah8IfkcQS5k
         A9LQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrkwZ5tg4rBuHU4mp/0mJZKZOrIl423zMCgf56VQrMhko8ZSoFk8f7Muv9wyvZJ0P8aNcpqck7NYMt+b14IogI4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2cDP10Gk82ZXrz9cFgjy+Ixgxq8jh//2MwhVEsROUiuDUrjV2
	iS5kwt8hysgoeKd5Sfx+6rJerFIu0lYYfyMT0ciOQo5sa2bNhaG/Bd62QbTSsbJvaGc=
X-Gm-Gg: ASbGncvvYdibNUZKxS7sgbwVn6r/DSsMeyHfrpK/4ZsDWYCoZmy2BAezfatbUErwHZa
	C6a7WWxrNF+A3pO38Gz4ih3/Qkz4upGDHS+aKIn9BjltGK8YdpiY6IbvA4vKsXmvHzL60gGTRXG
	pZSHv9OXgBXPcwdx6qrqdS0fJnhqFVd3aLWw4Z6g/ejN0T2w8yZ5Cjp4nrRtT2pTym1Ub8GtqrY
	Ez3I+E5GSWCqg48LGUQnT8ek2AkMUGXBK/lQXLhnwVoActSsSnkS4dY/2jFXwu4//8P21kice2T
	0cVkCB3D03UEXPxDLP/9K4h9SqUSCG2OXsvrXW247JJroDpNHHj5sxCKgpvDoqZAXgyfT6lgxu9
	eey2KtZ1EU1jXS3TJbZuwbZi3Lm5xD2VNq9X7lkCYb4cugmiXZOClKDV46r4H+OKazQrPY+vuvJ
	+XRioBOALwivjmr0ilT2m1TkFQcS1K8wWV7A==
X-Google-Smtp-Source: AGHT+IGbQFjuStndCCaKR4261I4iaoz/JO8/XzOkp528toduF4S7yedYyO+RXOpk7sO39YsAF2rxfQ==
X-Received: by 2002:a05:6402:34cb:b0:63c:3efe:d970 with SMTP id 4fb4d7f45d1cf-63ed84dcd85mr1490392a12.31.1761605830413;
        Mon, 27 Oct 2025 15:57:10 -0700 (PDT)
Received: from ?IPV6:2a02:810a:b98:a000::b25? ([2a02:810a:b98:a000::b25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef95b7asm7465709a12.18.2025.10.27.15.57.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 15:57:10 -0700 (PDT)
Message-ID: <4f517225-3850-4a83-b05a-eff08c88691d@cogentembedded.com>
Date: Mon, 27 Oct 2025 23:57:08 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/25] media: rcar_jpu: Drop unneeded v4l2_m2m_get_vq()
 NULL check
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20251015075353.22625-1-laurent.pinchart@ideasonboard.com>
 <20251015075353.22625-19-laurent.pinchart@ideasonboard.com>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <20251015075353.22625-19-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> The v4l2_m2m_get_vq() function never returns NULL.
> 
> In the set format handler, the check may have been intended to catch
> invalid format types, but that's not needed as the V4L2 core picks the
> appropriate VIDIOC_S_FMT ioctl handler based on the format type, so the
> type can't be incorrect.
> 
> In the get and try format handlers, the return value is not used for any
> purpose other than the NULL check, which was therefore probably intended
> to catch invalid format types. That's not needed for the same reason as
> in the set format handler.
> 
> Drop the unneeded return value check and, as the function has no side
> effect, the unneeded function calls as well.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>

