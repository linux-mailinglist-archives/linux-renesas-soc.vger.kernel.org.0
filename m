Return-Path: <linux-renesas-soc+bounces-5424-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A118CB21F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2024 18:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B2D71F21894
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 May 2024 16:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F073E1CD1F;
	Tue, 21 May 2024 16:28:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3754C66
	for <linux-renesas-soc@vger.kernel.org>; Tue, 21 May 2024 16:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716308920; cv=none; b=BoWzGnNT20s8U8cN+e/XBdOPoh7qQvIKWF4tgJy8O+LGz1olKMFJ2/3+P7193eJOm9XZLjUDbSlY2L2+y6LcrtxIB4VdPXElv/y7E/McB8Iwh5+mO6ZkwwR+dRlxQXG3VYHt/rZrh36tWuO0ny1PfgjPjEtLbwXeebSKMMcMDhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716308920; c=relaxed/simple;
	bh=154KM+x4Nja/RiQpNOxEA9S3rerXJR9lOLYlQ7piwpE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=GU70j+tXMGr4FHZIKcsC51VR8OdpUyLMzE9XC9Wpaf2lUuVtUCl/IlBswdM7Q8+mul57dyr8HPyLrwgcsyaMAORrrAJBQcxXE6vzI1oIJriLcsb8r8M27iXdGDT2vG5Zna5HZ+EqwX9KCXI4yY2vXgXOV8VnJ+8LiyNbT4rbzQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-ddda842c399so3712816276.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 May 2024 09:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716308917; x=1716913717;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3ZEPLPB2S4JIgrMC0Ufy9mtSBnsPnGS+PDbxeRNCUc=;
        b=ktu0HPNETIzAR+MkCfAQ3ZYVERI3lm3M3j8FN8EQAMlIUPpKfGpjJsNRZFrLs2WtFZ
         TZlrXWYZFM59kWnGXxki1lQAfMo3pjvD09Xt2ffeqGaN276MpAuzwRhTGak64tEU6LJE
         6hcztwy/pLO9ZohsJx857RiM7Rq1L54zP6pp6dx9Hzd6YgmQSRXLbAvS9tOsvRgnZCrm
         XYWdMSgVSPhxt7VElUbpPXj2M8LIrcL9H/TIZs8uFz/H46p2loDdI8jQw2ztugxUl3Os
         RETDi8gb+cksR6FUpZgkobOmDRuU4S7oc52BDugOJaQWbR+7q6Nf1CAYlGDldfaNPIzd
         MT9w==
X-Gm-Message-State: AOJu0Yxaj9geUfYZRLqEGclIf8r/0ExtcAQ2IJGDKGx+l/Rc+OmEk6gV
	//9Pub23xXtsT7GQD6aVAiHPAFo/2kPHepZOhFtdWd1gteqG7ogwKVmijc0s
X-Google-Smtp-Source: AGHT+IEYov4lN+HwSx11WA0GkUTbmyuZS2TyWhHNur1KfpFBLL/GZaaKVbaErwa07wa0GpzvkXUGRg==
X-Received: by 2002:a25:ad21:0:b0:de6:151a:2813 with SMTP id 3f1490d57ef6-dee4f4c281emr41088657276.40.1716308916981;
        Tue, 21 May 2024 09:28:36 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-df4a4d93841sm957663276.27.2024.05.21.09.28.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 09:28:36 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-df4ada85a82so2712679276.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 May 2024 09:28:36 -0700 (PDT)
X-Received: by 2002:a25:ec03:0:b0:de5:9eb4:1ec1 with SMTP id
 3f1490d57ef6-dee4f4d9c2emr38873340276.48.1716308916128; Tue, 21 May 2024
 09:28:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1715956819.git.geert+renesas@glider.be> <2fe3c8e38b566de09e49056c62fa954ed306a497.1715956819.git.geert+renesas@glider.be>
In-Reply-To: <2fe3c8e38b566de09e49056c62fa954ed306a497.1715956819.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 May 2024 18:28:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWUNH07weDPdbxhJ7bDtvRhSeOftqm23HnVd35j+A2G8Q@mail.gmail.com>
Message-ID: <CAMuHMdWUNH07weDPdbxhJ7bDtvRhSeOftqm23HnVd35j+A2G8Q@mail.gmail.com>
Subject: Re: [PATCH/RFC 4/4] arm64: dts: renesas: gray-hawk-single: Add CAN-FD support
To: linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 4:57=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Enable CAN-FD channels 0 and 1 on the Gray Hawk Single development
> board:
>   - Channel 0 uses an NXP TJR1443AT CAN transceiver, which must be
>     enabled through a GPIO,
>   - Channel 1 uses a Microchip MCP2558FD-H/SN CAN transceiver, which
>     does not need explicit description.
>
> Inspired by a patch for Gray Hawk in the BSP by Duy Nguyen.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Changes compared to the BSP:
>   - Add can_clk,
>   - Add missing can_transceiver0,
>   - Keep channels 2 and 3 disabled,
>   - Preserve sort order.

> --- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts

> @@ -75,6 +82,24 @@ phy0: ethernet-phy@0 {
>         };
>  };
>
> +&can_clk {
> +       clock-frequency =3D <40000000>;
> +};
> +
> +&canfd {
> +       pinctrl-0 =3D <&canfd0_pins>, <&canfd1_pins>, <&can_clk_pins>;

This lacks

    pinctrl-names =3D "default";

(the BSP did have that, but it was badly indented, and accidentally
 removed while disabling channels 2 and 3).

Unfortunately adding the missing line doesn't help:

    ( sleep 1; cansend can1 '5A1#11.2233.44556677.88') & candump can0

doesn't do anything.

( sleep 1; cansend can0 '5A1#11.2233.44556677.88') & candump can1

triggers:

    rcar_canfd e6660000.can can0: bus-off

> +       status =3D "okay";
> +
> +       channel0 {
> +               status =3D "okay";
> +               phys =3D <&can_transceiver0>;
> +       };
> +
> +       channel1 {
> +               status =3D "okay";
> +       };
> +};

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

