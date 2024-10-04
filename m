Return-Path: <linux-renesas-soc+bounces-9430-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9F7990603
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 16:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98B851C209CC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 14:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E1F217304;
	Fri,  4 Oct 2024 14:26:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EC4217301;
	Fri,  4 Oct 2024 14:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728051994; cv=none; b=CpRgCcIgeVr13ST7xEq2ek2eKj3SgsNhxQOc8nIFR4cOGyoIxbTpdZkn/d/m27eE52koS5Jv1kSTftxkgjjboqhOJGp33EjT0doUoANujBiHswse3s+GgR1FI5TvTNFTWtkBE+Db2iMGMeNbyk8/IS6np3EXEbpvkdOXYgZ6FqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728051994; c=relaxed/simple;
	bh=ZV27CNibob8fX8RKpAofrvmqNd+GWFEFFpqEcnB7zV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jcviifbPRjbhGewwVJtGQ1sAuCpb3LqBHfKpiqZTJR3W1orQOsxdCP/1/DKMDsL/Z3fspAXj4wFmqOcUyCDD7ph3I7f9rteLkpuHlPSB7cBBhA+XQ590CmrBR8zd8cQfJHy1GdcL8y+aJzNlBt2OvFAJnbkdBzJtE4B9biy+5iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6db4b602e38so18677727b3.1;
        Fri, 04 Oct 2024 07:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728051991; x=1728656791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4W39wmNYs41F8/B3E0CBINvmBBsZibA5DvtuOSDH9Nw=;
        b=rz8ZUg38pWuF7ymFBTtqcP1W4+f42jf5JMSx2npTp+AyPBjHbf0QmiPxnbOZ3/fzFA
         Ytp9KNQT6KJ4zKvKcJYdwvqbrWBilQ/f0ZdCRcqzLp1kjKE6mNNUukfpI/un5zc0z5Gg
         tHEL3X/M9BdA5GCFPt0lKEqAVv9rHzXpA/idEtqzvYvXSam42H2ZPm86H0skCUMwH+/D
         Cne38TikhS5yyT0jNp66xyhId/vlQDvTAafXkejITU4nhH3Xax++33R0bSeCh3enjImi
         EOcU+/oCwIw+bRkVSyu3nQH4vIanmX5jp7TcKrYzuLOaSfHgnagTG9VtZb44A/PEsETF
         WmJg==
X-Forwarded-Encrypted: i=1; AJvYcCWQTOEfKaLKcBNP1BHiDRgfoeayXJJkjUhe0obPSUQU16n2sDAD/tKOFL6lrPXFTLU6qXcFpTKl8i+v@vger.kernel.org
X-Gm-Message-State: AOJu0YyswKHg8ELtrM2U/fGA18Sak+PDV8G9GUM6XJy1VoOBYVWUJDzA
	m22HrVKck/qPChUjemkwifsJsQo2xZswY/foz7+ZjIXIs4ISu1e1NmmoFppYA6M=
X-Google-Smtp-Source: AGHT+IE5mFzvUh8gM4EAAWwGM5nb1dboGfl40JZXEE8BrHI0k5PWlCaCGZI3FS9PIIBR7g7X/FVEyw==
X-Received: by 2002:a05:690c:eca:b0:6e2:11e4:2f58 with SMTP id 00721157ae682-6e2c6fc7e0emr29355347b3.7.1728051991011;
        Fri, 04 Oct 2024 07:26:31 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bcfb32b7sm6451317b3.110.2024.10.04.07.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 07:26:30 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6db4b602e38so18677507b3.1;
        Fri, 04 Oct 2024 07:26:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWjqC2fVyOM4IvQ1l5Mbk4TBXkXx0f6KUpC0ctGmAumnViG2O/V68kdhq2GN6dLiVl35i0kclBiuCFU@vger.kernel.org
X-Received: by 2002:a05:690c:c16:b0:672:8ad4:9461 with SMTP id
 00721157ae682-6e2c729ead6mr27151707b3.41.1728051990608; Fri, 04 Oct 2024
 07:26:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240926110718.20519-5-wsa+renesas@sang-engineering.com> <20240926110718.20519-7-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240926110718.20519-7-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 16:26:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXP6BTs0mSOqY1x+QmT-s-=5p10bbh46w5NDekyB+7YSA@mail.gmail.com>
Message-ID: <CAMuHMdXP6BTs0mSOqY1x+QmT-s-=5p10bbh46w5NDekyB+7YSA@mail.gmail.com>
Subject: Re: [PATCH 2/3] ARM: dts: renesas: alt: use proper node names for keys
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 1:07=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Avoids 'keyboard: 'four', 'one', 'three', 'two' do not match any of the
> regexes: ...
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.13, squashed with PATCH 1/3.

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

