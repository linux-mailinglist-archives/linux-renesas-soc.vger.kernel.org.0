Return-Path: <linux-renesas-soc+bounces-19379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4DAAFC9CB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 13:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4D324A2A22
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 11:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194192C15B0;
	Tue,  8 Jul 2025 11:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XDCiGTz/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EB9285045;
	Tue,  8 Jul 2025 11:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751975045; cv=none; b=JF/5dkv+sHieLz/z4COXdq0pZMUSpczlMCdfH9lTC7AkzZQjuabcP1f0ip8cIQL5GwyDMVuZGSEwvbphExLTrVPex3MykpWwLZG2eeKWIu3RHqbJzxykkGKLOL/q3UySZPxGSD7ldF9WAtzH6fG3HFrFzjftpOxDWAz5Q0ot+1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751975045; c=relaxed/simple;
	bh=euBngZUN3i8DpgcvhzPFxxIUHObyI0cjAape0oKxtSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m9GusRa6tGIIjn64Nmjqm3EXBjTvQxY5xBMLP/AjxK5JkcH1H+dD29g3DpQ5WCv2AYQ2mUNS55mgtudz9sxZIqzSzDiYhTxnneiAuaGTMkH0sNbAAwzs9xKizuP/RfpJdZApaNcX1i9XY5OMw/+gIA/f9+pGchTTrao3ltVqVA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XDCiGTz/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0EBC4CEF1;
	Tue,  8 Jul 2025 11:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751975044;
	bh=euBngZUN3i8DpgcvhzPFxxIUHObyI0cjAape0oKxtSs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XDCiGTz/yOQV6aAgHBBRTwgRIY+3GxOyiUunilE+wchLddWgyHGIdjW7w5t0Sv8eP
	 UGn7BE5IOwobQjWICF/X/mDJ1IWkq2xmvnSPQgBQ/NfnkJp+k+AbwqjMXiK2UEGQpW
	 22eyKHm1RSQ1JhreqDoHTnasqh8EI1/8HMhaTHC1Sb41xVPgN3YlOd9IRILC/4wEaX
	 89yhX1gIsMzl2U1aHGlDPQX86J1QzH3/7MIE4l32pq+xpO9FWeTXqYSv3yT5BYfYKM
	 U5+VPCdF//3bf8/TQmcayGtzRcAZHzPHvryST8njzmfaTakROM7vIrcCRlptxMYvBz
	 mbDCQcUbo4vJQ==
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60c3aafae23so11595470a12.1;
        Tue, 08 Jul 2025 04:44:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUkPujt3q7iXTKyEUyuN8pcCvVbo3dsReKFOi2aqvdMaf/T3D6WaoSYsjyheqywg1BraMR7uLzmYzt7OuEDHP4Kw0UH@vger.kernel.org, AJvYcCVSrVtomBTL+fNHVa8DJEvZlKiNSCskixSEYRSpSUWr9NxqiEaaN0iCaXNV5FA0MFnOdVntfKJYGVuCFWjh68llUCM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7mZDYtxCUSt++VgSZd6U/aBFPOEmqSPuHs6bXVF+nUb8Uc95+
	Fo4KaKlQnKlb9IjqLr+1IVeYJc+aFS+Yc9NircpVO9KI+hcEEFh8tbZrSZAQ0F7wishCxxGbIJa
	lUfcVZ+8RTFbCQHY1jh2SmWd9olB9UA==
X-Google-Smtp-Source: AGHT+IHCtb15+abSYqU+gOdOP7U2/IBW1zh5G8l2N0+xbpbmZQEdM0BKjKASkHihetN/FhhJOorqYz+o9hYFUPauMoE=
X-Received: by 2002:a17:907:d2e5:b0:ae0:5137:6d6 with SMTP id
 a640c23a62f3a-ae6b23bd6e6mr235339166b.9.1751975042822; Tue, 08 Jul 2025
 04:44:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250706122638.1040347-1-niklas.soderlund+renesas@ragnatech.se>
 <aGyLYBoJ0c0UcN-8@zatzit> <20250708075155.GA1430987@ragnatech.se>
In-Reply-To: <20250708075155.GA1430987@ragnatech.se>
From: Rob Herring <robh@kernel.org>
Date: Tue, 8 Jul 2025 06:43:51 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKFMY0mO8mRmc5CS6cW+FKuMOcxJqz19Gh+EeX0VLHtwQ@mail.gmail.com>
X-Gm-Features: Ac12FXzAG46FR9Jac3CqdQB5WUWyCnW7PgTrU6LVK3wM1RpTykIGLTz7ivbM5QE
Message-ID: <CAL_JsqKFMY0mO8mRmc5CS6cW+FKuMOcxJqz19Gh+EeX0VLHtwQ@mail.gmail.com>
Subject: Re: [PATCH] checks: Document possible false warning for graph child addresses
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: David Gibson <david@gibson.dropbear.id.au>, Saravana Kannan <saravanak@google.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, devicetree-compiler@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 2:52=E2=80=AFAM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
>
> Hi David,
>
> Thanks for your comments.
>
> On 2025-07-08 13:07:12 +1000, David Gibson wrote:
> > On Sun, Jul 06, 2025 at 02:26:38PM +0200, Niklas S=C3=B6derlund wrote:
> > > The dtc graph_child_address check can't distinguish between bindings
> > > where there can only be a single endpoint, and cases where there can =
be
> > > multiple endpoints.
> > >
> > > In cases where the bindings allow for multiple endpoints but only one=
 is
> > > described false warnings about unnecessary #address-cells/#size-cells
> > > can be generated, but only if the endpoint described have an address =
of
> > > 0 (A), for single endpoints with a non-zero address (B) no warnings a=
re
> > > generated.
> > >
> > > A)
> > >     ports {
> > >     #address-cells =3D <1>;
> > >     #size-cells =3D <0>;
> > >
> > >     port@0 {
> > >         #address-cells =3D <1>;
> > >         #size-cells =3D <0>;
> > >
> > >         sourceA: endpoint@0 {
> > >             reg =3D <0>
> > >         };
> > >     };
> > >     };
> > >
> > > B)
> > >     ports {
> > >     #address-cells =3D <1>;
> > >     #size-cells =3D <0>;
> > >
> > >     port@0 {
> > >         #address-cells =3D <1>;
> > >         #size-cells =3D <0>;
> > >
> > >         sourceB: endpoint@1 {
> > >             reg =3D <1>
> > >         };
> > >     };
> > >     };
> > >
> > > Add a comment in the check to document this.
> >
> > Hm.  I don't know the graph bindings at all well, so I'll take your
> > word for it on what's happening here.  But simply documenting this
> > within the code doesn't seem particularly useful.  Someone running dtc
> > will still see the bogus error, and they'd have a pretty long way to
> > go to find this explanation.
>
> It would have been useful for me, I spent a lot of time questioning
> myself on why my dts files produced warnings and where incorrect. I even
> submitted patches to try and work around this issue before learning
> these where false positives. A comment here would have saved me that
> work :-)
>
> I think if the check stays the comment bring some value.
>
> >
> > Probably better to simply remove the check (and maybe comment that it
> > would be nice to check further, but we can't adequately it from a
> > valid case).
>
> I'm OK with removing the check too. This comment was first posted
> together with a change to demote this check to W=3D2 (instead of W=3D1) t=
hat
> have now been posted separately [1]. I will wait for feedback on that
> and let smarter people then me pick the best way forward.

I'm okay with removing it. It's somewhat redundant now with the schemas.

Another option though would be making it default off.

Rob

