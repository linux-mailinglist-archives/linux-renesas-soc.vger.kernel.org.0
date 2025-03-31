Return-Path: <linux-renesas-soc+bounces-15195-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BADAA76AC0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 17:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3189516DBBC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 15:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C07E221560;
	Mon, 31 Mar 2025 15:19:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7683222155D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 15:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743434340; cv=none; b=PqaHOUbY+JRVpAv5g494lYmQxest7sbNURXVh3XxCsFSRLoINZBT9nlV5GZA4QO6iZwAwojADzy7sbB1DctqaKprSUrRVi4ZKRyHtLMbLaoc0zJ3XeDsPBJikWmV/mJwFF10cWXEiIOoyIud4S0cbtB4LPCSFkTNYzbM0XvURtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743434340; c=relaxed/simple;
	bh=0hzCphTNn201LqBHlyR6cl2v2A1z9/uucizHPVMMKlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KKFYvDGizpw2VEHZBwY50fbvDePOhS+PzYWzkH3bf56XGm4CKctjDRGJtCVovl+SATyofnpEzOqs3tXtatKIYTCWWjfAiNVV2afjORXeoVxfDWTOZ/Nh7GS3UiqX4fvt4rgsPpp7VTkNw/1M40mG5rhz17hZwEKPNSH0WMtr7sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86d3907524cso1913023241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 08:18:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743434337; x=1744039137;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNL0W15M2vdnBf22pY9fC/bCkEI51E4GnUxEHufwCmA=;
        b=Mm6aflSvC4d5JVYsHFgKq1udMZ64sbd58Nk5aCB9E5Cs+UCxiVx7r0VLt0Yj9u4lYF
         qkFn0KpAdQUTOG8hX1fDnSyAL54adUo8JLoXLkuAZ+b76l4E2392P9iz2JFalnU7aExs
         XrvDNm3H45hTUgSwP0rdHE4yh61sNSheOuUYP/VCBahHziZegh5+u2bnq/vqvc3mrLxC
         NbdM/goDhwqs+SUVUzEWZ/wgvwH9bg279Mc0nFyu17b9/6rswf+yM24m1EylnculhvhE
         BT3a9HCE5R+oCYt3N19ygbKZwz3bdux4U1wE7MTRioBR70r31Jseu5yx9JdKJvPl+78O
         E+dA==
X-Forwarded-Encrypted: i=1; AJvYcCX3c2z33JuT4hDaRrUVRsy5LsSw3vrwbTAk62/BdWzR+cXPfhCQK/43IH1mP3hdMFMXgvaGciKfCcGaJz8GEotGrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdLnk487gojVOTVnJigIbCwbEfzPNBQBC6EikdfwdvTpKx3KFq
	pdtXXqcVtHwuxQhIStKgMxtCctf+PafMuAzH2vPirMLcR+tfRXqSZe0I5Dg8
X-Gm-Gg: ASbGncv4qoPOmQRNVt+RL2Mc9rwckaGp7695JG/i3Hw4r2SsdGS17EZrKUO9OxlI/M/
	VL2BWw5V+YVr8IN828RjV3HM3oepo/8tCBnxQRix2i+/istPIGkCquPCTH67V/naWgt0aKPNEBx
	eIm3q9UNSTvrty7mTe6SNLkEffEWL8s2AIw0+75b4bOpWf7RQCjbUHCtP+4NztuzaVBMB0PHdSW
	ACXT6rvNhA7Rs4rRDjUqli2uf9SaE8UuFtA1PT9JblSk8FCnoRdJFJcBNk1woEZY38JogqkRj78
	aDaSIv/4CPC/N7xBe7qj8RlaQexCIlUVFC9mcqxofE9g/SejKBaM8iyFa42Wd1l3ezE8tGGDz6o
	GRed7A0A=
X-Google-Smtp-Source: AGHT+IFxC8tIGEOkhN7Eki40FGSmTOkN0PKB6zIcrCyp5xjGPw8BAAMnAuD6SGYOgMig+gLGzaZrbQ==
X-Received: by 2002:a67:e7c7:0:b0:4c3:c9:c667 with SMTP id ada2fe7eead31-4c6d39a490emr6296583137.24.1743434337033;
        Mon, 31 Mar 2025 08:18:57 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-871a320fce0sm1595376241.5.2025.03.31.08.18.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 08:18:56 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86d3907524cso1913010241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 08:18:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVTtAeZHp+Q7i27qEamHYdg3TbK1VDaKWYVjcwgYbwXUuxrJ9qxzbUQFhgdwYkAJSZgrjhUZMqRPtk6/+nNzT1Xtg==@vger.kernel.org
X-Received: by 2002:a05:6102:4b8c:b0:4c1:9cb2:8389 with SMTP id
 ada2fe7eead31-4c6d37fd6b5mr6363675137.2.1743434336454; Mon, 31 Mar 2025
 08:18:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250327193318.344444-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250327193318.344444-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 17:18:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmC=jLOYpt3VfEis8sa4beYDUAwry+ZAvvGUybVPoqvg@mail.gmail.com>
X-Gm-Features: AQ5f1JrCnSiCrVgMGYYsPO2X5Q7HF5nXt7N3nok8LCQgfDwAg__7wkQMDpaNNL4
Message-ID: <CAMuHMdXmC=jLOYpt3VfEis8sa4beYDUAwry+ZAvvGUybVPoqvg@mail.gmail.com>
Subject: Re: [PATCH RFC INTERNAL v2 2/4] arm64: defconfig: Remove individual
 Renesas SoC entries
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Mar 2025 at 20:33, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Remove explicit entries for individual Renesas SoCs from the defconfig
> file.  Since all Renesas SoCs are enabled by default when ARCH_RENESAS
> is selected, and ARCH_RENESAS is already enabled in the defconfig,
> listing them separately is redundant.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

