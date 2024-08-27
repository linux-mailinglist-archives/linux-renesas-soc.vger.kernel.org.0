Return-Path: <linux-renesas-soc+bounces-8325-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DC8960350
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 09:39:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B2F81C22421
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 07:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF96D155C9E;
	Tue, 27 Aug 2024 07:39:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D953C145B10;
	Tue, 27 Aug 2024 07:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724744343; cv=none; b=am2Y9u4IvWMjRyHxxCTOltOOQvfh7SwM0h0ebzcnC+FkY5gIDFZB6SDr6CKsvEzngAuhpPM3pc3CL+KXQIvDkmveCVxyI/u8Ixoi5XKJheBsURrRy197mpPlLcvlIhy2S6rNM3j543msKjsKQKXj2xrPOVy7T3gsO+7V1aDJJHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724744343; c=relaxed/simple;
	bh=v+T24qfs7CVwj6oCTIePx7taaMDBZ8ll2XQVDijZuQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UZGzSVZiZnBlSa+rgP5BCapOm405UoDPJkPsrlvZ6f59lfeWROmyd2WAowsnNZYsU+HyVL7VkVVDFdlNoyQlFR78wMZcljO+AtayHCb2cVGu0QtxogZ8ucqmFJRKsLhiZJm6e9MDP4DEsaktNEromw+mk/dsq9y54Z8OV6aDPCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6c0e22218d0so54589557b3.0;
        Tue, 27 Aug 2024 00:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724744340; x=1725349140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CPO4/hTDEjg0BC8lm/XglP0DPRxyiM/izP9D1gxis8E=;
        b=VyILDVnTWOg+dWNnllyU6uuerHmTJgAwlUJUa71lk6S66PPZH0FjrmLpEwTduz3T3f
         fLpVsDcIzDHtcW/h48Gof3K/QKgi3hR+vE5FQRRgPyx5RAiYfUZ/3Nepwtr74QMzQXDB
         yaZ+K20PCf5BfqmGWrNykG7YqwnmTZ/meoAhliZj1YEVIPSYka4wYKY4t5GLX89ESMT7
         LdySYuQMiowSQUyOv8ebDchgsQDQpq2FQG9UTcy/td1E90y6HMxujxFmpdPmXnq5DLSw
         ma2IoBXPtx/EmgI6aCkVAT2K2UyZ/Tco92ze5CpCmqt+s33FOPSbVJYGvekCE6Wy01yo
         zwbw==
X-Forwarded-Encrypted: i=1; AJvYcCVITD/T8WMjXpJXIcALG54MEy2lfFuPkAgWgA50OvvkdoJCeTgGVHUZjV10immflGiUYP/cAWCARa60PPOzt397N2o=@vger.kernel.org, AJvYcCXvl7ad7dPPElL5EPqwmmt5jdnsnwET50zcrO/CN3O4kLbOb4k/rKNpdUHsCEYIh8gnVEGqgiN2XJqV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4f+jQLgXNpZzNDElSBBb1ffqbYdziMx8VB4XeymwUpgpzmMyC
	0jBsYV1qvuzZG/qRYpQpaZkA8zUT0QHhiAX7qXywDdL0RQnHAaL/LAox10FM
X-Google-Smtp-Source: AGHT+IHgKorUpZKSH0CfRXKvoockxP+UKfGw8aoPN1Y+dt5JWY0opjdNNJRBJuhD6u2xyEY28iNMww==
X-Received: by 2002:a05:690c:4603:b0:6ad:bf4f:1bc3 with SMTP id 00721157ae682-6c6286b8c94mr119381157b3.32.1724744340052;
        Tue, 27 Aug 2024 00:39:00 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c399cb4ffbsm18826257b3.13.2024.08.27.00.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 00:38:58 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-690ad83d4d7so47203607b3.3;
        Tue, 27 Aug 2024 00:38:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVyJO1W2T9A2PdRM/1TdmmAcb4Ikp+0koK8O6aTLR5itf/Jvg1bTFXBQ/z12tE8/gvSiYSEz9iAHcuH@vger.kernel.org, AJvYcCXGyJKjtXcA6WDKxWuq65eBudl+bj9rT+VODwhEgGM5z4yUS6idhjDcaIwKkLSIWGRdHJQ+oNtgDd1xBCEZV+U0R6o=@vger.kernel.org
X-Received: by 2002:a05:690c:4686:b0:699:7b60:d349 with SMTP id
 00721157ae682-6c624dc972bmr110225937b3.11.1724744338713; Tue, 27 Aug 2024
 00:38:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240826101648.176647-1-biju.das.jz@bp.renesas.com> <TY3PR01MB1134634E725C4E0EDCBCF3F90868B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134634E725C4E0EDCBCF3F90868B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Aug 2024 09:38:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVYNTAGa8=Ci-4ibcBOz-Rnv9g61tPdC4frFUxj+sH+_A@mail.gmail.com>
Message-ID: <CAMuHMdVYNTAGa8=Ci-4ibcBOz-Rnv9g61tPdC4frFUxj+sH+_A@mail.gmail.com>
Subject: Re: [PATCH v5] arm64: dts: renesas: r9a07g043u11-smarc: Enable DU
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 26, 2024 at 5:19=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Enable DU and link with the HDMI add-on board connected with the parall=
el connector on RZ/G2UL SMARC
> > EV by using Device Tree overlay.
>
> Oops Typo EV->EVK. Shall I resend the patch, please let me know.
>
> Cheers,
> Biju
>
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v4->v5:
> >  * Created Overlay for ADV 7513 transmiiter connected to DU

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.12 with the typo fixed.

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

