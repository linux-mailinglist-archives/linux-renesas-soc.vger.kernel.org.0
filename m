Return-Path: <linux-renesas-soc+bounces-8371-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA82960B46
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 15:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A0C12842D0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2024 13:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 821A91BDAA6;
	Tue, 27 Aug 2024 13:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YncLkuMx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEAF1BDA91;
	Tue, 27 Aug 2024 13:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724763967; cv=none; b=TGSjzQRONO9bSQ08coovo1rechoBnlh4uqMnDDQa0O54c9ocxDQ5L55FTbJFpX/WjCBWWRgh01durBuSebjLmMP1AftFbTWttUQ3lY977GbMq5hiCvBenV4nE9FFth6Fv2aM+BDKH3gBdjpSp0JODX6NffM2EWNg6Gz+dpaSRFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724763967; c=relaxed/simple;
	bh=xggNVPk/5EQl9/TFKZGcuTwMgHxKYBXOTozMTu32GHY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z79bNlgPGJL9GS92igMWk3iW0Fs26dNO/k4Cf5uuG6NmvOtbb+EnkUALcwEg4Ade8KTBcqVhSUV56aEEpMNzilmJhkfqVjPQe6UPTXgIu5e7/W/rExDXjnDVEyy4wLCLhlhDwV6ydOnqa5nT88FEx1y1SxyJG/LdU/O049b3wV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YncLkuMx; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-454b3d89a18so29983981cf.2;
        Tue, 27 Aug 2024 06:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724763965; x=1725368765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ChKGvVEm12EBDIPmTGyjqqgoLWW0v9Em7fItsGhb3mI=;
        b=YncLkuMxZNO3EduCNOhd73411qOfW8mT7ehrGtjLMwWGeypeqwxwGagAh858FM6mw9
         UgjmMmiNgft9gwbr4xxv9mS1y3y5To5TqGNMggkcxgwGV+IuyKjRVZ5hv+biFi0yGUiS
         CyTUNhHD50JgL4ZJfvyjqE/PBhNlQggLCY9Jr/ZqGV38nig1XlGwehz6sydqmwF9FlXP
         ncP9Ttfcqficxqjy4HlCegLRqNIcdsK/I6eXWUOZewM9ltx/bAme+HdqX9wTovsYn2Ly
         5zzFddJ/IPaJLsz6k8Oz/r0QSwpTrD/d1kaxzMtG4EZf/XzfBtQMh78tAYwtzkXH2Ndb
         eFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724763965; x=1725368765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ChKGvVEm12EBDIPmTGyjqqgoLWW0v9Em7fItsGhb3mI=;
        b=E4jGZ5XVhFotz5LkpSbGDYukrDnX3RF4aVB5p+gaa0r8FzQ8toDxtG8t7+RktoC4Ym
         MNRdMJ+q5BG1jfFbp9WnekOAeSQkNjll+EdUJ1zLKocgF7S8r3yBEcIEQDAQ0TB2hv+x
         qcgquZlffpGZF+eSFxICgb0kjboTY4qgEyu6lk/s00EKq5tnoBtQZMxaplOkwhE5kpX7
         +38LtgWPqMolq442zdy/RRxFZixUyocyXyhNnEdPmRJrCI38ZDQqIJ8QVfmj+Z10QF8E
         bJgsDZGKIVu74UH7WQr2Gbg18+/YiqREx3KFEygW7rTFy9n6wdP9pXkghtMlvSmCydIg
         gJQA==
X-Forwarded-Encrypted: i=1; AJvYcCV1bkcxts7RdUJHXwO0AefJtewpQZ0lZ7xfJ00k8A0oFTH3z+5Y5SnLwFBiT9mN5aShpFcwK/rbUVD5pn+K4eQgf9o=@vger.kernel.org, AJvYcCWdbr10A6MF9dGmSVtzp18MZ2fvX6QpwtQWdiFTIKP9Wuxp8UChPsHgYgyyFPosBJeXFPa7rA1qpBPdNuZ4@vger.kernel.org, AJvYcCX37NUw7I44IJVtt62WO5ZSI1loGXePQNQR0bVSzafRNzKseeqxZhK04tZiGDo8sFNBV9MTvrjxuHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNcu9HaeOkWRCqocxwrzMqYtgZDVU02ovru+oElXWCu6J7xYQi
	8GlEqDFc+1cM62U7nshoikFEoL1CoBKHF7N1yiD3c+Uf0IUh3SP9MvXSEtUHBEK/iZzErBz5znZ
	h82HjlWb78iaaGZOcadzYBql+naw=
X-Google-Smtp-Source: AGHT+IFUtiFklzSQip3X9Y1CtXfvOcvLYFAK4BNbLVp0Z2SsgbyjL5DRa6PGhvsubIvSkQEvb/f8eDSB/VkYIFaDtaU=
X-Received: by 2002:a05:622a:598e:b0:441:1617:9841 with SMTP id
 d75a77b69052e-455096f4bbamr149984311cf.33.1724763964729; Tue, 27 Aug 2024
 06:06:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240822111631.544886-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240822111631.544886-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWcHn2ae6qennqtPq2eLtKLkeKUNoSoAXbOTh=gDgJ9tg@mail.gmail.com>
In-Reply-To: <CAMuHMdWcHn2ae6qennqtPq2eLtKLkeKUNoSoAXbOTh=gDgJ9tg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 27 Aug 2024 14:05:38 +0100
Message-ID: <CA+V-a8siwvOxB-RF1BtQ9kj2=aJAVP+-Nx9YkSNj+o67zTc=JA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: renesas: r9a09g057-cpg: Add clock and reset
 entries for GTM/RIIC/SDHI/WDT
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Aug 26, 2024 at 2:37=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Aug 22, 2024 at 1:16=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add clock and reset entries for GTM, RIIC, SDHI and WDT IP blocks.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > - Updated DDIV_PACK macro to accommodate width
>
> Thanks for the update!
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.h
> > +++ b/drivers/clk/renesas/rzv2h-cpg.h
> > @@ -8,6 +8,13 @@
> >  #ifndef __RENESAS_RZV2H_CPG_H__
> >  #define __RENESAS_RZV2H_CPG_H__
> >
> > +#define CPG_CDDIV0             (0x400)
> > +
> > +#define DDIV_PACK(offset, bitpos, mon, size) \
> > +               (((mon) << 19) | ((offset) << 8) | ((bitpos) << 4) | (s=
ize))
>
> I think the DDIV_PACK() macro (using C bitfields?) belongs in the
> previous patch.
>
Agreed, I'll move the updated macro (below) to patch 1/2

#define DDIV_PACK(_offset, _shift, _width, _monbit) \
    ((struct ddiv){ \
        .offset =3D _offset, \
        .shift =3D _shift, \
        .width =3D _width, \
        .monbit =3D _monbit \
    })


Cheers,
Prabhakar

