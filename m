Return-Path: <linux-renesas-soc+bounces-18283-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF58AD8BF2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 14:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB1CC3B4B6D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 12:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4E22DECD7;
	Fri, 13 Jun 2025 12:24:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A34291C2E;
	Fri, 13 Jun 2025 12:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749817452; cv=none; b=hfUamTq0rB6Mc8Opt7CeeXW3qXAr7Y1nx9HK7fpuZhdZoHUnK0Hj2zAWY1yQJrjh5pei2IXQuE6iO4hQ1KSVFSUk0Bk8VCEnsVzShwXgAli7SZj9zObTfvOpqfnCnAdguKKDSrFucxCGfuKppXbhRNOO3ZpPckKMbzNNucNeaAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749817452; c=relaxed/simple;
	bh=fPnnAEsFj2pXGJf+KlWLW3/3Btcwm7tHlz6Ibx8xA5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CAh4IvNiJTyL2IgmfXjL+8eUu3iJRzsC9Qlsw315aVqYrk7ETNuez6JaWDdJEpOsoTABtD/qj6C0p77CvAPK2mH1hPLC7jyr3JeWlKhUP4YXRWZnFiVo/9JRNMp8F45AZYJFYxcxxcO+nLCeGgohNesoBMLi3w/i3EimDPWMEhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-87ecc02528aso555981241.2;
        Fri, 13 Jun 2025 05:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749817448; x=1750422248;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+gnQwem1mwUuekrLA9IOnRJxUiNMrjqNgOKJoIX6WMc=;
        b=ewxBxII6bbnv/Y1Duv/dFw3ifYb2s5qPn7+BGMiqQUreMnq4UKvL7RQLdUdHL3m62g
         N4iMX6C85uaNKeQUFga+AXcldmIO7Tyexcnb0+bIyFWn4dQ+vps8SZC3/7qS04/jSLO2
         W0b8+x5hTCcedN9QD2QVr4WYnniVT/jW1sUDSb4AMK+3f0tSG0mTTPRwKXh78xztP9/M
         LVL9SPjeYb4KJiPbFdfjWs1lPZFxz0RUWv/oWabaa5uAPWmYV03rrOAK2TqJrjtZS6fh
         I/OZlOexfMozlQhSPBeczDQl032hXZi7s90uOCVtCiRZVNgDaIhYlPj1gzxp2QVX8Vd9
         pULw==
X-Forwarded-Encrypted: i=1; AJvYcCW0DCnJUH4yhjGgDbAZ2LMI/y8H8TN/Jy2LMR3TX0qtP6hksDSZOYkcsy7+uFnao15WnxFkxkDyqWwSazurx0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7xeXxIHnTLZxdaYPpns3BK+NVNm51Zf9o4rm6YtQsVTcHSwN/
	MYyLThIKzv5d1glnz507EHD0h2f80G6DSmfmS741KJWaRfGO7dUlcFwAPkkvit6D
X-Gm-Gg: ASbGncvT3H3X9vLyuX/k71mO3Kz5gQdVTzZhINLvPO8bXBKC5zUne5jns8mJTWfDXbO
	HaHttg0XnAYrqgwJw6tfDtQpLQ41l9AN1sBCKiieooFCqEjOATbAvbr4iFBbPaJvwpYtvx/tDOu
	QBVH6LGPMCSfbyfOi5tBmeaulcJ+UaooViJ4U5B/FP6MwsVW3t/5uD3B9Fwg5NutEBHUTtuKRg1
	qyv5lVTaqi8tk62bE5AEcu+i31I77+HGHWcTDdlYIJxQuJ5BavomOpZb5z3jAMGAGtuZL/baGhv
	P5QTsYWTgM7gOjknRazu4ZIIG45gGtdgehHSEs0mI1oYfG+YEWS1MjKACpmcAkB8j0riMW55fx/
	MVWlhSEE//HCTwBZXASiFnqKk
X-Google-Smtp-Source: AGHT+IFMPq+oCs/ySFYCvKM3KjyKfmz2izhhckrF9F9YHz2Wywnm+NrY3X07VRcrmQ9Ni/98MJu6OA==
X-Received: by 2002:a05:6122:2912:b0:531:2afc:461b with SMTP id 71dfb90a1353d-5313ca4d013mr1918776e0c.4.1749817447817;
        Fri, 13 Jun 2025 05:24:07 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5313dd849fdsm202402e0c.3.2025.06.13.05.24.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 05:24:07 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4e7b9cbd19dso535500137.3;
        Fri, 13 Jun 2025 05:24:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUJ/ly60PuH898m2oD+kQke0Hme8LhqG9C6ce689295CnrTRaa2KMJkKsb+aUvcgYFgUDZOQ2wq5I2p6cNmA6U=@vger.kernel.org
X-Received: by 2002:a05:6102:6a96:b0:4e5:a394:16cb with SMTP id
 ada2fe7eead31-4e7e3913affmr1776882137.7.1749817446838; Fri, 13 Jun 2025
 05:24:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
 <20250611093934.4208-5-wsa+renesas@sang-engineering.com> <aEmws+OtHirrUPUo@lizhi-Precision-Tower-5810>
 <aErqY0QWMRdC7Pvg@shikoro> <aEsDj5Vcb4zFJFlo@lizhi-Precision-Tower-5810> <aEvyfM42WTKENbFO@shikoro>
In-Reply-To: <aEvyfM42WTKENbFO@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jun 2025 14:23:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXW_4gHSTo0roNUpBrq2gLVBK=6zY_=rhh8OP85KJdqTg@mail.gmail.com>
X-Gm-Features: AX0GCFud3FpU7j3L5lRkGCpi0azPf9mSlrHfr1677jlPzJNObQkb7btaZ7k73WA
Message-ID: <CAMuHMdXW_4gHSTo0roNUpBrq2gLVBK=6zY_=rhh8OP85KJdqTg@mail.gmail.com>
Subject: Re: [PATCH RFC 4/7] i3c: add driver for Renesas I3C IP
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-i3c@lists.infradead.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Fri, 13 Jun 2025 at 13:41, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > Sorry, linux-i3c mail list always delay your post, did you register linux-i3c
> > mail list.
>
> I did subscribe. I receive mails and my patches using git-send-email go
> through directly. My responses to mails are always held back just saying
> "suspicious header". But I don't know what is "suspicious", so I can't
> work on it.

Perhaps your overly-long Mail-Followup-To:-header?
When replying to your emails, I always have to prune the To-recipients...

> I am going to the I3C Plugfest in Warszaw in 10 days. I could ask people
> there...

Amazing ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

