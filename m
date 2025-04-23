Return-Path: <linux-renesas-soc+bounces-16239-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70962A9821B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 10:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 545A15A2B41
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 08:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90C182741D3;
	Wed, 23 Apr 2025 07:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AeFY7NdO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D106E28153C;
	Wed, 23 Apr 2025 07:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745394925; cv=none; b=OxoMmYlqM/uzgXhkCyhDAq7m2FsYWrSi0tom7J9V5YRr4qpiUJBRGs+uAopF5fMEO+FKf56IykrpSW3La2EERB8XfJk+m+1dkL3QZWhtY+CteXzK2h0bt2n8u25cLxS6SwN6f3FHCLdX5wUb1QHAWsZNGCl6YpLadAJtvJvEdAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745394925; c=relaxed/simple;
	bh=tjgo4np+Z6AJeX0xArPypis+FgYghdSG5VHGIPEzWvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5CabXKZl+oTIRLCjeFNgSkukxwcY24Oygw9v7m6C8lpSGUrHv6+6Aaz6yKPHT3zjvScSB4/TkazoURHAa6E0WZd+c3qLogssL1eu9yMF/B770ItL+p4fmju+eFudZpR01C2tRn0tBsxtpxcPkzylHPpAAdO0G2SqIB3DNmAxuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AeFY7NdO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-440685d6afcso57060105e9.0;
        Wed, 23 Apr 2025 00:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745394922; x=1745999722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1eWzS/Ah2cnA75NtUgIRsIHb+DY3iDF+Qb9KegxCV7A=;
        b=AeFY7NdOdPIWgFpf37NBlBTHutA0XKzCjVNohb7Hq8EJmvw7hMKnM3s8OyBQ9aY8C4
         xETIPkB5okP/Nz7AGrQYB4PKm0LKAsp4lE7EB8Z47mASkiNNoTZL9EUjPihRjDYX8eSb
         xPB+dEarMKbSNhi1vGjtUsEChS58/dkOFL3AnIi2Q5bc/OLdzR1wVQXwzUMG7idknwQy
         qIkmcuGU4I02lnXTHcwxNZpiynOlWuFgkmFllidJM3EVHAw4f89iyqATjMnsAvm/VM27
         mhsErBUV8l+mfH5CS1UQfl0nBDWiUboAkpUfBxRHGH67jij/cK/s/LsrKeypbDJxq2d2
         gTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745394922; x=1745999722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1eWzS/Ah2cnA75NtUgIRsIHb+DY3iDF+Qb9KegxCV7A=;
        b=qzHS/sfAgnTEjoGOXXKaOhAaZ1Qm8NondsQnO0K5mlkskUgJmRSpJ5sORfxrLgo6P4
         wvCEeWHibOU/KdyjeUeQ/EctsbxLTghFv/GsO2CCYdo994RRwd69jsB4ddjFOLvpDL/3
         IVGpPvNABm0mYq5HvU1+MjqRlVRUCJO9YagGzCevnTS5JGEF+ROi0u/Z/fheAHLRGXzz
         yybaZTyRiDEvOGdl2F4ned7z4u5HbO7lHrtLwiAs30OGlzZYDSzdXncJgeDVCgq+b7F5
         hjpaoj00g9qV4Hj10dTEhxQV+QEYW4hKho/J7v8ir0XMJt12ZyyeS+KYTdak0ORcc/9D
         ephw==
X-Forwarded-Encrypted: i=1; AJvYcCU2eE6e9sk9fGB+wRFAKvb5xVrqfvNRWt2mvqKwvc6eD+6jyOibcD1pgxLuyINvUVSGJBlUrxPg/yL8ebK1S72ibxY=@vger.kernel.org, AJvYcCWqJlqNM9Dbh0RXIuyayhzNa2/eBQQedBfdUkPL7eCSSeMin/ydHiqIaewAqR1VnJWBMjqqPcyNogDc9bzF@vger.kernel.org, AJvYcCX6hRiQMxbzND3swlIB/UuHxD9eQt0TaXdaXvI9vRsCpty+AKcWnXfNQg/4MSWMxDwUnPJ9hRO2@vger.kernel.org, AJvYcCXSmcfs5JVkIi2xwM0hmqmKzSITEyfNH/sblXbmnMhVcoJiWaGGLVW162nsi9/S6nglYuny37JHv2lQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7eFTSH3hReoXub+h3M2tTjtGkiX+MykbKRCcMVnLO4G6aFXy6
	iGCHF4Vgq3aIRQkuW9H6ZkXevTNiNnTqBMy1eDp2D1hfGRXsat2V8ok7lBHIV59ID9YRYdFAsiE
	GzxQwb3ag6Opgaznee2SSg4GWFBo=
X-Gm-Gg: ASbGncvA4Jp2CUv7BZgEcz09PL57yf4bRnfxMHSgbtXYIb827X50XtWPkLIa17bjFrz
	Bg5+/NgK7xgtQhvX9i0pGeXPX+Md/G3XqvVTgIjzvfNcki9WxLcN1ljkaPCk9rGdix7Bn+lZOh+
	lbnXB/0EGu6DrmlJeF1k01PA==
X-Google-Smtp-Source: AGHT+IEetajyp7tewz7gSg2bUmPRDylKdQxo3ZKlMaQaOjNuvNTMi3XEyh1phX3DcIWXuVWrhzLhzxViAkCb79CfcaQ=
X-Received: by 2002:a05:600c:358b:b0:439:9424:1b70 with SMTP id
 5b1f17b1804b1-4406ac17329mr182625395e9.30.1745394921859; Wed, 23 Apr 2025
 00:55:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417084015.74154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250417084015.74154-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250422184813.02b21095@kernel.org>
In-Reply-To: <20250422184813.02b21095@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 23 Apr 2025 08:54:54 +0100
X-Gm-Features: ATxdqUENAmcd1iPlreTGMgox3_qZS9GKX_Vez1-JK_b3xBLNPYkG-7O4wKnzxvI
Message-ID: <CA+V-a8uk33D7m17nOa3tFviq+OEajPFm-haU+oFJwiE3Hvo3Aw@mail.gmail.com>
Subject: Re: [PATCH net-next v8 4/4] MAINTAINERS: Add entry for Renesas
 RZ/V2H(P) DWMAC GBETH glue layer driver
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

On Wed, Apr 23, 2025 at 2:48=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Thu, 17 Apr 2025 09:40:15 +0100 Prabhakar wrote:
> > +RENESAS RZ/V2H(P) DWMAC GBETH GLUE LAYER DRIVER
> > +M:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > +L:   netdev@vger.kernel.org
> > +L:   linux-renesas-soc@vger.kernel.org
> > +S:   Supported
>
> I'm going to make this Maintained when applying, please see:
> https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#suppo=
rted-status-for-drivers
>
Ok, thanks for taking care of this.

Cheers,
Prabhakar

