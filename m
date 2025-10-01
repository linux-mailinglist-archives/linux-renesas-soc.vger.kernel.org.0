Return-Path: <linux-renesas-soc+bounces-22528-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E8183BB08E2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 15:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D3024A48C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 13:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988682FC016;
	Wed,  1 Oct 2025 13:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbrNcnyk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749142FC00C
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 13:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759326421; cv=none; b=MJ6+b8OlkjDw2KeedC/PaBBWcoyxyc6rO2ka/mr/D60eh2s5Ek9JddFWF7i74lZUqEd2vSmkvZMQ37kW7XcJz71Nte4g2LOlb2KV3pki4SO+lxPr5PzCBWcdbteqGzXVcpw38NarENxPuWUSgvSipgyU+ZsoBRdkv2Co7viFBkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759326421; c=relaxed/simple;
	bh=v+ji9plO4OzWyJJ2i6Oh5BS7dDU72AHEz/U7GHRK0w4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kbqAQWi+cPPQNZxXdibm653NzBiBc2B1/QJnj5FjjuPh80BlEYb3NxwdsI7QqO4WbsKzLmMEFq/obrmtUrQg4I+lEw9wm7CjiEl8zoG0cr7PfWx7DoKsfqtuC+cgwndAu4o1bRJSFnq2rF+TjuTrnE7yP4Q2zgsiuAG5gzrxIoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbrNcnyk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBFB5C2BC9E
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 13:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759326421;
	bh=v+ji9plO4OzWyJJ2i6Oh5BS7dDU72AHEz/U7GHRK0w4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lbrNcnyks3+ir45B8whX+uMqQeRBBFxrcMRB0fAhX395A4/OI6N3tMF7uEdvcgFYV
	 I1RCPdZS03d2UKit1z4cnjxqqcRPKBuAFJMnQLphCCGzRrkogYnEf3qs0tsaZo1tNm
	 28C2XN6206TbM8M/2u5cIJQQcn0yJ//Jg1JWgtln9jKayfRtObWyTBE8JXFg026/Q+
	 luivwjam98HZ36cWi6s4jjOyLlsMzqAiWc9xYrLVnnqMAA91w0oZcNhS6cwOhF2wXE
	 H/zyUEHSe8fpZrUpRC67HTLBSU6Y0asMdUVVBd8eP7H2uzAUPqqLNWg3s6zIu78abt
	 +5o31bGdgN78g==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b0418f6fc27so1072706866b.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Oct 2025 06:47:00 -0700 (PDT)
X-Gm-Message-State: AOJu0YySqn/Wa3YDH3WyBEOH4hqYpNwKP+VhCxqBKoDsiC6S/MWVVcF7
	gKks8ipuzAg5PIljnS3+Crtc3Qhc+TG/LNxmSTUitcwbvYpFVlGX/L0VVwkEUpyJ0QV+DuB1gTM
	xzPrFrR5i8Co17QCyy+qcMTTEwIycGA==
X-Google-Smtp-Source: AGHT+IG9ni4sY2zl429plZ6qIAweLfDCEUNWwBAiRJ2N77L+a8Jj28/qR+F80g2b2zgIZ5GWBfDitVWfYI5X8+Mgc2M=
X-Received: by 2002:a17:907:26c9:b0:b40:2873:a61a with SMTP id
 a640c23a62f3a-b46e0dad64emr408799166b.6.1759326419310; Wed, 01 Oct 2025
 06:46:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250929072306.5634-2-wsa+renesas@sang-engineering.com> <20251001125149.GA1122744-robh@kernel.org>
In-Reply-To: <20251001125149.GA1122744-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Wed, 1 Oct 2025 08:46:47 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Rnmv26tjOednFuQkLf0hwfMU1xihLT+D6aym0SigNng@mail.gmail.com>
X-Gm-Features: AS18NWD2sQKDdAvC2H5URHdQH3iLfTDYG6Pm_keCh6ddLiDqUsFxVxjTYOqR5Fg
Message-ID: <CAL_Jsq+Rnmv26tjOednFuQkLf0hwfMU1xihLT+D6aym0SigNng@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: dlg,da9063: allow 'interrupts-extended' property
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Support Opensource <support.opensource@diasemi.com>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Steve Twiss <stwiss.opensource@diasemi.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 7:51=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Sep 29, 2025 at 09:20:47AM +0200, Wolfram Sang wrote:
> > If nested, DT schema cannot extend required 'interrupts' to include
> > 'interrupts-extended'. It needs to be added manually. Fixes:
> >
> > arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: pmic@58 (dlg,da9063): 'i=
nterrupts' is a required property
> >       from schema $id: http://devicetree.org/schemas/mfd/dlg,da9063.yam=
l#
> >
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > Copied this solution 1:1 from:
> >   Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
> >
> >  Documentation/devicetree/bindings/mfd/dlg,da9063.yaml | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml b/Do=
cumentation/devicetree/bindings/mfd/dlg,da9063.yaml
> > index 51612dc22748..4af5fcb856c7 100644
> > --- a/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/dlg,da9063.yaml
> > @@ -110,10 +110,16 @@ allOf:
> >              "^buck[1-4]$": false
> >          thermal: false
> >        required:
> > -        - interrupts
> >          - interrupt-controller
> >          - '#interrupt-cells'
> >
> > +      # oneOf is required, because dtschema's fixups.py doesn't handle=
 this
> > +      # nesting here. Its special treatment to allow either interrupt =
property
> > +      # when only one is specified in the binding works at the top lev=
el only.
>
> The solution is to fix dtschema. I'll take a look at it.

Now fixed in 'main' branch. There's a handful of other cases fixed
too. Had nothing to do with nesting as most cases were ones where
'interrupts' was only defined in a referenced schema, but then
required in the outer schema.

Rob

