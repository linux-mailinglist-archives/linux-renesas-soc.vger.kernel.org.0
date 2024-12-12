Return-Path: <linux-renesas-soc+bounces-11258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A28AE9EE6F3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 13:43:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5ECCD16588E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 12:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A892135AD;
	Thu, 12 Dec 2024 12:43:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C290208984;
	Thu, 12 Dec 2024 12:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734007428; cv=none; b=VCGGwE1fBx+RdqxnrLX9KOv6o1wFTlfqq1S0HPzZIFzEXQmtdVDeum4M1lUerHFzM8805jaKzaiXPtDbsIIVNBA+9G/nJxtT71oa+GRwR/oMKUbQlqhP9rnqdP09+4tURmXwZOt1mDdELJD+UnwEBAPWN9JqpYEQOIroPvDcT2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734007428; c=relaxed/simple;
	bh=3btXi147AzIGDL7nozSUw3gUgxVcbaIZkGDcEzNxV+I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I3RDSHETatD8Bg6dEdtunopZu+J7nyCrha6F/BG1G1KRzP02WkpIk2AeeAQCtiGy46WyTpQWsTl9AOg5sDIGkwwIV5w/qPFwueqcneYNTj/N2ubLy36i6H7nmg3LEATBnnxLE+cBzQAY9uKWEx4ySut/jOTf4lePcqDC6N2sgw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5189105c5f5so314471e0c.0;
        Thu, 12 Dec 2024 04:43:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734007424; x=1734612224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dga/d7asM1k55Drtu8OoXMNL+GZziO1sUeNOAqVL/T8=;
        b=SsJpYbp6GxulDlp6IZEJesP+g0k7Cic4FPBzlCkC/EJZGmBjL4rVWNjkbtTkCACL5H
         1Nn7TYVQVbO6PMeWAciyqOI91x7+DT/4/mJxI5fRSukyLrEeSD5uiOUToNOM2Kc6K/0p
         XlTiRha2/Q9fGSTz7mp1Ar5+Ou4eW9yNX98tgNeqL+Wf3DBSz9XIpE+zv1FNUpJIdRUr
         S1m3Qq9/Mxrd1xJKaD7hiM1LGFkOZGRpyGYUEFKJceLFY4PVfAhhiI6XNsy4Udzi5ykv
         fBGkj72OZ1mw6Qt2rqSvdsxcq/uKy3+Za8Cz26lgfeA9Qc3zH8/Mi7iX0tBmEFCI4vVy
         UXbA==
X-Forwarded-Encrypted: i=1; AJvYcCUm9yaVkck2HM4NMqx0oHrLoKCuYXM/nhOP2EEht+2ovs4e76PjUpiDLx5bKtUUYitDrgainZkqfZTsu8exoaU1Jso=@vger.kernel.org, AJvYcCWvefbGMoYkaUn76k4ZFFrlfTmC6VS1vt2eFVMyVdUjP6r1lz/182I9rBxhzt/LNjpwPPn9PA7BIXgudpl1@vger.kernel.org, AJvYcCXFIa5m2yV4JlV35rGys+CqczgxInExTttyhWYnDH6PCzFC7FH1rWyHcIXEeqAe4UZeNEXazTBehY7N@vger.kernel.org
X-Gm-Message-State: AOJu0YyarSZxkLrHI8xjY6RswLmw+V/cFyIE4tXhvd6CAn1x08InwAno
	JTENvQwQ9HMwHXSSmcDJQZTjys6p7QW5Dl74kHX2+M0zsdNJYLwTYtyg8IrBeVE=
X-Gm-Gg: ASbGncvcm54/XvuIeooCE+uQMQYeV0+fjIs9/71Jml1XZkSTD1TRHc6aPFxnbrVjkAs
	CyzCs31taULZCjDUKb/Cmbx1o3s7Wtsiw2p2dYpthYM9uJQqEHjVZ/ny14DS1ZHhtlGynrskjo+
	ZqgjuqKlbf2fqYT2oq+ZTuBIGXUVX0E1/6Q86QGYn8RlDj3KOUUuV2A96JZEPWRZDegSCNIAmxb
	D02nL+6cNLl0EQD58oJDZHv4jBFLl6EIkLjerjolB+hPzdon1Q8INceMEzu1t5Vp4NsmMekForx
	IuUev958rwL3jTaqEO8=
X-Google-Smtp-Source: AGHT+IHQ5fvcWAWo9i9+oklZR/h4YQZR2d62b3fHSXJE3hebzhICeskydWukIa9dmtCikycYDGTk0A==
X-Received: by 2002:a05:6122:a21:b0:510:3a9:bb87 with SMTP id 71dfb90a1353d-518c576d2a3mr279931e0c.1.1734007423702;
        Thu, 12 Dec 2024 04:43:43 -0800 (PST)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5174fbc9923sm728682e0c.11.2024.12.12.04.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 04:43:43 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-85ba92b3acfso275113241.1;
        Thu, 12 Dec 2024 04:43:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUH4VEH/xeCU3LFx4Xnr/RU3ZNr2ZThzD7Ro1BxbwU3rs1lrYAb+6lQ9N/jpMHaEYusNlQNUBY+AwjgaqSd@vger.kernel.org, AJvYcCVI3XK2Lpc69JIGL+tYm3xZL0SRfo1p2xUJgCWZMnUHN5w04DG5fin7O0os01OAqbESw01WPyCxnVek@vger.kernel.org, AJvYcCVSfPqRmHvtv5QOYnwwXVNE12OoC6ncDP5TDAoAH8znsj/KmL4slUIMyOMjjls8N8te9shogB2oISTPlFLWwPuU8ck=@vger.kernel.org
X-Received: by 2002:a05:6102:3fa3:b0:4b2:4a40:f284 with SMTP id
 ada2fe7eead31-4b257fb96aamr39654137.14.1734007422756; Thu, 12 Dec 2024
 04:43:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com> <20241203105005.103927-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241203105005.103927-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Dec 2024 13:43:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX6ORf7A2juaw0SCxwADDLOpmmENMN2NeXjQY_uJymAWQ@mail.gmail.com>
Message-ID: <CAMuHMdX6ORf7A2juaw0SCxwADDLOpmmENMN2NeXjQY_uJymAWQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/13] dt-bindings: serial: renesas: Document RZ/G3E
 (r9a09g047) scif
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 11:50=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Document scif bindings for the Renesas RZ/G3E (a.k.a r9a09g047) SoC.
> SCIF interface in Renesas RZ/G3E is similar to the one available in
> RZ/V2H.
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

