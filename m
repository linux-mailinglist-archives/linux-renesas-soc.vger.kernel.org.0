Return-Path: <linux-renesas-soc+bounces-18194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF7BAD7416
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 16:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22D3A17FDEC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 14:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D4AE246BC9;
	Thu, 12 Jun 2025 14:37:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AAA23505F;
	Thu, 12 Jun 2025 14:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739075; cv=none; b=Vq/cQMSG2cxv+HBGjcrUyf5cEOQ5so2tK6xTzoezaG1HDbP5vnra/1bzkovbV+oBz3m2j4TZV8r1wbF7PXyUoJFto0syf8C4U0Z5XR+SMoaIQp24qSFm00mm3PvSn3jMb+sH0UlLLBFaqeh4LbPHlF8JKFDFO0aq4Qa56xUrePI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739075; c=relaxed/simple;
	bh=O6W/K7b07dkwKTyYfKtfCQuyTlX9X+pyVvffOR9Nldk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K/58+wu/V7Q82wsa+dm9zcpwVrpuGdqLZWaWw+L8z1wGDarHWmgpc+SyGXxScFzXubrUtc8wW3jUCA/bUKGbrFXtuZyNALs+XV7WpYo1sfN/RcEt0N3InGl3tprQ0zGiIgiWuPv5TT+Ebjdx4u7EWtBEn8eGEg1+C0WmrSRt7Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7d09ab17244so103312385a.0;
        Thu, 12 Jun 2025 07:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749739072; x=1750343872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOmPSIivTsovpCjDwCwEWEu5/zxVJAFHI1BLg0Js7Ww=;
        b=bmDJNles/vkEG6qLuFOuoLOQD6dMvNC+Uw4ftueOzmwUMikbd0CRhT7rZ4t5CbXVEo
         HIUNIzKeeImavRStZiO3Nu/UPRkgR9V81GE/MCF5+OAo/QAkBcBd/ho5TGIJ0b46oEqi
         7tIfKhhMT2T/o6MzLxEB35e+4hob5a8rAE3YkrZAHnTW0ZNksKvUOQNOGeAXIKAOJ2O4
         UKmTOAP/sPvEWl2TnUaAnTTLCj+/uL6JtlyERnYCH9i3FjILULrq6LyFU7SE0BQIgH+Y
         yjbuWuva3+sXgdcDJb9/tGokMXfvK34soy1A2rWbVm3hXTmp7Sbl0tKe5i7Fwq77EhKO
         eX+A==
X-Forwarded-Encrypted: i=1; AJvYcCWDupFhVLvhWLVXuyWAT9eZ96ASxAVcrRZdEs1k6Wnl1eR3wsUZA9StMlxvdI3t4dmqN/9jGSCvWQegn4QQF5+DYN0=@vger.kernel.org, AJvYcCWSMs5fqXndeqwfbKXB2FjjVvpbEbc1OWf75UVPB7yS8imi/3UqabkAEoDJTrSiNE1L19iRFQpvYwyq@vger.kernel.org, AJvYcCWch0+hMOo9cF+xD5P0Iw2ctczbe7REH0i76ZM2wdKjgNKsIYOmQctSgtZUftSTLGpnmxAKgdzM1Hz6@vger.kernel.org, AJvYcCXucoe1vKBxVwz6RHzF2/oCmtE+ZEeauuNR2jTRX4DEfoLtkJvFhjhVFPB15ce6Wrpgz6pKzC4XxWOwZm2r@vger.kernel.org
X-Gm-Message-State: AOJu0YzZL8tUqBEkIEbj09y4G+YljoqJHnyXYL3kw7lryI+2sv+6WfH0
	KWkQFrf3cZIm1pH+sPtmd1pcjaHOiNNOoSwuqy5GZxT1sXvHEKjhpkQ9jTGtXsPG
X-Gm-Gg: ASbGncuDtcdQCX9bfZZrJ/mnj0bYB8HedbKBDQANN2iSIhxwPWpNSiMEpWmI9qs1QCh
	pIiyjqEOKlWihyALahLA7rmkuy1fqMh90NEspOUJFLSNxyo4Jgk7yMr0n0eT1n8g5Aclr4b41Ch
	NyoNvT6KnbmVGr2tpBX0QUR9YEho4gAuYn2hcbG863m5ahfd450L53rORl1tn5wcadyfOX73TPI
	rtm8xtZ59VUxRIC/9zgmxl2v3XBDpRFqfZxm+nHniaIvsQRKtwlgaIeXdN03ae8rTasFa4ETZOZ
	614tELRO+Nf/vCnwfycH6jBeSvtWsGGW3jid/HLbcypiuYH7PnkD16dhfad1kCznObLlB1Ts0Ts
	ElQ62sn1V8Xa+Yk4zC1uhrSSxSGepRv51q2nSV70=
X-Google-Smtp-Source: AGHT+IHsf98z+s4quoDI+FeKbg/LGVfaUED8/3e+WVR7YjU2cMxdt2x2wvnk7eESyJatVSRaFvHOZg==
X-Received: by 2002:a05:620a:440f:b0:7d0:a1c9:65a7 with SMTP id af79cd13be357-7d3b29ffffcmr579761085a.6.1749739072585;
        Thu, 12 Jun 2025 07:37:52 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8ecf304sm46375085a.83.2025.06.12.07.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 07:37:51 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d3900f90f6so102866685a.1;
        Thu, 12 Jun 2025 07:37:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUzo3USmkzJgidk8ms+yTLAX/jmFOxlIcu+luxNbC8xf+nc6RzOquxtVdc6iujxzyKPJPLDQQCXGYEnXWgDJyvW79E=@vger.kernel.org, AJvYcCVAdXTMlz+17mUrmwAFl5PvVhU9rAzlH0uUsIRW1hTeofRbWx8AGp0Qd2112fyI6InVypK956WpeAH0tndN@vger.kernel.org, AJvYcCXCFIQbfHn7w44zzx3Smlqva42x/fxq6rTTKAK1+Kj9d8/OLGkLHdYrdBYyjxSDu3K+cLK35O+q9p0z@vger.kernel.org, AJvYcCXZT4vAxXAny7BA+nRmKXeQ6UtBtQ+paEcX1BJrxV12y+zivqoEklczsuQg/FxJqk1f/lsIZl9/kDCa@vger.kernel.org
X-Received: by 2002:a05:620a:454d:b0:7ce:c4c7:9b81 with SMTP id
 af79cd13be357-7d3b2a6c463mr523364385a.30.1749739070426; Thu, 12 Jun 2025
 07:37:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250609203656.333138-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250609203656.333138-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 16:37:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWU_4diipE=RJA5-QWah6GsK1iTN81vU2zfFDH706CSnw@mail.gmail.com>
X-Gm-Features: AX0GCFuA5VG6ZhY4MKccLvaxlcpAV08UgArY0NXtQPD8TBPsBM-2Y27Ob8TIZnk
Message-ID: <CAMuHMdWU_4diipE=RJA5-QWah6GsK1iTN81vU2zfFDH706CSnw@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: soc: Add Renesas RZ/N2H (R9A09G087) SoC
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Jun 2025 at 22:37, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Paul Barker <paul.barker.ct@bp.renesas.com>
>
> Add RZ/N2H (R9A09G087), its variants, and the rzn2h-evk evaluation board
> in documentation.
>
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

