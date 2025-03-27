Return-Path: <linux-renesas-soc+bounces-14913-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C30EA72E74
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 12:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AE6D3B4D7D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 11:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11DFA20F096;
	Thu, 27 Mar 2025 11:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQbVgKTX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D8F20D504;
	Thu, 27 Mar 2025 11:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743073622; cv=none; b=eDxEARLMtGunLVTatXf66sNZCiO3XIIAJvjxM0JG7T4Z2+0/yNOyTWj2oIKIySfg5Q7bSrs+qbyVrIBaXZEY4kjy4N0zWK0bVUFEdApmpGVqRvVPZi4DZNG4D2ff4pzUShap7G9lxN+4I6UXiTLSAZ6apnEv/INKZ/U33W0XQ7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743073622; c=relaxed/simple;
	bh=BuQdKLqrhWHmhs+mT0ivoRzo7Ii9+wiV5JhiJYZKvi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mf5nx1JR7Leugvce2FGxqUdMOdbnqd/yXAHL2LXznIK3aforDQDfqYXk5Ge+RFqCz2G/ci3IayaP57917wn1IdlScyIQHhBzvTdjTYhF81anyLPhMyZEHeRp9cocl3af1aKJb021jA5+cAT2UnB42m2AX1o3qWxz9x02LNN0bxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQbVgKTX; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-523f19d39d3so452112e0c.2;
        Thu, 27 Mar 2025 04:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743073619; x=1743678419; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BuQdKLqrhWHmhs+mT0ivoRzo7Ii9+wiV5JhiJYZKvi8=;
        b=UQbVgKTX1tZzQhqimw3SmQ42Fbvcy8lKOpP8LzoB2JZ3xHxOJCgSjKYvlHFrl2+mKy
         BdjwYF8crc1guEZIskZmPDbQIfqFigtunQwsQcbUfBioqGfUFH2mppzxC4sEPKWwh5xt
         duThTIAtmTDQ73crJPN1ogTOjJ0PrpADURtgl6lReu/x1ta+nDSKI/X20bVDr/5t06F8
         9V5uD976YCBZ+KaW/DJdtwHtD5Nqqb8z/N/v1bpLTcqzr4vg9zXgzHzpWsw+7x1KtTu8
         Al8UcET38BobFo57T4/wLXTO/Y+wJ77gIq2v9YJx2zyc+Q1WNi4b+HWX60LVhPl0wtdD
         Piog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743073619; x=1743678419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BuQdKLqrhWHmhs+mT0ivoRzo7Ii9+wiV5JhiJYZKvi8=;
        b=QHLm8NrYwFBS14AkuXpv6HjlFrzN2yH/Xc5eBruQXYrqkWrdfkUF0pvq90E/ZQTidc
         6i3bXgJ5AtWpWbOwAkLXnYLdg1Y78KGrXJzCzAkonnF2tcG0dKRqVp1eTnBrTXvgZMWW
         xfwx20gtUQb4/By/O9MNUNqZktxhVohoAP9LQNNoEN8cQN45JnnFVkqz5gafqRPBYZvK
         4rAShcqcPXcjp0buHtue6D7FFm8bVgG/N5FVC0pLycvG93QVd9cwKcrNaIArLvt1ggDh
         H5edoF7V9lPp6iqptURO4cPP1YW4Z8l3MgC3QRtmoiIsr0B8/t+ZxLI1Nsfk/KdamSvb
         aP9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+gEWke3N30/b9uGxoDsVdlsRYQfkECgkXPEAKgZLPe9EmhgKYLqtLZ6wqs26eYw+SpAuXpMsxEXSoB5P6PYnfTP4=@vger.kernel.org, AJvYcCV5EGAl7LKrQ5pqCOJAlPJexyperLpFZFfBDaitRXND0hRFiWnTBTqyUwHQG1pNxOTh1oPUmICf6dMo@vger.kernel.org, AJvYcCVd4mbAzzzS8ILoR5aLQ2D2kkGg7hUupntErxUOUbLKFrSFrH9+YJbER3DCbt3Fx7fD3DVLNICQdzXmgFc8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1ZJIn8wK76dXncxJTqtFV9vNkqPYdcBvj1yTIgJ8Z7G6X4Mw4
	PEijXB7H676C3ilgDTxkTnpgTZfaZmGsIZpGHCrdGGYcLA8RAEUlY129VQadW3SPg1d1GiEa5S/
	UeKuzMt86DM+2NtMo2wZpSbLzpoU=
X-Gm-Gg: ASbGnctpNUI5G4XI22tkK839Lc9DNktm1hOuvUhxbmuoSsRmOj9Gc3jcKuWFDgAGB/E
	iLg5LusxO0r0yTvCVm6RD5yysctNk39P2MSzE9J+R+V29IS+aYfmh3QqS9p0LpRz/Tp7fZSeDc1
	CsWFjqn78JrHi4gsD6QvVM9lMDyXcZ/5G4JQAv3i3cO7NhFHwnMLfFdgjvfyo=
X-Google-Smtp-Source: AGHT+IEOm9cUCIzbmcm35mwEwgAg+CYjQj2nruO0LZ2GtSnT5RPVCXqpeRK85lo+9GVPGIgUHTU0QTXBaUZG5i4aiHQ=
X-Received: by 2002:a05:6122:430c:b0:520:60c2:3fb with SMTP id
 71dfb90a1353d-52600705addmr1888914e0c.0.1743073619001; Thu, 27 Mar 2025
 04:06:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305123915.341589-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250305123915.341589-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250305-cesspool-headlock-4d28a2a1333e@spud> <CA+V-a8uQTL+SHYqVU_J0th4PT6YPF7q6ypzDu33nS_6onWLoOQ@mail.gmail.com>
 <20250306-slather-audition-a6b28ba1483e@spud> <18780ad4be2c28999af314c97ae4104fb161a691.camel@pengutronix.de>
 <CA+V-a8tYv_u4UM5XVysVMPbfJoVwKFHqucLdJOmDP-xrXZ0L5Q@mail.gmail.com>
In-Reply-To: <CA+V-a8tYv_u4UM5XVysVMPbfJoVwKFHqucLdJOmDP-xrXZ0L5Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 27 Mar 2025 11:06:33 +0000
X-Gm-Features: AQ5f1Jo2y4aHX-Ul1mcjzUHpwZcTz5IMogldURDHGCK5Eh0UhKB7pBr8uELbClA
Message-ID: <CA+V-a8sfx-QwzPz_zEEmGAyAoqha5cfMs9CvWDVJ_b0-D7QfpQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: reset: Document RZ/V2H(P) USB2PHY Control
To: Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philipp and Conor

On Thu, Mar 13, 2025 at 1:17=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Philipp,
>
> On Thu, Mar 13, 2025 at 1:09=E2=80=AFPM Philipp Zabel <p.zabel@pengutroni=
x.de> wrote:
> >
> > On Do, 2025-03-06 at 16:26 +0000, Conor Dooley wrote:
> > [...]
> > > That sounds awfully like "it was wrong before, and I want to keep usi=
ng
> > > the wrong node name"... If you're claiming to be some other class of
> > > device, "ctrl" should really be "controller" like all the other sorts=
 of
> > > controllers ;)
> >
> > There are "usb-phy-controller" nodes on the rcar-gen2 SoCs.
> >
> Ok, I will rename the node name to "usb-phy-controller".
>
Fyi to chime in with other reset drivers I'll rename this binding file
to `renesas,rzv2h-usb2phy-reset.yaml` and have the node named
`usb2phy-reset@15830000` in the example node.

Cheers
Prabhakar

