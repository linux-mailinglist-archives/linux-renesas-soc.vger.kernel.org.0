Return-Path: <linux-renesas-soc+bounces-19035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4722DAF5977
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 15:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 769A51C4545A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 13:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46BE28506A;
	Wed,  2 Jul 2025 13:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ms85nqRC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEF7279DDE;
	Wed,  2 Jul 2025 13:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751463203; cv=none; b=VbZcrPJCZ41/3u1wNymKb2ZjyqWXX5Lz5K5QHQeqidkGzmB7IuX772vGCbAu71XBu15eg5Alhlw51KDCbHih+tr0V4m/fJ+pGR7RRZGrcsD/3gGsZ3naPMTTONPqXzaT8+ijyys9EqdBtDluE+kMKawf2EWri5CGIZoTvk+61Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751463203; c=relaxed/simple;
	bh=6ZJoXh0cEbCM4cZ27A/jrL3W/hqj2QTs5UxB4/NfNm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b2FKUJkuldfdxlqx9gl15h4EXxNCKjPOCx8iwy1QRI7wez2DwR+uMgSpklEpDzTltgFRTzn4bLkHAIfN0DVZSDR33yvBKXpvqtQPhevwqyPfniY/zaqJnG7kIDp4qHGIKRPXNUwcE0Zq3tJ4qTcwR1L83WBCEhxxQanQ1ne9yf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ms85nqRC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A28C4CEED;
	Wed,  2 Jul 2025 13:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751463203;
	bh=6ZJoXh0cEbCM4cZ27A/jrL3W/hqj2QTs5UxB4/NfNm4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ms85nqRCLJN5BiHidYWG3bgKo5L6H9uZl8jMwAcZ0YURgWPk36DCRFstSzTTrCg7W
	 +/kqCm4rqTCKbg+BqQOFIxIa/QBRJm36VLlqwZByR7evrTBAu2tDLgMlghDVnvwcu7
	 v5A+HIbIf+LRXtNDO5bbfBDqVU8xysMQ5v75kwtv9ZczpFAygzSJ84v0U5II4IBgzG
	 QPzapVeYIy9MAE+Zf20dpIIa46palkkkmfCl4SDlHGf3LJLyCiT5q7O+lf6U2XaY02
	 V3LUPnQz4WO7EwdVU0kelsvfyMI/f3gVPAGe3DkSlbzyfTg/x+rk8eC2VslL6XbF/e
	 WzTT4lgCS/SpQ==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad572ba1347so646291666b.1;
        Wed, 02 Jul 2025 06:33:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW9RJJSlYZsycHkJ7MBlw6oHA+alLmLZrhAdeQ6JkMihkw2MrMgx+sNE7iSkhsswe7oSlXEpRLJJCF7@vger.kernel.org, AJvYcCX1I3DaHEu3ze8bX4zfCb6gkZ4ikbSHZL1xO4J2Rja7FU9vwRiJQR6FfL0qX4cbOqNmmDvuXVQauLBEBx+qtPTCtnI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUE8Mn4f/ILL7u6tNyzs58E9Ex4nN+ekg//G46mfgoGV8N04in
	5xcfySQ538poPMXriHuOEBt3nksS9AE0aU4/lxg+THr9no79hf1bO1xmmJfMpsEg+ngT2YZJYWA
	G5VBRwqWGw/yvlNynwJ1qM1i/Vlls2Q==
X-Google-Smtp-Source: AGHT+IHlGTSeJ5v0vcxPyMmEC7gCCCHZoyL0aP/sMQBSe0nJEFY/JxxLRk6vi/2LnHhE1sbqb1/nvshVpFZ1le1D/Jw=
X-Received: by 2002:a17:907:dab:b0:ae0:b847:438 with SMTP id
 a640c23a62f3a-ae3c2b97e72mr300214366b.21.1751463201726; Wed, 02 Jul 2025
 06:33:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702085008.689727-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250702085008.689727-1-niklas.soderlund+renesas@ragnatech.se>
From: Rob Herring <robh@kernel.org>
Date: Wed, 2 Jul 2025 08:33:10 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLb3X84=+XAFDUoC9p5aZei99ZHLQ4qEoY_xsTA=PV4Ug@mail.gmail.com>
X-Gm-Features: Ac12FXwKkcJlLhyfbifTzZHSHaL4epyFJeTfhVscx1acUhYeXx18oOWVpxxXTk0
Message-ID: <CAL_JsqLb3X84=+XAFDUoC9p5aZei99ZHLQ4qEoY_xsTA=PV4Ug@mail.gmail.com>
Subject: Re: [PATCH] dtc: Demote graph_child_address checks to W=2
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Saravana Kannan <saravanak@google.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 3:50=E2=80=AFAM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
>
> The dtc graph_child_address check can't distinguish between bindings
> where there can only be a single endpoint, and cases where there can be
> multiple endpoints.
>
> In cases where the bindings allow for multiple endpoints but only one is
> described false warnings about unnecessary #address-cells/#size-cells
> can be generated, but only if the endpoint described have an address of
> 0 (A), for single endpoints with a non-zero address (B) no warnings are
> generated.
>
> A)
>     ports {
>         #address-cells =3D <1>;
>         #size-cells =3D <0>;
>
>         port@0 {
>             #address-cells =3D <1>;
>             #size-cells =3D <0>;
>
>             sourceA: endpoint@0 {
>                 reg =3D <0>
>             };
>         };
>     };
>
> B)
>     ports {
>         #address-cells =3D <1>;
>         #size-cells =3D <0>;
>
>         port@0 {
>             #address-cells =3D <1>;
>             #size-cells =3D <0>;
>
>             sourceB: endpoint@1 {
>                 reg =3D <1>
>             };
>         };
>     };
>
> The false warnings, and especially the confusion on why it only triggers
> for single endpoints where the address is 0, leads to confused user and
> reports of issues with DTS files. To try and mitigate this behavior by
> demote the check to W=3D2 and document the possibility for false warnings
> in the check itself.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> Hi,
>
> This solution was lightly hinted at [1] by Rob and I have ran with it
> for a while locally and I'm happy with the result. Lets see what the
> rest of you think.
>
> 1. https://lore.kernel.org/all/20250109150327.GA3352888-robh@kernel.org/
> ---
>  scripts/Makefile.dtbs | 6 +++---
>  scripts/dtc/checks.c  | 5 +++++

dtc changes have to go upstream first. I can drop this when applying.

Rob

