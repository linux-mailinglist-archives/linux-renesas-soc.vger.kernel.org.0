Return-Path: <linux-renesas-soc+bounces-19044-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EDEAF62A3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 21:28:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C4A74E09DC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 19:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B152D3742;
	Wed,  2 Jul 2025 19:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+VCUjiD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87FE2BE656;
	Wed,  2 Jul 2025 19:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751484506; cv=none; b=kmMXAJ4AzHRcuCT15yDAvXjP0nvNMRlTGWP1syDqwz2UANVR2BQum16yeAln8cP3KEQp0l0EmveV9pMIaczopg+c1QlW8XTUEKZgszODPwkc1UqzZFme4o8f3NfFB10FMssxIfpjUOGm2q0PIncz5AUZDNutiZqmM2MqFIOOS+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751484506; c=relaxed/simple;
	bh=xih0f0IrVpiwPNIQN3FuiM2jsdd/W6PIPe7Fb7/bOkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftIaonTKWDqZgmCZp2pbzKeFpCLs6K5723cr5vesY1cXCZ+EG2hmDYsZIF2ZnFGeJmDRmp5tbTvMlIJvAefECfHswn12TodvkUoevdZIgw55Wbbe9+UA7uyy+AswMD2Hh8YUtH4z1kbtY+HOQz3KwJBByUW5bsYMUxc9sBVNN+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+VCUjiD; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60c60f7eeaaso12052954a12.0;
        Wed, 02 Jul 2025 12:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751484503; x=1752089303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xih0f0IrVpiwPNIQN3FuiM2jsdd/W6PIPe7Fb7/bOkc=;
        b=E+VCUjiD5iQKfMDRBMF1FnuPX+OCGSr5qEhAog9ulP9jxk9J8I248S952ImwJmtZ0V
         Y+Nzm51L9O+5UmJIBD52SbZmSF84GHq7GIfdQ6leHMUXk345xFJBlrD9JjYT1tMYgywl
         g1r/pH/6uhEOZvdDy3J1X8tecLMeG6waSUVN8sBMy1NAzICwksHAKDnytQPJxtswUMuU
         2rTiVTIFqa3zDxuhYpz7cfml3xxQA+IZ6Ohx3YkaCsWK1LJEbfYlSqg0ptbwMPys5QpG
         c+xahbbL0MwOf5dbTAN7JZbHCGYiAZJhOoJHInKDHph6M+0qzSfXs4jlBRf94oVF5ylj
         sMZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751484503; x=1752089303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xih0f0IrVpiwPNIQN3FuiM2jsdd/W6PIPe7Fb7/bOkc=;
        b=RSGt5lZ6omVuRPZxkkUKU8y1hF1JNo2M/hqWKjIu0zxQWhFq1JeegaqjSN+jZ6As+i
         k4D3mE2lRFV6rJvWopyqWCYHso9x8CJMSmQBk1oQ/4ccnjAI2MtqBY1bv0srpPSew1pD
         ud4Hpu43iuWtn4N7mctaOKolSNcn/tc6vgCfq+j7hXr5QsNR9Au6ZJMhTlLu8lJx//EV
         NnnGzvFsICLabpsv82NeZkwY+8UAfmSMAySygLeiJgCGsKyltY5XQVVrhb7grNu8jcnR
         SQki/1lKrol3DrEzMuMygT3C2NeLFblAPaazqxrAPdTaOmDiXQx9EuZIkhYfocKjyxAI
         HX9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmS2y0xKC2DatxOMyNBYk6t1PMlETEO3eqg7hCojFncTUlhm4zUJpG3Y5h6gP+ok83FtYEY8EG0XjfF7fY@vger.kernel.org, AJvYcCV1jedj8pgT11dQIxi3JAJO2kWhuXqCLQvaQzNlIntKZtuZpmcmQUuabB/BUQAhjkCV8UobFmwzKCwzbFPFb1dsONI=@vger.kernel.org, AJvYcCWuqHayBDdQVknauUMHr+TpW4OVcXMS79q7IDNT3+XxFzpPuQP9hkGrh2oA7IsxeZycXeBN2BqPZttf@vger.kernel.org, AJvYcCXrFsZvB04NUgzilQH0a87RauWFIoSL32EnRxwaLTjTD75pcLvedxozTHQVOG7x1uYHTLQwSY9p4SZs@vger.kernel.org
X-Gm-Message-State: AOJu0YzywA++sYtIqfIbt3D4COHHlC/PPXpJlTt+t5vaCeaPceHVpYOi
	07KqSsgZ0WjPjzUqeFFRSQj3v3kQQvIyvneXZ/wTByzraPPFwJoZoNg86BVRnI0N9RmESy2RHeM
	aZofW78Z+svSV/qag70xKH/AeIrTav56lAmuMqYo=
X-Gm-Gg: ASbGnctHqXjtdYdef60lipLIxQV64dFutMUqIBQV4t+agpAPN9euITuHM4lXdtlxaGV
	Uw6IItZnvvD+APYfv4bW6TZU33QjCJoKlB6Jl5wCDXsWOzHsiJ0jb/86omIF1TLCH8hFUaaEoNz
	Xxuf5aQjFaBPh1Fej40dGa3yLYim5QqH9og3H74RfTPKeiGA==
X-Google-Smtp-Source: AGHT+IE/26ZGPj4QJDw6qpUc3nD2BeQNoD6ogI7+uKO1XyauigWU5XVfBCs81BmFBQwMtqbz+/auirfJKgcCXcSCFzk=
X-Received: by 2002:a05:6402:5208:b0:60c:3a86:e117 with SMTP id
 4fb4d7f45d1cf-60e5364e311mr3566885a12.34.1751484502896; Wed, 02 Jul 2025
 12:28:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627204237.214635-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250627204237.214635-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVpL4gdPB=vEbGiA4neNiUSKdxvKU3AFGVROsdes3VaPA@mail.gmail.com> <CAMuHMdUNG0YzL8gLaukdgbzEEPHXaG+YZRruddGjqt96XRrqLg@mail.gmail.com>
In-Reply-To: <CAMuHMdUNG0YzL8gLaukdgbzEEPHXaG+YZRruddGjqt96XRrqLg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 2 Jul 2025 20:27:55 +0100
X-Gm-Features: Ac12FXwFlupBYcEpmCxkYg_zcbmeQfa_-hTGAw2ui_pb142vwFJa2E-vLtLI5PU
Message-ID: <CA+V-a8sKA7yj68KOA26gMvhU+hjnp0CUf62Typ4LkAfd-1Ee5w@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: renesas,r9a09g056/57-cpg: Add
 XSPI core clock
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Jul 2, 2025 at 7:22=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> On Tue, 1 Jul 2025 at 14:34, Geert Uytterhoeven <geert@linux-m68k.org> wr=
ote:
> > On Fri, 27 Jun 2025 at 22:42, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add XSPI core clock definitions to the clock bindings for the Renesas
> > > R9A09G056 and R9A09G057 SoCs. These clocks IDs are used to support XS=
PI
> > > interface.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > i.e. will split, and queue in renesas-r9a09g056-dt-binding-defs and
> > renesas-r9a09g057-dt-binding-defs, to be shared by renesas-clk and
> > renesas-devel.
>
> Looks like I can do without the split, as both dt-bindings-defs branches
> are upstream.
>
Thanks.

Cheers,
Prabhakar

