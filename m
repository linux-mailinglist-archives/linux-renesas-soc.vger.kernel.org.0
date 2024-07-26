Return-Path: <linux-renesas-soc+bounces-7563-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4A793D647
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 17:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 757B6B22556
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jul 2024 15:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F062917838E;
	Fri, 26 Jul 2024 15:40:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDF810A1C;
	Fri, 26 Jul 2024 15:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722008407; cv=none; b=WFILv6Ly8buq2DItTwexp8ZWdykH7vwRh+4YpUILKp5tbtyEsOmhNqV5cEo9HS3mQSVGbVoveS937OME+QzKgGGJUmqwsSiefQuEwPOM7nBtbAX/tri9ES9CMfHIzV121bTIg6CkhNersSWe2JNhtxNdtpVwge4hNixecT2Og6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722008407; c=relaxed/simple;
	bh=pYNGuQnN9bcfiRckm6C9gRTU9IPT4TznVgg1vdHN9eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kyrMiiBNZyG26sPiQFYNRJEAWBTA+qvIMZ7TFiRcnne5ECvdLhWX57kHc9FdB+deYHAydY0P27c6Ixb6NOlKCQaV3t++sry1J9t6Z9TMxrbZ4qhhPQEryWRosz9ZkUaIgz1dm9ftijTEHV2pFG4EYtvuAeAz3uh5hvlPSunpIxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6519528f44fso21346627b3.1;
        Fri, 26 Jul 2024 08:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722008405; x=1722613205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoJFfy3kgEr0ppPa3BxefQbJt1rU56MMap8Mstn8RuQ=;
        b=WZmDdU5ksgWC4u1L5qVJcIrecFT49pRnauNWvGD+NvNI1LdyhsMWsTRwjP4ypxYku4
         1RZCDsltLQFU99WzyCpyiUKEzZrpDR8OO2dRkPj9j3JOQgM54WODlFxdK5G5K0poSDDG
         nX/BSK6XHDFL5iLFFqYdfx6WmrmUk2D57ion45pRQWuRNJFhDgDdo1Q+1L7JEE5OtZj6
         gTEJ+yp3U4TXklFCMiNFhqtPpIBENT6lzT/AorAjOdHFfmJomDfE7l2kpQqaNJWfBBS+
         JGUd5t83ZPMtmfyh7bO2e4Yl0TgOpcEa+5LhNjotkWEDllIKV72Rw2O4ygzwpdqnaEPN
         +C5g==
X-Forwarded-Encrypted: i=1; AJvYcCU8dlT/WIPv2FBCIFIMn7f9tQwgNkTo+e5QXuCqY6qnLUJ1pvY/FX9vz+Qayw1rkfffv2751TYZlEErwsWRM9+6T6I8c//SYXxmUowE5nmvVqqQ8YAcjKzWdmAEXtzosavpM7fA6vIWVx2WxkYL
X-Gm-Message-State: AOJu0Yxq2fDozfBRRcPqT+N0r6b1FdL/Nf2Dco6j630J0yiShV9hPMUA
	lx6MRlB8mGVp4bZlLds+xRPH1YDGJUQMon0O0MQDVC1GRPsuQLp74N5IR0BPFcY=
X-Google-Smtp-Source: AGHT+IGDsVefjs/ipEMcVizEw1lSqdn2T8w2baAVdqEtXSu32PQhiqqWVkeosRox5DgsN34sU/Z8OA==
X-Received: by 2002:a05:690c:6203:b0:664:7b3d:a53f with SMTP id 00721157ae682-67a0a7fba7cmr2090677b3.45.1722008404913;
        Fri, 26 Jul 2024 08:40:04 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-67566dd90f2sm9311407b3.11.2024.07.26.08.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 08:40:04 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6694b50a937so27362847b3.0;
        Fri, 26 Jul 2024 08:40:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVn0wh4J9mk9I2bOaB7eUlBbY0BAQsaVuqnC6s7qLlJi/ca2VJRvjblfLrNGHCuQVgXKcprry5jXqyY3b7NFNX46wUDdxRt3x4uOmJ2Ow3YfpabQZFSCysEd1dudXqcIBToSpTHJR4GUGvIXsyS
X-Received: by 2002:a05:690c:23c1:b0:62c:c62e:e0db with SMTP id
 00721157ae682-67a0a60d465mr2350577b3.44.1722008404411; Fri, 26 Jul 2024
 08:40:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725100534.5374-1-oliver.rhodes.aj@renesas.com> <20240725100534.5374-5-oliver.rhodes.aj@renesas.com>
In-Reply-To: <20240725100534.5374-5-oliver.rhodes.aj@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 26 Jul 2024 17:39:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQd8ramKT7Ui-ay_y=wGKTUojKWXLKRfFd55q+Dg87pA@mail.gmail.com>
Message-ID: <CAMuHMdXQd8ramKT7Ui-ay_y=wGKTUojKWXLKRfFd55q+Dg87pA@mail.gmail.com>
Subject: Re: [PATCH V2 4/6] dt-bindings: reset: renesas: Document RZ/G2M v3.0
 (r8a774a3) reset module
To: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 12:06=E2=80=AFPM Oliver Rhodes
<oliver.rhodes.aj@renesas.com> wrote:
> Document bindings for the Renesas RZ/G2M v3.0 (a.k.a r8a774a3) reset
> module.
>
> Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
> ---
> v2->v2 resend:
> * No change.

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

