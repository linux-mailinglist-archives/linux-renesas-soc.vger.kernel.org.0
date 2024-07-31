Return-Path: <linux-renesas-soc+bounces-7655-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAE5942926
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 10:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95C511F211A1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 31 Jul 2024 08:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E81B1A8BE0;
	Wed, 31 Jul 2024 08:29:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00F81A7F9D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jul 2024 08:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722414553; cv=none; b=hYJeOPmnD+pNmk/b+wgUNdU9i3C6zOGs9hLie5JMale7CxP5fTkwfaR5Bj3wvoccgsgumyoxYN/tED2HF3aZd9bt1jbB2KXH372AHmCxg1YP6xurf2VuQK3CFqwY1Cvko2KYM2u2d8CT5yEezDNOdUPYobY7byJq1y35vUBfKQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722414553; c=relaxed/simple;
	bh=GvPzjuPTHNwT0sU3VsXjSIcIH4Ihw2h7Fh11OrSbxdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mP2sMU0ilNwTpNuMm61JR/KCTafwaKop+XMLZpRk3DKUDNj6IxtTB3CvrjOpCg1yDut0ULp+43R1uun/EDHjL3xk4YeArBDwtXaZus9RnpA2psMhh6e3NeyvhstzGQMnzK9jjr5GHyyL9m/tL3HFqmYSkL1uPSblmnEj0bG2cNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-682ff2f0e67so16270417b3.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jul 2024 01:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722414550; x=1723019350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFUCt3Bsi1iCqC+jA7TnkhmlNAEuwd86EldupbqR7Rk=;
        b=laPxJMl1svyKJ/eqLjdIyk3qB0G9Ix8fgR85iGQUJNS2Y5I89snJ5kCzitzin887be
         Llhbl5V24J3Sx2CC8B+x6c9+WvSzsM5JFYuWoUY0lahyhUvNFVzEbul0OCqouooPpjn5
         ZZjGuBQampHB49NVioW/q80tQ+bhsisunwkdWjfoZTGjY23nBFiG6rSKd3idHGTUkaLi
         35EdZh+T3NqDTZVHLH84q/UZCz51ckA7B6BisoEue01vhtG1zSqrcEfCHbVbhwnPlWKn
         9YASUJwLTGrwTCNduCQvYN2j8e4lUuFL/dbpM9srCW/81lSxXTxzRJSiwysTb2DKdecp
         /93Q==
X-Forwarded-Encrypted: i=1; AJvYcCVI6sKW9QVPhRLkvVzKqebv5WqvYtjS8i+/OAoMRdcT8lMNCEuQUeqZtGelMBOrCQ+RYnvI4cq++IvXw3CEVe6Tldv4boUTUY7VfS9a6IR/PsE=
X-Gm-Message-State: AOJu0YxLuQrSektsH0k6PN8l3NnNPn/LetJIVuo0PQY1zdZXj7OtqGwu
	S9h+NqkH9Pu6C3+5j4MW7OotKkk9+yIYBebj0zk99LHugqUix9uaRpS47Tac
X-Google-Smtp-Source: AGHT+IGu6RetsTelYx6ATdd2lcJd8WF82LUBdk4f5Q83l6ujZ1gBT4OkyA0yrp4AsuZhXo6p5XWOJQ==
X-Received: by 2002:a05:690c:698c:b0:62c:dcb2:a75b with SMTP id 00721157ae682-67a09b7066fmr142984517b3.38.1722414550144;
        Wed, 31 Jul 2024 01:29:10 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756b9be9cbsm28404807b3.108.2024.07.31.01.29.09
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jul 2024 01:29:09 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-66ca536621cso39019707b3.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 31 Jul 2024 01:29:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVbgDRa2GTDnHr0jLeqCHX5IYpmjnJRxoWYHUh6mggftKKfogeJUuGeq5uyWZdi/iGPMOR4bb0C8WWEQv0zeBeIVRoSnGrz8qydMh0rVSq8YI0=
X-Received: by 2002:a05:690c:23c1:b0:615:1cbb:7b81 with SMTP id
 00721157ae682-67a0a60d184mr128759337b3.46.1722414549601; Wed, 31 Jul 2024
 01:29:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240731080846.257139-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240731080846.257139-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 31 Jul 2024 10:28:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWv726HCteiT7V4q_94nNVDkBLStCsm+hrjfJgz_LgyrA@mail.gmail.com>
Message-ID: <CAMuHMdWv726HCteiT7V4q_94nNVDkBLStCsm+hrjfJgz_LgyrA@mail.gmail.com>
Subject: Re: [PATCH] mtd: hyperbus: rpc-if: Add missing MODULE_DEVICE_TABLE
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linux-mtd@lists.infradead.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 10:08=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> The rpc-if-hyperflash driver can be compiled as a module, but lacks
> MODULE_DEVICE_TABLE() and will therefore not be loaded automatically.
> Fix this.
>
> Fixes: 5de15b610f78 ("mtd: hyperbus: add Renesas RPC-IF driver")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

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

