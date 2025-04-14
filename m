Return-Path: <linux-renesas-soc+bounces-15915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A81BA881B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 15:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 888803B90CB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 13:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70662D3A68;
	Mon, 14 Apr 2025 13:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcZ34JlD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066942904
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Apr 2025 13:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744636842; cv=none; b=qSb9OGVl5hoCPIWJldFyK68C7YrpDAjiJtfaWqgtIR7Wp9PkKGlU8wS45hGApTevtrhO45TgCbO07JyG6kaxYPPPg4Rd0thKNKTClltWJEivCGrp1OXIhydouLEIpClNCWgphYA0c6hipGS7k6fyLeXE4DM76c4PqGafBbeQlEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744636842; c=relaxed/simple;
	bh=0DW9P2vkOqYuAIYCGGAHkspI/XNgtSr6CdG2rxbknBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fJXfjGON3xwC16QmR8E4Rs+vvDl/RpfrGpWZW83nqS30RDLmyBGW70VcUZKGfgGF/NVP2ZjL3hHmDgMA1z74YQAzmwpH+sAIU4M3t7y9GsQ8RUzp9o38Zhq/ZTJV914/OQz9HFzR/84v8XrAs92NFMxuwgJ7fYb5n4ZcUlI+sh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcZ34JlD; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-528ce9730cfso412917e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Apr 2025 06:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744636840; x=1745241640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faWGYrDVXBsVmnyYGCMogPW7h+P44xazLnFIajasJjI=;
        b=gcZ34JlD7hBVwIpeBzwQDC7od9HJaJ/1EgkQCp9LTozxx1HVZYKPNwDwMY1im8Ku0I
         SZTKTv0+7d/SCnLJtIMoAg/YsPx2UEZ95Mz4FuuiP9P7TDVxalZsBK4Ig7OCcpuw1ZHU
         XKVLgEAfq2ckx4Lq2gDGjonbeQOuPmUwUPJ9wzI9m56CVwP8a50LWJKty6x1PHhULkqO
         QD14bSbYfL/mqJO4vwWMaLrQI55MzhDz7JWvT4LM8UkKeLD/+K4nxcG8kJRtuSWYSVXT
         oE5zz4RbC1p5OIjE5TQ8nND/4ejqGNghbZmPL+1b+lNAQQ570dGqv7IveJbKtFu08+lK
         1bNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744636840; x=1745241640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=faWGYrDVXBsVmnyYGCMogPW7h+P44xazLnFIajasJjI=;
        b=fVvADCwKvgFbtPVK+e7HhIN0IQYCW+2RuqqH9adOeokexo7K25NdN9PdXZHYVchQ6i
         +RGscYkplPaTjfwTb9QD0fCXHG8jPgVu+7QouMGXXeB5kT2b/nIISFn62iNDSmzSLazH
         VU+phxOiMOVtWOEtd1NIQidBLDnE3SVCmkoQiLtufQvF5ZRAhLZbWwd5ed6iiMhi0ZUz
         /87Ve+5cFDziduGUcziMHOkOZ7xlXddZ8B83Zx29nSo0bqRZ6aXzG5bgdkIvCQ83KuLS
         ypJWbz1c+0VaP1n+C53taubnuFrXa+rn3/kJ39It/bJWZbIaUQMhvykBrjvpzkeJGDEA
         0sPw==
X-Forwarded-Encrypted: i=1; AJvYcCVCDkXL/IRej0aDvEZ0ZIfKt6xlKWMiDJA8tM5pVWrNALEy7kToUFVq1ZF7ddqNrA5O+IIvZWVuGq5unK4liLFq4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdj720UTssYKjDDIuN40Hsdfef14xZgUOQ984wZX8ME44L9hdM
	O7LP7BxtqQxKy8tdYMRdW3iQcq5QAe6fHTiNMDu1BmwY3W7wnkNz+c/NFBCAOKErePajz1HQs1O
	4PRu5K+SUtGYyQmzHCx7UHCzAVrdOlLfSscE=
