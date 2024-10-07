Return-Path: <linux-renesas-soc+bounces-9547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCECF99365A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 20:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62F771F2427C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 18:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4EE81DE2A0;
	Mon,  7 Oct 2024 18:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVkvfyso"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADE21DDC2A;
	Mon,  7 Oct 2024 18:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326294; cv=none; b=Jhtsbtl8RmbtTKBvtzRNVSrTDurX9ScLb7M56UaYbpiKHmZgRFBMzFmpLwk2jFJ4Wjkr7aT6h/FD1YiMmvShV2QqO8PJawXVSI8SLI7qJYs2MZ0rNKF45o9ALs+Cxxco0x8OZNVU59okYiyyPS9HCdTJbPiwGkVlwMuVQi4i6BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326294; c=relaxed/simple;
	bh=52KPk8znzZib/+veP1IO9/ycUwLZqHrSq4g/EwN9VIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TP9K+tVULT6TfSRptUrwHH8FpaxVsfwpr0n00n8PZbBmF0xB9XvYpIMQrIrH9R/jFaFAkMJEwQ0MG1FSqzQgiqebzfLZcwha/YI659/mBU6KyStAsjsNIN1O8sOto2YfCLRfS/7lFgYHLe3IzW9+Cv2hE+aDzpULm8PPWLdfE2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVkvfyso; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-50c8330c567so931282e0c.3;
        Mon, 07 Oct 2024 11:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728326292; x=1728931092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lic5cQ9l4QOyHrIwAQJ/yh7Fa4GXpkdg5ATWQa1vS7w=;
        b=mVkvfysoV3496BwzcaLvqhxv68+Zung9gbqY3g7M7zocz1Ht67llchazZGfwhkjJpx
         OHACM0NMINVlOGrQbaQahxQFIUPuWtVJll/HocFXRkgtDdqHx1EraXXu4EDS9mNf8l6N
         6pZxtHLphWK/aRrzzuuEpmg8HQUj31WhmUd4KJim+MjjDNXU91T/9GVjzqqRmmUAAtIn
         eHo+p6WGSAMALSt6c/ggS72B0QTEZGxbWVixtXohulFK0E6tkV8NLT+BQVs4lmrEOcUP
         Zy3YUWu+MDAFN8oYXYSeGLSzaS5k6RbbUEpOEHzqQLa0MtrPxHc4FqqqJ6uoycDRGpdr
         Ir7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728326292; x=1728931092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lic5cQ9l4QOyHrIwAQJ/yh7Fa4GXpkdg5ATWQa1vS7w=;
        b=hxAYoBQjsDfARDPc627gVkk+l0dwN2FDxElum2mMotRnBB4yPN9q2C4Z6sOS+Yu9KJ
         ysIsxdsRK0qN7fkTaQZSV/3ftOhdrr5a2sB2BgIYMmcLtcEpvCYI8dQJEtFZP3TLM/+Z
         D5wvp9eFihlWrz/FVvut26TiDtn+t3eJG9C9oVpDebTJDMJR7hSbbrS9FwHHHkEj9dpb
         7FWsMERDi4/CgiyqudawcCSe089sgbquR2FvYXRx4Djdv4IYLnNO0A8QyycHO5gODAU0
         Vq+Dw/OOz1Hj23YGmVsR1jHV8JNm7NEi1lBjgMlpg5jRXj7e/W86IXYvVrSjThTxfQH5
         q58Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJLjkQdlfxFiKiSEeFcEwSKHQJTvw36gNFikK2UcZhpR5HfXwIKjkXZIFYsJJaJNpbCP85VTFDaNnx@vger.kernel.org, AJvYcCX1e16GUAZ99pvW4snZs6LV4NHEMExka7ySj33t4xV1TT0Uy+z4if8cZB2G1j6HULbpJBFRT7YzcBf2zVWFIj+jLOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXGJzOXv4tIW5Szkr3bLAb+30092bedlZEYwcv+fh83qHT4BIh
	v4NMN7DvUAMAgwEv3M23pJ2tPQWhvY/lzmtIunO6pZKLEEGjs9a11LE8FtTpaUQXRb16EBB8bY4
	okYcHVAiVxCK+AI3BuDwAnMqQm28=
X-Google-Smtp-Source: AGHT+IHZBgLbmAutqQc9Izz4VkAA56rjGPH/gKeRbHapDyvhBeSLyJlUbes8PdoWHAeq1+4n036c63rTw/Z/so/S2AQ=
X-Received: by 2002:a05:6122:1da6:b0:50a:76c9:1bb with SMTP id
 71dfb90a1353d-50c85593f4cmr7431676e0c.11.1728326292106; Mon, 07 Oct 2024
 11:38:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728045620.git.geert+renesas@glider.be> <c1ee39ab194f1d04d56af6804fd9e7632710154f.1728045620.git.geert+renesas@glider.be>
In-Reply-To: <c1ee39ab194f1d04d56af6804fd9e7632710154f.1728045620.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Oct 2024 19:37:46 +0100
Message-ID: <CA+V-a8sDakaLVGt1CnFSeprqQe6Y9j8S78n1uFJ__OEyrGsOBA@mail.gmail.com>
Subject: Re: [PATCH 19/20] arm64: dts: renesas: beacon-renesom: Use
 interrupts-extended for touchscreen
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 2:30=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Use the more concise interrupts-extended property to fully describe the
> interrupt.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
Reviewed-by:  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/=
arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> index fd1dd2875644dd60..729d165f909a5257 100644
> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> @@ -440,8 +440,7 @@ wm8962_endpoint: endpoint {
>         touchscreen@26 {
>                 compatible =3D "ilitek,ili2117";
>                 reg =3D <0x26>;
> -               interrupt-parent =3D <&gpio5>;
> -               interrupts =3D <9 IRQ_TYPE_EDGE_RISING>;
> +               interrupts-extended =3D <&gpio5 9 IRQ_TYPE_EDGE_RISING>;
>                 wakeup-source;
>         };
>
> --
> 2.34.1
>
>

