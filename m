Return-Path: <linux-renesas-soc+bounces-5396-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EE68C8954
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2024 17:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECDF51F24C83
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2024 15:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7D041C66;
	Fri, 17 May 2024 15:28:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764E012D743
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 May 2024 15:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715959682; cv=none; b=bQkZG5HpH6fljXj/CxQNpgD33HZq0I/XffHcjPG0RqV3BX+p4UJ5LmEvhePNBrcbKNvYenyUKPqq3zjolOA6858lRTADmHhmyFW8Z/3fLJaO902ekhR0FI1eU2qLvwHLZGDBRA/FXR61JG5PBRRTm09tIL3KgjymXmghAWb2BHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715959682; c=relaxed/simple;
	bh=+ZFM8XSfR8KmOQ/EqBhZd+YHj95+cxY0mvlyf9E9bHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f6Sene4N9KLvs6MC1fV/w+dvGpS0M7fwpe0q4EDJMEeNp1aOfGir8NBf7Dw1y8LhrGIfkZ+V+IXY9onXBfjp1RECdcglKI+lR0VBbCxyimSfDZJY082X0i70xhC320Z3rP9TKWKq7OZ4F+2nRgGE6H2Mvfam6G8PtT11Bb835mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-620314aa1d7so3029327b3.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 May 2024 08:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715959679; x=1716564479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UB7ztqTyN4hCrX1jLwzsBEC0qA/pMR1N/Rzp4Wf7DhA=;
        b=Aw9tT1kTaUvs2JbSLvSuPxKksZ7D52AB2Gpp6UgQgEKFTqLiKU6Em4Pd4YqJX+ckm7
         vddg3hknh9rODPT379h+vD+UqQjz7spURwliC8oH90Fd/jjM4c6Ur1mi1Sbi4nELcZp2
         0tqfs543dUeXtx+lBkpgIBXbOz8+Qn9kmZhhDrEBwBcjLSTLQITcarCoOLjNTkN5Ois+
         DwG0er5I8EivdEQPpiZhXvhueHdwIkfBJiGzCMWL3Xzymgz5LR1qfwwXgqnqMWqB5NqO
         eW6lrKg+FZoJEUAPNsQEC9gxId5g4J917gcD5or4KPvTQ/EvvOoEKl+OK/58m1ralnUE
         WOhQ==
X-Gm-Message-State: AOJu0YzEuLfDEyOiAhmpsq2ea1SrqCurCxYNKBjgeLCC4E7wunAe85TE
	nVyfKJo7uhGKncXAl2MR3Ey5wPWRCvgpmm3qLlYhwQnRoX5zBXPF/3kvzAu9
X-Google-Smtp-Source: AGHT+IEgU21pTBHUL7C81N2JbwVSqASguBmjknpsEm0W+HMEWMNn/IVnHDIu+mSKNudfW2UYsgIinw==
X-Received: by 2002:a81:4e06:0:b0:61a:b7c8:ea05 with SMTP id 00721157ae682-622b001ec63mr236007207b3.35.1715959679078;
        Fri, 17 May 2024 08:27:59 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e272f0csm39388367b3.64.2024.05.17.08.27.58
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 May 2024 08:27:58 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-620390308e5so2721037b3.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 May 2024 08:27:58 -0700 (PDT)
X-Received: by 2002:a5b:a11:0:b0:deb:3cce:b158 with SMTP id
 3f1490d57ef6-dee4f3801e0mr20086937276.59.1715959678432; Fri, 17 May 2024
 08:27:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1715956819.git.geert+renesas@glider.be> <r74ymblr7f7ruwjzo3dfnr5y7xu3z3nf3e4esadicixdiexxf3@ycwbwxdskzzc>
In-Reply-To: <r74ymblr7f7ruwjzo3dfnr5y7xu3z3nf3e4esadicixdiexxf3@ycwbwxdskzzc>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 May 2024 17:27:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVBWDtfa81bOnbPneDEc=n4hC8wbM=EeXNddPHU8rd0ZQ@mail.gmail.com>
Message-ID: <CAMuHMdVBWDtfa81bOnbPneDEc=n4hC8wbM=EeXNddPHU8rd0ZQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/4] *arm64: Add CAN-FD support for R-Car V4M and Gray
 Hawk Single
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Fri, May 17, 2024 at 5:18=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > The CAN-FD module on R-Car V4M is very similar to the one on R-Car V4H,
> > but differ in some hardware parameters, as reflected by the Parameter
> > Status Information part of the Global IP Version Register.  However,
> > none of this parameterization should have any impact on the driver, as
> > the driver does not access any register that is impacted by the
> > parameterization (except for the number of channels).
>
> Does the BSP work?

I haven't tried the BSP in-se (it does not support Gray Hawk Single),
but a forward port of rcar_canfd from the BSP exhibits the same behavior.

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

