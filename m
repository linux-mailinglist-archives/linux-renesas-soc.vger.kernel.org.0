Return-Path: <linux-renesas-soc+bounces-27089-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7847ED3C133
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 08:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B72F0442B18
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 07:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A983B8D62;
	Tue, 20 Jan 2026 07:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LNi/4U+Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB343B8D59
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 07:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768895718; cv=none; b=YCIKkDoiRWp+WSs303/qvEuEzzjMjymhkNi3psne5NfBroZcXvq3rSXchGcNb0wO74L+MDRoyayRzhhkET9ZJcH1e6MlclQ7Lqp5MpFxE4gi9Fgvg8BTnYKj27aVI1k99b6rvJ+rtUwBuqf5emF5YiGqjWs6/3dRMC3MLw+5IdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768895718; c=relaxed/simple;
	bh=TMLsqINFJyrKXhaZG2FJM4ezyn4y9q99PGcQ/6K3rFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rYxii3F7W2fTbsOTa3BWQg5cVTNWdC77GLhj834h9A/m8igTkBGvOWhHaDklqgW9LNpT+AXJQpwRSbI5BeVJiNdeFrtJGDwP4TZu21dt4WtQMYUfHoxJ4FyVV7y75K4wRzDoLVdHqsjD76MNJRygKqvMQHUgYzyggpuFeinpafE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LNi/4U+Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0236C2BC86
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 07:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768895717;
	bh=TMLsqINFJyrKXhaZG2FJM4ezyn4y9q99PGcQ/6K3rFU=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=LNi/4U+YXla5CSde8B0UCcyl6TTmcg7RDk+rUCKE2Tuo5l8q54R2Lzu4cZkF3aPCP
	 36pRRmhzO4jcrstA4tyuI8kz9n4HRzKauNmo7obCQXKUfQtonJRC9aGSB+dwUPkfa4
	 rhKzNB0KpHv4miU2MlP0UTlPfcCP0+Ita2ZTdzVupQuQr6wB3vNMRXLfNzh49YgY4j
	 0JfNyf1/93p1u3C2IkqFcqNLVfkavlUVDKw2WrJKxCRzO0D7ieKLc0/S6ETJKm1frc
	 CMAFrWYGDFvoHaJE3MYihNWFCSzrEHgqXD/PqAdaFNNOwzzPZ/4DnjVdHAWy9oJdRR
	 AEjvSrMg/OQTQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3831c18b23bso39725181fa.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 23:55:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0FO2ZoSCnSxUFlmXTpNRJrU7/WTdDrHeBpDZ7GAuRBW5oQxW84mfQQYGucjTK6ndOgvtghrW1QrNagXyRcCip2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW6q9I9I9mlHyc38sGrd9IwdXtRXGFWzbeXcbofRYgicb3BNH/
	BbvGTENPMq9yZ/Wa5JtCISLYWSObvWiKpH9KP2eoFpGZz38bE9VcAo5Xdx3Zg69NIvYWmBgSSTM
	RzOR+jUfRv3eNBCHCWlY/BADqmhdY0Vk=
X-Received: by 2002:a05:651c:1443:b0:37b:97b7:a048 with SMTP id
 38308e7fff4ca-385a54354fbmr4917361fa.17.1768895716136; Mon, 19 Jan 2026
 23:55:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com> <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 20 Jan 2026 15:55:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v64uUhbEkB+iFjs5FGYR8E7=2nyNxDi646PmnygBZa6hQA@mail.gmail.com>
X-Gm-Features: AZwV_Qj3MBFPhHKAOhUS4trI6djFD2VyeTyhcWYMtPVh-frJE3FOzmJGjGidA8s
Message-ID: <CAGb2v64uUhbEkB+iFjs5FGYR8E7=2nyNxDi646PmnygBZa6hQA@mail.gmail.com>
Subject: Re: [PATCH 8/8] soc: sunxi: mbus: don't access of_root directly
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 6:40=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper functio=
ns
> to retrieve the relevant information.

I was somewhat expecting a matching change to the Kconfig to add
COMPILE_TEST to the "depends on" line.

But maybe the case is already hit with ARM=3Dy && USE_OF=3Dn ?

ChenYu

> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/soc/sunxi/sunxi_mbus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/sunxi/sunxi_mbus.c b/drivers/soc/sunxi/sunxi_mbu=
s.c
> index 1734da357ca21b249740e089698275507ea98a8a..8bc5f62ff258837d3f3b30cb8=
4b60d1872b31c27 100644
> --- a/drivers/soc/sunxi/sunxi_mbus.c
> +++ b/drivers/soc/sunxi/sunxi_mbus.c
> @@ -118,7 +118,7 @@ static const char * const sunxi_mbus_platforms[] __in=
itconst =3D {
>
>  static int __init sunxi_mbus_init(void)
>  {
> -       if (!of_device_compatible_match(of_root, sunxi_mbus_platforms))
> +       if (!of_machine_compatible_match(sunxi_mbus_platforms))
>                 return 0;
>
>         bus_register_notifier(&platform_bus_type, &sunxi_mbus_nb);
>
> --
> 2.47.3
>

