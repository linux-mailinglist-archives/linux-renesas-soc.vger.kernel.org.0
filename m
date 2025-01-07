Return-Path: <linux-renesas-soc+bounces-11912-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25597A03FE8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 13:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF0F63A6D52
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 12:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D762D1DF748;
	Tue,  7 Jan 2025 12:50:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2E629405;
	Tue,  7 Jan 2025 12:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736254210; cv=none; b=H5hMo2rFFyrn8ytd9rRFXXnLBvnsr3I7hRNt8yJwnvqPF5+fHfWjbNkT//gFI0s7YH4xgalbvpgHDo60yW3TIa4vQ84rSEMkxaXIAEidJQCM5JhNC87egAdl7Z2Btd1JRjY0LegZVongHKdvwQIChdcDxZ/PsHBaZcFLO+vO39Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736254210; c=relaxed/simple;
	bh=BCjC/PTdeRIjW/KaGVSPSCOaXTZUOw451Td9KLCTlPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X62kO3Pt1NCAK3qVc8Kwq4FlNXam1Nxh6GWuSa3cfHL8n/Ch6nfr69UtaBhMR1EbjIocoxhgP2MwRXQRi230GMHjww019aB6oesYMMpJK3TZmiLJ9nlkl/5q5rqrxFusjQOfMnMLYBiktwhZzEUvsP3Lp1LeyLWV5yVt0pb8e+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4affbb7ef2dso10461260137.0;
        Tue, 07 Jan 2025 04:50:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736254206; x=1736859006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=me7DzBGqdvWEXMWxV812oN7zJv78NsUqICU2xnXcKOA=;
        b=VXhcXJKr9U3KeNJ/0SdOmrVBSmijrs8a5YvF3LC9ZN5bf3/wdGEdPDdux7wUw4SEQ7
         1vX/7ChHEpJ/qUQRLqL4JcRttW38T8nkOtosmwu9fWTBJvGRFGeW+6HSClOtf0ZV9slb
         bYHcCCwH0ZNBBXwPgajw4jPuQRsiGG85jwBLbngds1l/cDnGL+Oshyy8nk5DdEvL2+k5
         r72j6mhT48a5a4gtOHk3aXAUUPTbYjXH/e7NBLyUpE6QEzSq0sBagI/aRFe9VuedF+pH
         VaUNPhMlt6WCGLPrHgpidMuENnJv85LczlevsfKS4ATfhNNs4fhvjNirE7ePHu2N5hU9
         RNYA==
X-Forwarded-Encrypted: i=1; AJvYcCU197xkzbxQXfQq3TkvjGH1K8Br2iJaaGZC52oXSP77GvTlb06evsd06qTAxiFkgxGD04iTaQD8dOQcd1rLMJw7ATo=@vger.kernel.org, AJvYcCV1CFd0SXWuAH1vZ0cYEV19Alvxr043H89UeUb5YhSTiNS982QGsMCtnqIl5HacTLPMUM+SHRXsCwQ=@vger.kernel.org, AJvYcCWJEQz0k1pHfUCc0+db2zlOA636T82aGF9y9kuYs73dwemvxy7ZJC2R/bfda34Fdl/5YMNf2I266qRlprSE@vger.kernel.org
X-Gm-Message-State: AOJu0YxTXrn+KDl/VX2SilE5mMKkqX849sfgbyYxA2fwZqZHduPSp1qh
	WqwVRMaTyyVXA/TfWaN1/dQ8WmmEJsx8QLu563ZBdm3eDs6PQQAogLygxgce
X-Gm-Gg: ASbGnctbd3BqYgaZkVCPOBcS78cLbq/QIzIauT6L6DeLcp6BIu/y3NBlmqxM8YsJ41p
	Eh8Im1CNuaWbfQpp4vS3y9ENfbFIEmmqrpE2mtsgW7dweE1aJ//Tp/1lnZBu4NIDsbbSH4Xr9/x
	HiqGJBrPT/5wsILZ0dcKu2bYNtXz7nNBqOB1tDqxP59qrHmi8AtFLEcJkDS0Vj5+stiGY5FxF3f
	QnkNmw85W8gVGTmjyoPzcxrbNcdz9S7Fj7apwsQrJooJs37l8DFS92/4RuzL7X2dB6xtsbhvPxB
	aNaE0Bm9dD/LyHAJsB8=
