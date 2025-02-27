Return-Path: <linux-renesas-soc+bounces-13751-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F02E3A478FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 10:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A8917A66B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 09:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0325227B83;
	Thu, 27 Feb 2025 09:24:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D930715DBB3;
	Thu, 27 Feb 2025 09:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740648268; cv=none; b=HfRnYCldnnYaMUWP//G3nj5A+LawdW4XFa8DBcSwYxJBpVkEQhGG4SCf7QIwOuQ7bD1co77QjQMPSLAUwsLQwXrljCTIr+G52V0vTUhSLlbk4Y9xBtRup7Vg0TkljLSnKmH3XvAX7VViD9Qg40YybJ72QSK9T1XJQD+CV8kt6WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740648268; c=relaxed/simple;
	bh=hJXIxywuA0eBIXyrnPtmFdPI6LGiZRRpy8zNqTsdtrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bcAAwAFJ6WGfXeqAdJTKzns0bgj83eiYWu3R/XNHwq+sTVXnNfNcsjjkOqc3rFC4rm5iWGMRwAyQ94WZmomB8krli8f9mlrmMmGBwHQpobJTkoO6pxyhBGsr0bFZDeQLkCKLh5LASP+y4HztcoICbbmPH+rOKFsZZd63qCPi/fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-51eb1a6ca1bso275894e0c.1;
        Thu, 27 Feb 2025 01:24:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740648264; x=1741253064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bsXao2r3BXF+b5muoZNjN0U+mhPp9TswNqeCZaqf3qY=;
        b=V4UY13awlCFZnm2GXPRjl2OOi777dYbUX3hGblSdI+HQ9u1MPPsxzZavHkpTlO0vuY
         YXgZude6sCtIvXHFoPHvPVOnO3e7ua/xA1dWZ1zmU0hHsj6EDFAemES+g7e8LhAiG1ut
         TeW8XdsEVwS9zCyvDYc0qBoSbtSXX/hBjKAfytZf3rqDA+jZwCBiw8oEOj/GLJwYJTQ0
         g+alpPSUfIg4RQ944BRBEDuwp1TethzzQXfIKN97TPKEh6qNFLygnAn0+XeRphGvF0ll
         ln0FmRw6gwAe4ZwI5mT32CPThsRISW6r/ZQiNShIonMlNfC7F4zmwFgHmOBedfjvHi/G
         Cr7A==
X-Forwarded-Encrypted: i=1; AJvYcCUgSkzS3M3Z5Q2TELHy4NsDiaoewHDlJHkTVA+TnYZrU73ivqm3ZBeBGY7ryQJU1lfklzsyjXyB5hpND6LRHCdYkMw=@vger.kernel.org, AJvYcCVhI33gHlBrcj+e8crsnfJNAnioHU6+VCIN35k4yct3lfoAhImvu6qZREi+cq6YN0LQMufNfN/i6HeavNc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhjne+1LBYgpESjsGdSdJbwsOpnSa2bZGp4Qz8bSfgWSp+DhYk
	+n23EsIQz9VnNWrymSZq75kiGUyx365QmPd1NcjE5dFVmZI2AzV1L8XKHev7
X-Gm-Gg: ASbGnctYiFSMZR9nVO0nTNqATP2Gj0h7qlsCNxwuEdghs25cUauuR2KabNePZJcQTVS
	5xQTAbIuGj9gjpZRNvuLfTGOViaNnV333BH2CFGOkQ/NX1u84tyMGizSZVLcxKaYlyYMVbfK4p5
	nARCmfMvmQ5VWxGEiEjJGnlwFmYH5Ed0+E9dbWyirtfLn9SuqIME3DI7x4EO8HdMIncyaNI0Ai3
	DFuOzioZyDWlTP6AUvMZ+YSsTk7Ocz67NKn8EcfT/I1t2j6T9bfkBP9eQk2/exCqKYTJN5BX4RP
	/jwB8ZKCAFSz4rS8cRfJ5UoUTWc272PyaZmpWOJg9uCxo0/Me3hx31oa5INYtTyr
