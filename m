Return-Path: <linux-renesas-soc+bounces-6813-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C86BB918361
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 15:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84DA6288C8B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 13:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0796D18AF4;
	Wed, 26 Jun 2024 13:54:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5121E14532F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 13:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719410051; cv=none; b=HU2/pNwP8e2H2UwT6sLp9fbcUST1Jk1xcdAYGzAbmmt5A8wn48h1w70PKz4onMb+jQfLyZ+Ghsg9Hh94qefEOBEzHwbWDQYQ6557zL2ZOBSUIuhGvIrNxQqrpXNFLHvnbnndOU0CH4jXWmwZ031oBpa6wTpvGAS70HsHaFe8wuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719410051; c=relaxed/simple;
	bh=4QYo+I/Qc+bx08x6uAmdb6Lt6/yog7SYwLyh62LZQco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AEi9kqV2pQKs5oqAhzve7Y/L2ihT5AvcEaBYyrEGfuIsf/rhFNsmKnGy8pIrEDtTv6ocPs19JuAIK3m8ZiY8GbnnpXVhTJMWmxUgmeg5rU4UvNHXtnpHJqg9btMDgY29iX1KuJBCXu4Dx7tWvnSzFc7iNd3zybYEM89mYh2xzDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-64546605546so35707927b3.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 06:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410049; x=1720014849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9dTqW7NGmduBzLdJtmTUSKpuA0Ox9R/EPUfOnP2s+A=;
        b=FPjzsDP6ijmuc6VMEA14RmUOW3ityy2Kw32Pfi7tgjLirM/tGdbBKYPMZR9ILP/dyN
         LY9crPPonbI2n5j/KkpmkleXSifPxmXg/Nj9823R1PaVAu29uOADZjznGtLkc903Pdt9
         7d1RKCXjl42n97SV2jq5MWdpgBktskNh+gpOZo8zJprjw/o/AM6MqUofF8uv6b7mSPPU
         iVz37GbTwhfSmlnKPIa6mhLdEi2/8sHIVruilhKqjUPfzjYkDyPcQleA00CHkCgxvTXL
         kKv3iwNXJh2vik1uaO6vaMnSyQa4waq4z3Qa7nm0lThOlUBgIuURQnbulgXu/kpJUobh
         AQxA==
X-Gm-Message-State: AOJu0Yzb2Y8DSP1YkfkamFtr+hukofZlYSC/JZ/f+2vtaxn8vfJ3QIAe
	I2IMDM4h99vDAvFmjlxHDoRBR/hllqYENn5ehWMPpL/oztAWIiKXNVhiFRnQ
X-Google-Smtp-Source: AGHT+IGUC8OZ5mUwm1lSsbGxNKZSzW7wvw/vW6OUgbMCvRlQttLltz3OGNzuLw+OfycxraFAiqlw6g==
X-Received: by 2002:a05:690c:841:b0:643:7d35:a861 with SMTP id 00721157ae682-643acc168a8mr83415037b3.46.1719410049144;
        Wed, 26 Jun 2024 06:54:09 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63f15f66a23sm38293137b3.142.2024.06.26.06.54.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 06:54:08 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-63bc513ade5so51377107b3.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 06:54:08 -0700 (PDT)
X-Received: by 2002:a81:ae0d:0:b0:630:8c44:24db with SMTP id
 00721157ae682-643aae70b39mr87732497b3.22.1719410048761; Wed, 26 Jun 2024
 06:54:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com> <87bk3rkxef.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87bk3rkxef.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jun 2024 15:53:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUmLMhc-r6YQv54C1ES-O2vbnWzT8jVMfbD4peVRFpa0w@mail.gmail.com>
Message-ID: <CAMuHMdUmLMhc-r6YQv54C1ES-O2vbnWzT8jVMfbD4peVRFpa0w@mail.gmail.com>
Subject: Re: [PATCH 5/6] arm64: defconfig: Enable AK4619 codec support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, Khanh Le <khanh.le.xr@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 2:16=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> This patch enables AK4619 codec support

as used on the Gray Hawk Single development board.

>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

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

