Return-Path: <linux-renesas-soc+bounces-25160-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DC2C89808
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 12:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 211DD3B0C44
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 11:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7BD31C58A;
	Wed, 26 Nov 2025 11:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PHcYHLIX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9FB2D7DEE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 11:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764156390; cv=none; b=PYtEjaSqx5bkjjavbHHeMc8sF+4YE/VdzIH9vCISWzNmPOZn/8X2ubOtLGMn6iubWsLdUTSHTttKJ1A8/RwV0GWjwZP3tdo5f8PTkessj0lrs2Ev/kFs495STMdinaPdDs1Wsgn763KxZVuKOQxwQvW1FZ0Jy460YC3/7Jq2qmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764156390; c=relaxed/simple;
	bh=8MYJEKcWCXXBqMxXSe7QIFRKD3q14ks241owAbInshU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HKjqsaJqIh7ycui4wJAx905TnPauIdEK24FJ1kWQz4twAzs86d5JlgdUPqJtaymmcaFetDbqToXaRp/ZzgiQ+baAkJ0lswBtpwY/AiHnLoeOC14NCXWcQZcS1JtY8XEa/mGVvtCgXDGYdvr7GvbDtRE6il5im59BxoFhSXNLIgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PHcYHLIX; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b3377aaf2so3829352f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 03:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764156386; x=1764761186; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MYJEKcWCXXBqMxXSe7QIFRKD3q14ks241owAbInshU=;
        b=PHcYHLIXyst2tsSlv0D7deOi6qA4k4F78PQ4SVJDGs9JFgF3M4Ew8H20q++O5qJwQx
         3foyHFBRfpmO4AxMxud4jl2k7+OzPZ31Uy1+pkPK2XxBnWLJLT7ucgZP9JvuHzMTSh1x
         +AKXv0LKXDtOakzTzNrKhjKopPwn0mOoWsTmoWwlL/uCIt9zA8GOkOuU3JlQeu5iMkNJ
         AVKbkZrzgz61DTlRe3YF7MMGC0QOU9+nK7AEDCez9VmkU9Ata9sYm51DWTOwub3ogTS0
         VObd6Hssao3gscZcASGHXsIoHJFjmzsRg/0VQOi2qa+53+k5cZe4O3nKE6mRVg5lOUz7
         ZNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764156386; x=1764761186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8MYJEKcWCXXBqMxXSe7QIFRKD3q14ks241owAbInshU=;
        b=cZJRbZJQVIqi+meqI15mE7gHjUUhO0hrsd9rzkcGHEaJFJh3gJc4E+LFcNCSeeYa6e
         okzHTmn8fq+RjGJD0neuE9FNT4e5gOZ+pUvhyU+4+Td4DjiV/wkwi7comYD+zpb3l9Jc
         M0c7CvYUqTCEP3g4CMLhEurHjjqQdfU4k0LaXrLCbhGvO4e5OOJe6gO0abJtLtcDhDBl
         33WmW4q52WLdxGb8UE5y3o1yjQPP3uTUzNcONU6ye0D55EebcztqXF7EDpYKgcR0fXLv
         Fo2ZWMg74P/5i77ux3gKEXD/Ie8D9PTiHIwdddZCtIKkEa5g+0R4t7uOOmvPiPHd7Jp4
         yPPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUAnO7vDNZrLkIi4Z/Idwgb7/VPur2wppVLrBN+mcXNOrf8KFBNlAvLI92CrHlJS8TanotL0te09EoZtK84zTsMw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+eOfPKC7CvSOJshWZAi79SgkYMwzJmzX7F4Td0lvjraJb3hdb
	eqz8aU5UFr76jHnpcJufnj0wDfmHcJZymbgXUidRos0eINtKV52LefHUXdYMTjsA6uYQDm9/wPW
	uKI8IlM1L0KPeDJYmxkGRUdYkmuzOzC0=
X-Gm-Gg: ASbGnctwsx4lqsQHBJE6Nf38rcig4BBzoppV/83RXi9lFZz2n/ERMXDycsOpOhIelyl
	weeGNEjW6l7Rb6WIUJPKoo+bVP8e8f3eFbVw+HbsOyzI+WmsggvQI3pKQsHDUudsApwF6l5eGn6
	Z8CInmudwhz+O4jAq/Dhfy+vkb3sxbi0L+TozWsKW9D1mfwvWd9tdm3BkhBxWR3Iorm3heyIYPQ
	YHi8QuDIWk+P8jbYY1TIqKQ5y1LqIPr5syKXqnYzQPwjwpfufjDmhnMaaJi7WczarvGhZJ5iRk7
	a0OBq73SMBalHiZIFKzDjkGOEXED
X-Google-Smtp-Source: AGHT+IEfxH2gmbZjPvKqNRvwXZKBYKL2SIu7e86pEBjVM24jiUKghAqZeKz7p8L/eyLcZFzkOO7av5Wei6NJvGffvgI=
X-Received: by 2002:a5d:5e01:0:b0:42b:3e20:f1b0 with SMTP id
 ffacd0b85a97d-42cc1ac9b39mr19266519f8f.7.1764156386428; Wed, 26 Nov 2025
 03:26:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125214529.276819-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <a406ed6a-fe64-408e-92fa-e8acd5b5a4b7@sirena.org.uk>
In-Reply-To: <a406ed6a-fe64-408e-92fa-e8acd5b5a4b7@sirena.org.uk>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 26 Nov 2025 11:26:00 +0000
X-Gm-Features: AWmQ_bnQBHmpRAU8OCjX9DaZotrDkjp5pmQOqZ8wHmG8HVTaSnE831nFJrDwISk
Message-ID: <CA+V-a8vn93Y-tQPfv6kZ2uSuh4kMQwkihZeqzNZNC2RzBeabPg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: spi: renesas,rzv2h-rspi: Document RZ/V2N SoC support
To: Mark Brown <broonie@kernel.org>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Wed, Nov 26, 2025 at 11:21=E2=80=AFAM Mark Brown <broonie@kernel.org> wr=
ote:
>
> On Tue, Nov 25, 2025 at 09:45:29PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document the RSPI controller on the Renesas RZ/V2N SoC. The block is
> > compatible with the RSPI implementation found on the RZ/V2H(P) family.
>
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Thanks for pointing that out. I'll make a note of it for the future.

Cheers,
Prabhakar

