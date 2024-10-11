Return-Path: <linux-renesas-soc+bounces-9680-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9FC999FE1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 11:14:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69CC21C213C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Oct 2024 09:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 842FD20C48D;
	Fri, 11 Oct 2024 09:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBWwGlXZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8E720C46C;
	Fri, 11 Oct 2024 09:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728638074; cv=none; b=eA0pmwz3mO7k1hpacTtd8q/gp0qZ8PO9favj+S9ZzVZ/XlfTpQOin7kzl7KnI6uyPA7j+X1ihLq/Q6Ag2KmVUQgKLYHDU3sizZgsxR0XLEo4aZ+gO8vX2u+Hwenol595IAqSFnFKPC9AL4w6jY9BmB3S+3/Te2LmOSuUpyngfs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728638074; c=relaxed/simple;
	bh=pm1R6q6lJJ6RpeRNCdVCinq55I3Vjxk/fLUNmOjC34Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F08LdEOgSSr/3oTuvUOspEsF0W/q0cEpaMt1Qqn3t1CjyiR6Jdh849N/WJuticdrATHkPZ3AjqZcuNJX3WE5+xQLtgdQf9DwzjUYDyap9s00cugRHRLbay8WwKTC0/lJYXf1R3OAhUA2N+buL48zGkq9LAGTnN98TN1iVoeieg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBWwGlXZ; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-84fd01c9defso465198241.0;
        Fri, 11 Oct 2024 02:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728638072; x=1729242872; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pm1R6q6lJJ6RpeRNCdVCinq55I3Vjxk/fLUNmOjC34Y=;
        b=KBWwGlXZ38tzb5Oy8Z4vMI82NRPGQG4N+6Aex8XaXcqwtDdXE0DD+xe2K58nJjlmfO
         ZEOPFKjlhbC3HRzO+FBjbYY7M7Fa0QHeEu1Gm8XF//l1yIpw5TIvwfcAnoNJFKTNRpsm
         PayNF5IUOvcl6gjcqUL3LP99/NcHtQ5+WbnaWn0V30SLg57ilqFBaHTZ+u9do+aAWG1t
         pE7sKWwjY3wUVhUWXEfMdU6Myl60RGbsQwyt5GRvpdO1BUKwdZGIR0aQZzgMpbYqI/jT
         KpYuV012crX7PWluHSheL2kwZ2mlNe9YtGmwxy5x1DUJqYDqc1/qt/IVqj+vR+gaE3tp
         jTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728638072; x=1729242872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pm1R6q6lJJ6RpeRNCdVCinq55I3Vjxk/fLUNmOjC34Y=;
        b=exPVgQQKqpfvIbKduO1MG8+lGWDRbNqsPr1m0KxWx8k9PRxRiBvDGXnmiFoa6twewT
         1f/dJu8X1y3t2IVNtzKp2abvmm8EsQtJ/CVR45/lFBcpY4aTNdeXNSu3aVUvOG0NsXHv
         ruRhLKiZULTIH0XkLnoHRXNv/h+ac/YHWUp2bFjOCnbcttpajM/Ui+F7YC6I2LixdC0o
         MGTn6P1yqhZIdZdKYE+WdhNQZYgrvtEaFdPZfJjiyoKK78q5b8qZkTLK2pgU8zn/TZ8h
         qaBBM2URbjHVsv5SlNm4hDi7eRqC5swO6yTAK7+3rLEBjbEioaBsquo6U0Qb3tRHV8T0
         4cRg==
X-Forwarded-Encrypted: i=1; AJvYcCUrs5DJMm2utO3JgyljTkJd+SArGj1MZ2nCbGj+61121Bnffyah8ldi0c/DUU/a7aBT6LAy9WgVA++6nCI=@vger.kernel.org, AJvYcCVv8x+l8Fg/rh8AJYYbvAMCJRjcfbJQ/5wZJnbPxcQQeF0P0dN41OtZ195+rkfz3OM8F/sfY904AcGhq0SBuMFnrAA=@vger.kernel.org, AJvYcCWdeImCVwdMmv0IiefGrtQPLnSbmry7rc0VkaSIlEAe6IAVBJnS9LTj4WOVMD3cbcBv/1IZReftqA/JlIA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0rMRI7m2T/BllOsTzNX/I5+1oMSq4NWjXZvxUkDgDBRQ+PytG
	50t5Wgjp8gSqLedzHJdvv5L7jVWy9PJ2b+aPpmTteKehVnILJGixv58hTfXFehRA/zOWjHq4+0X
	olz2+bxP5saARvI7VvI0Jg6U6Q6Y=
X-Google-Smtp-Source: AGHT+IFN6BwD7hbkdaVU4GTY7Q7yv6/OkCHoXg9LhU8kGTJStj4XSqIVXt9WrZknvEoLtnQlQrNDnn6npDT3H2lGJwg=
X-Received: by 2002:a05:6122:3bcd:b0:508:a4fb:a49f with SMTP id
 71dfb90a1353d-50d1f4fe720mr856880e0c.7.1728638071925; Fri, 11 Oct 2024
 02:14:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010141432.716868-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUzTyDvrAGZj0gp4QuW72LvS49VQxBT5UZP6OYXH6xtJA@mail.gmail.com>
In-Reply-To: <CAMuHMdUzTyDvrAGZj0gp4QuW72LvS49VQxBT5UZP6OYXH6xtJA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 11 Oct 2024 10:14:05 +0100
Message-ID: <CA+V-a8vzt0XLVn7BLWwi7d6Y9zUfzxXw21o4ZbERfe6Lt4V_gg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rsnd: Fix probe failure on HiHope boards due to
 endpoint parsing
To: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert and Kuninori,

On Fri, Oct 11, 2024 at 7:27=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Oct 10, 2024 at 4:15=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > I was intending to rename the sh folder to renesas, do you think that s=
hould be OK?
>
> That's up to Morimoto-san and the other sound maintainers.
>
Thanks Geert.

Morimoto-san, what do you think of renaming the sh folder to renesas?

Cheers,
Prabhakar

