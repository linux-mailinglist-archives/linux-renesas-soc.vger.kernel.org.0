Return-Path: <linux-renesas-soc+bounces-22822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EB5BC9174
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 14:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E63983C3A01
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 12:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC88E2E283A;
	Thu,  9 Oct 2025 12:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oV+LzD5v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E6B25A642
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 12:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760013729; cv=none; b=m1z5kCCwKqo30hlIC17/HL5OwnsvnGr14jSaRTxeA358l43jWXGe9YZdKUPFPAQFYth2TgkOUKzzUEGGk/8e/6c3DUML3HaT+mkrDRgJ2TQ7HUhr+ybRW2r0TBCErrIU9X0HLPJ+NHnK4Sox6WgJn+ucA7n479bnXeYi3uLcNts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760013729; c=relaxed/simple;
	bh=QeXANDoY3dA5GoghojfGO1E3AP0vVKa96j+PiZHrlrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GOa8WM/gAyNpBxUv1uzdm4fBPxKIFeUsyc5j9mOaHelATxi5ca9MQW+D8HY8l89O6JtPshA7+tGdqwX8NVXcU08Jfj2FwFJvyS+rIbYERal3LAoQsnQpJos6AU4pw3f+QYGYKo3+dqLaLGK+KR0JX5RblKQOBH1i0nQeUEqmuGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oV+LzD5v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28ADBC4CEFE
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 12:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760013729;
	bh=QeXANDoY3dA5GoghojfGO1E3AP0vVKa96j+PiZHrlrA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oV+LzD5vxTULw8ao/p3k9Kj+gE80OMDqEMaDN56BNvsfbhhp2lnjlD75mSjL3/ubW
	 7ks8n8K3kmZZewYlU8S1d5wLfpZp1o74VfdXafqS2fp1Egu6bnt7x9L0dw8Mu8BgWm
	 kB21PmY4ijADTE2DEU7An34QqGt8Xh4NgZje89CZv8hKmxDBthdN4B8QHyOM9qBgbO
	 z6XXYfBhwA0CUV/aySokP8xyVy8C1MPe31KOaYBJ4dTB3rcPQpWkY3sxAkrEW78hqD
	 AdXFYOun0LsJBiKUj9XgyldT1OOGMJ10H6F28uJcHTwzHcPT6l4PaszJ7j9rkgZ0oi
	 G4/bI/XYH1iCA==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b472842981fso112325266b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 05:42:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXxsY5lQm87QP/KHXzfiQotsHyXVffQOY8vlhyeQ8iA90d/PbcJ0AZQyWbuBNwOJB9MWQY3+ll7zIYiwK2gAa8cLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxI/ntVFW1yKkhGD2MhWzdVquE35PuqZ4weD99RhB1WNgByPgQC
	CtpMpL3Fxr94se9s/5ePpmtHEDqRPHZNHil/DOLEBPJrfk/Tod38CEm/WzoLImhg4GSkOK73ib2
	kHn43Kc9WO6umwUl543bjuKRZqKwjGw==
X-Google-Smtp-Source: AGHT+IEuECf/wjZh/1XKrIIGS6JTvgX4op6M6unqu0wb5kahYYe2XWklYd666VH9MZORUQaoIOMQVv2jrZlC5O+hBuc=
X-Received: by 2002:a17:907:1c0f:b0:b40:9dbe:5b68 with SMTP id
 a640c23a62f3a-b50aa792c29mr695845866b.5.1760013727678; Thu, 09 Oct 2025
 05:42:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007032209.7617-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdUChRoJ-A4W-PBBQssMvsn1GZY5zXmWxJ9y+EA8M2p3gw@mail.gmail.com>
 <aOWGWkQn1AK22tJB@shikoro> <CAMuHMdUXoq3d010y0vyXvvaHpgaV7rHb66VAHrwJxAZXzt+z=g@mail.gmail.com>
 <aOY2tdEXmhdZ0Yeq@shikoro> <20251008224208.GA237448-robh@kernel.org> <aOdZgyPJLsZ5IjBS@shikoro>
In-Reply-To: <aOdZgyPJLsZ5IjBS@shikoro>
From: Rob Herring <robh@kernel.org>
Date: Thu, 9 Oct 2025 07:41:55 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKLOF-zka5iuh60DFiqtYC23SX2ZH4z8H8iq75gq=szmw@mail.gmail.com>
X-Gm-Features: AS18NWA-QNJE7WtDzywh-WE_-Xda9MlREv8dk6BSHWSPEt_hGEz2b0IUc-sF2So
Message-ID: <CAL_JsqKLOF-zka5iuh60DFiqtYC23SX2ZH4z8H8iq75gq=szmw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: bus: renesas-bsc: allow additional properties
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-renesas-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 9, 2025 at 1:43=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Rob,
>
> > There's always examples not to follow...
>
> Sure. The good thing is that I could fix the bad examples, once I learnt
> how to do it properly.

Much appreciated.

> > The unit-address is the only part a bus schema should define. And there=
,
> > lowercase hex is standard unless you have distinct fields (e.g. chip
> > select and offset).
>
> Okay, so, the proper pattern is: ""^.*@[0-9a-f]+$"" which is what most
> busses are using. Will fix.

You can drop the '^.*' part. We have a mixture of both though...

Rob

