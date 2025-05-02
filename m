Return-Path: <linux-renesas-soc+bounces-16632-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56001AA70F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 13:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CCC83A9BB9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 11:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADC4242D7A;
	Fri,  2 May 2025 11:53:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5057023C4F4;
	Fri,  2 May 2025 11:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746186801; cv=none; b=MC//HfaMK3SPX0qk2hin1kRK0dwag9u15gBJ2Dz5FX4EmlLXsVD9qT7EjFGrZzKVjIU4hFYJNzc7xNI2Tg1flLZLAICl9i9nLk20vMYd5voHs1eVM/CH4RBYOdLtHzl7ei5IT/V9eDdXfrVEsfG4miJ1jWHuRJ9Ploqn6HFRy68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746186801; c=relaxed/simple;
	bh=2ZV+8Wt9GqansuqT8TLijEvg5bx7UD6FB0qJem+6Qnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I8iG8y+1iCLb2WUWSAnmL+f3vHvC4JgWmJYar8TxkkpM+u3CIUCK9c5EOpBZLIKDEyFbCZiUT8UnfVayVML9QcU1xf9o8BplwkUvLyb3NZaleG/hsvWD57vkEB5GfwMkjGxOI2Jtf1VsLUa3cFl0n8m57eBYsPc+Hj9nEId31U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4c4e1f16833so544322137.0;
        Fri, 02 May 2025 04:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746186798; x=1746791598;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dvv3aZc6ysvtM6PaScZm0AZ9BZs2r0w8R3h6Sq84JNU=;
        b=Oi5ynCkdM6ofwFNEEaO803KYp1hVlqyTgLhp6aKJjOFASgHndte5GnZaB3X+S6hepn
         PhmET095VrkWTUfjvQnNVIXe3G+O4P/BG7ZblIAtGG8ZCxmYIgvg1w5FoGPipO4F/f1Y
         GTwsZyyVgydq3YlENgrVhsQYCOcZ1WX3C7WfuLVTln69z/8UyUP22jn3FiCamhuJ41Rc
         +561FHMnyHw01gTB5dwKCekXQz85n9E0TpxmHTNUUVq6nDsaqyiIVpnYsOVtjQhFMiTR
         4BY7OLyBJji1bTiON7r1QfMAscmNNGoXA/EuDy6ZE0RAwsXOph8ZEwNJNpaqAQadIhD9
         KZrA==
X-Forwarded-Encrypted: i=1; AJvYcCVfSQCHR2BOCrt8KcuZCpKGbyW9JlOc6CVwARAQrI6Ceaov55yZzjtqvoM85xwNnmztE+jxLTw20miG@vger.kernel.org, AJvYcCWTUsMcLapkMZIELHhxGNdQLwUTh+ON/aGvN3EtMSCzMreg7Zn1TTZkMbSMRHEa5rk7E82oDljotx6IJJmqbQeYClg=@vger.kernel.org, AJvYcCWeVdLNHC+mNXB2o8iNWkW9amhqdBkC9AQzEbvKb8/pWkNTBV6oothY4qnlxIstXEXc8iniHlEa/Ru+LYDl@vger.kernel.org
X-Gm-Message-State: AOJu0YyiymZrsF/WErYd6ojDEnGgKiolNbdGDGDUl76lixSLpIAwXTOv
	/8YKr3yEk1IsgyFzxvL7gS6nmbQab2i7Q+GnWCdxqAJEnkgB4yUs5q2mf8D+
X-Gm-Gg: ASbGncspAeAm/SszVROklab0YbctDekQuD9rmGAMfFM98yU0E824xKAQjlwz5z9LQee
	16oGhjPOHkgMh37H3/TSNbkuWGLxdkO60fEZMZyEkLYUEbm0tCWYFkW4FCBIbVBImT7C0uKeW+4
	0l74lM0rB2pSskx2YzwkA6JhTD2seaDXsGt2EPiY2rfuCoubXBt6FaJnYVIiuYhgKX+b9rzOJOJ
	rz4Dap4YpbRRbN1+wDCfrEnsfYB08tvZX78oq/q/1W4jeiF4/xgVW0P9iX2Q45DqV0qMGNi19+x
	8yZc5eDuZtQblzikA/9uCQYwnHkSj9s4tja8Az9PjYHYDUxAvBIrh67lH7ofQROwBWhloApv1Pi
	sYFA=
