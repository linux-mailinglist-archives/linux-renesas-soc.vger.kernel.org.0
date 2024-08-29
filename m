Return-Path: <linux-renesas-soc+bounces-8483-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BE99641D1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 12:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 559321F22016
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 10:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7113818FDAB;
	Thu, 29 Aug 2024 10:22:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B2618E75A;
	Thu, 29 Aug 2024 10:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724926932; cv=none; b=WAMhCC9w+5JeIIPXlsRTVDpYw5tyXKQQ+AEVMci3uLmVqEvUt/7bmVslX6MW/6T9SfyNCPKMj3DbBbEZWWUaQTxercc2J+FfszKInJeswI0qCFQ9E/NOHPGBRHngiY73LId8+ngNPHij6dSfdZc0T65aUIKUI4PB+7zPNyqXndk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724926932; c=relaxed/simple;
	bh=mxxzQWZfgZ32+twWj89CW548vDxQf8EC0zzzg9UaSNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b9KYlcIqzStX3+SNzKZP6VB6lhVeMtSOC5Aplt6sCa8+32R7sFzc7pj9f7Ia3m5tZawVs4DvzLIPXma1xFFPm+UfOT4oyB32XWHMymwJHFpQBJmnAwg+ckqZDmuODV4dOQzN4mLFndoiDVS3XvI5RQkF5qkAqOSgQX82stMgWG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e1651f48c31so525763276.0;
        Thu, 29 Aug 2024 03:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724926929; x=1725531729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dy/eI0Q3PUx3vxxIGNbAvRLE3QuQXFyslX3VdRYQ4/o=;
        b=v+tG9zWtHUv/CN5vI9oyV+Y6ejdB7/sCUliVKgBqaG+tS1UmnO/3iXJE33WWHrJL6i
         gkucVZ+OLQote6L/ICW5QUP7QYiS3DeW/vEA0cPOtTK5EIrnGuuCgeSRfcsKyR0RAfYI
         msvkmBhGgxI4IHTKARiTS74SFaxQeCLdRB9/0fMY5/04xq8ROabcYOe75hjNAoXd5keo
         a1e1pAMVXIhNxh7f55bNbfuIyv2GTJk/My67DRLUdCmmYy8OoXCEOV0Z5lwesqsOJjh6
         hRUsdlypWQOu4qLrx432kNtfF8eHmGPOLgP9NZwRBB4mqeYGPdoL3seEIcdJ7Smpy2T5
         0gGg==
X-Forwarded-Encrypted: i=1; AJvYcCVR6SuoZJrrengLiGOx1AnCdcxXKxtlfv1kyOl5DTRGDJZk9uPD3267XJEFevkfJXWX2QDJkTYIZjeeODV9UBP2AtE=@vger.kernel.org, AJvYcCWLIdFEjYFoArr7RA6lpWSkw4Fs5P6A2uX5hUsYl8nV4hThMB1nq9KrtGOa+x0RjEAoCJ87KbwHx6u4@vger.kernel.org, AJvYcCWX+QNhTrlmi9YT9od5clACaW3YpB35Xq4BFcPy4Z06bRhpKhsm9I1TyuqcSg+SniI5U1fLCFcTXtd/4n+p@vger.kernel.org
X-Gm-Message-State: AOJu0YxCrb10d3YBJRGN/GVZ840Y4mIwFTcMheUgTn43KJjyIrslv31Q
	lDdflxDUSEHpYx4mtXx1aHBddNxv6l0clN077bgGcmX6pc4O4F2PAnfsWyKG
X-Google-Smtp-Source: AGHT+IHftTh4BcNHEhmt9KR/wd50l47Hw7EY06C8nuoVDoywkQ/YK+ptOtCScktB16Co7a7AvDznSg==
X-Received: by 2002:a05:6902:18c5:b0:e16:19f7:96df with SMTP id 3f1490d57ef6-e1a5ab38cafmr2873035276.10.1724926928989;
        Thu, 29 Aug 2024 03:22:08 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1a6268329csm182643276.31.2024.08.29.03.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 03:22:08 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6b4412fac76so4550027b3.1;
        Thu, 29 Aug 2024 03:22:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvJvJ1fxfRqwIGCdeXa4KMsPdC2+Aw3V3uEzKCzXAfL+hBm9LXYfmgl+wLnMTiALH50Gqt+OXERxNeQ8FzCxHiJDg=@vger.kernel.org, AJvYcCWGCUVHz7w/vmpgYPTFj1q5nF1ZhDzeImcKChHxFT6mKX3H0J3FG93dW3oHRkx8Ohl+B3GsgT9+N4B1@vger.kernel.org, AJvYcCWzvXg71AjnOufcktdGFGljGQv9OjaeBMONuTnnyAjC7JvKVT3IsKYrP4qdMbTY5cmieF+LTI6JLXN5z8/j@vger.kernel.org
X-Received: by 2002:a05:690c:438e:b0:648:bca0:1e71 with SMTP id
 00721157ae682-6d277c6f47bmr17823907b3.35.1724926928634; Thu, 29 Aug 2024
 03:22:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240828124134.188864-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240828124134.188864-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 29 Aug 2024 12:21:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWJm2VQxZGVedc71UiRVsVsA2JMMik+NKp3hsRaSKMNRg@mail.gmail.com>
Message-ID: <CAMuHMdWJm2VQxZGVedc71UiRVsVsA2JMMik+NKp3hsRaSKMNRg@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] arm64: dts: renesas: Add initial SoC DTSI for
 RZ/V2H(P) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 2:41=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add initial SoC DTSI for Renesas RZ/V2H(P) ("R9A09G057") SoC, below are
> the list of blocks added:
> - EXT CLKs
> - 4X CA55
> - SCIF
> - PFC
> - CPG
> - SYS
> - GIC
> - ARMv8 Timer
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4
> - Sorted nodes by nodename
> - Used hexadecimal values for clocks and resets

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.12.

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

