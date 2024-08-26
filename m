Return-Path: <linux-renesas-soc+bounces-8219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B431F95ED15
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 11:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 696D21F221F8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 09:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5A113A88D;
	Mon, 26 Aug 2024 09:27:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E24147C96;
	Mon, 26 Aug 2024 09:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724664437; cv=none; b=nHNwQ2OA9oDJrh0sGo5Y/dl6tYPR3YdUNLR1+PKqj2lLqs7sG8ZusxChDdYAvLkWE6ieGhv3YeXjIP1TUNvufgpzetMPp4vqsZiSimVJnQjQF4afhbfSWXJcWp8DNDjMdnCA0uS/Gpe7MeK5mRrVF12jaXBTNvVCENdszmeJw4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724664437; c=relaxed/simple;
	bh=wsp7KJjGbrXKs3WqH9lL0M00zqLheI0fPK5ShhhUhRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pksfJy+EoWdAMWiyXPGBaBlJZIwG8NvavA7DtY7vQ5g+TB3t0IBvEkYGQGtW2oSm5XZDePkm6k7qcZHmOXw7/yQPJsFdETDzj/KCnYDGMLsVQFmtY6FSyQbK7S2N6aY8l2HaemRB46t+xm/fCP12rIH6vx4MoB2kf27umrWpPGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e1651f48c31so3872458276.0;
        Mon, 26 Aug 2024 02:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724664433; x=1725269233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6ROosA98TA6pN3xRVUuKKY9mzmPVa5kKQyDsm2BmrE=;
        b=wjPMPALF6/91z2cjfVyTMTXXO5FU7L3O9zToUXaAA/DlhdfBRmJe+44mQBIhcACbi0
         A9O0iBPWqKZMuE7HFWj3WZ1AqzAxAZ57T0zCYj1z6aEwS0t6mUPQa1x09o3lb9nC3dnv
         Xp/k/YxxHy6M7qyvpZuipkEvb5QFJYlQ9BabwqzCQIdJUI/ibDZp8ORtQc43JB9azDy4
         hO59wB6PYMwRwUaGQbZEIX67eqZQDP7tjpaZKm/A2ZPjafRSmUKMEy5MOlh8VXUgvHea
         kX69RI8+2EbRm2zsBiv03YdVJtMxItgHHjVpmzaEb2JSYq4SIRzdDsQIjslNScWzHcTo
         uAEA==
X-Forwarded-Encrypted: i=1; AJvYcCV6yO60enav+E3I28B/LAKkVgnkFLtQqX4qFz6VBPpNO3jwalCYcP7sPgjo7lxX2BbV4seKW2puUT16@vger.kernel.org, AJvYcCVQ5Z+9af/t/dhvaYkd3CjpY36rm2/mFeguVnJfK6V/vGnaczda2eEyXVX2gB4FPaSO4mVju21KZPwWSbqlgTabR7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkXXksSORoqEDoNdpw7fQbxcRRY8o4fwv+NEbNSX6W1NNTg42S
	0IaAAhoTQExHgIVZpipBmW1zfdRIt39lZPbSwf1Vwa+sMyUMNJYlwG6RE3kZ
X-Google-Smtp-Source: AGHT+IFKc4a/MFz28Z/9pet/Rxgd+7qHuRECsYzsr1r+ELsQWsmcL5exWz1UUpyOzP3FctWkZ9lLFw==
X-Received: by 2002:a05:6902:2313:b0:e13:c959:2d3f with SMTP id 3f1490d57ef6-e17a85ecdb0mr12321744276.28.1724664433641;
        Mon, 26 Aug 2024 02:27:13 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e178e487e2csm1895172276.21.2024.08.26.02.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 02:27:13 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6b4412fac76so36684017b3.1;
        Mon, 26 Aug 2024 02:27:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU8YZtE+n8QyjvSGXEuRRiLFTsYpLOUOg4ZJCu9/V7Ths264lMEm160xxHNneVGOemb5YnvG6lNXfuLbL0GlnsHe1M=@vger.kernel.org, AJvYcCWIfwD7R1BtxfOSIQrwJWXNhmjAxN9fETgS9y+G/81TteqiQ+17DGQH5wDRhC6WuYS9Y7N28Q4UodTs@vger.kernel.org
X-Received: by 2002:a05:690c:ec9:b0:6b2:28c3:b6fe with SMTP id
 00721157ae682-6c62422c0cfmr122647077b3.2.1724664433168; Mon, 26 Aug 2024
 02:27:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826090803.56176-1-biju.das.jz@bp.renesas.com> <20240826090803.56176-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240826090803.56176-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2024 11:27:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWd4xUKY_avnp+77HT+bTn=TCqjTjM=VEwYQjEoLp_hSA@mail.gmail.com>
Message-ID: <CAMuHMdWd4xUKY_avnp+77HT+bTn=TCqjTjM=VEwYQjEoLp_hSA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: renesas: rzg2l-smarc: Enable HDMI audio
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 11:08=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> Enable HDMI audio on RZ/{G2L,V2L} SMARC EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped SSI1 RXD pin as it is not connected on carrier board

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.12.

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

