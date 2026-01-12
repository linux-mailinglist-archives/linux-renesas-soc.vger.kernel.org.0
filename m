Return-Path: <linux-renesas-soc+bounces-26614-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFF6D1420A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 17:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 82A593007517
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Jan 2026 16:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C3C36A02E;
	Mon, 12 Jan 2026 16:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkglunHp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC1236A006
	for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 16:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768236278; cv=none; b=t3cavJbp0J8g1ifen6KQH34UKVFLDK22rivW3DHnqOWt3qb+yMVM4J413amNAdOu4SsULn32p7nwtm49DXU5Wy7m3PEU6auOK7wMQaRaoF/EIpc0fIkZqarih0S6sqPTkqEPKqmaq4z0Eis2/8s+B7eMN9QzOXCdSZcqvHgMftg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768236278; c=relaxed/simple;
	bh=15bJV717b3BmCRep7g3f3eqDSXeQzdRiVGChJjyTeQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uURS7K30EZyi7OmY9bnTCDJvTnSPnUZ8zwmTrFLdtNN6V7ZPhre/Bk+cTg75CFRs36B3CMgPYvs4BjMBphYrOvK/rS3Ak+3+/FISOe17IMEvq3UnStXdExapMP2SvcPxQYtvOauJC4FH8kG6PcV2LkkbSCd+5CAFnem11JOf0cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DkglunHp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477632d9326so40000985e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Jan 2026 08:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768236274; x=1768841074; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cD2W84EqNYwKoDXJN6AUPaelb23t6+j5pqlOt/nW9so=;
        b=DkglunHpD7ozJZNE8HfofRjDdLTa+qjy9K1ApeixeqdqvEZttvrmSW3Qw4CUG4vNhm
         9gBe6rkq71PcDqDa9LZb6ZiMb6jva1eTIh1IRGcJOySy25c2B2xEhFJTRFRv9Gem8dQh
         wj0uDTWcNa3l2AKbrJYggEPrKcuGi7dX9jgExlWhKU8z/rTxzrG4oKvLz91EuM7Idpj0
         eP7gCChU7qBQw8k+TkKkFS0qls+y4ka6vOAb2S4Tr6rH393sVh5OA1JaEiFpgtUAXryQ
         vZDEcx6UgOtozd3IXIPcz20IuI3NMt1+3RO38FlMhX4xeUCAN4ZLeSr8KCSGBrC8xnyN
         u1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768236274; x=1768841074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cD2W84EqNYwKoDXJN6AUPaelb23t6+j5pqlOt/nW9so=;
        b=n2MnxCHz8z/DW3V+zUzfXFAW3o8muEuL5MdSkCFMOqAo3B+H1/jhmrFTcem+5Pslv4
         yICgq9r6+Ok3hvqExi6rR5BgwPtBJXZxwpbNwkjde1KzlRiDeCbnmf1TvUSNpbmNuW07
         TvIuCnr45rsWmpEoBRcNZtTR1eDO2bP8IoDRUctaBIZBGx3BZqBxEC3PWXHEAjHEWNTo
         Byat49QcY1MuiyjZzPPgZIlhzOMPlk1d5I/2ZzwiJW/DOUTbNj47+mnp219+migbf6pN
         PO+2vU4rDZX/tbPrizp0IhB8bl/dSxC+pkztFb9b4/sR+P/kGHuNqlDHlDg8P7MhcZdZ
         7yPw==
X-Forwarded-Encrypted: i=1; AJvYcCUfmCoeP0Z1yz22u9TQnfcC1mhQOBydVJYszAjY7sBvXMtWSs39HGZUxq+quFj7BwtUiZxafvO+THqiQbed01kr7A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbtBbwY9QavjM2vSXSAvW6Du8S0MKS5w6IDm83E4mlHnr58Gme
	ElapvMEiJiXQlL/sN1cxygOpnqsnmfQoXYSolcmr4JnfiF3s3B1u/mEoWjJZyUmJCIoUwT+npJv
	LqrFqlVAafDUXasjSaa1QhyJ3qNnO77s=
X-Gm-Gg: AY/fxX4u+fyR4OEcOEF3fa+nV/b6kHXsHJaA9UtO2Hf7lLLVM2xAlN35hwxzYAaxgVe
	t1+18x5vso89vMbSFxNSjcNpCO3AV+yRwK9nTEIuDSlConuFBU7EJNd40Om+AcRqtklPWMcobBM
	tFyNrubUa6OjY3EZjld/attcnQEZZI0s9AvPqGCb5+J1DJwiKP0oofpA98vgt2Y3SJJf/BCtQUq
	0J8w/IAAxqs6g1S3+iecmkKxlh1cEJ27Xa0qYrcGSZgzW3tbp4ieyZmSoUgtZIXzLsl0uhalswT
	w3znuA9fUp51KyRG+ydhQca2//Adhb0VWTSGPVvpB3cIhnyEW/qu3fI=
X-Google-Smtp-Source: AGHT+IGau+W3RGt608fIO3PobvK9WHuMcah1IGzOIOuD1jKefcV1nFFm2JOlx2I3P0NzrOE0nXKM9dKGfg70UFuX9rs=
X-Received: by 2002:a05:600c:8b0a:b0:46f:c55a:5a8d with SMTP id
 5b1f17b1804b1-47d84b0aa97mr211947485e9.4.1768236273225; Mon, 12 Jan 2026
 08:44:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251103194554.54313-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251104120141.GC27255@pendragon.ideasonboard.com>
In-Reply-To: <20251104120141.GC27255@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 12 Jan 2026 16:44:07 +0000
X-Gm-Features: AZwV_Qig6PsppKVhEERX8F-92Y9pCzvropDxY-lGZwStB3z6BiMeRd5H2J_Pg1I
Message-ID: <CA+V-a8sP6o2GUju2ub0q1exiV87zHrkTddvkv8GKR_7wBF+vSA@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: media: renesas,fcp: Allow three
 clocks for RZ/V2N SoC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Tue, Nov 4, 2025 at 12:01=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Mon, Nov 03, 2025 at 07:45:54PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Update the FCP DT schema to permit three clock inputs for the RZ/V2N So=
C.
> > The FCP block on this SoC requires three separate clocks, unlike other
> > variants which use only one.
> >
> > Fixes: f42eddf44fbf ("media: dt-bindings: media: renesas,fcp: Document =
RZ/V2N SoC")
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>
> > ---
> > Note, there are no current users of the RZ/V2N FCP compatible string in
> > the kernel tree.
> > ---
> >  Documentation/devicetree/bindings/media/renesas,fcp.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
Can you please pick this patch.

Cheers,
Prabhakar

> > diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b=
/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> > index cf92dfe69637..b5eff6fec8a9 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
> > @@ -77,6 +77,7 @@ allOf:
> >                - renesas,r9a07g043u-fcpvd
> >                - renesas,r9a07g044-fcpvd
> >                - renesas,r9a07g054-fcpvd
> > +              - renesas,r9a09g056-fcpvd
> >                - renesas,r9a09g057-fcpvd
> >      then:
> >        properties:
>
> --
> Regards,
>
> Laurent Pinchart

