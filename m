Return-Path: <linux-renesas-soc+bounces-12532-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F19FBA1CE66
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 21:16:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 703E37A231F
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Jan 2025 20:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8255D82D98;
	Sun, 26 Jan 2025 20:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="JoSoMn7B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69369481C4
	for <linux-renesas-soc@vger.kernel.org>; Sun, 26 Jan 2025 20:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737922609; cv=none; b=pRWS5QZ8K3qRBM+DbX97h0OSz7zTDq0/JMtMEPAx/8HM47iHSXsoax8X+QJulaIIq1VWSSxOGYjrQmT2cnGBhFfpySpdtcOwCxfl793kvBQH9Qn8bSpAJr6q00aQBYbXSEBLfCn+r5o5SgkyVPoZyp0uhzEkJ/XHx4vx5/FAQf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737922609; c=relaxed/simple;
	bh=WtEOXihcmsr1lzTZAMgAcbSQeEaS+kgFYwjB/o6hMB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DE5z0DadP1rEcw9s5vRgOMYYpb1ws9bL6uwXM8+knJ6ojB1/AEGmiBkAKceKcbNsXJfz3usHHS9A0W0BIUtn8ZnZzEGQrmfoCfd6LwFtWoxaqJHoni38HwH9U+0rP8rxfj050MtB3IMdPmqqsFk2qlFTVclbKRsOObQ/NuuWkm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=JoSoMn7B; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53e3778bffdso4272947e87.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 26 Jan 2025 12:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1737922605; x=1738527405; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4ZNtPux4k4w5u7VqNlBWLfdc0tNe6lI5K/xKjGCzzlM=;
        b=JoSoMn7B3UkRIhaMxPFuaZut181twuCL75XwqgHR5ku+swHwhcc9gNjMtt4LxUQMGZ
         cvodX8ozN6eDVacXcXESi9sRnqIiUtgxziBpIlMyEhKc9BnP1FU5UO+7OWUabbeVhzFN
         Ayyn+GbU9DSf4jeUXrN6WF9YwsFiteArcLdgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737922605; x=1738527405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ZNtPux4k4w5u7VqNlBWLfdc0tNe6lI5K/xKjGCzzlM=;
        b=g+rLNI804fnIywryJK6wPjzhtvRfGwLKU8qaEeeKS0SSdfLfsn4jb3rCd0F+2eJPBB
         v5Rd/BJPuRdo1GWwZKE4Dw+rZ53IzUUbOHLyaRYKFJcWg1V2T6KzWrQEWt5vTdchtIek
         9yHXbSKOootlGpjxuYb14QhUCuYo/aZqo5TsWXlDj0L8+Ql7hb419cLMvFMTHk6hMCFD
         nIND/F+d/JKU1Vi1Gq8J8/jxV/ZNJQsbydMSWjQ0eRINQE7mjom9YAkhf161qIeHEKB0
         H2GtagAJVis1fNT7wWlMbkxO+bm4jO8BFIUmhlqTClHOCIZwDOUByuWHR4cxxvU+wqBv
         BO5w==
X-Forwarded-Encrypted: i=1; AJvYcCUdwGSaeFb1JqCdoKl1eveT6CfLSNy2rbpUYJrmcaF5KOB6YCm4hK3Ly+SVkX6NimFLI6jClFEsRJKcxRLHT5OZIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzO/p+Q3zOqDtDZWedUW3HNn8xZ1D9FJMCX929bKhlTbV+VYbKX
	LSuAepUUDzvGPfxCcsmHfqw3fuXxyKWTxFbjj25cYhMZLY6+7GF6smJHUjNVJHcz7lid4BV6/Jm
	ex9AjpftTHpbO35b8MQpVlPiFSkJLZdMqH28MXg==
X-Gm-Gg: ASbGncuKArCVywDXXXdIi1Qm713rMhWlGv03nW7npnFYrt9OPxmOUIKfKrnD/4AuFpn
	9b8b+aJUs9yazLrqRvVJlRMy8VTiObfFL9fXg+5Yzn1cTDpoM4B0xVLptt7P7mg==
X-Google-Smtp-Source: AGHT+IHpNJrz9WMWch903TAiyexD5im2md1AOlljCOD9VDetDI+IYBTtnHkZ7in2filpfAXyEQB0mkMLJrBAqb/m4So=
X-Received: by 2002:a05:6512:3b09:b0:542:2f0f:66d9 with SMTP id
 2adb3069b0e04-5439c246297mr15817353e87.16.1737922605340; Sun, 26 Jan 2025
 12:16:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250125130320.38232-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdWmE2UiE7kwAyQKONSE_ytrNux+Wwu-v__K=jjpAutxqw@mail.gmail.com> <Z5Z06WowFspmXby9@thinkpad>
In-Reply-To: <Z5Z06WowFspmXby9@thinkpad>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Date: Sun, 26 Jan 2025 21:16:35 +0100
X-Gm-Features: AWEUYZm3rp0vUAqIsh0TRNx78BDvcUFd99-_H2ukVHyEscR3EILieZHz010UAVU
Message-ID: <CAKwiHFjM+H4ZQ5MjY9FVaHni3XiWnMkoVM8na=KPfHN2Q0eWTg@mail.gmail.com>
Subject: Re: [PATCH] bitops: use safer link explaining the algorithm
To: Yury Norov <yury.norov@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Kuan-Wei Chiu <visitorckw@gmail.com>, linus@ucla.edu
Content-Type: text/plain; charset="UTF-8"

On Sun, 26 Jan 2025 at 18:46, Yury Norov <yury.norov@gmail.com> wrote:
>
> >
> > >          */
> > >         val ^= val >> 4;
> > >         return (0x6996 >> (val & 0xf)) & 1;
> >
>
> If you guys feel that you can explain the algorithm you're employing
> in a half-VGA-screen comment, it would be the best choice, and that's
> enough.

So when I saw this, I even wondered why it needed a comment or
reference at all. I thought table-in-a-constant was a standard trick
everybody knows.

Isn't "The constant 0x6996 has bits set in exactly the positions
corresponding to four-bit numbers with odd parity." enough?

Rasmus

