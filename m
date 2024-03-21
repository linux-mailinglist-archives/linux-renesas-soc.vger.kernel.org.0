Return-Path: <linux-renesas-soc+bounces-3963-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6134088574E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Mar 2024 11:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FBC42834A7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Mar 2024 10:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0F6125CB;
	Thu, 21 Mar 2024 10:17:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B3C1CD1E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Mar 2024 10:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711016255; cv=none; b=fflQaLgRZGeNA9nbBFirLOU6s0NZ60F4DMtlM274PGPbAvHFTxpulxf3bFxeQ83zF7rEK1ZfThC9GDSBCVktoxM09IWCGEoTPKugQO2+UF5NWYRuQo+gxk18Ubev9d7vYMzA4jbRS0gzoEIfk9rfkbp9sHf4aLjfhBdS0RQ6eoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711016255; c=relaxed/simple;
	bh=/P9EpEIEY2tVPeZs2qt1FGDgIo309eZrckrFVCehq20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dAB76olXxLii0dvBGftc6eYorJDUGPXvY6jA6RdhHxd5WzVHor2cu1dIcRX86D9CD9bAZJQLAqW5rgqhckuA4IBhy2kkINLcUJ8Wm9YXAmHt2A1h1ZNqFN8SYrWNH/z3MhOQji1SW5hDwko7jIQvWSbflP5862CidlIMxghRBQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6098b9ed2a3so7614457b3.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Mar 2024 03:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711016252; x=1711621052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dAAMDED4NIUcrWKwhcy/3hfgqQ8HYtOsLrJKDZQ5n6w=;
        b=k8vdF/H7CYxRfx5GMWvtrhDIxA/n2xq5lte7cPat9yhRD80lAHpAFJQq6X7+N4j8nt
         KL6DfgNZhFZp7dKJvtAGqNG5C2qnFQzKpXHVT+wzRoHK6T7Xm6IEiDvSbye5U/+EfvbR
         NKFlyOIlyrS+UDWdKdUqC1DYTw4CD7w5x0KmtRntkfSyRJ7defsCx8gxg0cwlZK1Yr8r
         MU1G32/5aEw98PWHi0y/FlPGHk+RQ03r3ZuKYse/UEX9ROoevlvCrHWzpBiGost483Ft
         gKCqmV5SIiC+idqm/Xr9U8I/w15c43p0nelVW8z354FWt7lGrybQqDzVnfNLsv/5Thdb
         ifTg==
X-Gm-Message-State: AOJu0YzKnEfTmYnZ4RFGUqqNf+VCrAfgU28wi6utiGz5O/5JSZLF9hbF
	ItJoWcBPkI5OKzR70AxzmZwf99C1/kgHSIf4dEhoHLrvZ7sEwHBRlSqyOZ7C3Cc=
X-Google-Smtp-Source: AGHT+IF8hyq81iUQyPZy1K2Ka+EgApOy1YFc0z96l6SgLPiOfQmW8LqNiWI97RrkhEMiiqP7DPzVMQ==
X-Received: by 2002:a0d:d511:0:b0:60a:a5c:78e6 with SMTP id x17-20020a0dd511000000b0060a0a5c78e6mr20939772ywd.19.1711016252133;
        Thu, 21 Mar 2024 03:17:32 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id ee13-20020a05690c288d00b00609d25c2476sm3156325ywb.32.2024.03.21.03.17.31
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 03:17:31 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6098b9ed2a3so7614137b3.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Mar 2024 03:17:31 -0700 (PDT)
X-Received: by 2002:a25:dc4a:0:b0:dcd:4e54:9420 with SMTP id
 y71-20020a25dc4a000000b00dcd4e549420mr18613876ybe.5.1711016250725; Thu, 21
 Mar 2024 03:17:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1710864964.git.geert+renesas@glider.be>
In-Reply-To: <cover.1710864964.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Mar 2024 11:17:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUixcKNVN+d1HddAJsinxBwPufGG6J9-oYjbK-8SfMP0w@mail.gmail.com>
Message-ID: <CAMuHMdUixcKNVN+d1HddAJsinxBwPufGG6J9-oYjbK-8SfMP0w@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: renesas: Add more TMU support
To: Magnus Damm <magnus.damm@gmail.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 5:29=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> This patch series adds device nodes for the Timer Units (TMU) on the
> R-Mobile APE6 SoC, and on various SoCs from the RZ/G1 and R-Car Gen2
> family.

In case you are wondering why I did not include SH-Mobile AG5: on that
SoC, the TMU interrupts are not wired to the interrupt controller for
the AP-System Core (INTCAx), only to the interrupt controller for the
AP-Realtime Core (INTCS).

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

