Return-Path: <linux-renesas-soc+bounces-15139-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12894A7655A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 14:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE5F616A161
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F40C1D89FD;
	Mon, 31 Mar 2025 12:05:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C85F1D5160
	for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 12:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743422738; cv=none; b=ACcpnKe0VFeOjOcej4s0Hnc4NYu/74x/tBDs6SUjr9uWwjb3pznbV1DpheT8IvxphEbeBHGdppV7GWyW9SW+ckwOYRxqXGaGIm4Z6JBgw3FK6I0/Qk3JApNOSBXHfqg81dfCdUpXvLIwRzaJcbvTSnnlcrTZp2EyzwEycL019EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743422738; c=relaxed/simple;
	bh=/16FlyuYum7B3u1npI0fOcXlWTgswfsx/np7SjSCy5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uW3Q+R3oKTVF//wSAXiG0Aj78NCZYTYWwSDJQymzAKDtsqQmQmn2aakyIk8L5O+Gyt+nQDY6oIeW6eATAEy2vtepNUQyNwTXNmvBcXFuyzJLv1X8eaLt0KFq1kjlI0yQInq0IbZLLzZPpiBlqbR5oqrlwtqd/e+OHSCtIku5KAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-47686580529so45299981cf.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 05:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743422735; x=1744027535;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2VuSSwQUKJ8qeu94RxUF5laa27FwusgpIfSp0O2zE8g=;
        b=WEN1uM7QyZd19oqTMTBXuTO+U5O81yltrtY3MvrLP3ReFV8AsQ7hox0YZn8FUG4LSX
         5+ERu5AdyTUDnDiPSBbs/a74DYCrgdkKwiJZaeOunIj9CcKMpaWK3d+jEQiQyTfvPQDw
         Pl4+hwbBtY+STo7YVf3dZ5Ve9HHgsD8KW5jiKeQZa3/ZU3Ravo3qjebRbIj184Xh2ExC
         wgHeizY3ur3rt9IB7gliNA3qbNu6NlZTHVtEpjEKAEwGDrPMcKXhDgytrlXLnt+I8UES
         TKgB2u/XG09gT5eteuVuxOdjdrc29wcG9L029Kzo6x7h9Tt6g+CTY7IIm3eaXdUsJMdu
         l0qw==
X-Forwarded-Encrypted: i=1; AJvYcCW9SfC/L1gMllAolccx/JxvxgLE2X7gTSG0pgrtS7N9WChAJAaZaMuVMCS+bKbDzz60iNZYTrWuvBQfxeeewZ5Xew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIrQgRhHHqiORFS2WiKNgkD1pbXzqfIzlKitHVbVOAIYY6W4yE
	xqHws6Y0rGLckmDBuMUQMoBcJ15Up+rAH9hgWihw7DC6n+sqOp1lV9tT5gDN
X-Gm-Gg: ASbGncuuffznMR78QnC51Lk7ZnhcZixVuAE7kIGidtXqew8ej87Osd+qQZGgUOsRnOx
	7Vy4EGjOiaaDjQe3HgJThE8qyoFL0lnfpVK7th6gCTzrvVNPtkRKNx+FSYoucDPyRZKfQww9cNn
	PmFE/BbIIi0ULZ+e5pWLpae4ueFbP9QJZbvAEVVQ+J++57iWZiev1iMs2qrh0YBYuKBe7DfGFIC
	2oigDa8JM07tPsyd4tVEQCzNlu0s2TGxSVwQ5plZs2SKArX6tZShVzq4lpAi0yUarWLVNZyECDO
	qI1Cej0ojTuX5qK8Egtu9cThwnBtWGDZNH1xz5xZaZHoith0OqKWrNUG7/2XKFuBcqttPiBvCCh
	qypGaAjLIeVk=
X-Google-Smtp-Source: AGHT+IGYUELa6kMYTg6afVoFxINO0fMGSZW1JeZ3nH0P2+zzA/FAqcmdVryHda7AZIT1cJnp2pEZ9A==
X-Received: by 2002:a05:622a:48f:b0:476:6215:eaf6 with SMTP id d75a77b69052e-477e4ba9e44mr138443481cf.31.1743422734694;
        Mon, 31 Mar 2025 05:05:34 -0700 (PDT)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com. [209.85.222.175])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-478b26f3968sm34380481cf.41.2025.03.31.05.05.34
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 05:05:34 -0700 (PDT)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c5b8d13f73so463594785a.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 31 Mar 2025 05:05:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGTsB9+I31nMpoDMooeFzywEyHipz0EodQFh0E347NvApZoTxEUKWxwvsh1PAqg30KF2TlnU2xXCpk1+e669+EGg==@vger.kernel.org
X-Received: by 2002:a05:620a:2912:b0:7c5:ad3c:8478 with SMTP id
 af79cd13be357-7c6865ea983mr1241939185a.16.1743422734185; Mon, 31 Mar 2025
 05:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311113620.4312-1-biju.das.jz@bp.renesas.com> <20250311113620.4312-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250311113620.4312-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Mar 2025 14:05:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXiGZAy4thzWq3JYDi9F=0DASnEbAk6S-+hDY8Gcs_jMQ@mail.gmail.com>
X-Gm-Features: AQ5f1JqmburHEFTPMX0JIVw52y8WOTLjvgrhUFaYdQIv5FojsC0dqZnCMUfJUpY
Message-ID: <CAMuHMdXiGZAy4thzWq3JYDi9F=0DASnEbAk6S-+hDY8Gcs_jMQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] memory: renesas-rpc-if: Fix RPCIF_DRENR_CDB macro error
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 11 Mar 2025 at 12:36, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Fix the below macro error found while moving the reg definitions
> to renesas-rpc-if-regs.h in the later patch.
>
> ERROR: Macros with complex values should be enclosed in parentheses
> #define RPCIF_DRENR_CDB(o)      (u32)((((o) & 0x3) << 30))
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/memory/renesas-rpc-if.c
> +++ b/drivers/memory/renesas-rpc-if.c
> @@ -56,7 +56,7 @@
>  #define RPCIF_DROPR            0x0018  /* R/W */
>
>  #define RPCIF_DRENR            0x001C  /* R/W */
> -#define RPCIF_DRENR_CDB(o)     (u32)((((o) & 0x3) << 30))
> +#define RPCIF_DRENR_CDB(o)     (((u32)((o) & 0x3) << 30))

The most-outer sets of parentheses are duplicated.

Although casts have a higher precedence than bitwise shifts,
the original intention was probably "(((u32)((o) & 0x3)) << 30)".

>  #define RPCIF_DRENR_OCDB(o)    (((o) & 0x3) << 28)
>  #define RPCIF_DRENR_ADB(o)     (((o) & 0x3) << 24)
>  #define RPCIF_DRENR_OPDB(o)    (((o) & 0x3) << 20)
Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

