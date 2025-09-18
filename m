Return-Path: <linux-renesas-soc+bounces-21993-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03220B82A42
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 04:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41B9C724438
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 02:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701F423D7F2;
	Thu, 18 Sep 2025 02:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4IXSxTT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24C223ABBB
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Sep 2025 02:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758162103; cv=none; b=tFsC5WS3qPJmHtB0qqwMRWhjGcg27OoPdhOyKrF424TtzTrDV/+SRNv2e43h4XSA/asLG+Vb+FFLP4L+8XDDHj6GEWP6w9ciRPa51t59rsXJqyFAwdkia1YYwqCi6tkaU5cn1c6zW4w3AfukAGY90O53usdtiXXlj93yHz5jG9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758162103; c=relaxed/simple;
	bh=wYFDhqZMpWEiQYUOZ4bLOFJqYbrY+MzBsawXh0UrLjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dYFhXY+KGboQvB5kjRVpMTsOywGE3o1AvjlQSngtwRiFtGa6kR+GCtyfZcZbHjb3gMvJgnjxDVZ3tk6FytqMs8IKyIvIZmC8sCWPkAXpZTohCKpx8n1savALgEUl8ZY7mrrQTuN7h4KEgnX//vdmpnjx86G0EEL0E3ziMhuG0E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4IXSxTT; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-77d24db67e0so186755b3a.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Sep 2025 19:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758162101; x=1758766901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9AP4EHyPiENgOeGo6lnIyAQbYkHufakN6exnZUysaUA=;
        b=T4IXSxTTdXMv3OupRrPYN9LkPLjgKGEtjXIJLiUmcQGYz4zc9tjLO392ihK07IHkgN
         H/ZDjHmP3iwVPZlwBZq/aJkcHyT6dCIJ4rD2mip7PhIfyVVsN/PpFw4xp4XjMGuwA58j
         fgi+n4eOJ0BKjuHqazZ4dzWKF6lghGLpCo3x4lT6HDNHqwMV8Re/YPkbBJt/2wO5JvQ9
         Zl8WZqNKdkgIhJJXiCh0FybeOGDzzRYIB0vxoM1Uo1DL069KbFQyKyCDksnOFDwrPkKt
         sJg6gPQfmd6ZfPEuDLuS5vi1R5b2zW34MFtlXX6xsKib8H49nPIjzScJO2zK75TfuxCR
         D+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758162101; x=1758766901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9AP4EHyPiENgOeGo6lnIyAQbYkHufakN6exnZUysaUA=;
        b=o2wuYlAzR0CBD+0itVMUmJphKPGIzAVKNN1rZLNfmkCLSXIY6lo+vVtPl4ZFcFC72q
         SUcbjsQ+rkr8lptVR84JOkAeFSqE6AdZquMbhIn2ZHXuRjSzhKElSd/7wA0GJ7q1E07w
         JZGIxgU5O8MVNZFufIkWDbAEQmU+kO68kbfIFJtWIX18lMyE1b8zyRRvn5oj9pfAYBKU
         AzyZhhsBpF9T/CCdRfPLr4V/5Au3z1fLI75rcegEhAvXvpYknFWy8bjGDelDSnv15jEg
         /ACq+zW5CaN7vkzbHr/Xn/irQlVqqkCfohpJfkRY8J9EYr/xKyI+7/yS8jRvK71B3Hsr
         gAKg==
X-Forwarded-Encrypted: i=1; AJvYcCXyLkfCEgdPcQQHoa7owSfjLKpg9lnIYLtXbPVP7hqtaWkKMI7F5gONJr73sD0YJy41RJeScuzN7TBMypo/n/7Yzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YytVMQVZS5Y4jcUvysyOnABT40++UdR2gSDrKHWooreiwLrSLcy
	6ij/2gD8GvnKr7L5Qy3kPN889SxWJ3B/UCAHJAEk8BeBQlpbSKX0W/QtKqoJFeloA+/aWiUu6A5
	TFlODMJZwKT23qjapnAOlAzzRgqD6MKw=
X-Gm-Gg: ASbGncs03Yw1NHftKg6lynqMVMZgfioQaFXXVnGRqebCJzdw6AHvrNh3/HV1BB+kpVq
	TOxSt0Dol3UpFxTy8JTh2uwit3qOZlw+cgfqJb3/QLNdTNRIJi6x4PBaSlEbe70zqCGH3Jh/gwj
	WpxxxSyvL/thQlWlM24YfQ6VVwBN31dMcaVj90e1ApKFpsdsaIiShr/OMECLRPg3WgpnKF07coN
	MDaGthabVZQdMcXar0uryKeD2w=
X-Google-Smtp-Source: AGHT+IFNb+V//PSot2NdNe8uHywPWrpykUBYjIUlGCyD/yVXRRWQERUfDT3CjUAAlpnDFP1yuGL6Iyf8GhGufhzMKhs=
X-Received: by 2002:a05:6a20:2590:b0:24e:c235:d7ea with SMTP id
 adf61e73a8af0-27aa85b47fcmr6198309637.47.1758162101119; Wed, 17 Sep 2025
 19:21:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250917074812.4042797-1-kevin.tung.openbmc@gmail.com> <9bb9929a-8130-48da-983e-2901a7c3da36@lunn.ch>
In-Reply-To: <9bb9929a-8130-48da-983e-2901a7c3da36@lunn.ch>
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Thu, 18 Sep 2025 10:21:30 +0800
X-Gm-Features: AS18NWCtilTwOalEuEaTOVX5c4Y78vBcx4wNNE9JzBKwGJPsuMQ80m1HKt2v-vk
Message-ID: <CABh9gBew1=hbJvg1Mhg5dE7Lr_Z442_kbBX6zTs_6_C2NRyLbw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Add Meta (Facebook) Yosemite5 BMC (AST2600)
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2025 at 11:12=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> On Wed, Sep 17, 2025 at 03:48:08PM +0800, Kevin Tung wrote:
> > Summary:
> > Add device tree for the Meta (Facebook) Yosemite5 compute node,
> > based on the AST2600 BMC.
> >
> > The Yosemite5 platform provides monitoring of voltages, power,
> > temperatures, and other critical parameters across the motherboard,
> > CXL board, E1.S expansion board, and NIC components. The BMC also
> > logs relevant events and performs appropriate system actions in
> > response to abnormal conditions.
> >
> > Kevin Tung (2):
> >   dt-bindings: arm: aspeed: add Meta Yosemite5 board
> >   ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC
>
> The threading between your patches are broken? How did you send them?
> git send-email? b4 send?

Yes, the threading is broken. I initially used git send-email, but for
some reason, only the cover letter was sent. I then sent the remaining
dt-bindings and DTS patches separately as a follow-up.
>
>         Andrew

