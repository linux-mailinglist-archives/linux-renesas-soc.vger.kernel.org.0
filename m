Return-Path: <linux-renesas-soc+bounces-19953-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2FBB19D38
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 10:03:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 016091619C4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Aug 2025 08:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A1902309B3;
	Mon,  4 Aug 2025 08:03:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A453F17D346;
	Mon,  4 Aug 2025 08:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754294616; cv=none; b=Kr438tovkoDBB++nPESN1ieY9IaF8h3lUtmX0KxS3tYo/LPntNZVnWRN+qHGHlKY+aTqTRv0w1mrjaWbM95XPIN8voe5j38LNlTD51mvBUvhDp1KUqUCMLqFL85shaGjzHkGV734bipWBsKBAAYlODDd9SEEbnc9zMkvRmvAaAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754294616; c=relaxed/simple;
	bh=tJyci0TQwLDQu1/EiGuK1L3QnCHROh64+v6nVe5I65g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JzMAc/fv7S/uT5VYOhahd6h24MkAtTVUQWHIEd4xpY/6hS6cYFlIWRoUErtw0EXuZlySe68XXdCdjEY8vF40BAYQp6IkI91xK2Fgg2FiaVw4RItpCCgG/2UcdsF0RAMoYZcm6YGtejgkTnthfhaeL47+Hw3y/rn5QKN19z4Y23s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5393aa6c5d4so2223676e0c.1;
        Mon, 04 Aug 2025 01:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754294613; x=1754899413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcknNWKp+brO13pk7sFZJ6VuBFTu4cSmWAzgREGC2O0=;
        b=XikPx5/WjAyCONMwYxtjEbYoJVC6760zusiQmfGN0K8vYHrYwSKUGCvOJrUfWZxoQk
         fZK5W5iWQka5deS6PRelki/UYXgwDeZo5aT3PqtCpAz7qQ9DszhSGQwzuRJs9Iwragzw
         Fh0MxdYpUyuMcYER6bIm/detMuEVvPuCabsd2c2TWVuU7QZaPssGTnTNo2rXO3HBjYRG
         iOlQUfSrrKMNXThIFenx0Tzz4HDYCeyDBq4ebr13/gHXk4KSEgCa3uIcbjXL6lHGtxus
         1NPGO8EPBMIpacj2deTVK8doLM1cySSCdaT7TbbnGAZTKOgrMRiB7l9KPtBHo9nUgXxO
         UCrw==
X-Forwarded-Encrypted: i=1; AJvYcCUDdrBtfbh0W87KHkrzCSUsIbdHxA/nHlsP4elFXeBjFtckEKFRU3gaC0HEm4FpNMgkHUpuR1Vx3HQt5WsNJTYCu9U=@vger.kernel.org, AJvYcCVIG4eOH8jlbw8J2PHLu2v5ig8YEPZfO6t5LUBWYB7gmMyip8xAnOfFDZx2MZEkoQv0Pn5mhV/pJQgl@vger.kernel.org, AJvYcCXtP3PSq4/YKfg4wQgUiHrHzfTIEgf2EHvINW/uj/57PGj440Vv8M0JDhMYFtcYvhHJaP4Q2bqlRDdUrB2a@vger.kernel.org
X-Gm-Message-State: AOJu0YwJxJcJXiMjt8AHNCKO951YPe12CKwyqslPqCAxl6lL2USIeyqj
	H+Bm6ZKIlmJHUvIbrJlbfQLH5Qc4jHb+mAhPx3Z5GqfdRsil3+vV+4Imdv6nqanu
