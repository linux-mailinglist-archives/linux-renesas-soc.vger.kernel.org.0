Return-Path: <linux-renesas-soc+bounces-25670-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA59CADB3E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 17:10:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 45A07304EDB0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 16:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05CBF3F9FB;
	Mon,  8 Dec 2025 16:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avNpNCvH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271FF214812
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Dec 2025 16:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765210150; cv=none; b=R7ZBJj8VqBe9ILgyxx0P5NjzQvLT92XoloPNF2KcZyLUmOz+ysACBCvBJWlFgp3Cmt2E+VJv4lRUEDQ40EOuKKCdq74lrNnSHmRJxr0h3hm2/EucbYX304ucvgVws4VmBP+peibXiU3bNgm4XdYhKz5vKim03ir8YxnCO1d2vCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765210150; c=relaxed/simple;
	bh=RL5vla2iBJ25HcdaV0uhE6Ky6hIMB/opH7o7VaRBVYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Toc3VcryDm8v63h+XUv8OpLcuitNhZDLHYHtj51BJT1lOz+zYsoceS08PUBGQQlnWVkpjJgq5zZYX/9vQWQnPG0AWyiyeJ2hIPLqWqRUglcfyb1hropsXIoLOV+Y3EKwoOWzuZFFTDNb3Oi4lg1dttmb/OUHHspZjZbK9M/0QSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avNpNCvH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477632b0621so34038795e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Dec 2025 08:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765210147; x=1765814947; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zdjba8hBGxOnTGFRvhD4ykuH5Qe1xLO/Pwcd0PhJxyk=;
        b=avNpNCvHqRiV+/Iwnskrm8yUjLgHSA5C339cM7aO/C/+Rv/yr41JqZ+ocj6N6flIX0
         ewLIf+k+eTmsPLJ8MxXI7FS/2V9BSmjyWSGOX/VSj1uFgEpzi6+yHhzvxZSWWBjmKTqw
         sgSmUrSLKpT53ewhfc1BdHea7/dCtL+SAya+ccB3DofQTHu8U3scS+T28drtFgfZywdT
         cf56ji/hN1fEOHelsZ7O6fjD4/fDYcqEtWM3nfEGXC1Pt9X+Va54ovjGoTd5EGSo5mfn
         DIj187i7z9GCyJaNpCdPR6+TNNwMhZRBCeUBVui3E7srqZRj6pL6/t4ofwY/Fmrjcs4D
         jvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765210147; x=1765814947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zdjba8hBGxOnTGFRvhD4ykuH5Qe1xLO/Pwcd0PhJxyk=;
        b=nWHRz2BgxyLsWBHrLcR6rNcBq4aWbfC5OnlftSWEzpX9DMhLbHrmRB6HWlvcUYJ4Ih
         NPgp+/QNr4drO+f1K2yDiAP/qWUp+4nO3AIoeFmsi7j9fZNDZ1YsU/0Ki74Y1/AOGrwK
         27apRhgd036l+hn3uVGa0dj0caGtZwn12QOQJRx3VWzSyIVxNXTxrulAfdEJttB0OjN8
         nDSvLRxqtFuAd7coVrTPpDz4tQx918D2h7m3Rob0hrwyfJ/peDBeARiApdrAQbjXO5yj
         zExnBS/NneROcmXSUbY9IpX+3Ucw5FXfrf/0COVBDM/YQpkSCpIPjgqBR+qftfCSr1Mx
         XHXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtQjJnn/QugSWhO0kItm3AehGN7mvJT+etbmQbelWe9IiZZom8DVzzsOc/G9NZBkXxkmavx8yJTU39gA0ymgWAeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbv3yJSCMgmGY83Fo4tQRVUhTDAnq+j6TOu2FPiHXPxA8YJ12F
	3UkdN0k0wFDaxu8nS1vBuace2D61UTrgrV3zQInmbxWqtPaM+wHddOuQTSD8eLN44cOE07zQQZL
	moPEYz+aMNE1HJwFc4EzC/7C30uNNrB4=
X-Gm-Gg: ASbGnct25geBi2qtVPMPQgqAWa2S9I9NjEk/eygf4vUPYbEnMkauXpmlD3qykNusM1C
	9iKt6YRNocqW4NkFLbAOBuFKOKXGUMaaPcKItDnKmVrw27MjnUaJJsfdlPD/WcQPfyuJ1CdYZFs
	nfUQ555qmjMhrlo5Wrql54RiaDsYzPbORASXuWvCjpcEsibb4a+5DcHvY8xJYabYyRe4NPWdDvU
	RIV/YaC1U9rAvNPv54boa4RupEd3LCr05UqrV5bK8Zt3YwQcIw92N6vlB+a8zfFG8QFQI9NbROu
	vVoO0ksQoskF+rgZTKZQodrqPB4=
X-Google-Smtp-Source: AGHT+IFOBf4kYlCOHQII/gMObV81xnIfGWW6V1LWfsU0I+KfwhAEK2mqEfxsYfyiN0pXHwrxrO9b8QclmlUqc870Mt4=
X-Received: by 2002:a5d:5f95:0:b0:3e9:ee54:af71 with SMTP id
 ffacd0b85a97d-42f89f1703emr8908100f8f.12.1765210147178; Mon, 08 Dec 2025
 08:09:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251208155019.136076-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251208155019.136076-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <aTb2MuGSZvp9d0Al@lizhi-Precision-Tower-5810>
In-Reply-To: <aTb2MuGSZvp9d0Al@lizhi-Precision-Tower-5810>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 8 Dec 2025 16:08:41 +0000
X-Gm-Features: AQt7F2r5YSD8A41drLddmPekNoFw0-x2T7kYVaWOfrZad_IV3a03vwBr52GNX_E
Message-ID: <CA+V-a8tuP-C_0=atz0WXtw2mqNfjsaYCkDdsQE3QwyhFWTSSJg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: ti,tcan104x-can: Document TI TCAN1046
To: Frank Li <Frank.li@nxp.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aswath Govindraju <a-govindraju@ti.com>, linux-can@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

Thank you for the review.

On Mon, Dec 8, 2025 at 4:01=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Dec 08, 2025 at 03:50:18PM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document the TI TCAN1046 automotive CAN transceiver. The TCAN1046
> > provides dual high-speed CAN channels and includes STB1/2 control
> > lines.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml=
 b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> > index c686d06f5f56..c53c4f703102 100644
> > --- a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> > +++ b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> > @@ -23,6 +23,7 @@ properties:
> >        - enum:
> >            - ti,tcan1042
> >            - ti,tcan1043
> > +          - ti,tcan1046
>
> according to patch2, which is the compatible as nxp,tja1048. why not allo=
w
> ti,tcan1046 fallback to nxp,tja1048.
>
> So needn't change driver code.
>
Agreed, I'll do this change and send a v2.

Cheers,
Prabhakar

> Frank
> >            - nxp,tja1048
> >            - nxp,tja1051
> >            - nxp,tja1057
> > @@ -84,7 +85,9 @@ allOf:
> >        properties:
> >          compatible:
> >            contains:
> > -            const: nxp,tja1048
> > +            enum:
> > +              - ti,tcan1046
> > +              - nxp,tja1048
> >      then:
> >        properties:
> >          '#phy-cells':
> > --
> > 2.52.0
> >