X-Google-Smtp-Source: AGHT+IEhz5CzzHOhR/FKwEtbTXUuyvI0JXRM2HWf89Vmjr6THByP8jPaZgTZyZWO46Ne7zSrnhqFCA==
X-Received: by 2002:a05:6122:3406:b0:518:7ab7:afbb with SMTP id 71dfb90a1353d-5224ccfc2b3mr3107793e0c.8.1740648264469;
        Thu, 27 Feb 2025 01:24:24 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5234bf01b24sm162993e0c.13.2025.02.27.01.24.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 01:24:23 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-868e986092cso319229241.0;
        Thu, 27 Feb 2025 01:24:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCViSPVpQKm1iW7t3NOyGHxo80HtP7+4bgx9dow3YsvzRoMM+Nv+lwBwjDLNmYOq7wazmkSDGX8eHFGpRvo=@vger.kernel.org, AJvYcCXE9ZsPLvQ0kgNEBq9IWhnWAmlVz9I91YYIbzcB4+8KSkxw/l/YkXRAe+aUR953T9WwIsZMZtH/Rq5sDoFoC4HsMq8=@vger.kernel.org
X-Received: by 2002:a05:6102:4b09:b0:4bb:e8c5:b164 with SMTP id
 ada2fe7eead31-4c01e1cd220mr3515703137.7.1740648263592; Thu, 27 Feb 2025
 01:24:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
 <20250226130935.3029927-14-thierry.bultel.yh@bp.renesas.com>
 <fe4ccf6d-bdf0-41eb-bffe-83d459319689@kernel.org> <TYCPR01MB1149252F0825C9BCF6A1B832F8AC22@TYCPR01MB11492.jpnprd01.prod.outlook.com>
 <f134c607-2a03-4ee2-9f7a-befa1e4feb74@kernel.org>
In-Reply-To: <f134c607-2a03-4ee2-9f7a-befa1e4feb74@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Feb 2025 10:24:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW1k71gL_OYug+aF=SEkMDuXLy_oLpikahYVcqPMsMbHg@mail.gmail.com>
X-Gm-Features: AQ5f1JoVNzTVv9iRqIxLoBtW1eNPEriYX27b3fcczBzchYMkzLkI98yA_imqF9k
Message-ID: <CAMuHMdW1k71gL_OYug+aF=SEkMDuXLy_oLpikahYVcqPMsMbHg@mail.gmail.com>
Subject: Re: [PATCH v3 13/13] arm64: defconfig: Enable Renesas RZ/T2H SoC option
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	"thierry.bultel@linatsea.fr" <thierry.bultel@linatsea.fr>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Paul Barker <paul.barker.ct@bp.renesas.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Wed, 26 Feb 2025 at 15:40, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 26/02/2025 15:32, Thierry Bultel wrote:
> >> -----Original Message-----
> >> From: Krzysztof Kozlowski <krzk@kernel.org>
> >> Sent: mercredi 26 f=C3=A9vrier 2025 15:22
> >> To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>; thierry.bultel@=
linatsea.fr
> >> Cc: linux-renesas-soc@vger.kernel.org; geert@linux-m68k.org; Paul Bark=
er <paul.barker.ct@bp.renesas.com>; linux-arm->kernel@lists.infradead.org; =
linux-kernel@vger.kernel.org
> >> Subject: Re: [PATCH v3 13/13] arm64: defconfig: Enable Renesas RZ/T2H =
SoC option
> >>
> >> On 26/02/2025 14:09, Thierry Bultel wrote:
> >>> Selects support for RZ/T2H (aka r9a09g077), and SCI (serial) specific
> >>> code for it.
> >>>
> >>> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> >>> Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> >>> ---
> >>
> >> You never responded to my comments at v1. So I asked at v2. Still no a=
nswer.
> >>
> >> That's v3 and still silence from your side.
> >
> > Yes, I understand your position and have added a paragraph
> > at the end of the cover letter about this point.
>
> We do no read cover letters, unless look for dependencies, so if you
> disagree with someone you ought to respond to the email directly. Not
> silently discard.
>
> You keep adding more and more symbols, so your "out of scope of this
> patchset" is no true. Otherwise every contributor will use exactly the
> same arguments - "not my problem".
>
> So again NAK because it is something ought to be finally fixed (and is
> not even tricky to, so I don't ask for impossible).

Adding RAM to existing systems is usually quite hard ;-)

Not all Renesas SoCs are used in systems with multi-GiBs of RAM, so
IMHO it is still valuable to have fine control over which SoCs are
supported by your kernel (and e.g. which large pin control tables are
included in your kernel image).

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

