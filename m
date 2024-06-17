Return-Path: <linux-renesas-soc+bounces-6312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 587D690A53F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 08:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17A381C238BD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 06:18:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6477118C32D;
	Mon, 17 Jun 2024 06:15:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A93E187321;
	Mon, 17 Jun 2024 06:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718604953; cv=none; b=qOs0z5IMBAe8FfghMLguUfZAwYm8LT3xu7OvWI+N7TCpDxLRhi0o3iSTkNtDfEVQwuRdVu7zp0IM6IdEBDspBKtiPZNL/3FogR0GnxqWSJ/ik02/FyZFSRHYhqut2GajuyG4hb557GxJ4lmxxxnQcw1miF8xKDpgrYVnrbzys24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718604953; c=relaxed/simple;
	bh=UvXMhseWbGmd50TamefZqmyt0KDCrLhlY4UDY+LJLBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t0CIrGwhi1JN8NTdtzNoZgsJdF9JVp716q2q8KGAPLbJhzqtxzYAk3AQe+JaTmhohF2fsPkpClufX+EVeRWsCcE68CYeXeJYMWWzJJt+c/i4fhzN8yQmRU3Xi8YnWZczM+G0H+585kKkeba3tyyV+rgzblkhPJ74HHtatyEeip8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-62f3ccc877eso33020667b3.1;
        Sun, 16 Jun 2024 23:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718604949; x=1719209749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pv73Fp5hlaUilCJzR0L8uJzdLMdKh5Wz5iCBLXUO4Y=;
        b=j4spehv56ntFZlafu5xqU/9yM3rbY1IjvIKat2hQUFx80vwHQAaLF8UzAxPkafMRo3
         1TzDxkHs79JTuUkAAGmTWhHQPrhp9BynW5Ix1qs0oYSJgYsW8ttSz05N1CHOXaHpWSng
         NvHo6UUsFX0PSF6d1i/8oQvNpNNN6uxEpVTjZ3Mjm7HycC1EDlTbvJW0NBOFYaThxF3N
         JUMpdtzTVzovtYI+21sAghwtpTeysMNi2S5qw6tohhDXzBTNuL24gMjXusKzOT9WKD+B
         NzN8IxsXtmbm7MfyGVxLRwXrG5AMXO6PBo7olqnCuc7S85cFsYU+jGeL388KnijCPASz
         WYaw==
X-Forwarded-Encrypted: i=1; AJvYcCVq7IGrf3cYs2pavEtImUJA/3Nw07Z5FXEzoqC9hQ30Afbpg7Ar9EMG85KBICWdiBHZFK9XVPLuXQFvKH2TNFkuHkojTsGmyuKYF6IU1emfjp8jURpx2vqEatPHBZXZYkeZilsDubuKyMdzLVak
X-Gm-Message-State: AOJu0YyMdb4zid82D+c2DwLAqgcm6H21Y5Po+Rl27MqOSG9EzT2RbqZy
	TST6hS3XzLuTUrsG7Dy+RYGIfqN27YA4xZNyRHJECxlSFZVVyVHs84RItdWf
X-Google-Smtp-Source: AGHT+IFDiSd4aiYteGHjhJvq7qqR6mt3Q+1fPbJlinGKpAEUDX9PG57IaCeStg34TFym60HKVjbGOw==
X-Received: by 2002:a05:690c:711:b0:622:c892:6ae7 with SMTP id 00721157ae682-630bcea865fmr75205667b3.12.1718604948980;
        Sun, 16 Jun 2024 23:15:48 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-631189a8146sm13226977b3.45.2024.06.16.23.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jun 2024 23:15:48 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dfa71ded97bso2985628276.1;
        Sun, 16 Jun 2024 23:15:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWpEbNDuVSg0Y3QOWNDj/+99zp9+MePNRQoDpTHSY7syJhCLF9Py2Tj0XIVlbcLgYaMI0CkG9Pmrel9Y3SjtEnkvdxu62TaaC1Cgb6OvbxesqRb11FeYSxBujrjBifF8K4AGbs74T81NN7hmPJ4
X-Received: by 2002:a25:8b02:0:b0:dff:30c7:8e08 with SMTP id
 3f1490d57ef6-dff30c7a1camr2633308276.32.1718604948256; Sun, 16 Jun 2024
 23:15:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240616160038.45937-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20240616160038.45937-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jun 2024 08:15:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXZc_R2-k1LUktM1M3Mon42U3=-gRJO31a8UJWPMc7E6g@mail.gmail.com>
Message-ID: <CAMuHMdXZc_R2-k1LUktM1M3Mon42U3=-gRJO31a8UJWPMc7E6g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: r8a7779: Remove duplicate newline
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 16, 2024 at 6:01=E2=80=AFPM Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Drop duplicate newline. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.10^W11 ;-).

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

