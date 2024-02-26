Return-Path: <linux-renesas-soc+bounces-3172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 162698674C9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 13:25:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47F0D1C21889
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 12:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73645604AE;
	Mon, 26 Feb 2024 12:25:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4F35FDB5;
	Mon, 26 Feb 2024 12:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708950345; cv=none; b=nkxDGJSoKHj26llC1E3X46FFWvcJI+KkH3m/tT6e/0QIEgi71QwSlYEJZ0ZYSY9XoVzSLPXOqNPEGAHOKUbHEmNxku+3b8OIw0R0uBiad9dSdtY/I5hzMcMcLubS8mCDEBQOSMCuLgjMamDzvgXAbb4wiIrDGymRRUAzFOioGzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708950345; c=relaxed/simple;
	bh=Wcusuh+lWuagiIH3bqpP54T63/KX8yQIAxdsoq1Okoo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NFRooT6S3kpBJxHgzqB+3sWUmeuvg17JnnIdJQmxdTLljUCpcxRlDiSLvubnK9UBE0OF0XOwy54fNOTxjSNuU+A7dFKyxLmRLQFfOZDISIX/ebLafPOeYKFzYBzPwew+KN3N+GHLe/aqJGVnKbfqHxH03n4OV7VXd/UVdtK8zN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-608cf2e08f9so21348617b3.0;
        Mon, 26 Feb 2024 04:25:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708950342; x=1709555142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3T2uTlXB3ExY2DfXdBhbP4rbR8Cm76B7jSqV3u5yWQ=;
        b=prXlz/8INbo84GY2I0bsWm3JYwIyni7L9a3CL7Pyfl9EsCDgDIHCb1NkAYSjrr9Tef
         CFv0m7B36F1s381HK0qtcNzAaU/4kMbHZQyom9OaHwFDsW6ln8XWBEzyzaBQvM6ZLqH5
         lNZK8gYjWXMz7mISdBso5v1NFYS5V6QsRm5JZsDLW0J/5FcSlHPdIVuMt2nUp4TVbhAR
         WHIEXTFCvbrGZ3+eSUTlznK3oTqfeI+Z9zgBTVykTtudfYIUVdTkWQII9oULZXR2po6E
         bF8YHVo5HBHTYaOvu06QbyrvWq4yc6B64hMDjYYAXuk64v+bGYs/sozEXNA0vKJX7z2S
         9ybw==
X-Forwarded-Encrypted: i=1; AJvYcCVmNhMzzAyHCmgEIsa2Rd2Pw9NIfAKZca4/4Rx0J5Dw7L5h++S8TpWPSA61lmJIM20gSYuCvVrV0Y1GlQJXlvyswZnha2ZXESZprw==
X-Gm-Message-State: AOJu0YzZg2acUrcFlZjlvLnLEck3Why8t+6ue+SRMpMCgMYy6uh+A12/
	pbj/fuotW/tFuBGGiGF6a+EpeW5R7msjMxvjN/fTWs3yYZxtSANLWjgBg7ffdKU=
X-Google-Smtp-Source: AGHT+IE1gDIsJ1U5D443MMtFoEHHEzHvH/0fEyD8HbVzWqGT2rOXL0m9Zg+x5UnmQfwYAb23MKl1EQ==
X-Received: by 2002:a81:4cd0:0:b0:608:7af2:f5f5 with SMTP id z199-20020a814cd0000000b006087af2f5f5mr5551308ywa.50.1708950342517;
        Mon, 26 Feb 2024 04:25:42 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id x198-20020a81a0cf000000b0060483b63a1asm1151351ywg.47.2024.02.26.04.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 04:25:42 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dcc84ae94c1so2703381276.1;
        Mon, 26 Feb 2024 04:25:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWgSsxA3ZsfHfhtG1l08L5qdLlv71IyAPa21mjkeIU1BJsGfAWJxzi9MuwSUdFvfJW5Qk1f0dlYyh4RS0cASQgT5/Xh1m7G4E+xWA==
X-Received: by 2002:a05:6902:98f:b0:dcb:f7b0:4788 with SMTP id
 bv15-20020a056902098f00b00dcbf7b04788mr4904378ybb.60.1708950342152; Mon, 26
 Feb 2024 04:25:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240224191902.2065733-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240224191902.2065733-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Feb 2024 13:25:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7zWG8_CtjYstR=r1DHCds1vMx4=2qfjMfHb2efjsqnA@mail.gmail.com>
Message-ID: <CAMuHMdW7zWG8_CtjYstR=r1DHCds1vMx4=2qfjMfHb2efjsqnA@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: eagle: Add capture overlay for
 function expansion board
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 24, 2024 at 8:19=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The Eagle board supports an optional "Function expansion board". The
> expansion board adds support for HDMI OUT, HDMI capture from two
> different sources and eMMC.
>
> This change only adds support for the two HDMI capture sources.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v1
> - The board is named "Function expansion board", update all references.
> - Rename the over lay to r8a77970-eagle-function-expansion.dtso.
> - Add r8a77970-eagle-expansion.dtbo to dtb-$(CONFIG_ARCH_R8A77970) so
>   it's considered for installation.
> - Move #include statements below /.../; markers.
> - Sort nodes without addresses in alphabetical order.
> - Capitalize i2c -> I2C in comments.
> - Use symbolic values for GPIO flags.
> - Adjust gpios and output-{low,high} to match that the signal is
>   active-low.
> - Correct misspelled label and removed unneeded ones.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.10.

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

