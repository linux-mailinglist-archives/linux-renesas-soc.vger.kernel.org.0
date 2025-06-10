Return-Path: <linux-renesas-soc+bounces-18021-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E08D6AD3340
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 12:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABE7D189304C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Jun 2025 10:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A26286403;
	Tue, 10 Jun 2025 10:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZ297P/Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7120B283CAF;
	Tue, 10 Jun 2025 10:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550165; cv=none; b=R4CN0tfFg/MGpLGR8YDmcB01fqc70GnX+QtC127a3CNhtHWKy/OQ7ykF8o2xMT2OI+SnvrQimgrHeo2D2UDLGJYtUHWAdpoJJfzKwPiQKC1pv9Te2BcB0+uT8tlc/4yCGDVOX9j88fsHhvoYO6H6OqSObMOb2/hOZyg0Q08gsfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550165; c=relaxed/simple;
	bh=Mu3tJ3WQQn2lPprGjrNb/HlokFlYuCSBcp9oAp61tB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ULZP1Ae5hPK2zSFOj/Z/2SCOJLb0kqTyJziKSPAPADZbcwQb6fxoqcK4T5Zvs8UYMYyUNlNmD9hQbTIOaY3ZF/k0YZFF4rLZGWVEgn5C3mmsW21TVDqpfx87V1nig3LzNsFjUTzPbSttmE2ZJ7VQtNZJOrrlkwoLhBs5FgXZew8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZ297P/Y; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a3798794d3so4483848f8f.1;
        Tue, 10 Jun 2025 03:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749550162; x=1750154962; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mu3tJ3WQQn2lPprGjrNb/HlokFlYuCSBcp9oAp61tB4=;
        b=DZ297P/YeXjCP5/56Wsjb9cnTG8WH6TDtQfIUShKBHXk26H/nx5KTWZce1ilNU6i31
         FtzKlnA4cxJU9MH/9mL83VhS0Gi1c5VEiIU2jPWPHL5uJQmoApTAnbNS6YUs8RmSBUe1
         a2PWoflHj/BoSMzcrZ7BtX2Gsxh1C2ryuTQzPx+v6XblTdNEdwtcruiG+bmoaGQsZUYd
         i6AbPRbGx35Zz9HVdx9yOdC9KvJx+LBPwvHnoqnm2p45z85oOneIKrWG4JAn2KC9th6I
         XRJ/LG5mRR9DGYwc+vUGugahpC4YIwck2HPzcZoLrFiV+3MHxQ7uuzppT9yPXCmgcwQh
         bQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749550162; x=1750154962;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mu3tJ3WQQn2lPprGjrNb/HlokFlYuCSBcp9oAp61tB4=;
        b=CygdJKDiemdf7iBJh0FasxTEupKAGloqgYpmVBX5Wx2N3CFzBiJBHdMYKjKMUvFUZB
         TAYZKy+v7GHAaX2oR657IRvHOZ7XIU16WYMSBFpkCdSq16nd/r3yXTzSRWzf3ZacQK7m
         WjTgOm5PccJkl4cTgXajgSuhu74/3qWDgUJqRgzdQgAyormuliahz7/gMKzrrGf33JlS
         YO6Nn29xCgr3BG++M1mhHeH06FuidPLIuV1BK1NTHXrCfFjvUWR1gkV2sZv12oJbn8qT
         GUZjgbpDDmt8xSn4i7yu3UKo9S9CoRDvzBSOLefHz2mr4tejbHzXdyL9ewWXmseZijIQ
         +xqA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ5XaSx3luQdXIAoHFdT9wKZIHTd7C9S4pSGvnVpINnv0B3sC/xOrffZaB8Ak/8RPpfvsqdR4X58FvzbK4@vger.kernel.org, AJvYcCVgz18gJxtbmu3OJhHETsBYDKRDiyuaHGzi6do4ffSTpDvehxm+VAnkGO9HIk2W5lID+NGSqA1R2ULQG0FDUX4FP2k=@vger.kernel.org, AJvYcCVw7a1fhA3GS//vBh8vH2TLO+49805mC4AuVfOL5skdZTFmLry6g7DjRb6AfPYv2ndBIG2uV+rXwYX+@vger.kernel.org
X-Gm-Message-State: AOJu0YxYVQQDedQ4IVt7U+Ia9ar8MPYrFwRrcHEMJcC+eH2zI0K7Yg82
	i2ue9ITB505tjIARI8YrWh21j6coB+mF3hNicQn+84mzFZLNpbLkRdQH25+7k0w1Gq08LuvEx6w
	KRQyixntX/3katceEyvzHZkAUCVpU9Sw=
X-Gm-Gg: ASbGncsun3aHY+qSIDA1F1EeK/hdNWqI8cxpP6kFlMhHK6seGKJ1P1A+GPo39PXRVN3
	HAumCTfiS327bqcruLzz7Vf4qoOEu8cdtlCICnLWOza+V+GFpOdWc1kM768uLBR20HprHNKv5dY
	ZhULClmZsm4OcQPk/nb1SwAs0bY6jVTkRCMIJbiG9qCFg15HtgWSSXshS0Ga4JLSVzJRLXhUoa9
	CI22s9gJSMSNQ==
X-Google-Smtp-Source: AGHT+IGjgvRkM2W8kgSyX4TbWWmhSsHWLzeNNdPZfCrgDmOedOEofl5Xw6zzPhED/r+Zf+OBYUsJu2Nd2s2pudULcBw=
X-Received: by 2002:a05:6000:1ac9:b0:3a5:2e9c:ef0 with SMTP id
 ffacd0b85a97d-3a531cdd224mr13644239f8f.46.1749550161590; Tue, 10 Jun 2025
 03:09:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609231905.511904-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250610095753.GD24465@pendragon.ideasonboard.com>
In-Reply-To: <20250610095753.GD24465@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 10 Jun 2025 11:08:55 +0100
X-Gm-Features: AX0GCFtKRVuCrs4eEulMDJyNEUDBid3H4vZNN_u0ANsEVyoc5QWq-7m8nQNNlaM
Message-ID: <CA+V-a8tOZEfZzXzT8hvKcRt+2TSYb0LEw_WsBfm++ug6xJ5UDg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: renesas,rzg2l-du: Add support for
 RZ/V2N SoC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Tue, Jun 10, 2025 at 10:58=E2=80=AFAM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Tue, Jun 10, 2025 at 12:19:05AM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document support for the DU IP found on the Renesas RZ/V2N (R9A09G056) =
SoC.
> > The DU IP is functionally identical to that on the RZ/V2H(P) SoC, so no
> > driver changes are needed. The existing `renesas,r9a09g057-du` compatib=
le
> > will be used as a fallback for the RZ/V2N SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Assuming this gets merged after
> https://lore.kernel.org/r/20250530165906.411144-2-prabhakar.mahadev-lad.r=
j@bp.renesas.com
> ("[PATCH v6 01/12] dt-bindings: display: renesas, rzg2l-du: Add support
> for RZ/V2H(P) SoC"),
>
Above patch is already merged into drm-misc.

https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3Ded6a6d63513ee5199841=
c0a0dc2772ad944e63ee

Cheers,
Prabhakar