X-Gm-Gg: ASbGnctmDzenWK3K1duQjUI5y/hb0zAkK+PvML3MjQ9yBhO28FAek+wpAsoHubXyKsV
	YqCEbGTBshEHWeYvfh16oXEZ+V2yHYWEMpKowT0JavUO+gSLbS0cMKml9KNach0Dj3PjywON++1
	QezlY7nxpbkDsZoVXD5FinQA==
X-Google-Smtp-Source: AGHT+IF9LuPxVbvTbgQKi9Gw7S2lDQmad+UWe2QbZnsnxWMUHyrYbB2cJ69p0RrgSgPD/aG4OtGDwQo9KA/RqbXeNr8=
X-Received: by 2002:a05:6122:da7:b0:526:483:95fd with SMTP id
 71dfb90a1353d-527c3604e12mr6713946e0c.10.1744636839659; Mon, 14 Apr 2025
 06:20:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b76439632baf86289dea00ff6b2e3ac69251cebc.1744203849.git.geert+renesas@glider.be>
In-Reply-To: <b76439632baf86289dea00ff6b2e3ac69251cebc.1744203849.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 14 Apr 2025 14:20:13 +0100
X-Gm-Features: ATxdqUFnpZqJjCDuFxl0aXy1m-l6qtZvLFwtQavAPcOKUF12G1ml9CUVdWe7_H8
Message-ID: <CA+V-a8u+F_H8dZZSj+5HTkBi3ntW6GNq5P0r=yKPz8zB+zRrfQ@mail.gmail.com>
Subject: Re: [PATCH/LOCAL] arm64: renesas: defconfig: Remove individual
 Renesas SoC entries
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 2:08=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Remove explicit entries for individual Renesas SoCs from the defconfig
> file.  Since all Renesas SoCs are enabled by default when ARCH_RENESAS
> is selected, and ARCH_RENESAS is already enabled in the defconfig,
> listing them separately is redundant.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Not intended for upstream merge.
> To be applied to the topic/renesas-defconfig branch.
> ---
>  arch/arm64/configs/renesas_defconfig | 23 -----------------------
>  1 file changed, 23 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/re=
nesas_defconfig
> index 54face65d831129a..c6e1fa75134a482b 100644
> --- a/arch/arm64/configs/renesas_defconfig
> +++ b/arch/arm64/configs/renesas_defconfig
> @@ -382,29 +382,6 @@ CONFIG_HWSPINLOCK=3Dy
>  # CONFIG_ARM64_ERRATUM_858921 is not set
>  CONFIG_RENESAS_OSTM=3Dy
>  CONFIG_MAILBOX=3Dy
> -CONFIG_ARCH_R8A77995=3Dy
> -CONFIG_ARCH_R8A77990=3Dy
> -CONFIG_ARCH_R8A77951=3Dy
> -CONFIG_ARCH_R8A77965=3Dy
> -CONFIG_ARCH_R8A77960=3Dy
> -CONFIG_ARCH_R8A77961=3Dy
> -CONFIG_ARCH_R8A779F0=3Dy
> -CONFIG_ARCH_R8A77980=3Dy
> -CONFIG_ARCH_R8A77970=3Dy
> -CONFIG_ARCH_R8A779A0=3Dy
> -CONFIG_ARCH_R8A779G0=3Dy
> -CONFIG_ARCH_R8A779H0=3Dy
> -CONFIG_ARCH_R8A774C0=3Dy
> -CONFIG_ARCH_R8A774E1=3Dy
> -CONFIG_ARCH_R8A774A1=3Dy
> -CONFIG_ARCH_R8A774B1=3Dy
> -CONFIG_ARCH_R9A07G043=3Dy
> -CONFIG_ARCH_R9A07G044=3Dy
> -CONFIG_ARCH_R9A07G054=3Dy
> -CONFIG_ARCH_R9A08G045=3Dy
> -CONFIG_ARCH_R9A09G011=3Dy
> -CONFIG_ARCH_R9A09G047=3Dy
> -CONFIG_ARCH_R9A09G057=3Dy
>  CONFIG_EXTCON_USB_GPIO=3Dy
>  CONFIG_MEMORY=3Dy
>  CONFIG_RENESAS_RPCIF=3Dy
> --
> 2.43.0
>
>

