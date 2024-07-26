Return-Path: <linux-renesas-soc+bounces-7568-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D42A193D685
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 18:04:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78F941F24854
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 16:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253F25588B;
	Fri, 26 Jul 2024 16:04:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B841CD00;
	Fri, 26 Jul 2024 16:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722009842; cv=none; b=MrOrfNXA2bccm9UeO2gOuSvf6f6UGdjzGMjrGu0Ftc4YL9QITkBK6u/q8aPXE1NDkZNYNQMmr68Y4iYKzfZVgTfVLOpetStZamyqF7B2qgro0m+ezNbbTNLwGpQv77d0YZeBJSRV0Uplu/CwRXD5GkCMilsalzL1Qmw+TKJA1f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722009842; c=relaxed/simple;
	bh=RIUroloIALlecJt25OCpj/+tSdLmLmUNZKhH7Hh++M0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kIsWbDEAm8aTLyU6uPVXkPGbR17mKAfbvVnPj1D3U14JOv0svZ25f65+BN+ckNQ0AsHe/DaQwx5prVwo7l+i7WsvlAU+u4gksfiVIJmTIZUsRzxjQVCnIFdwE0+QufAfbjZJ8PxcfGbxqk39MPGPurARPrFaOXb5Yl7GWKIeQz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dfe43dca3bfso2245121276.0;
        Fri, 26 Jul 2024 09:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722009838; x=1722614638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rnrmsk4LAjav0+NDZkmFZGtCIbLnhTN3Oc8OLeZ+jtU=;
        b=TLr+TI7GQ9wV8Mrn7tF/K2YO14HZNpm8lgNFIs5HNiSPZg3wH8GrLtg5mSw7YTAkOR
         sD5cSE0lbo8Q+PyRfCGqn6w/gmfWZKzBgc6tJr20qY96AhbXnqnCbNkhF7xrrBbKtHSc
         qeXYvP97ZPUmOJI1/SFK49GQiiDUiVZz6r7ccfj2low9M8NUNhZdSquBYTT7XZVRQoOJ
         QvXcn3hfgowC9VkzLkGn13qqwy9CrDwHjSCe2USkMEJGaq9prCIWvj+OzFaciephHvmG
         F2Or90wH/pLet0ZHoS3LIIlTOPXQHFzjSigzBPiZjToxAXSAL2z2N4pYxAH7XPAyxmBc
         kYiw==
X-Forwarded-Encrypted: i=1; AJvYcCUydpO3jV65+TaPYxGlXaMPEneIDPHl5M0m6enrbwwZzF6i9Uy+c4lOo3F26vMgQGgbV9Xy8Taa2aPipUsoLN/LMAey+G8GBvl4l2ggDhwXyoxrxN2IxHa995W8mj8vKpYUT17iVYDuAO1osT77
X-Gm-Message-State: AOJu0YyZXqzS3+PBwGkloPxxE8FhHxncAFfLfbHTEEOgBm+dr1S//rRD
	r19cLXPpVNr+m34qMHZNiOxxFVux63XcfGlTOqqZZ3X9SQdINGMf6WPB3bXd
X-Google-Smtp-Source: AGHT+IFSK80htEuTJSoDUr4PPmxJx/gegdmlRYPb7NJ7+wHn86bFcCKAzPBWK80zJ7da/4XnVU8vAw==
X-Received: by 2002:a05:6902:1089:b0:e0b:4aa4:170f with SMTP id 3f1490d57ef6-e0b5460090amr283610276.40.1722009838467;
        Fri, 26 Jul 2024 09:03:58 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0b29f7ad81sm822789276.24.2024.07.26.09.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 09:03:56 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-65fe1239f12so19905947b3.0;
        Fri, 26 Jul 2024 09:03:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX38hTZ2orUdG+0uJIAvLnA4AyTZGjvdG8ctGRMI/M1q6PMbx3U2OkY8hqrfmVihn6cyvELQqsODQdg2kV1V+ECvRSpaxeVAOpHPf8VuoToolarS6h+rejyzXQ7RZGK4rRXfV/0GONJVYmJndmN
X-Received: by 2002:a05:690c:dd1:b0:644:b209:4de1 with SMTP id
 00721157ae682-67a050f3e25mr2849197b3.2.1722009834893; Fri, 26 Jul 2024
 09:03:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com> <20240709135152.185042-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240709135152.185042-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jul 2024 18:03:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUo_9j84ENEz2zupQnc922bA00XM9qxcisRSKhnZHYdNg@mail.gmail.com>
Message-ID: <CAMuHMdUo_9j84ENEz2zupQnc922bA00XM9qxcisRSKhnZHYdNg@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] dt-bindings: display: renesas,rzg2l-du: Document
 RZ/G2UL DU bindings
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 3:52=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
> Document DU found in RZ/G2UL SoC. The DU block is identical to RZ/G2L
> SoC, but has only DPI interface.
>
> While at it, add missing required property port@1 for RZ/G2L and RZ/V2L
> SoCs. Currently there is no user for the DPI interface and hence there
> won't be any ABI breakage for adding port@1 as required property for
> RZ/G2L and RZ/V2L SoCs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> v1->v2:
>  * Updated commit description related to non ABI breakage.
>  * Added Ack from Conor.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

