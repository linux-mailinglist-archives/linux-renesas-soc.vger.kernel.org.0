Return-Path: <linux-renesas-soc+bounces-10010-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF8B9AD49C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 21:20:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AFDE1C21F04
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2024 19:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547511D015E;
	Wed, 23 Oct 2024 19:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gyvPEYmg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0C013CABC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Oct 2024 19:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729711199; cv=none; b=Eqlng+KyYRjZU/TpFe235Z3s2pA/fdUe+EmeJ0NyNiCTMyC/Tm5lmnA+7oRlx6puHodvAQwXABWzuX352tMKc8AnB0A/XCP/akupBkcmCceClONGkmTG+CG+zir2GeWU3ArafpcwSBrPTE55PLIvVMw/dBsUMVNOTcDVo2xAnwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729711199; c=relaxed/simple;
	bh=jVfaEMDiqxEbMojHP9PBFB3cC/z3et13Xb9WEIyCI8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U0iiwYcG86tECGeVGeyHrvRF9NL13rV6ijCmlE7p7p4DtIDPLYDSMB2YHsdEe8e5kxLV0M4Y5ivekjDqu9F2OBwRzJe3Up8F93zWsn0WG/iM6m6vKN3h5w8MND9zHmu42Kn7tdsXuanLL3k22hekoyLIzeQbZGBkz0fkZ3+WXKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gyvPEYmg; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9aa8895facso9995766b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Oct 2024 12:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729711196; x=1730315996; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hmLs1fnyFuhch9ym0D8390T3Il2G3hywHxmDwOxNics=;
        b=gyvPEYmgNLZ4RJEIu6zb/MNXaMvkJi9SMwHBAW2j+7GJqaddfk0c/DT1zxIzBbWuAF
         tJKkhMN6ZFf9CvgCVXatR9tLrVu0MJrRzKMEBG7gj+X9hPLRL3GZtzlZ4WEZb2qEXkHw
         H03HtF+xvR8RZJcPoMLR3dZYSa4jMmTIfmEZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729711196; x=1730315996;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmLs1fnyFuhch9ym0D8390T3Il2G3hywHxmDwOxNics=;
        b=ArwEJSoJru9Yp1R5Hw6WucE6PXB7XfVI59ogIVILfLd341J13vK0lJMy8b70rbbUlb
         bERuBDdBmD0Ri9M7uXseCJJvJ6CkQNyD+Y5SjBpR1Et2kbR1jpV7zglxFTmnQMclmc3s
         Ttj64xrzuturZTQVfujvUII0ITe6K0tUoLjDHFtIoiutu6lEFwPK9sy1vL67odjDVxmd
         +U1l3CgH1UKuol7vcbCbqU6nY5/oduJmyjNSDbssCUgEs/f/Hgjbh4CCnJDaLaa0kTix
         WX3uk5v3aP+MmxWhGVIZKxgxTfyqQxw8a1NLheBHrLx9Bc0BQYLSiPVXhBttYqveD5Hm
         Zo1g==
X-Forwarded-Encrypted: i=1; AJvYcCU3tdyF1/whkX9tHf2FYbHfdpjQI217affABUZJYquZOOy/LAOLTYpv1Qg/7lUYGMRg0N3F+YlR/FB07eZyzzfCXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiTsrKJJNRkPSM2lZotS1DnL84uHex4fcBU8WPP6V6MLTJMYAJ
	PNjboBxjjuOnu+pqJ3Ow+eZe9jCsFveqooRZ+lkAfuCb+R6+7YFcKiKizy9bh9tjPz4xE53ulrR
	jCgypow==
X-Google-Smtp-Source: AGHT+IFZy4hH2l9bc8F8/3A7v7b9IsQR9gabVBRwZlLEWUJrvcbWIPZ6wVwahJgnWkD6YEsBFn/zYQ==
X-Received: by 2002:a17:906:c10f:b0:a9a:13f8:60b9 with SMTP id a640c23a62f3a-a9abf8a4234mr393324566b.36.1729711195714;
        Wed, 23 Oct 2024 12:19:55 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912ee592sm514364066b.79.2024.10.23.12.19.54
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 12:19:55 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9aa8895facso9988166b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Oct 2024 12:19:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUigZ7uCNM6n7SDFgiZYp85BOsRAdGw4jqeh2WN/ZKjELhwjYwVO8BxVGSeSrl/r4xYwX9thC70xZMsfyOoPxuO5w==@vger.kernel.org
X-Received: by 2002:a17:907:72d5:b0:a99:f4be:7a6a with SMTP id
 a640c23a62f3a-a9abf91ed4fmr407338266b.47.1729711194415; Wed, 23 Oct 2024
 12:19:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io> <20241023080935.2945-2-kexybiscuit@aosc.io>
 <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org> <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
 <e25fb178-39fa-4b75-bdc8-a2ec5a7a1bf6@typeblog.net>
In-Reply-To: <e25fb178-39fa-4b75-bdc8-a2ec5a7a1bf6@typeblog.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Oct 2024 12:19:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjw0i-95S_3Wgk+rGu0TUs8r1jVyBv0L8qfsz+TJR8XTQ@mail.gmail.com>
Message-ID: <CAHk-=wjw0i-95S_3Wgk+rGu0TUs8r1jVyBv0L8qfsz+TJR8XTQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
To: Peter Cai <peter@typeblog.net>
Cc: Tor Vic <torvic9@mailbox.org>, Kexy Biscuit <kexybiscuit@aosc.io>, jeffbai@aosc.io, 
	gregkh@linuxfoundation.org, wangyuli@uniontech.com, aospan@netup.ru, 
	conor.dooley@microchip.com, ddrokosov@sberdevices.ru, 
	dmaengine@vger.kernel.org, dushistov@mail.ru, fancer.lancer@gmail.com, 
	geert@linux-m68k.org, hoan@os.amperecomputing.com, ink@jurassic.park.msu.ru, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-spi@vger.kernel.org, manivannan.sadhasivam@linaro.org, 
	mattst88@gmail.com, netdev@vger.kernel.org, nikita@trvn.ru, 
	ntb@lists.linux.dev, patches@lists.linux.dev, richard.henderson@linaro.org, 
	s.shtylyov@omp.ru, serjk@netup.ru, shc_work@mail.ru, 
	tsbogend@alpha.franken.de, v.georgiev@metrotek.ru, 
	wsa+renesas@sang-engineering.com, xeb@mail.ru
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Oct 2024 at 12:15, Peter Cai <peter@typeblog.net> wrote:
>
> Again -- are you under any sort of NDA not to even refer to a list of
> these countries?

No, but I'm not a lawyer, so I'm not going to go into the details that
I - and other maintainers - were told by lawyers.

I'm also not going to start discussing legal issues with random
internet people who I seriously suspect are paid actors and/or have
been riled up by them.

              Linus

