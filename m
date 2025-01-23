Return-Path: <linux-renesas-soc+bounces-12385-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27772A1A258
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 11:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 635E51676D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 10:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C30220E333;
	Thu, 23 Jan 2025 10:58:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F227020E331;
	Thu, 23 Jan 2025 10:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737629901; cv=none; b=h0fKZQo034Iv8kEwxIIFGm/cFIrT18SWFISihcsIF4D1w6XcXNXb5CH7Ol2QSqdsGx2rBGz8BIomqxowtgz3HqZjQCU2TPYzrcaknZK6J+Yw78pJ9KiF/crMkMnD75gBMMm5IDg2Vrk6X3ZwgdORd0T5D4OIs2ilbmuVM/1s3so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737629901; c=relaxed/simple;
	bh=ym5pSsupsnmhVRdwaULlathHDKcHbK97KPIUpebUrbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IKXg9mqOhpR7j9f2cz+0Bb2DY9tQ2TWrM/hSjV5xzG5TGXJE5zZbHxX9Re5VNO+SOZLmyM4NOXyX7iNWLznI4oS9eVPHhtPbw20H+Tln4wIQjya6FbSluFkSLDS/9G/rwgdHNyh6UCrI3+YtxqX/HUiGnxlo8ZMiUuPJgusyTB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-85c5eb83a7fso387197241.2;
        Thu, 23 Jan 2025 02:58:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737629897; x=1738234697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtX7DoRXUqnAZofgkh5q63zF27J/FwUYhIdiQf3PYXM=;
        b=p0DRo3qKcnmGVkHn6Xm0aHtsXCIMO6YL8/U+U2lhaGzmh9wfRqi1rcxIYP5zQaouM8
         /WWUP1jDt9EXvrNEvBrssWUSchMlvfDj3beMfLCb+rjmtoS8PrCeEKmP9Puluc1RHY2H
         fNJRLnErNMLAg5UWy9rTK0Nk271XawHlpHrQA6IgH/Y5cg7X5yyBkMPoGyLZl/d1A1jv
         hfkPZxvo8cMFO07fcoL2Gi+ide/u2yJ0z2NYdaZuqsss68VAtwbzwQWFcdq4t3oMkLhP
         lbVpsqXhPt1FL8sRDpM68FXJLfTPOql6Z7iYIYuxuVZlCd0EK66Y7rXAWrMfrAOoBGga
         mi+w==
X-Forwarded-Encrypted: i=1; AJvYcCVR8lSdTu8mfkIJ+4zgpsuTGx1hL1ooQ5mFSNKDjVFfOHNS9hiVWaKmnIE9XvXnZ+5FdaI2UzRqxUJxbK0TfsuIPk0=@vger.kernel.org, AJvYcCXaBBkJTKD1jsf3SjfMZrICdspYCiMhzASmKsdZR9J/jCXQhiBrFQu1jawk3JbN44BZs3zaHkpyh4AbIzo1@vger.kernel.org, AJvYcCXfyzPWoP13CwNenALhwEdc9PIzAOcT+/NolRdggJ8hjxGYi3y75CHcM/AA5yqKNzBwYYv2v8yUWteC@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe4t1FQwbU3gYvIkPWvN+K5PJwYWg5v/nls7ILfLI2ZPxjM77S
	Md1/YqeL/58tWzhqer7YZIZxpAl4rzYxK102lPTeKLH89V8MJQZxp8dh2EfQ
X-Gm-Gg: ASbGncsUsQo7ysv4fqfGQB8Gf254DakHfG5zfbV7mA4Ma90ThYZUyvlbGWpLN4JSA3E
	y8dcFkfBQJkkrq736FUvhm/kEgugjTERXCRwVgdiFwf+15haplpr5TjOh5v8a3VbsdNfYxrZMKo
	sdqtsC+TCMR7+n9NoMgySrencgBtFZp2aFWJHfKzwxJqfNvQ+aadSxzwtpE6cK/FG2m8xOxMFOK
	tniNjSFc33Dm3GDAln1DZlZolr6bdSetl/HyOKAxxKnyxx5pMCzvnxW2xH53QIFbwtwGwu2KSJp
	HU3qfLU+kMUWnXhAS4MvZkjk/4p1RTrXiA50usDzHp0=
X-Google-Smtp-Source: AGHT+IH0ZzI07T1PGnOwXHJwuUkaDExz3zfAOH8Kq6pQrVhe8mLxIVZYlV/3B4WG+Np4zPUizC8Ktg==
X-Received: by 2002:a05:6102:3053:b0:4b2:4877:2de4 with SMTP id ada2fe7eead31-4b690c475b4mr21057564137.15.1737629896553;
        Thu, 23 Jan 2025 02:58:16 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b68a319064sm3136085137.23.2025.01.23.02.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 02:58:16 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-85bad7be09dso464785241.0;
        Thu, 23 Jan 2025 02:58:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVSC1ZrhmYfv9XuqAHIBdBv9rbKz04cq3ECJ7twDWappoVqACOlQJZsTH+qaVUU6jiNz887pVITaj+3LiCW@vger.kernel.org, AJvYcCX1SJXvygu/1CKlhKJHwV37UsW9HLTPuF4Ub+7ECJPSzYrMPfb0LOyq4eEsFY06BchRkHoefeZRKxsdUZ8NzzQ/dRc=@vger.kernel.org, AJvYcCXU5d91PGpFUh9ZsiEL1mmYvFvXE0V8xw6GZeUrFnQ+wFMDHcBRSafQ/VmwOqKOYzVr+F/uiuwomILS@vger.kernel.org
X-Received: by 2002:a05:6102:2c88:b0:4b2:cc94:1d6a with SMTP id
 ada2fe7eead31-4b690ca2b07mr23201273137.19.1737629896144; Thu, 23 Jan 2025
 02:58:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116144752.1738574-1-iwamatsu@nigauri.org> <20250116144752.1738574-4-iwamatsu@nigauri.org>
In-Reply-To: <20250116144752.1738574-4-iwamatsu@nigauri.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 11:58:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWV0GXh5oE9c+h4V3hE82Sw7GmM0C-tEUevqgJHxG+SKA@mail.gmail.com>
X-Gm-Features: AWEUYZk5Bi1XuZTB0kmctOWx1ZUa4x-ocqcGOYbpNleV0yUFa9EyMh6i06WmEg0
Message-ID: <CAMuHMdWV0GXh5oE9c+h4V3hE82Sw7GmM0C-tEUevqgJHxG+SKA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: soc: renesas: Document
 Yuridenki-Shokai Kakip board
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Masato Kiuchi <kiuchi_masato@yuridenki.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 3:48=E2=80=AFPM Nobuhiro Iwamatsu <iwamatsu@nigauri=
.org> wrote:
> Add "yuridenki,kakip" which targets the Yuridenki-Shokai Kakip board.
>
> Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
>
> ---
> v2: Fix the rule of binding for boards.
>     kakip board uses r9a09g057h48 only.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