X-Gm-Gg: ASbGnctM20SCbHg2v9mb8zmYrue7dTz37iPKQ6Utej88NMxR0hIgseI1rin0sPwdqCH
	SCJ9UsFIQDqYWBsKQFFrz94og3eK6tLRQo+s6z4ilRyT6T15Qd5iHItuSNjhr4Gn5MD+8lKXUj0
	FfT4X7uO+WMp+tiMy2j+koq0f52ISozsDkxYNmFauNOuf8RneS8PF+Ig5Jj5/KcHsSgN552ScCv
	6kgii8DaLctmZ4YfL8Y9c3SX0f0eW1b3JaYgDnWAlxPMdm25/ckDP+gpvq9sZMdp/Rl7D47OPJm
	jkO6iZenQmRrI/6BsTtEcTv9UYMD0ZxW32LEDM+Ki67G3vYbh/D1UJbPfyHi6T0hG+CDHycVELz
	Vd3QYP5k7X4MO0yrl2RKw+Ms6ML7kI7gO+9t0FBEFrcf8JTi12wpyqHQ2wVieZNNL
X-Google-Smtp-Source: AGHT+IGGVOWlqemPJ+hajVq84TBx8e8R8ijNGo2h5VMTL/JgpqWZEodJ/W7Ne8X3zOug0FBlNxHXrg==
X-Received: by 2002:a05:6122:c84:b0:537:765c:b31 with SMTP id 71dfb90a1353d-5395f10dfcamr3411874e0c.3.1754294613215;
        Mon, 04 Aug 2025 01:03:33 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53936b980aesm2633640e0c.13.2025.08.04.01.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 01:03:32 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-52d9a275c27so1482898e0c.0;
        Mon, 04 Aug 2025 01:03:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUu9Bqq2XbLRuzWSGXumE1WjkFmN4L3sSXAjTf3a+FX34LZRTScG46KinGk/cqli6nySvKJbgbHAp1UXR6t@vger.kernel.org, AJvYcCX3tsh4GKy4A5G+ZCA4DOJ35+qUET+3v/DPQAXtr0UokoKygEtifowblUpvHuRnRV0G1lumxJPQ8iGrVKmjkZMz90Q=@vger.kernel.org, AJvYcCXHXBNQkcqqJm5HPQn1zIChv+IpL6rLIMHeCiOLC2tQl0tEYDgNxzdHhYe7pAYMqZLRdLyYRDqTTMe5@vger.kernel.org
X-Received: by 2002:a05:6122:1821:b0:539:46e5:cfba with SMTP id
 71dfb90a1353d-5395f32b336mr3106817e0c.7.1754294612271; Mon, 04 Aug 2025
 01:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801121959.267424-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250801121959.267424-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 4 Aug 2025 10:03:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUzKFEjtft1krg=275yTdzE1v+c1VrvN5BmsLtes6LKuw@mail.gmail.com>
X-Gm-Features: Ac12FXwWFgHzoscci9HjkYPO5MpVyl5pXju-934o0-1vBYPrkKWL87nBskNm-2w
Message-ID: <CAMuHMdUzKFEjtft1krg=275yTdzE1v+c1VrvN5BmsLtes6LKuw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: rzg2lc-smarc: Disable CAN-FD channel0
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

Thanks for your patch!

On Fri, 1 Aug 2025 at 14:20, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> On RZ/G2LC SMARC EVK, CAN-FD channel0 is not populated and channel0 is
> a required property. Currently we are deleting a wrong node. Fixing the

s/wrong/nonexistent/

> wrong node invoked dtb warning message. Disable CAN-FD channel0 instead
> of deleting the node.
>
> Fixes: 46da632734a5 ("arm64: dts: renesas: rzg2lc-smarc: Enable CANFD channel 1")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Updated the commit header and description.
>  * Fixed the bot warning by disabling the channel instead of deleting it.
> ---
>  arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
> index 345b779e4f60..0d357516e0be 100644
> --- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
> @@ -48,7 +48,9 @@ sound_card {
>  #if (SW_SCIF_CAN || SW_RSPI_CAN)
>  &canfd {
>         pinctrl-0 = <&can1_pins>;
> -       /delete-node/ channel@0;

Please insert a blank line between properties and nodes.

> +       channel0 {
> +               status = "disabled";
> +       };
>  };
>  #else
>  &canfd {

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.18 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

