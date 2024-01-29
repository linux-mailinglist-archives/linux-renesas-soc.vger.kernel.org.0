Return-Path: <linux-renesas-soc+bounces-1944-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 991C78410DF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 18:38:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99C0C1C2244D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 17:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7847376C82;
	Mon, 29 Jan 2024 17:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PL+NSHgi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1010C76C7D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 17:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706549902; cv=none; b=bFuTgKhXyNnWsQBAwI7X8DMsaopeCjfafkz7enCIs2pkgVN3aywHpMnkF5DBWsmt3daN8rmCMa7jVTeJ2qWXkspU1O7G1k9dlPx6zbrJMLi9vIW1o81S1+iKw/5l7dYO8bYg34SkTYsfpjFas65+aAMMUAcldJHhsQ1QYcZ3png=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706549902; c=relaxed/simple;
	bh=9sPOI7F0uESoYaMUP2XYpFpXLkXAUQ0RykDgDDMeD2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CNsRdD1h8Wb8sNEV8OHLv5hh7/Rj5hVUpF5Thr4dya6+mMo1s/OdeCU69xrnPGDVrIqV4m7L9yuDKVtHGBxRymJNeWxY2bPMN/FEvaMcqaDzhcHZ84yB+IhtYsTb8l/Xgd/dh4QnKeG6SvmvNEsq11DKxkKX2k2yYgfnRK1GkUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PL+NSHgi; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d8f3acc758so5224815ad.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 09:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706549900; x=1707154700; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=skReZXUWO+4CpZviMCdM9d0PhWwWTcjjV6026UZTL50=;
        b=PL+NSHgif1nUJUrnXJMKMA1Di1VXW42KPBIPPe81fwdj67MCRki8/zLqukKiRClui/
         s5USEBuO6T42wrlSofUws7WH6t5mwyprtVLUF3NNnu5pchF5dcEBsCFyCp+2ilHvUvXj
         izs3Mp/Vmobgrd9yg3/K7S3Yk4cOqxReoKqvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706549900; x=1707154700;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skReZXUWO+4CpZviMCdM9d0PhWwWTcjjV6026UZTL50=;
        b=UUyyuBoXAY2Y2cScg56LcsCHWN+Sa+Q3uVEU3UjVTxVsHeTgpq6/FQot52p1d+Pi6+
         ku7LNFAuUsCjmoirEyb7bqybm8FsIdqmcj5q1Os2BG9MnJkUDVtYsA/h9kaL4LtUxITo
         ymusTzk0XKoUS3XxidWWz1V1MLvsEHuSNupd19qCcr3J+7WNNQv0ujb3xAYTbnYvVSQ4
         RGBwN0xk1Ei4922hErtFEQsM72Hy7FvVQ3uXmTol2tip3bOj+efsA758HOcBQe+Hb0SB
         k0yMHwcHFyLjN7+7Isu/nDGA8zXjHrYNgbwVa1htYrpqXxApv6HWoh9DvGquv3X1Fx6l
         DOdg==
X-Gm-Message-State: AOJu0Yx3LSR5m9lhVvpRp9LWzTVG4G8M2obs+V6FFsIHGsa7R6A6sflQ
	MwMdTK84IzVJ9rg6/h31mX3pxyPP9IVDL+H08vKQXenIGyQXO7//JYyJBw0PaT8KvwEbpDuJeMY
	=
X-Google-Smtp-Source: AGHT+IGScTnnfRj1AdnqDlkNR1TKhTfrfYJdP2Uh+sgvWCJpqWThh0OktY3I9Y7NvrLzGWoWI9rmAA==
X-Received: by 2002:a17:902:d68b:b0:1d8:ef97:229e with SMTP id v11-20020a170902d68b00b001d8ef97229emr1696645ply.33.1706549900213;
        Mon, 29 Jan 2024 09:38:20 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id i5-20020a170902eb4500b001d8d1f78845sm2743531pli.123.2024.01.29.09.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 09:38:19 -0800 (PST)
Date: Mon, 29 Jan 2024 09:38:19 -0800
From: Kees Cook <keescook@chromium.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-hardening@vger.kernel.org
Subject: Re: rcar-dmac.c: race condition regarding cookie handling?
Message-ID: <202401290926.67193AB2B@keescook>
References: <12ff20eb-d4b5-41f4-a494-cfb6b7abe617@de.bosch.com>
 <CAMuHMdW=igXesjxvNk=+in62neW=kipnFW2BUH3P7sfDnqXzEQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW=igXesjxvNk=+in62neW=kipnFW2BUH3P7sfDnqXzEQ@mail.gmail.com>

On Mon, Jan 29, 2024 at 10:57:40AM +0100, Geert Uytterhoeven wrote:
> Hi Dirk,
> 
> CC Kees (for the wrap-around in dma_cookie_assign() not handled in [A])
> [...]
> Was the system running for a very long time?
> dma_cookie_assign() relies on 2-complement signed wrap-around:
> 
>         cookie = chan->cookie + 1;
>         if (cookie < DMA_MIN_COOKIE)
>                 cookie = DMA_MIN_COOKIE;
> 
> but given the kernel is compiled with -fno-strict-overflow (which
> implies -fwrapv) that should work.

For my own reference:

typedef s32 dma_cookie_t;
#define DMA_MIN_COOKIE  1

struct dma_chan {
	...
        dma_cookie_t cookie;

Correct, as you say, with -fno-strict-overflow this is well defined, and
will wrap the value around negative if chan->cookie was S32_MAX.

In the future, when the signed integer wrap-around sanitizer works
again, we'll want to change the math to something like:

	cookie = add_wrap(typeof(cookie), chan->cookie, 1);

But that will be an ongoing conversion once folks have agreed on the
semantics of the wrapping helpers, which is not settled yet.

If you want to handle this today without depending on wrap-around,
it's a little bit more involved to do it open coded, but it's possible:

	if (chan->cookie == type_max(typeof(chan->cookie)))
		cookie = DMA_MIN_COOKIE;
	else
		cookie = chan->cookie + 1;

the "type_max(...)" part could also just be written as S32_MAX.

-Kees

-- 
Kees Cook

