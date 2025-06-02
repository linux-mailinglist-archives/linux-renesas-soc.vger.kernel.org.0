Return-Path: <linux-renesas-soc+bounces-17772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A3DACAAAC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jun 2025 10:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68DEA178747
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jun 2025 08:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454E31B5EB5;
	Mon,  2 Jun 2025 08:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nzt6mYeZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4831AAA2F;
	Mon,  2 Jun 2025 08:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748853394; cv=none; b=JeYpn8CnXJuu2F3i8wXM3Ms9iAEcN5rRCtlcD5nsFoiu77s4d5sZGs4CV1WAhJXwnp7LbLJOPKISpyrLp8RulAmVf7hkoy0FvzPqB7sQd2aWLjjuLqb/v0m6QEtJcZ/u8YlbD64Z7L6lRHzg0Fsgi6DJr++HK4yz9F2+YImS7+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748853394; c=relaxed/simple;
	bh=iGdLxQJedJR10q6IJUr1rxrGXieIgbBd7uldv9npHUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kF1dSU6HcUe6Z7iflPHPk9D4VrSqMaCIxYD3opXC0Rz8wDYKJ0KSY0V3t3VWt6wR7Z1yqRNQk99mophzTIAP1dqlQ0BkuG4udzSqWMO+kdW1OHeAY3GBbEZFl5tDDZyop+YKk1GA2uslQ35EHVmrN92hEJhNzjWN5ID8RkeAYvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nzt6mYeZ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4fea34e07so897360f8f.1;
        Mon, 02 Jun 2025 01:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748853391; x=1749458191; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iGdLxQJedJR10q6IJUr1rxrGXieIgbBd7uldv9npHUA=;
        b=Nzt6mYeZFpBWGceqJIPQNvKmEeMTk72YwEY6liXtyIBxZP+Urrxs+iZiU98A+XZqQ4
         e3EsbKJrn3fT1DwpAUGtW7qkNXSo+NsPAd0eKsOn/r16uzbxVJTLJDPGgDFbVmhZweIx
         Mt6OrI4DCdhA0W7jxs+kDLv5xdzfZM9j7drUws9BN58nuMBlfTN5A54WL/G1WGI/gEm8
         MWCkMz3uS7Wg3F5rDuuUiyRdgmQjfvzeHsXzYyuW/ZRHcaa64HoVi4EgVks5dGNtaSB3
         H5cIKCybfssqrLOOCVy8k115Me87q1CyEbpIr4INTqq+ort3fjlq0PQ5E5SxrEVWLahD
         MOgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748853391; x=1749458191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iGdLxQJedJR10q6IJUr1rxrGXieIgbBd7uldv9npHUA=;
        b=nO+4csVYcmICh2uyM7+2utlMSwtId0IDFkakxNcehJmPR0fFRTOwAdSHYyulEUOzMS
         E2Z9i2OVCbDKSaWQ5V8RrIvxDJ65Wp4sAvKqUrDwxk8ZAO0URUXcl1Wzbc/8JgwR3Whq
         UKkYFcihUN4ayMdHUc9yfzzSxHK9iRI70Daiq+uqzYYQOXc9srghYiLArka/VidEdN3j
         kY0SAhRZBZIWE76biBtQ+N+Vh+0Y8BJDN0VkqXDCayMXDPiZGkuMQfnox5biBxGtiQYd
         py3Utv8NB8GtFGdJ7fwXhnppzyB8nJ7uhEZCoT2mEHhJ2Vhlzb7pBj1xJNVVL9HDsxMY
         51YQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8n76Nip1hztzf+zI5BsZet0+jjInpiN/nlNgJ3JbJ01fG+uLeUzHAn5kCXtAHAWwcHr5fwejewtW5@vger.kernel.org, AJvYcCVI+KYpgW4YGk/tfroGvF3wwaxBtjR2t2Il5c5s5Wk7y1saR2K3tPTl/Wz8cqayL7w2EDfJerGVDXQaDxjlWFiNIco=@vger.kernel.org, AJvYcCX5ePKpip85dT6uUq1sEyLfYekiu0l481B41vznky9r8hJLGUGviD+26chISh3HdtnhwoAsP/CYef+/aGHJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjml7J+gjHcOQagQtyOKPvJTVCzCCyOcT1kzFRNyH6mPy2Iffo
	3AaM4Z581KHZK7LO4i+bXFEg/BOjQh/YR/989/kAG5WvUAw8OGUyYzuzdP5iBwhAeIVi1quKr9R
	KxheMZN1R0QudwTuYhg30gAKj7SrpkZA=
X-Gm-Gg: ASbGnctNR9EeJk3/Ny6vsmMyL44+jC9R7lhQdsJPlDOuUxlchH+1CKgc09dJZdtIiXb
	DU0mLkjX5WnnGtc87Y4gXgholyvWlG6Y5l7XsHGW5LyTkaqynoeXewfdtBaYqruwE4fpS1x1rne
	Y4MHl6SkBYhdD1Ts6HcBNanu2uR5CnU64WXNGaAdqc8EYXv/5oeyZOzxrvtiEDcV9rxw==
X-Google-Smtp-Source: AGHT+IEl1yFIws4sUhYVt+mceahGviWsgSBrMHfHPOC+CYt5sYV8U0pDAY6BGzpas6W8OjgINEKeDfDm8N6CfrCK8Bo=
X-Received: by 2002:a05:6000:2303:b0:3a4:d8b6:ca3f with SMTP id
 ffacd0b85a97d-3a4f7a364d6mr8102292f8f.30.1748853390528; Mon, 02 Jun 2025
 01:36:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530165906.411144-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB11346673EBBFD1FB88D29E51B8660A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346673EBBFD1FB88D29E51B8660A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 2 Jun 2025 09:36:04 +0100
X-Gm-Features: AX0GCFv6flm37VNpA6T95t0a6H6J7zZ0q6BdfwG8BeDqYZlmDD1D5hs6SRIgbro
Message-ID: <CA+V-a8v9AnFjhGY0ULde8p=oct++PuBUusi=DfwObdAFjSkouw@mail.gmail.com>
Subject: Re: [PATCH v6 02/12] drm: renesas: rz-du: Add support for RZ/V2H(P) SoC
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 31, 2025 at 7:36=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 30 May 2025 17:59
> > Subject: [PATCH v6 02/12] drm: renesas: rz-du: Add support for RZ/V2H(P=
) SoC
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The LCD controller (LCDC) on the RZ/V2H(P) SoC is composed of Frame Com=
pression Processor (FCPVD),
> > Video Signal Processor (VSPD), and Display Unit (DU).
> >
> > There is one LCDC unit available on the RZ/V2H(P) SoC which is connecte=
d to the DSI.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
>
> This patch is already applied in drm-misc-next [1]
> [1] https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3D1f957fbb88b61e=
af5ac9bf2db6bc2e54121a4359
>
Thanks Biju.

Cheers,
Prabhakar

