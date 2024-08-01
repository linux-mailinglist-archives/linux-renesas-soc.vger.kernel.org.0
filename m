Return-Path: <linux-renesas-soc+bounces-7690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFE4944F5B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 17:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A8AA28D530
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Aug 2024 15:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465AA1B0106;
	Thu,  1 Aug 2024 15:33:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986DF1EB4AF;
	Thu,  1 Aug 2024 15:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722526394; cv=none; b=Rb7fwKST+PslPMekQt+I0S9IHn27owjKKEaNCj8OeS4h22/UuTy9h3kjfaZswa+H3PtuDsyaYFAoQ1qcMJfHv50c2pPLa6PlNX4kQddIjeSSy106nUi90Q4Yz0YdhFFGCsNSC1lVyWP0c2e7X0+MCORAA4t/SxrQXMC0sdt9K3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722526394; c=relaxed/simple;
	bh=ALuVp1XuOJ+btarC4mZoyADJuP73V8cR8m5gUJn4ICs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bs+4BgCbGr/sG6WjFaNP7Lfxv76+iKoDrNgMI++IdFOIhJ/5ZeJXRljhlO4fJx7AAFjC73bkdxE5F7/aO3I0jHpDYDnbeSHxqg8qCLDtQBVdm/MBQkqMcSdnIqyfE88+0v7lFuVK9vK0Dw6w+Zg6CoPRAvad2U+qZtzKfBJp4qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-664ccd158b0so56800537b3.1;
        Thu, 01 Aug 2024 08:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722526391; x=1723131191;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8WyyG16LV2GeKXms2sifT6MWIRdXMxgL5PDJsZdGCk=;
        b=oUYS0boyqu8n72bYJ6SOKf9iGfRb0qTnmzjIdZTCcJXAVxGxdrOkQfHllHdw7MSroV
         uRBpdSQayQsFvAW+o9LwvPLssEZqeX9O5+oVIKDavUxKBhkieRf/f9+TJuNKYr5khTIK
         rUnixGFxCUeqzwGa8ktGp/oPP9CDFdGtfrtL3uFSBhQm2Weodqe9SfB4/kdCwiQ/v6jw
         DGKgTf5sWSwBENBasR5Xi/NMOk+yYnFU4biiFOIkuiy2JGHxoE4YGtNnkIowr4AsCz9a
         nuBTVMERc6biizq/+MO6rgUGXggIx+EOhemHku0sbC7AxV90MbTC/YniJZHumW6e3JBN
         piAg==
X-Forwarded-Encrypted: i=1; AJvYcCUE/XaLbpxe0/XDDZ4BSp2PbHW3HIOg7YU+3xP5JJLAkN+aKN/CaWroSrjtINOxev1tWWbG9uVEE3b/RpE+83Opd4WMHLsc0LiaZBvSvGjIDSmo9xm7nS6AsLI/5k3OT/CIFbxYw8z8fl/xAE4/6TpoNzLxv7nerPvVjpfNL3VXnoXsmroScA1Re7I4fR5hneRhHpfg2iEUS4paZHBYDVKSY8iq1qYn
X-Gm-Message-State: AOJu0YzHrR+hSc6IaUGRJZ7fATRmNrAOKF7NLnhh3IxJk19m0uXG+GZx
	6TNqNnrOahu++1p3yj95KXks/EpLS0i6Lg31nK2EK7KjCndjVIXm+Cb9mBpr
X-Google-Smtp-Source: AGHT+IGNydcVPEK1wgOJ8DJoKPMVIceo+Bkojdrhk/iCNhkF88egTuG2s62+wYSRyYAVVRd8U0DZGw==
X-Received: by 2002:a0d:cf44:0:b0:646:3ef4:6ace with SMTP id 00721157ae682-68961605a4bmr4484587b3.24.1722526391142;
        Thu, 01 Aug 2024 08:33:11 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-67566fc4a04sm33675097b3.6.2024.08.01.08.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 08:33:10 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-66a048806e6so57766737b3.3;
        Thu, 01 Aug 2024 08:33:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWDY+02sBw/+hw9fQgBXWGgTlr3IArFd/11R8F2uQHt1DIChC0Eh80L2iPB+wEfkscnpoJNdghSbgM5A2ochxBdxrKhRqCYIXGa1xNdG7mTjiotYQSVoIEtYhRKiNKGl/dys4fd0yWF8tz1Qizd2TaVUGBDLYy/q9TK9r33c6NF9aoWnMwLHywFrj2GE06zp3qE/wRFeaDArtsLC4Nphu4p2iMmWGB6
X-Received: by 2002:a0d:c104:0:b0:650:11d9:b65a with SMTP id
 00721157ae682-689638f317cmr4097747b3.32.1722526390631; Thu, 01 Aug 2024
 08:33:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240729202645.263525-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20240729202645.263525-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20240729202645.263525-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Aug 2024 17:32:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWx_3px0VhTby--p4TNtqaZzhfk7K=2F7_9xD9+Xq9-2g@mail.gmail.com>
Message-ID: <CAMuHMdWx_3px0VhTby--p4TNtqaZzhfk7K=2F7_9xD9+Xq9-2g@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] clk: renesas: Add RZ/V2H(P) CPG driver
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2024 at 10:28=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add RZ/V2H(P) CPG driver.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v4->v5
> - Included RB tag from Geert

Thanks, will queue in renesas-clk for v6.12.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

