Return-Path: <linux-renesas-soc+bounces-11266-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0840E9EECB9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 16:37:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED5AF169B75
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 15:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A5B21CFEA;
	Thu, 12 Dec 2024 15:35:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F9E1547F0;
	Thu, 12 Dec 2024 15:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734017716; cv=none; b=raUznmC5WJ49UeUSALgoZBMRUX3rLAEuXKX3kNTzFBWr/wVehWMwsFTWOfvqP6BUq5DwmHDR2+CjNlaJ08XzOHUVlhJpUqfEXd9sdKWQJPZwlZG5AyIqR62LjYOSJgswQm7Bn7FTajFO+44t9d7s8Unl2yyUvEh5YIKIP0m/eHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734017716; c=relaxed/simple;
	bh=AisPG9GwlUsw8TD4MLszIgPXHpbj8n5LXNfwxVJkqZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X3Fb7baCNL09RmJUWJJUNUGQ6LB0xv3PuH8jjXJKUHdz9qHDSWJC1ebkGiemTbSJNDqvuiiDt9wEt2gsF0Ue288hBTS1F6bd6YXea3pflT4kqq5IQDh+8vxhE29d+mmvkOVOIEg6VpnfkjqFuTesXjrpaqir1j8jaq3TGXSalnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4674f1427deso8159911cf.1;
        Thu, 12 Dec 2024 07:35:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734017712; x=1734622512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoYWV4Px4uKpkyOHO5i+/GW/sMKXmpjcPB4M1bNQ1vA=;
        b=wca8yYJtXL67xG5M2NInf7wY77Q1aFMu8VcL5m5wXe4Q+EmOymSlgHHkzF32yDYQw4
         ajVHJOX+GfPG1fBY8KnQVnEDY8wlV8RwAXJiV6IVMlhKSQhnd8745lwH1FAqoD45cgNw
         0VSssZ0/PjbH1WeCmeLiSVjsTGpweBz4kBVzTjlijHfuO3zQp6dt6rnkW6+9GLwrd+k4
         45QzvmCH+FkZO/zD5KfgXhEttZqAno2+JObPDGZQ9pGBC5ilbEnokejTznYFwao0IPxk
         CHC2Ro6p0NMJXMS5PNGdcgjUgWp2/gDGSiZd+rJfAKgXvDUEfuaExrxdaP21Aso2PM47
         JYiw==
X-Forwarded-Encrypted: i=1; AJvYcCVVHKqYhAU3soKGFpUcT8JbqZvO9SU3ufRt6EQciLWyq/h2lUkZrYq/GoO5rCfTYnOzsCGPEqLhU3s=@vger.kernel.org, AJvYcCXlPotHXmWke6Dx2TXtVJrXOtdcEzu3M/l20pFlZ0arKFeQlAkzYN8tAyaBJ8wDpgNr9tvnXzKIvGWNSY7dfrWSiaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxijCSqTplUDKS/Dk4gHZTyITj171n0Cu7Gew4uXj51zX/TKdyq
	cJZ9N6Psd0BuYWzkTu4KneZdXmzoUh6Gu5RiT33rfKtnNxKQubVXmhXlEzC6BpA=
X-Gm-Gg: ASbGncv+DBe4GrlmuCfcvjv4jZ3xstreDCjlE/5GeVniADK1lXsLW/eZbo6j7JJnMiL
	9L+35AdEvn/97Xb8qGZVbGpv274kqOfkj/6hdODw9O2N3yP1p1PVMwgTo/2LeoySGUraemQRfk+
	dIXU0Pwuol7SI+sP5mHjbM/drgU/cBSLJs773X9hOLReCT1Pb5Tu65I86DH9daYSO0lOXzghp9y
	lHuxN1uTmQQQLY9hunURmfkjhs9rs6IrHSdS7ADJn5ApU7G5XenQcQMu+p096yrYFv4qx93OYSD
	K0oWCMnvf4QBIq1AZEPSCK8=
X-Google-Smtp-Source: AGHT+IGNEnecHjCwcOEYd1mp/Qip9Gv48ZxBtieHp04qb5Z30MXTTMYLO94EExaRj31GW4CHoeVr6g==
X-Received: by 2002:a05:622a:199a:b0:467:5014:8bd7 with SMTP id d75a77b69052e-467a15f9863mr12199801cf.22.1734017712357;
        Thu, 12 Dec 2024 07:35:12 -0800 (PST)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4679cd4a184sm5141231cf.59.2024.12.12.07.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:35:12 -0800 (PST)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b6ea711805so61608985a.1;
        Thu, 12 Dec 2024 07:35:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUih3aXNG/2j19B/0HCh1uZuAZIWArMvXlG76F8hg56Yd4eng45bOmZnwg6jRWQRmCM2UnBecBV8iUkbJzXHFHvBLk=@vger.kernel.org, AJvYcCVJsDl6ipdCLVKKpcH3BxNnT9oks66O4lZ6Z66LI10UhjHlR5IEPAf2lkb7eVoNRVBKF6m0KYQiljY=@vger.kernel.org
X-Received: by 2002:a05:620a:2493:b0:7b1:52a9:ae15 with SMTP id
 af79cd13be357-7b6f88cc850mr140038985a.9.1734017711879; Thu, 12 Dec 2024
 07:35:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com> <20241203105005.103927-9-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241203105005.103927-9-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Dec 2024 16:35:00 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXc4N20fowk0XOtuhdgeGuhUyVzvFHFU_3+7iPU_GfkuA@mail.gmail.com>
Message-ID: <CAMuHMdXc4N20fowk0XOtuhdgeGuhUyVzvFHFU_3+7iPU_GfkuA@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] clk: renesas: r9a09g047: Add CA55 core clocks
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 11:50=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add CA55 core clocks which are derived from PLLCA55.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