X-Google-Smtp-Source: AGHT+IFJ8Jo8FKmiSjciLmlOJhQacHz/H658B3pTVMevrmzztj6Ljp8E5nbeV0AF7PKh3Wao0zdnhw==
X-Received: by 2002:a05:6102:330a:b0:4ba:974c:891e with SMTP id ada2fe7eead31-4dafb68b67emr1520153137.17.1746186797770;
        Fri, 02 May 2025 04:53:17 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8780b293e9csm251507241.31.2025.05.02.04.53.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 04:53:17 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-86fbb48fc7fso450257241.2;
        Fri, 02 May 2025 04:53:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUuFVZTf/UUOU40s/prBghrrUw+T0F5gPAkek7uB2E0PnZXOckQCH+Tt2uhtkA01IwC8yC5Jyzfb0YY93oLGI1KDsM=@vger.kernel.org, AJvYcCUwXSN1bekKAGE6g7PKT5I37dNk+kfx8fjzxrU55KiDFe9J3cYAAGHGRZo+tdNEEtCtgC0GUM9NS/gu@vger.kernel.org, AJvYcCVIE9J3XlrU0YyUDe2uwSu45CBmL2qQnB8qGI+6ZPoQRltcoGQ5BjzhYnkftFIqOlX4HoGxc0579rLkScb/@vger.kernel.org
X-Received: by 2002:a05:6102:5045:b0:4c2:ffc8:93d9 with SMTP id
 ada2fe7eead31-4dafb50dd11mr1438920137.9.1746186797387; Fri, 02 May 2025
 04:53:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250501123709.56513-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250501123709.56513-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 13:53:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVjCE5-X3AmDy1=UHGPb7kmi_kpBX79s1t0g76-__sc6Q@mail.gmail.com>
X-Gm-Features: ATxdqUHd8V0pQvGYSlvvIMPnGrAT00VG3I_OsFOHO0G8lVIaFANIhY-BWLZCXg0
Message-ID: <CAMuHMdVjCE5-X3AmDy1=UHGPb7kmi_kpBX79s1t0g76-__sc6Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: timer: renesas,ostm: Document RZ/V2N
 (R9A09G056) support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 May 2025 at 14:37, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document support for the Renesas OS Timer (OSTM) found on the Renesas
> RZ/V2N (R9A09G056) SoC. The OSTM IP on RZ/V2N is identical to that on
> other RZ families, so no driver changes are required as `renesas,ostm`
> will be used as fallback compatible.
>
> Also include RZ/V2N in the list of compatibles for which the `resets`
> property is required.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> @@ -26,6 +26,7 @@ properties:
>            - renesas,r9a07g043-ostm # RZ/G2UL and RZ/Five
>            - renesas,r9a07g044-ostm # RZ/G2{L,LC}
>            - renesas,r9a07g054-ostm # RZ/V2L
> +          - renesas,r9a09g056-ostm # RZ/V2N
>            - renesas,r9a09g057-ostm # RZ/V2H(P)
>        - const: renesas,ostm        # Generic
>
> @@ -59,6 +60,7 @@ if:
>            - renesas,r9a07g043-ostm
>            - renesas,r9a07g044-ostm
>            - renesas,r9a07g054-ostm
> +          - renesas,r9a09g056-ostm
>            - renesas,r9a09g057-ostm

Looks like we have reached critical mass to invert the logic?

    not:
      contains:
        - renesas,r7s72100-ostm
        - renesas,r7s9210-ostm

?

>  then:
>    required:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

