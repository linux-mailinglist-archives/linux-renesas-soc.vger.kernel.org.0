Return-Path: <linux-renesas-soc+bounces-11607-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1849F8E28
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 09:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF50018960F4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 08:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F2E19ADA2;
	Fri, 20 Dec 2024 08:46:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634982594A3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 08:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734684417; cv=none; b=s6W+kKhGIAzO6curCuf6GGQ3h+MseqAJLN9/VBAbog5hJJgfQ0onUNQNL/x2qxR2QwVq5u8JjlzsXVtqfVllAW8JSiLYRMUvjmpYvXV+NvGVUV1KZDHEynMbiqmiAn/0PrkdN/tNz9EVJOrsGLYLxrGSoschtnl1bY4hhpRDSY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734684417; c=relaxed/simple;
	bh=B3/x7c+o+jOzHfYvXIw5R/MO9nBV8/J4OloyZgRLCzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wd4q4yMSvLHps7hmH73q1yvtFlNqKQ+f5avjAHQzC93e/P5k+CUYypPfroramMZol1DCIdDvdxnhcusNzqQbx1Lor39UmTysLcEVolcQL3b5zBAfOFhtuueK7Sb7LnKORrE9E73qFF+n8+9JScOX0Uu3fGR+mbDxg440rd9dg7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-85b92397fe2so344935241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 00:46:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734684414; x=1735289214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMGgWsa7y60D5IAlpUC633KRtr5EIYgMuwLWC1uedY8=;
        b=Im/+bSLlBnFHbrzptEmF9tInHGSsg287xRmC0eGFDN+rZzY1QRWO3I8cxHkpnqW49f
         hlY13tRwy09s6UQ2dpw4tlvixIq93eTi6GHzxqhNy2BuZmqlpHnSFCqDH/QncV1O8r36
         HL4Evi4cqfygXZsEab4HrGIus6CIDgfTNKBa7t9nDEu1dazUQ5jjCHN7suBGuLHfVK74
         E2OSG6UigXKHWnDqHgE3YE0xbPEwLjGSvAgyC32kcTuZTeLd7xOjFtQg6H6H9QGlRbn6
         Rc5Hbcf5kn0ylg9sNp4fP25snWfeSv/k3ScS6SIxryzn+42bEw8YsIrTcEjREx8RYW92
         6sNQ==
X-Gm-Message-State: AOJu0Yxho7aQeZZqLyTVkwPqECTpvLJFO4WSi00qTR90E+D0pTrJ/Bt9
	3pT2eubLQ9+YdTFHPH2xMSywus1lrGyFTt5LQ9Yr/ZGFsngWVPTpED81y3UF
X-Gm-Gg: ASbGncsRjAyKDc0kFO1jyW+3dflT4LJYO6Swx5wCz14CZXItm9YedgMw8fDAXaFRM7T
	o4YOZhgU5TNnIvcRUJnojEqkMEfh+z3DAMtp7bHAaZxPQmmHaFEHc8xZ0Z478tHpKuQnXMHT1TV
	xn+iMTpM9KvUuuHa9AOOwEd3mvfUqFmS/hjqYTd48TyQwDAbhwfgvCXH8Fj+/FuONNSLKHTm5tl
	eALqCpbaAzzWBgITIeQrs/Tzn/271obUnJ2coesx4++Pv2b9IAjI62bSgGH3K3OE7coJFlzDnbt
	t93Pz6jymqxB8rrj+pw=
X-Google-Smtp-Source: AGHT+IHIwH1HRWwaY7fWhxUaSXc26V9FoBqGfuyHb4p7qZ/08F6CfA9lpVSSiOJRep3i+7J3yYCB7g==
X-Received: by 2002:a05:6122:4089:b0:518:965c:34a with SMTP id 71dfb90a1353d-51b75c3f49fmr1927680e0c.2.1734684413795;
        Fri, 20 Dec 2024 00:46:53 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68b7d1a5sm292221e0c.1.2024.12.20.00.46.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 00:46:53 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-85c5316f15cso475871241.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 00:46:53 -0800 (PST)
X-Received: by 2002:a05:6102:3707:b0:4af:f6ab:9f9c with SMTP id
 ada2fe7eead31-4b2cc487ca5mr1654888137.23.1734684413478; Fri, 20 Dec 2024
 00:46:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219220338.10315-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20241219220338.10315-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Dec 2024 09:46:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVE7g7p_ysL6MjJqFxMdM9eY-cuOhXb9mAqDaJp-FOOdQ@mail.gmail.com>
Message-ID: <CAMuHMdVE7g7p_ysL6MjJqFxMdM9eY-cuOhXb9mAqDaJp-FOOdQ@mail.gmail.com>
Subject: Re: [PATCH] i3c: fix kdoc parameter description for module_i3c_i2c_driver()
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 11:04=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> A typo mentioned I3C when it should have been I2C.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

