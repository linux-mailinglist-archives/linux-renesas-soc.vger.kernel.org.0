Return-Path: <linux-renesas-soc+bounces-7190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD4992B155
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 09:40:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F4762823D6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 07:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E86113DBA2;
	Tue,  9 Jul 2024 07:40:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D9C13211E;
	Tue,  9 Jul 2024 07:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720510806; cv=none; b=irAH5T9TIQJSqEvMVtQBLJlx58VklT40uMPOH5Fp7p1xrgx91H8PGEdCiGgwePI4jO3lnx3LgvOwHGiuuKE4gKbdcmjYS7Tb8uegzKKULeK1lXK06SBmnf8JiafjjVWQgWBCd3Dml+UlC9pmUJ2TI8Fh4qluVj+2QU8gvh5JU8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720510806; c=relaxed/simple;
	bh=yi2daBkVk6MCt1wdZxZ/vwYALcm0EXFO/cs96sVKi+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gID7rPiFgrlQEhv/Uy6Of4CLY0bR6ysT8ejy3SocDm9H56DxARwMdO/Wa6lfxH9oYjzZCrGJwJ2e9chQ6QAsf2vJM3nMHGkjm1yeb4ll+XAxOpR2ryGFNOI5FPyLoLeQ/iG95dnZQQSUBU2bq24s3NZEAQQ0LJFyKNujKFkUQys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e03a17a50a9so4993427276.1;
        Tue, 09 Jul 2024 00:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720510803; x=1721115603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCNq9K8iVr0iw9+DRVp17LM3OY9eEw+ts1D+xWDdMyU=;
        b=BvVlAjl1Z1CPqTagLemQWk1Ldm22eqqQt76XaKEvZjpqI0gDEuiv3Qp4fM5XFhN86T
         wka3ryCrwjKgRokX2nbiPHIYdGImSvnyQk/a+Qk9+BMpVWQSJEcyh6OpoMQLPz8hESX8
         WQuOSOfj7z6+p1VENGssxqwmYv+58E9ZRAJPWebdj/fygByrgNadTIIRBb7WLpGNaueJ
         7OUUyElI716txtj0nmQAG0wSLz16m0T2EGcT0KHT+hrxaiIoHKBYEQUrXwH4Hib0q8J0
         p1zWCuGztgtfOhiGPzIRmjVLhMTbKy+Rrl37FsX0uaWmwLbn50MzSL5AeFlDBpMu3AUs
         x4sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuTPUm90rkzzsWxDy/uWvFqZwIUf38PpFqTabQJpcwLbWqwmro13wvry/kF5zHVFcyoRx5xkb5Z77e1iuYafQL4FHrNHV4Ld6WutGn4zON/0q3eGWofWbn1vCGqDh+JNTkLYq9RG51qTXkm3/+v5Q=
X-Gm-Message-State: AOJu0Yz0zYLzYgGRm2hTITSzseemgMWyhtZkWUts3Vcu/NMgYSLa3tLg
	/1Sfedg3wgRHRBf4v0VURNRptYLRBlFrSQpi3aoWyvIhbygVjMyONzehKCbCYYc=
X-Google-Smtp-Source: AGHT+IHo78IZzpIg/qYlodXe7valc3MjgNvBioFEHqU1i4V2T5eFKq3ZmvQUmM2CKq83RlUmqCLQbA==
X-Received: by 2002:a05:690c:3403:b0:631:2dc5:34ef with SMTP id 00721157ae682-658ee790bb1mr24493857b3.2.1720510802888;
        Tue, 09 Jul 2024 00:40:02 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e6fb6159sm2640447b3.137.2024.07.09.00.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 00:40:02 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-64b417e1511so45463797b3.3;
        Tue, 09 Jul 2024 00:40:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvee2UAP1aQPJXngHD1hMo/AGmHNnSTY0Ag5w/+rfIhnGhNETD6FpSi93Kq5PY0PXxBnXGatngBWtsTqyG26PkLbczFlKb46rA0uhVIcGlKssUNndAaX9EwYNlntTnCKttT2gn4M1iV0VyL0ZKgiE=
X-Received: by 2002:a0d:c8c2:0:b0:62f:4149:7604 with SMTP id
 00721157ae682-658ee790842mr20670797b3.4.1720510802394; Tue, 09 Jul 2024
 00:40:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1716985096.git.geert+renesas@glider.be>
In-Reply-To: <cover.1716985096.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Jul 2024 09:39:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWP7y=8rA5jszCbzh_RnXnv4tFUpHv0qtbucHEYRFE9qw@mail.gmail.com>
Message-ID: <CAMuHMdWP7y=8rA5jszCbzh_RnXnv4tFUpHv0qtbucHEYRFE9qw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] dt-bindings: timer: renesas,tmu: Add more SoC families
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 2:22=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> This patch series documents support for the Timer Unit (TMU) on the
> R-Mobile APE6 SoC, and on various SoCs from the RZ/G1 and R-Car Gen2
> families.
>
> Changes compared to v1:
>   - Add Acked-by, Reviewed-by.
>
> Thanks for your comments!
>
> Geert Uytterhoeven (3):
>   dt-bindings: timer: renesas,tmu: Add R-Mobile APE6 support
>   dt-bindings: timer: renesas,tmu: Add RZ/G1 support
>   dt-bindings: timer: renesas,tmu: Add R-Car Gen2 support
>
>  .../devicetree/bindings/timer/renesas,tmu.yaml       | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Gentle ping, as these are already in use in DTS since v6.10-rc1.
Thanks!

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

