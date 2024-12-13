Return-Path: <linux-renesas-soc+bounces-11300-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE97E9F115D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 16:50:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4ED2C1883D85
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 15:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B65B1E3DC4;
	Fri, 13 Dec 2024 15:50:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795BB1E1A18;
	Fri, 13 Dec 2024 15:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734105048; cv=none; b=mgw1Gz+0Iw8TWYasWkmr8SoJXT0uafC+E6I9i2Z6x+JHHvI46vK4Cb0GnO1puBuXZTkeHHLNQvcrpL0QtNxk4wNz9pOhk95iSUGJZSbdnOmMIzVJnitKkIBMc1YKXFRVyr7HVYa9WD2f6bCTPWomPFhsJv0BVWV1KcMkXSMfkGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734105048; c=relaxed/simple;
	bh=+vWx/xla3NmdPy6AaCslllDhobZi1UfzUcfCWw0UWFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QKSKm2gQxe1spyDVU9gUjc3rMsiiA9AV0OYB1secpXxmI9QSj9rtF4GKb/wE0LpGftSHXRMeszzztPbxtvcOq8cDt6GFqnc4cqEBFAfDQNLe8yMM9qWwwREicBGwEeOADrXzP5/7+5zFf9UpB3cAqualwhp/IzWuI5lXEYmZwGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4b11a11a4f0so520352137.3;
        Fri, 13 Dec 2024 07:50:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734105044; x=1734709844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GYg2VybSe9zczJSOfwqRrhBe0hYZTtXKLrOxz5c9cnE=;
        b=lW0aWku6IS1qmZIZAJCXyt2kNaJ44yOnpEN1ZaE6dnmg3VYw/wytUHrru3C38/FpgJ
         TeA0bxicsw52WoFHR54HfSQEXPm0kHwD/BuelDNOAQhZ5NiSWxU7Hzw8HuoTzSCQPy7/
         GVJ3CzCJ8VdZXLSFYY49ZbP4Jhlc4HVHNNA54GbvEgRiSHPaZ6JWE6SNn8gbeJA9LyWj
         y3BbkgJe45YrnpQggzix49swErqBBsVxpBc8/Z/99sKYWNMTXLl1Hb9ozJs2yBIwDwQd
         NoWaeL+Gy4piA9o7x5B7+nro1tzt2jdsJLnZk6Jf/Pc5rTUqDNFI/kdmJ5uznygm1VVX
         C1qg==
X-Forwarded-Encrypted: i=1; AJvYcCX+u4VPBFcyYQ2x06VxdF2v2zM9laOJnsB4ErBnB07QhCIuJZ2JonPOO9gf5Udh3rpyADF3Nht6NguP@vger.kernel.org, AJvYcCXuM5wSZYyMrfyasQff3IKtuuF3MucfJIP+BHgJdyCXuRCJEtUeWYxV5W8RpmeSDx/w8eLkFtXGjFCiB0kN@vger.kernel.org, AJvYcCXwyXCpNA7bogtZBhR9wTDyuW+Wx2u9j/rtycP/KTCR/eTyFWwe6WHaPqU5/2cbUhX48HR94oQ+l/k2twgjmmCnhWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxvcCKOrrcElHqoNH3zqwK2C4iIWB6e0Co7hfoj7IY7Qfk7ZEL
	eW9952Dq3+qyhQAEkdX3Se0MhRp6gkAw4LHFFHsuVJ/ue1wjKErtxvS3rLsw
X-Gm-Gg: ASbGnct4kkLNxzgpOzeEUnB6loePl6R/aytMHoAVoMaGrua6Jm3boTR2ZH4fiHaVBhh
	bDHdOKVN+nGjinghUyyUecSFr3uVeslvpLyLx66CcN29LOBhO4v/+g7xa/qPWhGS6tv1GaFs+iW
	G1Ra1/RzQ92Ryup16SDHHOiY5mp24n3TuhKdNeQo/DU0pwfprgDC7y+5Kq1RRWJiPjCEOgnm0CO
	CglQNxg7ime10y+cd6yhcC73N8hNZS8legLITxMRBvwWIB3ZSZ5J1Vx+fMpMjp1m95FtQLhXxSA
	U9quY7/SLe+RSHNKZcU=
X-Google-Smtp-Source: AGHT+IFDXwUdNezvBhEqdepdpypz2MiP13dVsTX3oq0cAyKTbeB6SlypJKmwpWBlxGSGrQvbr8w1Jg==
X-Received: by 2002:a67:e7ca:0:b0:4af:f8b9:bea0 with SMTP id ada2fe7eead31-4b25db08266mr3564656137.18.1734105044298;
        Fri, 13 Dec 2024 07:50:44 -0800 (PST)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4afd719eb3fsm2026441137.27.2024.12.13.07.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 07:50:43 -0800 (PST)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4afeb79b52fso501569137.0;
        Fri, 13 Dec 2024 07:50:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/0pbmQ8owJ4L86pkfj+QRkX439SRuNX0vfpA0w26Mk1NmHUUobs4i+BsxlWBQY6/+FDuCto82BcuZFg31@vger.kernel.org, AJvYcCV8zywGOTPxXEPwe39i5G0bzCq4ojgr8FOGRLf5OSenR8VBi4ElrNTQzcG4aKxh/HMsChiWEOSgoAHE@vger.kernel.org, AJvYcCWsukhLZpVbtDhmyt3kggQt+dJucuvcATHrG35V3unj4iDCAD+HhkVVUxpHxApWz/Sjx4nZ1CnRSt77IIL3isX8TN4=@vger.kernel.org
X-Received: by 2002:a05:6102:441c:b0:4b1:1b24:7241 with SMTP id
 ada2fe7eead31-4b25d9e2f8cmr3698882137.15.1734105043676; Fri, 13 Dec 2024
 07:50:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com> <20241211210853.GA3708218-robh@kernel.org>
In-Reply-To: <20241211210853.GA3708218-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Dec 2024 16:50:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWhi3n==N6AniKcr8n+mkLdvpHtTTC1jGhPzUbXkGw9sg@mail.gmail.com>
Message-ID: <CAMuHMdWhi3n==N6AniKcr8n+mkLdvpHtTTC1jGhPzUbXkGw9sg@mail.gmail.com>
Subject: Re: [PATCH 0/5] soc: renesas: Add system controller support for
 RZ/G3E SoC
To: Rob Herring <robh@kernel.org>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	john.madieu@gmail.com, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Wed, Dec 11, 2024 at 10:08=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:
> On Fri, Dec 06, 2024 at 10:25:54PM +0100, John Madieu wrote:
> > This patch series adds support for the RZ/G3E system controller and ext=
ends
> > the existing RZ/V2H(P) system controller to support syscon. The RZ/G3E
> > system controller allows detecting various SoC features like core count=
,
> > NPU availability, and CA55 PLL configuration.
> >
> > Key features:
> > - Syscon support for both RZ/V2H and RZ/G3E system controllers
> > - Detection of quad/dual core configuration
> > - Detection of Ethos-U55 NPU presence
> > - Validation of CA55 PLL frequency setting
> > - SoC-specific extended identification through callbacks
>
> This series and some other questions about syscon prompted me to look
> into syscon driver a bit. Consider this resulting series[1] in context
> with your changes.
>
> Rob
>
> [1] https://lore.kernel.org/all/20241211-syscon-fixes-v1-3-b5ac8c219e96@k=
ernel.org/

Thank you, not having to add a "syscon" compatible value makes
perfect sense!

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

