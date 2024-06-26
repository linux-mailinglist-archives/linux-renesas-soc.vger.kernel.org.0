Return-Path: <linux-renesas-soc+bounces-6814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B25991836B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 15:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C819A1F213CB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 13:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E84172BC6;
	Wed, 26 Jun 2024 13:55:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7CB18AF4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 13:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719410112; cv=none; b=Ap+xokfj/BSINGwNjQo4JMTPMQoTrmIMokc+UIyM0XFlFaimpEUiNTF2IZt3VsmAkx2sxNsxlOD55wgThN/X4o8+z1/0H4hmMElBL48KXGrXQ+xM/NiBfOgTQLaAaeGgGj1ugdt7obKBMjzFXY1bw79WiKZnfi1xLDT2v53X4Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719410112; c=relaxed/simple;
	bh=ptg1suhTCe4BVUBe6xp0zb4GMmZQqz23Ssp+OuSEZxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QCQUNX6oyhRvgJcA553XmwalVYBFZdwGQ3cMqX58rIKuUcRBSETe1P/9h+3NCKyHN/pBzTFB/xkLPcGzhWdvL6/LKIf3Bhlt2siiBwFSDv0N4WHr/KHdzGiRTFY3DajBIeoPPH2m5ZFuQPUTco+j1OIbu+yLM6hpgBvwb5mIJ5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dfab4779d95so6671552276.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 06:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719410109; x=1720014909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZfboZVzwHk78Cr5H8/sVyfcU5H/XGNX+XCUmg990rgE=;
        b=ZdZoT0Oeno3FBd611fFz5DxX5jjkBgWapgy4ET5eqJD/wW81LYEjlswbOelLLUvteP
         4ZYOL7HwrbK1cmB3vlHy9g5NeY2lvTI+wl8ltmxLg+OvZgsOrOdHvN6wSRV2M6BwdmaF
         4Q0AYZnKGHccd+8NKn7+lgJ9oFPWhx6Xf4LMKTbEtfq8DfLRjCaDeDRy5lkQbWfES/59
         SUZGsaiz7rAQYOOpkyOBzV3rx3prGuzwlMSGC2XcG2C4nF1wpJe6Kr6m6IPN/V68LFsq
         Tv3WPKn9eQ6FtSBmZPTnETLeJE1HzEUF8dLIepxtPQI/baRBku6//RydjzDOP7c8qCqq
         PiMw==
X-Gm-Message-State: AOJu0YyyWVsoBfau6gooMffkp1IDuKeSUcVX+sQgWP1N0mCDiQi6dMTK
	A96Wa+fqBKb9MDiInKTokNLh+laMIPG6Qw9EjXPGG31YpdtS7Shcg6kcM6ZL
X-Google-Smtp-Source: AGHT+IG1Pv5SdDA7mSW4PdCYjxmop51ZbKWObrqW0pQJ+0/iric+b3XHF/4XlXmUNTcpkuGRbOA3iw==
X-Received: by 2002:a05:6902:8a:b0:dfe:fd16:cbc6 with SMTP id 3f1490d57ef6-e0303f51da8mr10601187276.14.1719410109283;
        Wed, 26 Jun 2024 06:55:09 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e02e6116b08sm4325927276.13.2024.06.26.06.55.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 06:55:08 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-632597a42b8so61164447b3.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2024 06:55:08 -0700 (PDT)
X-Received: by 2002:a05:690c:d8a:b0:627:972f:baba with SMTP id
 00721157ae682-643aae70b44mr136259447b3.31.1719410108755; Wed, 26 Jun 2024
 06:55:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87jzifkxi4.wl-kuninori.morimoto.gx@renesas.com> <87a5jbkxeb.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87a5jbkxeb.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Jun 2024 15:54:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXndVJvJzit8p8DrkOky41AkELC+VRj8_bUmcEEzfwVrw@mail.gmail.com>
Message-ID: <CAMuHMdXndVJvJzit8p8DrkOky41AkELC+VRj8_bUmcEEzfwVrw@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: renesas: defconfig: Enable AK4619/Simple_MUX
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, Khanh Le <khanh.le.xr@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 2:16=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> This patch enables AK4619/Simple_MUX codec which is needed for
> V4M GrayHawk Sound.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will apply to the topic/renesas-defconfig branch, which is not
intended for upstream merge.

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