X-Google-Smtp-Source: AGHT+IFd+rFm+WEK+v5aKR75VRnedbeVE3ZNyRIu7EMdQoiOXKs9qakrIjS6UUf1RryLm1zqXxVc0A==
X-Received: by 2002:a05:6102:3a0b:b0:4af:f8b9:bea3 with SMTP id ada2fe7eead31-4b2cc38561bmr43255279137.15.1736254205705;
        Tue, 07 Jan 2025 04:50:05 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bfa8cd44sm7994442137.25.2025.01.07.04.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 04:50:05 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4b24bc0cc65so9140535137.2;
        Tue, 07 Jan 2025 04:50:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUDBs7j4I+k9dru6OpkhIGbK/YFSMLkpvu5KlGe8XH/DdtHfCZNFfCd8hZV2OPru982eOjlMn/WeieAWO/YVG2K5Tg=@vger.kernel.org, AJvYcCUL0eOAXWBY2GT/DvKt18umuksueZjSr6sXL2la6ZhZ6BDgYv06a0uNmXhNuKttEPXzyw+y9kIpylQ=@vger.kernel.org, AJvYcCVcMkee5eDjbuQ0Xoi+8qbd4UOFH+k2qupxtgN+TsFAnuHIXlsHTSouJ+TJqnx3bKdNP3EwSQPtou27n3GM@vger.kernel.org
X-Received: by 2002:a05:6102:3a0b:b0:4af:f8b9:bea3 with SMTP id
 ada2fe7eead31-4b2cc38561bmr43255264137.15.1736254204891; Tue, 07 Jan 2025
 04:50:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250102181839.352599-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346C123E18F61A009F6F0F586112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tO-d35+aPLYoCmC4xKW4cMoNyzM_Vmyw6CzOJjyjj=_g@mail.gmail.com>
 <TY3PR01MB11346C6E247A83F6835F0C7A686112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8v3wdwEk9zu26MeQVmOnWKm=RdHJzdH6tLKrvRLeoQ2DA@mail.gmail.com> <TY3PR01MB11346E9B6CD4CDB6EF93B99C986112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346E9B6CD4CDB6EF93B99C986112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Jan 2025 13:49:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXqF6SbU3ScXLUt7e5LGckouX6fQqg0sJ3+3cYeFtpN4A@mail.gmail.com>
X-Gm-Features: AbW1kvaluoHHsh3YN0Fg7OTLn4le_rAvkKTSbVjOUXu_Ex3TdNPz_Dw1GR9C4Dg
Message-ID: <CAMuHMdXqF6SbU3ScXLUt7e5LGckouX6fQqg0sJ3+3cYeFtpN4A@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP configuration to
 per-bit basis
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Tue, Jan 7, 2025 at 1:38=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > On Tue, Jan 7, 2025 at 12:25=E2=80=AFPM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > > > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > > > On Tue, Jan 7, 2025 at 11:24=E2=80=AFAM Biju Das <biju.das.jz@bp.re=
nesas.com> wrote:
> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > >
> > > > > > Switch MSTOP handling from group-based to per-bit configuration
> > > > > > to address issues with shared dependencies between module
> > > > > > clocks. In the current group-based configuration, multiple
> > > > > > module clocks may rely on a single MSTOP bit. When both clocks
> > > > > > are turned ON and one is subsequently turned OFF, the shared
> > > > > > MSTOP bit will still be set, which is incorrect since the
> > > > other dependent module clock remains ON.
> > > > >
> > > > > I guess this statement is incorrect. Still in group-based, mstop
> > > > > bit is controlled by usage
> > > > count(ref_cnt).
> > > > >
> > > > It is valid, consider an example say IP-A reuiqres MSTOP bits 8 | 9
> > > > |
> > > > 10 and consider IP-B requires MSTOP bits 10 | 11 | 12 (of the same
> > > > MSTOP register say MSTOP1). Now this will be seperate groups having
> > > > separate count(ref_cnt). Say you turn ON IP-A module clock and
> > > > correspondingly clear the MSTOP bits and similarly now lets turn ON
> > > > module clocks for IP-B and clear the MSTOP bits. Now let's say you
> > > > want to turn OFF IP-A so you turn OFF module clock and set the MSTO=
P bits 8 | 9 | 10. In this case
> > you will now see issues with IP-B as MSTOP BIT(10) has been set when we=
 turned OFF IP-A block.  This
> > case is handled by switching refcount on per mstop bit by this patch.
> > >
> > > I agree, Do we have such use case?
> > >
> > Yes, for USB2.0 on RZ/V2H.
>
> OK, then it make sense for per-bit configuration.
>
> > > Consider another use case, index 0, bit 8| index 0, bit9| index0, bit=
10 and index 0, bit8 | index1,
> > bit 0 | index1 10 is addressed in current patch series?
> > >
> > Can you please elaborate, the above isn't clear to me.
>
> I just provide a random example for a future IP, where
>
> IP_A requires mstop1 {8,9,10}
> And
> IP_B requires mstop1 {8} and mstop2 {9, 10}
>
> Note: I haven't seen this scenario in hardware manual.

That case is indeed not handled, and I had already checked before it is
not needed for the current SoCs (until we discover e.g. a dependency
between different GTM channels ;-)  If it is ever needed for future SoCs,
the system has to be adapted...

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

