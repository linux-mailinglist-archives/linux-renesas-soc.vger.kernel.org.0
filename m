Return-Path: <linux-renesas-soc+bounces-18842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FA3AEB844
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 14:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2DC23568198
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 12:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065792D8798;
	Fri, 27 Jun 2025 12:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZIJtLqi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402242BD5A2;
	Fri, 27 Jun 2025 12:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751029035; cv=none; b=lsh2FPdeBzxf4ejKKzYDcUHzkQ4AvSSoneaLNV8iQ0482fg6KEzXLmWhNC2OqXqyfdOGalgRtfF9CW9Gi+sAv+dtm/a6/ZWiW+dxzK/3bpAng0nKqw+OmhMOAQX0yC7UEh4dTn0zP8VhYt8O4t6AN04MbMv1DwygXBuFWTw6NTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751029035; c=relaxed/simple;
	bh=AkmKR0xYEDPjcPRcVgxirrVmqPeqBwtXBNYFyw4Tz60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5zfKMgpdF/1FE/HTW3h9BTcdi9LZJy+JoOeB1P/fse4xu1WHlWARVQxXDMSRk8Q5DwkWNll5WdvLZU+aV621rjfo9SpQfSAAZlN4t5rVUNYb+Aa6NsmJyU0sVU86wmK+9udcXVf02DWwZFd2zXi1/Eju1aA44YAKX8N3LAhz8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZIJtLqi; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-453749af004so11939485e9.1;
        Fri, 27 Jun 2025 05:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751029032; x=1751633832; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkmKR0xYEDPjcPRcVgxirrVmqPeqBwtXBNYFyw4Tz60=;
        b=lZIJtLqicP9Hzi+55/kLl43HUllOsWvnRFzb6fxQi9NyLhuVlpX/1jpkMEnIodvISZ
         hzzhBSJKMGNT7koeUiinxK/lGvrri9p4cIuU73cbwxR5zzGZ6Kr6+Qw7vT5IrcYT5irl
         E4yWzhEBrjgSoU2HR4wbR8ZIYIDSAs9gyQZsgFMqVbRE4Ti5fSqItrNuVVOxlsvhadqm
         QlgV2U6jvtBGY4+TQ9338ousAr8oFlFsIKEM/dam4T5kNOSUY7EdfzJvfvwTeGmoefy+
         Qk7U1wBEL4l2HpIysjZ6Gu6LCYKSQFVWPZKAiOcgMq6KHxBQx/KeSKADw0A0nmRZxiNz
         zR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751029032; x=1751633832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AkmKR0xYEDPjcPRcVgxirrVmqPeqBwtXBNYFyw4Tz60=;
        b=O3fbNioRU2/aTbhOZmXUVXyrtIgCG+10dO2+4CvUH6S0S6aRtx6y3jRcpBRgd/8dHI
         RsFNDMBxWXLL1X9BAX5CmfKJXl4iWlU6keMS3EutA9mN0SJLFf3q8i9O5Sz7D10r1C7L
         dHBOOUNDDIqlRpQShP55viLhlXGGhzI+GEIyVXwSigi/d9WwtPYnrmL6YwTU81ppG+Pl
         92c1jQuwG09NYoa4qGklomIH8Emvm/MDGcfcoDaNTw8t4t+HE7HvUg8L3pqi1BHsJtvg
         fl58T5R6r+/ITkN+Bbc66Dr7Prp67or9wgXLvvjahIM6foTwMZLvqhrFa4raIFW0b7nS
         e/Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUEVIUc9KtNAm3p6/fBQiE0Me+KUplDKOLg3v+r5h2dEmSPUP4S2shqi8FuQ3bxLbir1DcIfXvJPxximuYw@vger.kernel.org, AJvYcCVByNZ+zIqFK37rdWkunzh+JeLDQ1MF105j2ijJZEA0x9t5bzl67UMYRTvnysZ4TRL5bwrO+8xVeeXZ@vger.kernel.org, AJvYcCWxBBAh4UzCnTshmc4zGswmvug0/E5FoPk5MN9HctI4wkhXf7icbfQ75ueNdtafXCcyJc98kEEBsJQw0a13@vger.kernel.org, AJvYcCXCAuE2j0sa97CkqPrM109BzOW4U7mU/VBD3BJn1EKwGbLbT4Elkscs3+aSStI/3y8ToNzn0axCoEGg+nVMFec5BEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNpmj52uOfM6tQnCPWLnD60no0nGqmabpwO8r8Bse2IIeMvi0A
	6xqAzsab4Wo4RgDRBI1AAVI+Q8i1JthabmOitZKdMAIEZohol/VjUAkw2Fd8bei1Vu+kMVwSlaG
	wLjbLYC9iqPn8e3rl29Cut1u+9UFFbnw=
X-Gm-Gg: ASbGnctJ7fu09tDpAiA67S8YSv7MO0NfOF0aT/0R+ALQ7jc/mkx6CwYXEAOG1QwH9KI
	4x5jKGxYoLle4haR6yFqQznk2j8o8dQUAFhkeKJ0HMHpUxHOSRtHRLXD49hNUCv5DwmjI+4qRYE
	3IhcGZKyz9sqUqp4H5hJLnMjV8N0qad35Tb8tXx965+jPHVhHLqityVUxl/M+1pGFjal51EPbit
	SA=
X-Google-Smtp-Source: AGHT+IHKdbl+eTMCuh88R2xCJ+XeeR6X9LKRFohCHCe+lllNLZxSZrhyD8AKsaAkbu5hHbSvhGJSr8N3tREsLIiIovE=
X-Received: by 2002:a5d:6a04:0:b0:3a4:d53d:be23 with SMTP id
 ffacd0b85a97d-3a917603853mr2155412f8f.30.1751029032221; Fri, 27 Jun 2025
 05:57:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617134504.126313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250617134504.126313-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250626230913.GA1338561-robh@kernel.org>
In-Reply-To: <20250626230913.GA1338561-robh@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 27 Jun 2025 13:56:46 +0100
X-Gm-Features: Ac12FXy-jDAZXET2UcOHcVJf9UsqPgrajzf1xN4jHF2Yc60kab9-PYhzOqIgUD0
Message-ID: <CA+V-a8tR=bWEwA1+iGHZojN-yPDORAR-hER-Euk-rVSQhn=CKw@mail.gmail.com>
Subject: Re: [PATCH v12 1/7] dt-bindings: serial: Added secondary clock for
 RZ/T2H RSCI
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Fri, Jun 27, 2025 at 12:09=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Tue, Jun 17, 2025 at 02:44:58PM +0100, Prabhakar wrote:
> > From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> >
> > At boot, the default clock is the PCLKM core clock (synchronous
> > clock, which is enabled by the bootloader).
> > For different baudrates, the asynchronous clock input must be used.
> > Clock selection is made by an internal register of RCSI.
> >
> > Add the optional "sck", external clock input.
> >
> > Also remove the unneeded serial0 alias from the dts example.
> >
> > Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Hi Rob,
> > As mentioned in the thread [1] below there are no users of the RSCI bin=
ding
> > hence this change doesn not break any ABI.
> >
> > [1] https://lore.kernel.org/all/CAMuHMdUThuWxxznhjvcn5cOFCWOkb5u-fRYwTO=
oenDRY=3D4H6FA@mail.gmail.com/
>
> Please state this in the commit message. If you want to break the ABI
> you have to say that you are and why it is okay.
>
Sure, I'll update the commit message and send a new version.

Cheers,
Prabhakar

