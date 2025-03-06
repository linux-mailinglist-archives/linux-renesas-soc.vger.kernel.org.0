Return-Path: <linux-renesas-soc+bounces-14056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2506A54915
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 12:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 074F11734D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 11:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD8D20B1E8;
	Thu,  6 Mar 2025 11:17:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7A82063C7;
	Thu,  6 Mar 2025 11:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741259822; cv=none; b=XBNhpQHbMSbc/i9ZNm9kP9mTjsKrIJvYxTxUvVSM2Omkvt5PX2aorNi2DZ7mD+WNs3t2+UIw5KRDLuQVyGGlgtbA71PPwJwodin8jtQgw+UzXUhuO/s+eh2wSPulWHUICcorFzAjkp29C1UXlEiMuv3cc2HakDeiYIc25myqSnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741259822; c=relaxed/simple;
	bh=i9NWqcn1No4Y5D2BJzt1iYmNvmEQsvYXPqS6HC+X0l4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FsCTusncXBE49Vds0ikUElU6MrQ6mbfvJ1Vi2J1TFMYb+XKPoVrVe/oRR0o5ZuVOoUxlR9BkoPCoDbFjVoRyb+xIVXMqGleT/gNs9xFLOWoac+cgPFNEhoyrGjKz++8OmZAVsEzdb42R43QWkjYWmsVSU0XF2A4Etz1ng9SJyuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-52378c0c2b1so229761e0c.3;
        Thu, 06 Mar 2025 03:17:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741259818; x=1741864618;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mkHSGPXz1QjRo4gUVYEKIdFzNMIpKlc/qisF3LVX2no=;
        b=o2l8o+DwQNDDOpGrpTIAD8I9nX5E5ry5bqeZa50gxYgOratRPN+/BtEIVjZgXSlN5M
         VyREq+BoU+mlOOg0QlU2Lh9KTkvyfWvkeLzt//7We5dPPorsyVvpE5e+2YPuH3Uo9jBl
         fGkkv/NN5ZCoalUrmFiVzDjBIOvtlvpCBvZpxwbrpw9nzow/XwUpVcp+7k01uI8Y285p
         mqfeaTqSTzQapzKB2KHpXx5nFCRMzXUsj3bFvDf2CzvDuvVnvQA4Pgp22nUR1dbHe330
         GFzEn0Hv+CAJ1rz6ScLfj/8CxFN9ZZD7I2jvvYFjTl7XsmbIzeq3xCJLGQOrd480EdRh
         xlSA==
X-Forwarded-Encrypted: i=1; AJvYcCVtsIBqUyZcebZnCig64MazARgROn50zWg9/BdVUsOLmPZsW2afxhOE5/68wZX01/beM9fyaLGreL+T@vger.kernel.org, AJvYcCWju3FpJ+/+Y+W7NlMheWw/yyTZKv1tNxPTCXeBK8yhnrhSBfp0XIFIhO0YJrReLjfnlk2CMbqYVqRGYGeWn5db5DA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdHEiFo1e3MuK8lrqKBMAM6ImXTr26OlAY127BcuJPpNjdJNtm
	VRS7M5xhM4UNjCnzLmKcEmesu+RqSMrVfXiMI3Dw1SojEEKdTYWLWtRjm0sF
X-Gm-Gg: ASbGncuggTO+zUEcqnlQX3zAdt/njHpXlmJTcw8O/RNHh8Fbzp7u64Q6f0XQtlSN9bx
	ZxgegGdewOK7LLEDWU/ESM7Vyv9svar2u2v3Ve13a98y1hlD5OqmZEAK1QarpTPVJ42WhPlUO99
	eEsPUGenz123p6cMpf8Km7F3k938G5dXTh8siV38KCs+oO99C7dmfNU2Wsa4o1edzmwi9rHVUXw
	FofRqPBWcJmymOUZTKz/dd/M8PcHOr6zjgDRThR3EMXTelbLycr8jgGvOKQ6gMcDawQ8nQO7LhC
	qzPlNFEAqLFMpoGVSzQf8sE2LAo2bUYImcqlt6DdWOm+ODHh0MlMCImF3fQgxOH5JrxfI9FWAQM
	iGJRqPU4=
X-Google-Smtp-Source: AGHT+IFb4npbzLMnEDcd4ncVe/8GXuYp+MkyQKAsNb+7RCHINY+xAGuEJMLRnSeX3gZyA9E2LPr5Bg==
X-Received: by 2002:a05:6122:3186:b0:51f:fc9d:875d with SMTP id 71dfb90a1353d-523c6288a94mr3777186e0c.8.1741259818606;
        Thu, 06 Mar 2025 03:16:58 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-523d8afc188sm144351e0c.28.2025.03.06.03.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 03:16:58 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-8670d630d2dso205464241.1;
        Thu, 06 Mar 2025 03:16:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUrsNX8gV/FJq8MPs8FKkQbzRN18rfH2htZRkRtM0B1Lw++Su1JJfkDmhuYj1+Dozylirp1MVmrk8oz@vger.kernel.org, AJvYcCVbxV7Vuh3Gk9K7QBzaNcvtyPNgZ3cNbTv5/KNSk5wwDkmTsT78kxgp9xeWVuzmuXxevxDCfjPelT3Yt7/VS8yZLak=@vger.kernel.org
X-Received: by 2002:a05:6102:32ce:b0:4c1:8f9b:19f1 with SMTP id
 ada2fe7eead31-4c2e27ffc52mr4437717137.11.1741259818116; Thu, 06 Mar 2025
 03:16:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250228160810.171413-1-biju.das.jz@bp.renesas.com>
 <20250228160810.171413-2-biju.das.jz@bp.renesas.com> <CAMuHMdXOd0QgnWiptLJ2u8MwgYqw3=UufozdB2Lubt0yGc2BXg@mail.gmail.com>
 <TY3PR01MB11346736FD737998ADB7378E286CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346736FD737998ADB7378E286CA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Mar 2025 12:16:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUMuCCe-tpkkrPS10o7+kNUUYZ1n89_LLVkJVF5pka3EQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrohinNpL9zQ-QASbLVVdSn4EbfkZRG9OUKCo29mt2Ilp60hPHXxVjZHF8
Message-ID: <CAMuHMdUMuCCe-tpkkrPS10o7+kNUUYZ1n89_LLVkJVF5pka3EQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: memory: Document RZ/G3E support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Thu, 6 Mar 2025 at 11:59, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: 06 March 2025 10:44
> > Subject: Re: [PATCH 1/8] dt-bindings: memory: Document RZ/G3E support
> >
> > On Fri, 28 Feb 2025 at 17:08, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > Document support for the Expanded Serial Peripheral Interface (xSPI)
> > > Controller in the Renesas RZ/G3E (R9A09G047) SoC.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rz-
> > > +++ xspi.yaml
> >
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: renesas,r9a09g047-xspi  # RZ/G3E
> > > +      - const: renesas,rz-xspi         # a generic RZ xSPI device
> >
> > Is this the same variant of RPC-IF as used on older "RZ" SoCs like
> > RZ/A1 and RZ/A2?
> > If the answer is yes, then I do not object against introducing rz-xspi.
>
> No, by looking at the registers,
> I think one on RZ/A1 and RZ/A2 is same as RZ/G2L. So renesas,rzg2l-rpc-if
> will fit there.

In that case I think "renesas,rz-xspi" is a too generic name.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

