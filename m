Return-Path: <linux-renesas-soc+bounces-7556-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EF593D566
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 16:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D320D1F230D5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 14:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103E01CD16;
	Fri, 26 Jul 2024 14:54:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433A81DDD1;
	Fri, 26 Jul 2024 14:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722005679; cv=none; b=nxBLvEeLxP+UtMO60/+5d0dG8ZfN+XJ3MMqWCshxZuHUuCcKv2SicyhCF6oJfPnlDEMBLhovmbgK7qAGoL8VBMjbekZiV++IRY9hX5aqnYu+46YRk8GFFWeaeFzGzcOL7odl7JIeqfKRVTUXF9OV4I9GiaBDgqgKNvIfEb4jhgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722005679; c=relaxed/simple;
	bh=YW7aOyGxwGh+5XEZXOAyR5EmmVqVIsjrG2Fe/RWqAMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3sC6nCv/I9OoLBfklOTGlA/22dPjSTo8u4xIA3zwXHLlHPXxaqb9VDAsJdzhlI7MauIaW+AIQLdUJllRKMDVg8uLNPzVSkmk5TXd5n7Q0TkvHq3e4muqhSo4H13Zyp3JaWn1NC7tUVhse7PQyKUc3EnwLZlbYMjLDFzesgLmn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e0b111b59dfso2004340276.3;
        Fri, 26 Jul 2024 07:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722005675; x=1722610475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZBl3qZQJq0hNnNP2T29PmaD+J1EB5yPDQ0S8eS6mJQ=;
        b=pQzCdAzlPYqUDN5jKiIcaB2egwF68RNkPzCmHsFOq2pgxhbCShiaZR8HMMC0QL70Hk
         RoJb6052zmUkXM7hqr5MiBEVwcCJlmzDTljtusHzYnHocK3dxTN8xQX4jmu7QiaXV7Bf
         7FIYwdbwmp2z8kNyeqz4+wiLafUVv49kO6v2Fltzgf1QdjsglQ0zJKkZXQuwILIrAN7u
         0tXaBuWmCEb0rP7+56tkDB5l+yIu+wkJ3Y+hNP30f6fGqDOxKfBBYv6AxkRgHkjt+VzI
         dYMSGqrN0iZFkqfT5s7uGm6pbJBaPKMMDxlZ49f0SThqnJs9f0yeBdWD3yQF6aEWeNMR
         ci5A==
X-Forwarded-Encrypted: i=1; AJvYcCWp4DCvpDCMS94mY1DjK5Jlbuuxuh5mYxUhFO40DJQHyokZvSWwTvon+PfF42osmnT6ElwGXT+4tHBgMmiqhS7Mt4vhQ9I2AVBmS4G58jhMotnRNtZz0fyMBpd7FQ6m/f1gyNpWCQDqgRnLcRxmbyQrngIklDHVmH9uM22tZL5BMLdwMfpwK8db0j+ZdHLZbj03+rLU28fRtm/U2dXW5NDEeH1c2JVL
X-Gm-Message-State: AOJu0YwxRaRxgi6MCjlfjOlAZ/v+2FHc/lPwwNtuUQAgD1oWlFibQT/t
	fqa6BHIuQS41ShkllIYOQjPdSfFUpSIX99Fb1us7vkyYzSU+4pzrAVAaUx9bZf4=
X-Google-Smtp-Source: AGHT+IFnEGNm8pz1mhTjh3O8h3+vxo8ULamjLI3jGuGcx0GnWiYZfggREmpCeVnvpBaaEHzJoMXnjQ==
X-Received: by 2002:a05:690c:698c:b0:648:baba:542f with SMTP id 00721157ae682-67a0049f5f7mr1190647b3.0.1722005675299;
        Fri, 26 Jul 2024 07:54:35 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756b024a3fsm9176617b3.75.2024.07.26.07.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 07:54:35 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-67682149265so17118197b3.2;
        Fri, 26 Jul 2024 07:54:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhIxPIjhPA+NAeYipjphGIf9CaIIsPtSdbyvbCjN9qWtMQlHPZkpsN7H952xkkpKyLx19OhTl0E/sX34zgrWGi5P6fFR8m3eVhyO6ctBSu1u90MZIhtZu1wlCEJSpzt4l13eQVd2KjpoE1v3BMyBvpYaQRoODFQnTfqh6YFzll3g3mZ/ym4PPqnL4en2kR6SRQVy0uwFTT+qswXBLzOBThT779wv7Y
X-Received: by 2002:a0d:f886:0:b0:63c:aa2:829d with SMTP id
 00721157ae682-67a0a139c12mr200797b3.44.1722005674886; Fri, 26 Jul 2024
 07:54:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715125438.553688-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240715125438.553688-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240715125438.553688-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jul 2024 16:54:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3zhh0g8EsJ=-PHcsZV3wYQvppSKHaN3XynLdib3a7hA@mail.gmail.com>
Message-ID: <CAMuHMdX3zhh0g8EsJ=-PHcsZV3wYQvppSKHaN3XynLdib3a7hA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] clk: renesas: Add RZ/V2H(P) CPG driver
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 15, 2024 at 2:56=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add RZ/V2H(P) CPG driver.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v3->v4
> - Added a comment for core clocks
> - Made r9a09g057_mod_clks as __initconst
> - Made r9a09g057_resets as __initconst
> - Made r9a09g057_cpg_info as __initconst

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

