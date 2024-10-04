Return-Path: <linux-renesas-soc+bounces-9381-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A337E990080
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 12:06:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6360F282FAA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 10:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3EC2149E09;
	Fri,  4 Oct 2024 10:05:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03701145B11;
	Fri,  4 Oct 2024 10:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728036357; cv=none; b=NWRm+91N614ZsMU+NNsBK9KgG8TTdI6g7Bmfh6Mzpp5WDs4s/0WG+BLOh3ZYWKgsxLAeMnrmw5BPkgHkcrnQIND+HsVrLKx55rE0qF0WSnVNnBo2Vgz6hDUBd4ewovKH4QxynYETV4EEaQMFtKGcb5IZdLmLOl1EvnP+xdJrczE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728036357; c=relaxed/simple;
	bh=HooG/fIfWZpocHxUuHlc7AWwahI7xbpQargXvD8WiJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F9GixYGS4XtN+/IHQCFT9ae4q56zYkByrqh/+K+KDj3ghWGRh8J2U/ooislzXNwN0SAO6YBOB2wba3Kkth9bjvCfe3mNXb8jANN2I6EkmqDGi6xiQ9Q4UoZhxYshGcn452B1TtDkwfmTo4mrs6DWeVvfB1biwKGRmUCWYZ+DiZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6db4b602e38so16289097b3.1;
        Fri, 04 Oct 2024 03:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728036354; x=1728641154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QBc8f2cSzHljHbIcuwlK4R1jAe+yaqmseWLuC6kikrc=;
        b=m35e+ZoW02TVpjnqs8w0unsXykdeCYavWwub7/mueS5Nz11FLWtBEUxq/VW/r0ck5E
         CAosk0j40ZEwHFJBTsriV+sg4nZDbMjJ2Jkk/TEwNNNr97OQlSHjgsposcAejnnV0yra
         KhH/55snjzFmqOD+w7nv8L9+TVdb9OWopW5gT0qlOqOWa4PHpk5hI6ifm7LlXXpBF+ti
         oenaXw04NdlbPQuqzxatBs/S+zzy7n6A43WgmORaFHyytBd08bBZfu/7sDM89b7y0iNO
         4leyffikFbCX3f9TkOG4zuJtKBKqc4lb+CYzz2gR58q3DN7/mgYMF1waBTTVijAsxh4W
         5y5A==
X-Forwarded-Encrypted: i=1; AJvYcCU/ftX8fHNqarEUA7tqCl7o4ghY8NSoVAfhvnYEqiXkxSnEf2FtdUnlDXtfx+0y1Sd3+vqi78S1lFSJo0TK@vger.kernel.org, AJvYcCVgomTWmB6l2QaPy+mq07FW2Cq0gt2DPBvc5etUDALFc8QJLwJjPC/KdEkin//gsCtJtrvmCDyCaDA=@vger.kernel.org, AJvYcCXD99f0pqjr63q9ByWUefWqgfy+v7yjg+ig7shNuEi8whQAsvkUiPmGSPRaq3FU8A40bfCumuxk+JkUeG3mdIMfRlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YySF5XbFEB6hcjvDdYCbOHgeJWq00ETiqtIltYS9wY1TSCt2cN2
	J8oF1WWRpMBmGQ99NAN0U8/tKiWZzFzBfVYXPSbxAVXYNOFXKiJjnzOa245Q
X-Google-Smtp-Source: AGHT+IGabHsaXy3EBZfVlVobJWCwFwnQkJbm2FBpus7RmU6MPPePElWmQX0N+wFva/ggKOz/wPy25Q==
X-Received: by 2002:a05:690c:360a:b0:6db:e280:a3ae with SMTP id 00721157ae682-6e2c7036dbamr20078807b3.23.1728036354248;
        Fri, 04 Oct 2024 03:05:54 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bbea7477sm5954017b3.39.2024.10.04.03.05.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 03:05:53 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e2c4ffa006so8666337b3.3;
        Fri, 04 Oct 2024 03:05:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3/yHtp+JhkqP+DERVl6/6PPHD69cZ7FZ8yJqjIqF4RQ4CfuDdxPTBe1GVzgFPqiwz5Mcv0KIJL+A=@vger.kernel.org, AJvYcCWyg4iAF3PIsCyDGdFqB7Ckbuz6yzP3IMTSseJMdYzcHtv+k12TT0LblNW+lXXS19BX/uy+KgKZn38HSLQD@vger.kernel.org, AJvYcCX9dEdT/oy1f5tvKGoWqkb7SzGuOH4H7QjFXnZ/1ZU9RQe3eS9wZgRKOqdH1N5rL5xnWK2tC0y0kKgNeR4cDEppbRQ=@vger.kernel.org
X-Received: by 2002:a05:690c:38b:b0:6e2:50a:f436 with SMTP id
 00721157ae682-6e2c728a00amr16732177b3.36.1728036353760; Fri, 04 Oct 2024
 03:05:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240930145244.356565-1-fabrizio.castro.jz@renesas.com> <20240930145244.356565-4-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20240930145244.356565-4-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 12:05:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW1xL=rJPOJu9n_qs-ADng8GKjETOwa4F7CqXwWnWD2BQ@mail.gmail.com>
Message-ID: <CAMuHMdW1xL=rJPOJu9n_qs-ADng8GKjETOwa4F7CqXwWnWD2BQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] clk: renesas: r9a09g057: Add clock and reset
 entries for ICU
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 4:53=E2=80=AFPM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> Add clock and reset entries for the Renesas RZ/V2H(P) ICU IP block.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
> v1->v2:
> * No change

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.13.

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

