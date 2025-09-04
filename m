Return-Path: <linux-renesas-soc+bounces-21364-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D7CB443D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 19:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 055103A2E52
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 17:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6139F21D011;
	Thu,  4 Sep 2025 17:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QauJivRl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBFB179BD;
	Thu,  4 Sep 2025 17:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757005344; cv=none; b=a8HjutiOCcRfdhWnSBNg22CT763wnAhJFyf9lf/B9xKoLqoD2l3sYJpQ1cY7k+vTs+XyCb0LVXKekKgspL2iYBuWcGw8nERC3RzDWCcy+80rAtzMz6L2ETjT50QgAnlqyjqv09C3GYlZBplcWn0mFquhbJm7C+oNkM9F30FXDnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757005344; c=relaxed/simple;
	bh=qWUAfaIAwE02j83CxoHHqLBOvWVQ0yY4hz4cGgpAgVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jEi4zC/RzN8W8j8hFQWxnb0yXbSAFvv2rYlrwYIeY4eFPxYf/KcMGR1AhRmV3Z1Hp4EbZt2iU/WYTVtMNxnE07b4lf4vIgNqQAqstGK9wIMCniPYIdL+bDnO7H8vnBHgDPjIhDYlIaVpTeIezIWCx8gOamEF8vZIM7kt+5SQSt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QauJivRl; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3c6abcfd142so640896f8f.2;
        Thu, 04 Sep 2025 10:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757005340; x=1757610140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWUAfaIAwE02j83CxoHHqLBOvWVQ0yY4hz4cGgpAgVw=;
        b=QauJivRlCP/omea0HkUDZSV8kerfmR/h8kgNSTgKlG8BOOWIOz7W0RqrJSYGh0wZdu
         txVzvoY87VtQt6YUVanQfA3gKHF4VX9iE8IggYP55oRV4GybFu+tGYgw6oCRpW3RsFek
         xwiebfhBTJTeBK3xv5j4BwRfbGPbHq0+YbantaNvbAOWJgMuu1ZUKMS3sLjqQ2uKPlG9
         LNi2NPYXlbivHxC9w4PK4Bn4sNUmJ2LsOY5AzueyeBwqvNKx0V1k4nII1ZNHkj5kAuar
         TkIUxxrqn3By1TIT0VzxHlSrR6Dhw7chHVvvQiD8bGhW78uMVYI2HNomybsS8B+02rwx
         pL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757005340; x=1757610140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWUAfaIAwE02j83CxoHHqLBOvWVQ0yY4hz4cGgpAgVw=;
        b=rZ8Lg4ddaJlAYIz43RMG6BoreQk0E/testTfjrtghpd9UIbclHRUfxefQBojwNGIi3
         qS7RUVk/PVEaogHW7Y5AzQHyRfqFTSFw2MFkTJSvzCu0bwkTuslpdf+G/AowYSDy64LE
         X3iLuHhDdDs7CJ8JpSERmoDF6ygLyeh+mRzaCM/RtUBoWvmT7Zlcdgn3VrlG7uVn+ILE
         znAQNHiSOLfj34BdY3Ln0WNbqZPKI+7HgGWd/7ncSZYgvDz9AGFMKJRP1+2JJLPzhpO6
         IVKYsI4OkACZqzw/lnpnL5J2TuYO/zRmUMv8CCvw6lOduyziub2BT4legswTgF339i5H
         S1Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVZxq1o+TA98sxtJ+I8Q5CqMaJenHCVTdx2i6b3C1ISH513UShMS4oq2mpAiz6iJPuAzZUt5KxdWZ1+Yipg@vger.kernel.org, AJvYcCVxF3PRjgH6XSr1VL3SGi22CvCCZIbU5TsY/wXqtE/mbP2T9Er+x2zqzVBxGyAUqrCez7lrR5Nf/wjU@vger.kernel.org, AJvYcCXprnyOpZ2DEh6AbWipnIElg8SDXheBtjEuPnLSfVffhLJoqdfgoEyue+OAsNQrFV0/rJ3T14LQFgQEhLemRifGYrk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb+fcAXoePgbUPvxoEP0dyiZ1b+lu7tPcgcz+ZcqDMIetlSu78
	bkmS7tKuO69yOS0JKTQA4SEWiBkGcHt09XVyJeRnTJHTIpGkgApnZ+89gInRk5auj4Otncf0Iyh
	u//vr5bpOT3ppzCskqsp7bsM4zoeH4i4=
X-Gm-Gg: ASbGnctdz0P2zW+s0nuo67cA0DzEa7u02CmQxxEUIvfzAjWIjPhb5uesAjUCfltN4Kl
	/P9Sqon06TVkFarWXciHpvIZHsunvTDs9LqhGpST8/AY3i3O/TKpZAbGBTjvTIWEOqDynHvCMDI
	kMSoRaxN+Vx8ea3Uf4fPU8cyeZfvrgDfGWDM0eVu1NItE89jFfyR80D4tS+mMsibW13WERTVvLe
	qjJibRpHx/YP5kdNbWfZl2rgrCVZ16NzBAKVkl1cWkYpis9NPE=
X-Google-Smtp-Source: AGHT+IGGWSzsCgErsrGr8zjXQxnW7N11Z1K/YsLBq7BIXz9uzKohNBsjiRHo+et+EPwzJ8Pg+931qO/wQAziXr+D7/w=
X-Received: by 2002:a05:6000:3107:b0:3de:e787:5d7b with SMTP id
 ffacd0b85a97d-3dee787626fmr6296285f8f.46.1757005339757; Thu, 04 Sep 2025
 10:02:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904160305.247618-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <aLm5kbgRIcomBo6a@ninjato>
In-Reply-To: <aLm5kbgRIcomBo6a@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 4 Sep 2025 18:01:53 +0100
X-Gm-Features: Ac12FXxTKxEN51lya8eiqIz8Bn1e7rM0j_VjpYYSnIrgeF09dJthnrp4kknf5ok
Message-ID: <CA+V-a8t9VU4+Q6ofTYru2=OsrsfiSM53=rtvEzxoYmu_A0wwBg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: i3c: renesas,i3c: Add RZ/V2H(P) and RZ/V2N support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for the review.

On Thu, Sep 4, 2025 at 5:08=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi,
>
> > Add device tree binding support for the I3C Bus Interface on Renesas
> > RZ/V2H(P) and RZ/V2N SoCs. The I3C IP on these SoCs is identical to
> > that found on the RZ/G3E SoC.
>
> Cool, has it been tested with devices already?
>
Yes with the P3T1085UK Arduino Shield Evaluation kit (logs can be found at =
[0]).

[0] https://lore.kernel.org/all/20250904165909.281131-1-prabhakar.mahadev-l=
ad.rj@bp.renesas.com/

> > -title: Renesas RZ/G3S and RZ/G3E I3C Bus Interface
> > +title: Renesas RZ/G3S, RZ/G3E, RZ/V2H(P) and RZ/V2N I3C Bus Interface
>
> I suggest "Renesas I3C Bus Interface". The above is not going to scale.
>
OK, I'll update and re-spin the patch.

> Rest looks good from a glimpse!
>

Cheers,
Prabhakar

