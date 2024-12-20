Return-Path: <linux-renesas-soc+bounces-11646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD849F91B1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 12:51:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE4D416AB11
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 11:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2737A1C461F;
	Fri, 20 Dec 2024 11:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="FtHqCvpK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803B41C5F2E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 11:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734695473; cv=none; b=jx8oEAc6kPV8G0MAWGBtxl21P6j4Kdiy/a3DcQd2dgrqdjMEzVg9tkVHWOP/kNYEI1CNQECBnINTjG+/Bscc+XVEtGZFkd4f5Y3psdONpzBvY31cxZjyNOACdBiQEkTxh/3RcjXYAwxVL+zNq75p9AisyMIUC8NVrEf+OGgdh18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734695473; c=relaxed/simple;
	bh=m9jxDrqrMRGGV+vfAjM0MGRADwFp6pGZYy5BFHFE1K0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YnC7uhwyzj8doZ8m8OPczPAOan+e598BTa+7/8S97fL2M6tjre0CaN5vMM1WKP8d/7FSgVye+DODF9FpILIHHcAOHYI/0xfTKTKkV/cMDrYSB0wZW0iaYwn4vgQfQaQUkXICPs2LPy0Jt79Pw7ZjRjgtAXVhBos5jdDhkx5cWRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=FtHqCvpK; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3003e203acaso18782411fa.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 03:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1734695467; x=1735300267; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FselZA6J0O6C8HO5j7hrbLulI0ncgAdqXKUq9QFruHU=;
        b=FtHqCvpK2DPxxOldTtdA5Fj0Pf/uP0lv8dHXkSXNtPP3ZOMT7KxTaIG5tNoCYifyCy
         jcJT5wNmdhJccOokaXLGb5DuEaIXEP1bK+YOtPMFYQIZ3japlaIYKKZ30gwADC+qi3/z
         1aEK+mx9nJK1UYDLnMCW7n8EMj9GbI1oEwMes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734695467; x=1735300267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FselZA6J0O6C8HO5j7hrbLulI0ncgAdqXKUq9QFruHU=;
        b=Pvg8RLXFZx7Q/+xPQHPhqpTF3aKJmqbe9OXLbYomZS2hpONtplw6ZZmY87Nkq5IxIv
         Tjdl38Fyjkpt3ktL9pF8hj4NMhFonoqEBV+6Ro7Yj2tVdWiVIA/GZRSfZ+wbPZKey+Lb
         GJrpG9j4JCIEhooFcP1qsbZlVCJIocLuUAXQYynxoj/CA09s/PBfV1NB89SmSoTnPUs8
         LBLi0DUCOnkeIohUwYZ+jyOaCGZRyVUDVTNoNpj3qVpxB4y9ET6OhGbQylLm7McOLK+Y
         M5uTsqZFMpuphsWtlRfL369u87tynhQhgq10oN0MTptPwOp1faT5HGQftf6fX0gfSj5e
         VbKA==
X-Gm-Message-State: AOJu0Yz5CrtRrGrVM5A1nBVkUobdlWmBGIZ4/831SmH5srDz8hqdETK/
	nzeAL5mUDPOz0Xb05ZHZyBQIh0mYVTBf1GAt4NogqQqegX3Zlk/4xxMageON6lgAGiisevkcXaY
	Pt2Dzo3eN24ozWaI7NKfPD6LR3hOse1xE5+0ydw==
X-Gm-Gg: ASbGncvbhBpII1EdUznSOLXiETzUs1+ym1QwMj0ov1v3ntECGj4NaaSe0lkli11RAnV
	f1a6U3jZ+I2X71XVY/hYrSWnWKib25dgsvV6vUA==
X-Google-Smtp-Source: AGHT+IHHoH04z5TC5uOCxGY0BXgQ5o3VZ4L0WNK5OVpS6KNzKF+4jvnwEWhr3W52vEzvIla1z1eNFmF2Fdcf2EwIaGM=
X-Received: by 2002:a05:651c:b28:b0:2ff:d81f:2d33 with SMTP id
 38308e7fff4ca-304685c12e2mr11189631fa.28.1734695467486; Fri, 20 Dec 2024
 03:51:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241220113000.17537-1-wsa+renesas@sang-engineering.com> <20241220113000.17537-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20241220113000.17537-2-wsa+renesas@sang-engineering.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Fri, 20 Dec 2024 12:50:56 +0100
Message-ID: <CAKwiHFiamZ7FgS3wbyLHo6n6R136LrLVCsih0w+spG55BPxy8g@mail.gmail.com>
Subject: Re: [PATCH RFT 1/5] bitops: add generic parity calculation for u8
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Yury Norov <yury.norov@gmail.com>, 
	Guenter Roeck <linux@roeck-us.net>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Kuan-Wei Chiu <visitorckw@gmail.com>
Content-Type: text/plain; charset="UTF-8"

> +/**
> + * get_parity8 - get the parity of an u8 value

I know it's prototypical bikeshedding, but what's with the "get_"
prefix? Certainly the purpose of any pure function is to "get" the
result of some computation. We don't have "get_strlen()".

Please either just "parity8", or if you want to emphasize that this
belongs in the bit-munging family, "bit_parity8".

> + * @value: the value to be examined
> + *
> + * Determine the parity of the u8 argument.
> + *
> + * Returns:
> + * 0 for even parity, 1 for odd parity
> + *
> + * Note: This function informs you about the current parity. Example to bail
> + * out when parity is odd:
> + *
> + *     if (get_parity8(val) == 1)
> + *             return -EBADMSG;
> + *
> + * If you need to calculate a parity bit, you need to draw the conclusion from
> + * this result yourself. Example to enforce odd parity, parity bit is bit 7:
> + *
> + *     if (get_parity8(val) == 0)
> + *             val |= BIT(7);

Shouldn't that be ^= in general? Of course in some particular
application one may have constructed the value in the lower 7 bits and
"know" that bit 7 is currently clear.

Rasmus

