Return-Path: <linux-renesas-soc+bounces-25080-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 98310C8157D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 16:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3A1464E6E60
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Nov 2025 15:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6B1313E3A;
	Mon, 24 Nov 2025 15:27:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F023148DB
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 15:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763998058; cv=none; b=cyL/9ZTUjQ6IDSNAUlVwySUUBoPN0dI85WQEIjw6OoyKyijOd4WbfYBmDRLHtysUvG3/mtmat5zZGT3da5UPKxB0smHbd5tjk+6OHJtO5g4m/UKdQnlBR9nCKYem7XjjJRZ9dhfiv+tGqCn9Zhb55TtFnSL2olpU8vo6RMgXFwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763998058; c=relaxed/simple;
	bh=rOS1aByy753LS5mnApvPktfoG7CiPZT4h5wnRkutiXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KcLCoTysBmI3Fup8B/I2EGsCbs9eAjmxv0d57R689m2HU3M5oJgL4Rv3k3BXcM86XxXBTu9Gahvv9Y9GTSit7Dc+uC5B/UVQNLKwB9V+y7ESpfKsg/wocfrP7jOWVAEnsglC7rpt03PppRUvOXWYTHaPiqG7dnHlFDRpLV4goKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-559748bcf99so3542112e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 07:27:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763998056; x=1764602856;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eC4cvDO3IT4rDSa55t0HSPzkeqi2UUzrqewWPhJHnY8=;
        b=VVDJAcU8gtwd4ZpymUYxFxqJwVu7zv+lhM5dAPvkC6MsmZKjoIzN3J6ufe77teGJYF
         L1Zp95jHlog1DiU+jBMwfyvIZ4x2V8djkYTtDDYkkERZ8Wy53c36VX7DoCLa9JqqrZF6
         71I3EKw/MHQYsSEX74vf50gD4SSOyIYi7L86cNdIoh24NAi5qbBFXMC0XSZzETToEkGv
         xG0KVP77aGt1QSLV2C2HF3M7Pa4TsP+tpQF7pUIbQRF0mCxXpj0N9nr3datwS6VvVFa8
         HDENThppambUwIzNCRKiXvlkP+m2uDFjAv8ZF6NdIWBnX0f+BQHz2OJrqtLMvA9ZC6tB
         C7EA==
X-Forwarded-Encrypted: i=1; AJvYcCUqbMrk3rWGpxzKQsWc5LqbmtsXkVTGPMF3Oc6DLyFmNiv+OmSTKoMvoe7EysedusYbIs8lv+x2peMfFtMOiJNlZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXgEGQvuPFOKzJtFC7d8k4b0FgrQ1b/Oz9D9rsOgOWxHF2CLiZ
	GYm6a4F4U4HcAGwAvMtKIqz1WOQ5gryuYVpkraOn998lyasWgKgqkzYGWSdY7ED9tdo=
X-Gm-Gg: ASbGnctpJy7LKe6o6B1WtuIJpjWlBjYE7VOycdbzlFDfHf7ZRjoKg4EmPPpyP4i5qSO
	ZcIIe9HxaZnnu2J8QUUIia6SiDnVwmvuvzszDewdvdIe+kSVgMS98gcJga4wyEmG15KMd5SmNAQ
	mJvs06jrC3Xc7k8E3DfGtE58y5Nt9FUVf2UGP42yjybU21ChkwLv2I7LLhP3HDSgJMWGzz3dv/i
	q8SsbAnIOnKCM3mPKgiOfZuCkhvcK6OzxhXAgclhrnwh1DUSdqaawCLCUkE/laYqvJ5zg/SYaCU
	dPdKIUFbZFOHD8OUKwGZFvb8KCbDQPQXlJu3tFD3yxxuDtxTb+JIhyxfIQkN+9jEbQinu9Y3vRy
	MxK8R2nKgwdI7F5Lajj2uFxwvvLICloMTs2suLglh7bzp8GVqkMMqvHqoHtXZ2Vfztk7VmRhYc3
	0kax8aWMP37C1aqfcUKtJDRUs2qoELbLzJMyQ0KC/IQWF1i6fE
X-Google-Smtp-Source: AGHT+IEeKmIO5q0tdFwSemo2Sg01il6rkVUCfodP6GK6iHesncC4C/SRe5i9LwBGc6iDQK2sbRReIw==
X-Received: by 2002:a05:6122:78c:b0:55b:305b:4e44 with SMTP id 71dfb90a1353d-55b8d817d3emr4301954e0c.21.1763998054259;
        Mon, 24 Nov 2025 07:27:34 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b7f7749f3sm5636581e0c.11.2025.11.24.07.27.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 07:27:33 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-93a9f6efe7cso2782084241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Nov 2025 07:27:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUFQwqmjsScg4BYZYd+zshvPI3k72mAgEcZupQyRm6d9L+XCpn2OVrFH4QsX9B0uHAvrJnNw/o5pZe0JrWgWGfHrQ==@vger.kernel.org
X-Received: by 2002:a05:6102:1610:b0:5dd:896e:7b48 with SMTP id
 ada2fe7eead31-5e1de290b39mr3496222137.14.1763998053400; Mon, 24 Nov 2025
 07:27:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114194529.3304361-1-chris.brandt@renesas.com>
In-Reply-To: <20251114194529.3304361-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Nov 2025 16:27:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWmS5hi4NK1+TN1C1cyQyuJFV3K2CUnCkSw9U-JF1H8yw@mail.gmail.com>
X-Gm-Features: AWmQ_bnWEMaqDzgASqk2zI5T_pySa34CnCYdVyU_jzrAfY9eM-OMGJiM586_jxw
Message-ID: <CAMuHMdWmS5hi4NK1+TN1C1cyQyuJFV3K2CUnCkSw9U-JF1H8yw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: rzg2l: Select correct div round macro
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Hien Huynh <hien.huynh.px@renesas.com>, 
	Nghia Vo <nghia.vo.zn@renesas.com>, Hugo Villeneuve <hugo@hugovil.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Nov 2025 at 20:46, Chris Brandt <chris.brandt@renesas.com> wrote:
> Variable foutvco_rate is an unsigned long, not an unsigned long long.
>
> Cc: stable@kernel.org
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Closes: https://lore.kernel.org/CAMuHMdVf7dSeqAhtyxDCFuCheQRzwS-8996Rr2Ntui21uiBgdA@mail.gmail.com

> Fixes: dabf72b85f29 ("clk: renesas: rzg2l: Fix FOUTPOSTDIV clk")
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

