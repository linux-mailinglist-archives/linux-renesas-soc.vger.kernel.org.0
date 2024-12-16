Return-Path: <linux-renesas-soc+bounces-11384-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE249F3307
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 15:22:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9917A162D79
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 14:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976A52063C3;
	Mon, 16 Dec 2024 14:18:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FFA20629E;
	Mon, 16 Dec 2024 14:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734358706; cv=none; b=oRW+EuBdGYAbMccK5IaNp0dEz1j9Tqbv89iwaw18iz4smvOP3D3go7mj2VbcpjUnuX7Wr+IZTrBnBY7TvKE37ZWAXCL2g+JkLTEHTv0YP3GJYxRJG0MvCr8jOyYd6wmp2wiQvsyqnsWNTLT/wsdIIgzKgpNzVi1Y3GMosAjTfuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734358706; c=relaxed/simple;
	bh=Ob/tLOyRDV0hfcewFiar0Yr1SM9MvM4U7Z5l/3YseYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cKHPHTurMqDOqpmCcA+M1RPfSr54FKpHM1a3ucPg2oCHH6iSBnmATn0zKqPrYC2wOTPgPDowDLEHedV0GJxYDS8hF9O+HhgKxESxSKDYHrugbPWulIzulCS0lxw7Xy7mw5X+U3a1AVrI1R/skCPiz3/DP7vn3BI7gccbTlCdOsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b6ef047e9bso377248785a.1;
        Mon, 16 Dec 2024 06:18:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734358703; x=1734963503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTzdvrdPXVKyz1YfQTYQfHVX1dUtWt4ZqHX3tf81vjk=;
        b=dQKxFnpiuItkvl/mkaNazJqi53Dr4BL04bk9zmxomOAoK22O7OQGcxWK1gDZxMq9eJ
         ZNl8U1ZYu7qg/ZtZX75cYtVVGFm3GM+ktt8WQBg/imsA5Yk61DmR5tWUYIDmSKTUTYAJ
         CfuW4dFfx2PDTqwzcFFOeRuX+wWImKrhD7OK+B4FtXA9dj92sESz2sMDoAZtUCC/UiJK
         TcihI61ridb4H7togPioye1nHC5sxRF5xFDn+iPLO27ftlj7H0DH2QSO2DiZB8Lfq8FK
         00g37/75ACRsiEGPYkvqyOxHVUqDEFoGikrUhVe+mK/YOxJxghTDaNXZD4eZE/p5wXFO
         T8MQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaCSLNxyexuAYvhW2finn0XggPXtsu8KQ61iklUF5Ro90v4A6mIeN/ikw0KALTVKfTMoJw1cpUmnI=@vger.kernel.org, AJvYcCXukzLeoAGP3h1ST3+PqrG/GzocG9SD9OB5ShfmFnctSWW+6aYAUs2pnTO1BJa8moJ/0FWZ7y91PtCYrqJeoF3YHlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMSXh18MBfkzL7hTM1VaiP3P/9FWzbFjLSaANOuwVZZ+DeowEn
	rtOblaOkgJKFRUJnt6jG2ZdO9laXXwa8yvZ4/qYYSJthnhpkc8feV/W2zNm0
X-Gm-Gg: ASbGncvvMXP8YbfCJPQdnMjlLWFBNLrLs5FVv53m313aT06Rwbf7bSjOkgnnpnDhFcA
	SIoFnwchWSpzaQpDPo66kwe3HG3Q00GmtU8tvdKnc6Ih/FDDAoQ6euD4/Kp3u/z5/aPYCj0wu3R
	mh5Am6xqBSl3OwzJci+ukljFVWX68yJ2+lLea6AuLqjUM5gG+9C34TmR5yRN6ZOoJevJUjEBJju
	BjBOTJ+ElsL7MCesOBxFhfgBNmT+2hhl83wlLScINmE9HCX+TfJWocs9Fpb/xua8Iw4Z8LdAyKk
	awEyCi9ci8v4ra8DLJj6+Rc=
X-Google-Smtp-Source: AGHT+IH5PjW5rcS90bUq9ODbXuH/ho2FmsBDt8+8JbQmy3B+Wc5irPvi1R7dGLP0wEHqUigJHRuXAA==
X-Received: by 2002:a05:620a:40c8:b0:7b6:66a0:19b0 with SMTP id af79cd13be357-7b6fbf44076mr2142439185a.23.1734358702764;
        Mon, 16 Dec 2024 06:18:22 -0800 (PST)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b7048cadb1sm226509585a.117.2024.12.16.06.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 06:18:22 -0800 (PST)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7b6e9317a2aso449112385a.0;
        Mon, 16 Dec 2024 06:18:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUYlFMJ2Q0/noCcKPFmE72tDA6hDIu5UfdEYisHJBc2pNqSQfXcA601o/+YhcS4dflsEX6LaNMom2YZ7nOn4+kYVkE=@vger.kernel.org, AJvYcCXnJ8yepVczvXoiGCC2F76ByH262dMglJvcf1kQKAvbgfqoS3mZAifgWCVaRSIQZaHP4ygUsZPgozw=@vger.kernel.org
X-Received: by 2002:a05:620a:394a:b0:7b1:5545:7104 with SMTP id
 af79cd13be357-7b6f8c307eamr2483118385a.2.1734358702090; Mon, 16 Dec 2024
 06:18:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213123550.289193-1-biju.das.jz@bp.renesas.com> <20241213123550.289193-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241213123550.289193-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Dec 2024 15:18:10 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUoYYdLmQkcRbiVgKcWmozqCGnjr7_D2T7fXz=szM1Jtg@mail.gmail.com>
Message-ID: <CAMuHMdUoYYdLmQkcRbiVgKcWmozqCGnjr7_D2T7fXz=szM1Jtg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] clk: renesas: rzv2h-cpg: Add MSTOP support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 1:36=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add MSTOP support to control buses for the individual units
> on RZ/V2H.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * Updated commit description as adding MSTOP support
>    for RZ/V2H first will ease backporting.
>  * Added missing MSTOP data for SD{0,1,2}
>  * Replaced BUS_MSTOP_NO_DATA->BUS_MSTOP_NONE
>  * Added idx, mask variable to struct rzv2h_mstop to simplify
>    the code.
>  * Started setting initial value of refcount with the correct value
>    based on the clock's current state.

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

